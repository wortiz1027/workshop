package co.com.netec.users.services;

import co.com.netec.users.dtos.PurchaseRequestDTO;
import co.com.netec.users.dtos.ProductDTO;
import co.com.netec.users.dtos.UserProductDetailDTO;
import co.com.netec.users.dtos.UserAggregateReportDTO;
import co.com.netec.users.entities.User;
import co.com.netec.users.entities.UserProduct;
import co.com.netec.users.exceptions.UserBusinessException;
import co.com.netec.users.repositories.UserRepository;
import io.opentelemetry.api.OpenTelemetry;
import io.opentelemetry.api.trace.Tracer;
import io.opentelemetry.api.trace.Span;
import io.opentelemetry.context.Scope;

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
    private final Tracer tracer;

    public UserService(UserRepository userRepository, RestClient productRestClient, OpenTelemetry openTelemetry) {
        this.userRepository = userRepository;
        this.productRestClient = productRestClient;
        this.tracer = openTelemetry.getTracer("co.com.netec.users.UserService");
    }

    @Transactional(readOnly = false)
    public UserAggregateReportDTO getUserFullReport(String userId) {
        log.debug("Iniciando agregación de datos para el usuario ID: {}", userId);

        Span customSpan = tracer.spanBuilder("user_products").startSpan();

        if (userId != null) {
            customSpan.setAttribute("user.id", userId);
            customSpan.setAttribute("debug.status", "attribute_injected_ok");
        } else {
            customSpan.setAttribute("user.id", "WARNING_USER_ID_NULL");
            customSpan.setAttribute("debug.status", "attribute_injected_error");
        }

        try (Scope scope = customSpan.makeCurrent()) {

            io.opentelemetry.api.baggage.Baggage baggage = io.opentelemetry.api.baggage.Baggage.builder()
                    .put("user.id", userId != null ? userId : "UNKNOWN")
                    .build();

            try (Scope baggageScope = baggage.makeCurrent()) {

                User user = userRepository.findByIdWithProducts(userId)
                        .orElseThrow(
                                () -> new UserBusinessException(
                                        "El usuario con ID '" + userId + "' no existe en el sistema."));

                Integer totalFromSp = userRepository.obtenerMetricasUsuario(userId);

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
        } catch (Exception e) {
            customSpan.recordException(e);
            throw e;
        } finally {
            customSpan.end();
        }
    }

    @Transactional
    public UserProductDetailDTO registerPurchase(PurchaseRequestDTO request) {
        log.info("Iniciando proceso de compra distribuida. Usuario: {}, Producto: {}", request.userId(),
                request.productId());

        User user = userRepository.findById(request.userId())
                .orElseThrow(() -> new UserBusinessException(
                        "No se puede registrar la compra. El usuario con ID '" + request.userId() + "' no existe."));

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
            throw e;
        } catch (Exception e) {
            throw new UserBusinessException(
                    "El sistema de inventario no está disponible en este momento. Intente más tarde.");
        }

        String generatedRelationId = "rel-" + UUID.randomUUID().toString().substring(0, 8);
        UserProduct newPurchase = new UserProduct(generatedRelationId, request.productId(), LocalDateTime.now());

        user.addProduct(newPurchase);

        userRepository.save(user);

        log.info("Compra registrada exitosamente con el ID de relación: {}", generatedRelationId);

        return new UserProductDetailDTO(
                newPurchase.getRelationId(),
                newPurchase.getProductId(),
                newPurchase.getPurchaseDate(),
                externalProduct);
    }

    private ProductDTO fetchProductDetailsDefensive(String productId) {
        try {
            log.info("[product_id:{}] - [message: consultando la api de productos por id: {}]", productId, productId);
            return productRestClient.get()
                    .uri("/{id}", productId)
                    .retrieve()
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
