package co.com.netec.products.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import co.com.netec.products.dtos.ProductDTO;
import co.com.netec.products.entity.Product;
import co.com.netec.products.exception.ProductBusinessException;
import co.com.netec.products.repository.ProductRepository;

import java.math.BigDecimal;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

@Service
public class ProductService {

    private static final Logger log = LoggerFactory.getLogger(ProductService.class);
    
    private final ProductRepository productRepository;

    public ProductService(ProductRepository productRepository) {
        this.productRepository = productRepository;
    }

    @Transactional(readOnly = true)
    public List<ProductDTO> findAll() {
        return productRepository.findAll().stream()
                .map(p -> new ProductDTO(p.getId(), p.getCode(), p.getName(), p.getDescription(), p.getPrice()))
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public ProductDTO findById(String id) {
        return productRepository.findById(id)
                .map(p -> new ProductDTO(p.getId(), p.getCode(), p.getName(), p.getDescription(), p.getPrice()))
                .orElseThrow(() -> new ProductBusinessException(
                        "El producto con ID '" + id + "' no existe en el inventario activo."));
    }
    
    @Transactional
    public String getConcatenatedProductNames() {
        return productRepository.llamarSpListarNombres();
    }

    @Transactional
    public List<ProductDTO> applyBulkDiscount(String keyword, double discountPercentage) {
        // Regla de negocio 1: Validar el término de búsqueda
        if (keyword == null || keyword.trim().length() < 3) {
            throw new ProductBusinessException("El término de búsqueda debe tener al menos 3 caracteres.");
        }

        // Regla de negocio 2: Validar el rango del descuento
        if (discountPercentage < 1 || discountPercentage > 50) {
            throw new ProductBusinessException(
                    "El descuento temporal permitido debe estar estrictamente entre el 1% y el 50%.");
        }

        // Ejecutar consulta parametrizada
        List<Product> productsToUpdate = productRepository.findByNameContainingKeyword(keyword.trim());

        // Regla de negocio 3: Validar que existan productos elegibles
        if (productsToUpdate.isEmpty()) {
            throw new ProductBusinessException(
                    "No se encontraron productos activos que coincidan con el término: " + keyword);
        }

        // Aplicar el descuento
        BigDecimal discountFactor = BigDecimal.valueOf(1 - (discountPercentage / 100));
        productsToUpdate.forEach(product -> {
            BigDecimal newPrice = product.getPrice().multiply(discountFactor);
            product.setPrice(newPrice);
        });

        return productsToUpdate.stream()
                .map(p -> new ProductDTO(p.getId(), p.getCode(), p.getName(), p.getDescription(), p.getPrice()))
                .collect(Collectors.toList());
    }

    // Consulta nativa paginada mapeando los resultados a DTO
    @Transactional(readOnly = true)
    public Page<ProductDTO> getProductsByPriceNative(BigDecimal minPrice, int page, int size) {
        Pageable pageable = PageRequest.of(page, size);
        Page<Product> productPage = productRepository.findByPriceNativePaged(minPrice, pageable);

        return productPage
                .map(p -> new ProductDTO(p.getId(), p.getCode(), p.getName(), p.getDescription(), p.getPrice()));
    }

    // Inserción nativa con validación previa
    @Transactional
    public ProductDTO createProductNative(ProductDTO dto) {
        log.debug("Iniciando solicitud de inserción nativa para el código de producto: {}", dto.code());
        if (dto.price() == null || dto.price().compareTo(BigDecimal.ZERO) <= 0) {
            throw new ProductBusinessException("El precio del producto debe ser mayor a cero.");
        }

        // Generar un UUID aleatorio para cumplir con la PK del script de base de datos
        String generatedId = UUID.randomUUID().toString();

        productRepository.insertProductNative(
                generatedId,
                dto.code(),
                dto.name(),
                dto.description(),
                dto.price());
        log.info("Producto insertado con éxito mediante SQL nativo. ID generado de forma automática.");
        return new ProductDTO(generatedId, dto.code(), dto.name(), dto.description(), dto.price());
    }
}