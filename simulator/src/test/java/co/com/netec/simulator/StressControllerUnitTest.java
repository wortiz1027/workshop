package co.com.netec.simulator;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import co.com.netec.simulator.controller.StressController;

import static org.hamcrest.Matchers.is;
import static org.hamcrest.Matchers.notNullValue;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

public class StressControllerUnitTest {
    private MockMvc mockMvc;

    @BeforeEach
    void setUp() {
        // Inicializa el controlador en modo aislado para una prueba unitaria pura y
        // ultra veloz
        this.mockMvc = MockMvcBuilders.standaloneSetup(new StressController()).build();
    }

    @Test
    @DisplayName("🧪 Debe retornar estado UP en el endpoint de salud")
    void shouldReturnHealthStatusUp() throws Exception {
        mockMvc.perform(get("/api/v1/simulator/health")
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.status", is("UP")))
                .andExpect(jsonPath("$.message", notNullValue()));
    }

    @Test
    @DisplayName("🚨 Debe ejecutar el bucle matemático y responder exitosamente")
    void shouldExecuteStressLoopSuccessfully() throws Exception {
        // 🎯 Asegura que la ruta empiece por la nueva URI base
        mockMvc.perform(get("/api/v1/simulator/stress")
                .accept(MediaType.APPLICATION_JSON))
                .andExpect(status().isOk())
                .andExpect(jsonPath("$.status", is("🚨 CPU Estresada con Éxito")))
                .andExpect(jsonPath("$.processedByPod", notNullValue()))
                .andExpect(jsonPath("$.executionTimeMs", notNullValue())); // 🚀 Sincronizado
    }

}
