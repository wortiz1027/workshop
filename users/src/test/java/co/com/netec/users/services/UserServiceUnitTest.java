package co.com.netec.users.services;

import co.com.netec.users.dtos.ProductDTO;
import co.com.netec.users.dtos.UserAggregateReportDTO;
import co.com.netec.users.entities.User;
import co.com.netec.users.entities.UserProduct;
import co.com.netec.users.exceptions.UserBusinessException;
import co.com.netec.users.repositories.UserRepository;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.jupiter.MockitoExtension;
import org.springframework.web.client.RestClient;

import java.math.BigDecimal;
import java.time.LocalDateTime;
import java.util.Optional;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
class UserServiceUnitTest {

    @Mock
    private UserRepository userRepository;

    @Mock
    private RestClient productRestClient;

    // Mocks auxiliares requeridos para simular la API fluida de RestClient
    @Mock
    private RestClient.RequestHeadersUriSpec requestHeadersUriSpec;

    @Mock
    private RestClient.RequestHeadersSpec requestHeadersSpec;

    @Mock
    private RestClient.ResponseSpec responseSpec;

    @InjectMocks
    private UserService userService;

    @Test
    void testGetUserFullReport_Success() {
        // 1. Arrange (Preparar datos locales simulados)
        String userId = "usr-0001";
        User mockUser = new User(userId, "Carlos Mendoza", "carlos@email.com", "CLIENT");
        UserProduct mockRelation = new UserProduct("rel-0001", "prod-123", LocalDateTime.now());
        mockUser.addProduct(mockRelation);

        when(userRepository.findByIdWithProducts(userId)).thenReturn(Optional.of(mockUser));
        when(userRepository.obtenerMetricasUsuario(userId)).thenReturn(1);

        // Simular la estructura encadenada (Fluent API) de
        // RestClient.get().uri().retrieve().body()
        ProductDTO mockExternalProduct = new ProductDTO("prod-123", "XBX99", "Xbox Serie X", "Microsoft",
                BigDecimal.valueOf(2750000));

        when(productRestClient.get()).thenReturn(requestHeadersUriSpec);
        when(requestHeadersUriSpec.uri(anyString(), anyString())).thenReturn(requestHeadersSpec);
        when(requestHeadersSpec.retrieve()).thenReturn(responseSpec);
        when(responseSpec.onStatus(any(), any())).thenReturn(responseSpec);
        when(responseSpec.body(ProductDTO.class)).thenReturn(mockExternalProduct);

        // 2. Act (Ejecutar el método del servicio)
        UserAggregateReportDTO report = userService.getUserFullReport(userId);

        // 3. Assert (Verificaciones estructurales y de contenido)
        assertNotNull(report);
        assertEquals("Carlos Mendoza", report.userName());
        assertEquals(1, report.totalProductsCalculatedBySp());
        assertEquals(1, report.purchases().size());
        assertEquals("Xbox Serie X", report.purchases().get(0).productMetadata().name());

        verify(userRepository, times(1)).findByIdWithProducts(userId);
        verify(userRepository, times(1)).obtenerMetricasUsuario(userId);
    }

    @Test
    void testGetUserFullReport_UserNotFound_ThrowsUserBusinessException() {
        // Arrange
        String invalidUserId = "usr-falso";
        when(userRepository.findByIdWithProducts(invalidUserId)).thenReturn(Optional.empty());

        // Act & Assert
        UserBusinessException exception = assertThrows(UserBusinessException.class, () -> {
            userService.getUserFullReport(invalidUserId);
        });

        assertTrue(exception.getMessage().contains("no existe en el sistema"));
        verify(userRepository, times(1)).findByIdWithProducts(invalidUserId);
        verify(userRepository, never()).obtenerMetricasUsuario(anyString());
    }

    @Test
    void testGetUserFullReport_ExternalApiFallback_ReturnsMetadataWithErrorDetails() {
        // Arrange
        String userId = "usr-0002";
        User mockUser = new User(userId, "Ana Gomez", "ana@email.com", "VIP");
        UserProduct mockRelation = new UserProduct("rel-0002", "prod-999", LocalDateTime.now());
        mockUser.addProduct(mockRelation);

        when(userRepository.findByIdWithProducts(userId)).thenReturn(Optional.of(mockUser));
        when(userRepository.obtenerMetricasUsuario(userId)).thenReturn(1);

        // Simular un corte de comunicación HTTP (Lanza excepción al invocar la API
        // remota)
        when(productRestClient.get()).thenReturn(requestHeadersUriSpec);
        when(requestHeadersUriSpec.uri(anyString(), anyString())).thenReturn(requestHeadersSpec);
        when(requestHeadersSpec.retrieve()).thenThrow(new RuntimeException("Timeout de red"));

        // Act
        UserAggregateReportDTO report = userService.getUserFullReport(userId);

        // Assert (El Fallback defensivo debe activarse y no romper el reporte general)
        assertNotNull(report);
        assertEquals(1, report.purchases().size());

        ProductDTO fallbackMetadata = report.purchases().get(0).productMetadata();
        assertEquals("SERVICE_UNAVAILABLE", fallbackMetadata.code());
        assertEquals("Detalle no disponible", fallbackMetadata.name());
    }
}
