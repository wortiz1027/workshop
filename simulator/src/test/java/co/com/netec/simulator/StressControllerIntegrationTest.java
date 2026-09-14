package co.com.netec.simulator;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.resttestclient.autoconfigure.AutoConfigureRestTestClient;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.client.RestTestClient;

import java.util.Map;

import static org.assertj.core.api.Assertions.assertThat;

@AutoConfigureRestTestClient
@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
class UserControllerIntegrationTest {

    @Autowired
    private RestTestClient restTestClient;

    @LocalServerPort
    private int port;

    @BeforeEach
    void setUp() {
        // 🔌 Conectamos el RestTestClient al servidor real de Tomcat que levantó K8s
        this.restTestClient = RestTestClient.bindToServer()
                .baseUrl("http://localhost:" + port)
                .build();
    }

    @Test
    @DisplayName("🌐 Integración: Validar endpoint de Salud con RestTestClient")
    void integrationTestHealthEndpoint() {
        this.restTestClient.get()
                .uri("/api/v1/simulator/health")
                .accept(MediaType.APPLICATION_JSON)
                .exchange() // Dispara la llamada síncrona
                .expectStatus().isOk() // Valida un HTTP 200 OK de forma fluida
                .expectBody(Map.class)
                .value(response -> {
                    assertThat(response).isNotNull();
                    assertThat(response.get("status")).isEqualTo("UP");
                    assertThat(response.get("message")).toString().contains("vivo");
                });
    }

    @Test
    @DisplayName("🌐 Integración: Validar procesamiento del bucle de estrés con RestTestClient")
    void integrationTestStressEndpoint() {
        this.restTestClient.get()
                .uri("/api/v1/simulator/stress")
                .accept(MediaType.APPLICATION_JSON)
                .exchange()
                .expectStatus().isOk()
                .expectBody(Map.class)
                .value(response -> {
                    assertThat(response).isNotNull();
                    assertThat(response.get("status")).isEqualTo("🚨 CPU Estresada con Éxito");
                    assertThat(response.containsKey("executionTimeMs")).isTrue();
                    assertThat(response.containsKey("processedByPod")).isTrue();
                });
    }
}
