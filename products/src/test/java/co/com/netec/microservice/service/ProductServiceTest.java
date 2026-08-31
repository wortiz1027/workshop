package co.com.netec.microservice.service;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;

import co.com.netec.microservice.dtos.ProductDTO;
import co.com.netec.microservice.entity.Product;
import co.com.netec.microservice.exception.ProductBusinessException;
import co.com.netec.microservice.repository.ProductRepository;

import java.math.BigDecimal;
import java.util.List;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.mockito.Mockito.when;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.eq;

@ExtendWith(MockitoExtension.class)
class ProductServiceUnitTest {

    @Mock
    private ProductRepository productRepository;

    @InjectMocks
    private ProductService productService;

    @Test
    void testFindAll_ReturnsMappedDtoList() {
        // Arrange
        Product mockProduct = new Product("1", "CODE1", "Product 1", "Desc 1", BigDecimal.TEN);
        when(productRepository.findAll()).thenReturn(List.of(mockProduct));

        // Act
        List<ProductDTO> result = productService.findAll();

        // Assert
        assertEquals(1, result.size());
        assertEquals("Product 1", result.get(0).name());
        assertEquals(BigDecimal.TEN, result.get(0).price());
    }

    @Test
    void testGetConcatenatedProductNames_ReturnsSpOutput() {
        // Arrange
        String expectedOutput = "Product 1 | Product 2";
        when(productRepository.llamarSpListarNombres()).thenReturn(expectedOutput);

        // Act
        String result = productService.getConcatenatedProductNames();

        // Assert
        assertEquals(expectedOutput, result);
    }

    @Test
    void testApplyBulkDiscount_Success() {
        // Arrange
        Product console = new Product("1", "PS5", "Play Station 5", "Sony", BigDecimal.valueOf(3000000));
        when(productRepository.findByNameContainingKeyword("Play Station")).thenReturn(List.of(console));

        // Act
        List<ProductDTO> result = productService.applyBulkDiscount("Play Station", 10.0); // 10% de descuento

        // Assert
        assertEquals(1, result.size());
        // 3,000,000 - 10% = 2,700,000
        assertEquals(0, BigDecimal.valueOf(2700000).compareTo(result.get(0).price()));
    }

    @Test
    void testApplyBulkDiscount_ThrowsException_WhenDiscountInvalid() {

        assertThrows(ProductBusinessException.class, () -> {
            productService.applyBulkDiscount("Play Station", 60.0); // 60% rompe la regla de negocio
        });
    }

    @Test
    void testGetProductsByPriceNative_ShouldReturnMockedPageOfDtos() {
        // 1. Arrange (Preparar los datos de entrada ficticios)
        BigDecimal minPrice = BigDecimal.valueOf(1500000);
        Pageable pageable = PageRequest.of(0, 2);

        Product p1 = new Product("uuid-1", "CODE1", "Consola de Videojuegos", "Retro", BigDecimal.valueOf(1800000));
        Product p2 = new Product("uuid-2", "CODE2", "Laptop de Oficina", "Core i5", BigDecimal.valueOf(2500000));
        List<Product> contentList = List.of(p1, p2);

        // Creamos la envoltura real de página simulada (Colección, Parámetros de
        // página, Total de registros en BD)
        Page<Product> mockPage = new PageImpl<>(contentList, pageable, 10);

        // Simulamos el comportamiento del repositorio nativo parametrizado
        when(productRepository.findByPriceNativePaged(eq(minPrice), any(Pageable.class)))
                .thenReturn(mockPage);

        // 2. Act (Ejecutar el método bajo prueba en el Servicio)
        Page<ProductDTO> resultPage = productService.getProductsByPriceNative(minPrice, 0, 2);

        // 3. Assert (Verificar que las reglas de transformación a DTO y paginado se
        // mantengan intactas)
        assertFalse(resultPage.isEmpty());
        assertEquals(2, resultPage.getContent().size());
        assertEquals(10, resultPage.getTotalElements()); // Mantiene el total de registros de la BD simulada
        assertEquals(5, resultPage.getTotalPages()); // 10 elementos totales / tamaño de página 2 = 5 páginas

        // Verificar el mapeo exacto de los atributos de la entidad al DTO record
        ProductDTO firstDto = resultPage.getContent().get(0);
        assertEquals("uuid-1", firstDto.id());
        assertEquals("Consola de Videojuegos", firstDto.name());
        assertEquals(BigDecimal.valueOf(1800000), firstDto.price());
    }

    @Test
    void testApplyBulkDiscount_ThrowsProductBusinessException_WhenKeywordIsTooShort() {
        // Prueba la rama del if de término menor a 3 caracteres
        ProductBusinessException exception = assertThrows(ProductBusinessException.class, () -> {
            productService.applyBulkDiscount("X", 10.0);
        });
        assertEquals("El término de búsqueda debe tener al menos 3 caracteres.", exception.getMessage());
    }

    @Test
    void testApplyBulkDiscount_ThrowsProductBusinessException_WhenNoProductsFound() {
        // Prueba la rama del if cuando la consulta no retorna nada
        when(productRepository.findByNameContainingKeyword("Inexistente"))
                .thenReturn(java.util.Collections.emptyList());

        ProductBusinessException exception = assertThrows(ProductBusinessException.class, () -> {
            productService.applyBulkDiscount("Inexistente", 10.0);
        });

        assertEquals("No se encontraron productos activos que coincidan con el término: Inexistente",
                exception.getMessage());
    }
}