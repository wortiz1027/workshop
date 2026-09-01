package co.com.netec.users.controllers;

import co.com.netec.users.dtos.PurchaseRequestDTO;
import co.com.netec.users.dtos.UserAggregateReportDTO;
import co.com.netec.users.dtos.ErrorResponse;
import co.com.netec.users.dtos.UserProductDetailDTO;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.test.web.client.MockRestServiceServer;
import org.springframework.boot.resttestclient.autoconfigure.AutoConfigureRestTestClient;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.client.RestClient;
import org.springframework.test.web.servlet.client.RestTestClient;

import org.springframework.web.client.support.RestClientAdapter;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.client.match.MockRestRequestMatchers.requestTo;
import static org.springframework.test.web.client.response.MockRestResponseCreators.withSuccess;

@Transactional
@AutoConfigureRestTestClient
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class UserControllerIntegrationTest {

    @Autowired
    private RestTestClient restTestClient;

    @Autowired
    private RestClient productRestClient; // Inyectamos para simular la red distribuida

    private MockRestServiceServer mockServer;

    @BeforeEach
    void setUp() {
        RestClient.Builder builder = RestClient.builder();

        mockServer = MockRestServiceServer.bindTo(builder).build();

        java.lang.reflect.Field field = org.springframework.util.ReflectionUtils
                .findField(co.com.netec.users.services.UserService.class, "productRestClient");

    }

    @Test
    void testGetUserAggregateReport_Success() {
        String mockProductsJson = """
                [
                  {
                    "id": "3d703247-54bc-47ef-a69d-7531a638022e",
                    "code": "PS5",
                    "name": "Laptop Samsung Pocket",
                    "description": "Disfruta de la mejor tecnología al mejor precio",
                    "price": 3563000
                  }
                ]
                """;

        mockServer.expect(requestTo("http://mysql_server_products:8080/api/products"))
                .andRespond(withSuccess(mockProductsJson, MediaType.APPLICATION_JSON));

        // Act & Assert
        restTestClient.get()
                .uri("/api/users/usr-0001/report")
                .accept(MediaType.APPLICATION_JSON)
                .exchange()
                .expectStatus().isOk()
                .expectBody(UserAggregateReportDTO.class)
                .consumeWith(response -> {
                    UserAggregateReportDTO report = response.getResponseBody();
                    assertThat(report).isNotNull();
                    assertThat(report.userId()).isEqualTo("usr-0001");
                    //assertThat(report.totalProductsCalculatedBySp()).isEqualTo(8);
                    assertThat(report.purchases()).isNotEmpty();
                    assertThat(report.purchases().get(0).productMetadata().name()).isEqualTo("Laptop Samsung Pocket");
                });
    }

    @Test
    void testGetUserReport_UserNotFound_Returns422UnprocessableContent() {
        // Act & Assert
        restTestClient.get()
                .uri("/api/users/usr-inexistente/report")
                .exchange()
                .expectStatus().isEqualTo(HttpStatus.UNPROCESSABLE_CONTENT)
                .expectBody(ErrorResponse.class)
                .consumeWith(response -> {
                    ErrorResponse error = response.getResponseBody();
                    assertThat(error).isNotNull();
                    assertThat(error.status()).isEqualTo(422);
                    assertThat(error.message()).contains("no existe en el sistema");
                });
    }

    @Test
    void testRegisterPurchase_Success() {
        // Arrange: El producto debe validarse de forma síncrona en el catálogo simulado
        String validProductId = "f6391f5d-12bd-4f07-b068-c275754f3e76";
        String mockCatalogJson = """
                [
                  {
                    "id": "f6391f5d-12bd-4f07-b068-c275754f3e76",
                    "code": "93LOGTO2PG",
                    "name": "Celular Microsoft Ultra",
                    "description": "La herramienta definitiva para potenciar tu productividad",
                    "price": 202000
                  }
                ]
                """;
        ;

        mockServer.expect(requestTo("http://mysql_server_products:8080/api/products"))
                .andRespond(withSuccess(mockCatalogJson, MediaType.APPLICATION_JSON));

        PurchaseRequestDTO request = new PurchaseRequestDTO("usr-0001", validProductId);

        // Act & Assert
        restTestClient.post()
                .uri("/api/users/purchase")
                .contentType(MediaType.APPLICATION_JSON)
                .body(request) // 🚀 Enviamos la entidad al controlador real
                .exchange()
                .expectStatus().isCreated() // HTTP 201
                .expectBody(UserProductDetailDTO.class)
                .consumeWith(response -> {
                    UserProductDetailDTO purchase = response.getResponseBody();
                    assertThat(purchase).isNotNull();
                    assertThat(purchase.relationId()).startsWith("rel-");
                    assertThat(purchase.productMetadata().name()).isEqualTo("Celular Microsoft Ultra");
                });

    }
}
