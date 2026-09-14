package co.com.netec.simulator.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import java.util.HashMap;
import java.util.Map;

@RestController
@RequestMapping("/api/v1/simulator")
public class StressController {

    private static final Logger log = LoggerFactory.getLogger(StressController.class);

    @GetMapping("/health")
    public Map<String, String> getHealth() {
        Map<String, String> response = new HashMap<>();
        response.put("status", "UP");
        response.put("message", "👋 El microservicio está vivo y saludable");
        return response;
    }

    @GetMapping("/stress")
    public Map<String, String> simulateStress() {
        String podName = System.getenv().getOrDefault("HOSTNAME", "Instancia Local");
        log.info("🔥 [SRE ALERT] Petición de estrés recibida en el Pod: {}", podName);

        long startTime = System.currentTimeMillis();

        // Bucle matemático de estrés de CPU
        double x = 0.0001;
        for (long i = 0; i < 80_000_000L; i++) {
            x += Math.atan(x) + Math.sin(x);
        }

        long duration = System.currentTimeMillis() - startTime;
        log.info("✅ [SRE SUCCESS] Ciclo de estrés finalizado en {} ms en el Pod: {}", duration, podName);

        Map<String, String> response = new HashMap<>();
        response.put("status", "🚨 CPU Estresada con Éxito");
        // 🚀 CORRECCIÓN CLAVE: El nombre debe coincidir exactamente con el de la prueba
        response.put("executionTimeMs", String.valueOf(duration));
        response.put("processedByPod", podName);

        return response;
    }
}
