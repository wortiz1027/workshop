package co.com.netec.products.controller;

import static org.assertj.core.api.Assertions.assertThat;

import java.math.BigDecimal;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.resttestclient.autoconfigure.AutoConfigureRestTestClient;
import org.springframework.boot.test.context.SpringBootTest;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.client.RestTestClient;

import co.com.netec.products.dtos.ProductDTO;

@AutoConfigureRestTestClient
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class ProductControllerIntegrationTest {

        @Autowired
        private RestTestClient restClient;

        @Test
        void testGetAllProducts_ReturnsHttpStatus200AndJsonArray() throws Exception {
                restClient.get()
                                .uri("/api/products")
                                .accept(MediaType.APPLICATION_JSON)
                                .exchange()
                                .expectStatus().isOk()
                                .expectHeader().contentType(MediaType.APPLICATION_JSON)
                                .expectBody(ProductDTO[].class)
                                .consumeWith(response -> {
                                        ProductDTO[] products = response.getResponseBody();
                                        assertThat(products).isNotEmpty();
                                        assertThat(products[0].id()).isNotNull();
                                        assertThat(products[0].name()).isNotNull();
                                });
        }

        @Test
        void testGetNamesList_ReturnsHttpStatus200AndStringData() throws Exception {
                restClient.get()
                                .uri("/api/products/names-list")
                                .exchange()
                                .expectStatus().isOk()
                                .expectBody(String.class)
                                .consumeWith(response -> {
                                        String body = response.getResponseBody();
                                        assertThat(body).isNotNull();
                                        assertThat(body).contains("|");
                                });
        }

        @Test
        void testApplyBulkDiscount_Returns200AndUpdatedPrices() {
                restClient.put()
                                .uri(uriBuilder -> uriBuilder
                                                .path("/api/products/bulk-discount")
                                                .queryParam("keyword", "Laptop")
                                                .queryParam("percentage", 20.0)
                                                .build())
                                .exchange()
                                .expectStatus().isOk()
                                .expectBody(ProductDTO[].class)
                                .consumeWith(response -> {
                                        ProductDTO[] products = response.getResponseBody();
                                        assertThat(products).isNotEmpty();
                                        // Verifica que los controles de tu script inicial ahora tengan el precio
                                        // reducido
                                        assertThat(products[0].price()).isLessThan(BigDecimal.valueOf(3992000.000));
                                });
        }

        @Test
        void testApplyBulkDiscount_Returns422_WhenPercentageIsInvalid() {
                restClient.put()
                                .uri(uriBuilder -> uriBuilder
                                                .path("/api/products/bulk-discount")
                                                .queryParam("keyword", "Xbox")
                                                .queryParam("percentage", "99.0")
                                                // en el test
                                                .build())
                                .exchange()
                                .expectStatus().isEqualTo(HttpStatus.UNPROCESSABLE_CONTENT)
                                .expectBody()
                                .jsonPath("$.status").isEqualTo(HttpStatus.UNPROCESSABLE_CONTENT.value());
        }

        @Test
        void testGetProductsByPriceNative_ReturnsPagedData() {
                restClient.get()
                                .uri(uriBuilder -> uriBuilder
                                                .path("/api/products/search-native")
                                                .queryParam("minPrice", 2000000) // Filtrará los productos caros (como
                                                // consolas o TV)
                                                .queryParam("page", 0)
                                                .queryParam("size", 2)
                                                .build())
                                .exchange()
                                .expectStatus().isOk()
                                .expectBody()
                                .jsonPath("$.content").isArray()
                                .jsonPath("$.totalElements").isNotEmpty()
                                .jsonPath("$.content[0].price").isNumber();
        }

        @Test
        void testGetProductsByPriceNative_ValidateWithJsonPath() {
                restClient.get()
                                .uri(uriBuilder -> uriBuilder
                                                .path("/api/products/search-native")
                                                .queryParam("minPrice", 3000000)
                                                .queryParam("page", 0)
                                                .queryParam("size", 2)
                                                .build())
                                .exchange()
                                .expectStatus().isOk()
                                .expectBody()
                                .jsonPath("$.content").isArray()
                                .jsonPath("$.content[0].id").exists()
                                .jsonPath("$.content[0].name").isEqualTo("Laptop Lenovo Ultra")
                                .jsonPath("$.pageable.pageNumber").isEqualTo(0)
                                .jsonPath("$.pageable.pageSize").isEqualTo(2);
        }

        @Test
        void testAddProductNative_Returns201CreatedAndSavedObject() {
                ProductDTO newProduct = new ProductDTO(null, "TESTCODE99",
                                "Teclado Mecánico", "RGB Gamer",
                                BigDecimal.valueOf(450000));

                restClient.post()
                                .uri("/api/products/native")
                                .contentType(MediaType.APPLICATION_JSON)
                                .body(newProduct)
                                .exchange()
                                .expectStatus().isCreated() // Valida HTTP 201
                                .expectBody(ProductDTO.class)
                                .consumeWith(response -> {
                                        ProductDTO result = response.getResponseBody();
                                        assertThat(result).isNotNull();
                                        assertThat(result.id()).isNotNull();
                                        assertThat(result.code()).isEqualTo("TESTCODE99");
                                });
        }

        @Test
        void testAddProductNative_ValidateWithJsonPath() {
                ProductDTO newProduct = new ProductDTO(null, "MOU-RGB-01", "Mouse Gamer v2",
                                "16000 DPI",
                                BigDecimal.valueOf(120000));

                restClient.post()
                                .uri("/api/products/native")
                                .contentType(MediaType.APPLICATION_JSON)
                                .body(newProduct)
                                .exchange()
                                .expectStatus().isCreated()
                                // Validamos la respuesta sin instanciar la clase DTO en el test
                                .expectBody()
                                .jsonPath("$.id").isNotEmpty() // Verifica que el UUID fue generado en backend
                                .jsonPath("$.code").isEqualTo("MOU-RGB-01")
                                .jsonPath("$.price").isEqualTo(120000)
                                .jsonPath("$.description").isEqualTo("16000 DPI");
        }

}