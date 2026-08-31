package co.com.netec.users.services;

import co.com.netec.users.dtos.PurchaseRequestDTO;
import co.com.netec.users.dtos.ProductDTO;
import co.com.netec.users.dtos.UserProductDetailDTO;
import co.com.netec.users.dtos.UserAggregateReportDTO;
import co.com.netec.users.entities.User;
import co.com.netec.users.entities.UserProduct;
import co.com.netec.users.exceptions.UserBusinessException;
import co.com.netec.users.repositories.UserRepository;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestClient;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Service
public class UserService {

    private static final Logger log = LoggerFactory.getLogger(UserService.class);

    private final UserRepository userRepository;
    private final RestClient productRestClient;

    public UserService(UserRepository userRepository, RestClient productRestClient) {
        this.userRepository = userRepository;
        this.productRestClient = productRestClient;
    }

    @Transactional(readOnly = false) // readOnly=false requerido debido al Cursor/SP en MySQL
    public UserAggregateReportDTO getUserFullReport(String userId) {
        log.debug("Iniciando agregación de datos para el usuario ID: {}", userId);

        // 1. Buscar usuario y sus productos locales optimizado con FETCH JOIN
        User user = userRepository.findByIdWithProducts(userId)
                .orElseThrow(
                        () -> new UserBusinessException("El usuario con ID '" + userId + "' no existe en el sistema."));

        // 2. Invocar Procedimiento Almacenado local para métricas analíticas
        Integer totalFromSp = userRepository.obtenerMetricasUsuario(userId);

        // 3. CAPA DE COMUNICACIÓN: Mapear y enriquecer cada producto consumiendo el
        // RestClient
        List<UserProductDetailDTO> purchasesDetail = user.getPurchasedProducts().stream()
                .map(relation -> {
                    ProductDTO externalProduct = fetchProductDetailsDefensive(relation.getProductId());
                    return new UserProductDetailDTO(
                            relation.getRelationId(),
                            relation.getProductId(),
                            relation.getPurchaseDate(),
                            externalProduct);
                })
                .toList();

        log.info("Reporte unificado del usuario [{}] generado con éxito.", user.getName());

        return new UserAggregateReportDTO(
                user.getId(),
                user.getName(),
                user.getEmail(),
                user.getRole(),
                totalFromSp,
                purchasesDetail);
    }

    @Transactional
    public UserProductDetailDTO registerPurchase(PurchaseRequestDTO request) {
        log.info("Iniciando proceso de compra distribuida. Usuario: {}, Producto: {}", request.userId(),
                request.productId());

        // 1. Validar localmente que el usuario exista
        User user = userRepository.findById(request.userId())
                .orElseThrow(() -> new UserBusinessException(
                        "No se puede registrar la compra. El usuario con ID '" + request.userId() + "' no existe."));

        // 2. VALIDACIÓN ACTIVA DISTRIBUIDA: Consultar si el producto existe en el
        // catálogo externo
        ProductDTO externalProduct;
        try {
            ProductDTO[] catalog = productRestClient.get()
                    .retrieve()
                    .body(ProductDTO[].class);

            boolean productExists = false;
            ProductDTO foundProduct = null;

            if (catalog != null) {
                for (ProductDTO prod : catalog) {
                    if (prod.id().equals(request.productId())) {
                        productExists = true;
                        foundProduct = prod;
                        break;
                    }
                }
            }

            if (!productExists) {
                throw new UserBusinessException("No se puede registrar la compra. El producto con ID '"
                        + request.productId() + "' no existe en el catálogo de inventario.");
            }

            externalProduct = foundProduct;

        } catch (UserBusinessException e) {
            throw e; // Relanzar nuestra excepción controlada de negocio
        } catch (Exception e) {
            // Si el servicio externo está caído por completo, bloqueamos la compra por
            // seguridad de datos
            throw new UserBusinessException(
                    "El sistema de inventario no está disponible en este momento. Intente más tarde.");
        }

        // 3. Crear el nuevo registro de relación asociando la clave foránea local
        String generatedRelationId = "rel-" + UUID.randomUUID().toString().substring(0, 8);
        UserProduct newPurchase = new UserProduct(generatedRelationId, request.productId(), LocalDateTime.now());

        // El método helper de la entidad se encarga de asociar el usuario y activar la
        // cascada de JPA
        user.addProduct(newPurchase);

        // Guardamos explícitamente (u ocultamente al terminar el método transaccional)
        userRepository.save(user);

        log.info("Compra registrada exitosamente con el ID de relación: {}", generatedRelationId);

        // Retornar el detalle enriquecido inmediatamente al cliente
        return new UserProductDetailDTO(
                newPurchase.getRelationId(),
                newPurchase.getProductId(),
                newPurchase.getPurchaseDate(),
                externalProduct);
    }

    /**
     * Consume el microservicio de productos de manera tolerante a fallos
     * (Resiliencia Básica)
     */
    private ProductDTO fetchProductDetailsDefensive(String productId) {
        try {
            return productRestClient.get()
                    // Inyecta dinámicamente el ID en la URL remota: /api/products/{id}
                    .uri("/{id}", productId)
                    .retrieve()
                    // Manejo avanzado del código de estado HTTP remoto
                    .onStatus(status -> status.value() == 422 || status.value() == 404, (req, res) -> {
                        log.warn("El producto con ID {} no existe en el catálogo remoto.", productId);
                    })
                    .body(ProductDTO.class);

        } catch (Exception e) {
            log.error(
                    "Fallo de comunicación por ID con la API de productos para el ID {}. Aplicando Fallback. Motivo: {}",
                    productId, e.getMessage());
            // Fallback en caso de corte de red o error 500 del servidor remoto
            return new ProductDTO(productId, "SERVICE_UNAVAILABLE", "Detalle no disponible", "Fallo de enlace de red",
                    null);
        }
    }
}
