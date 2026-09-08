package co.com.netec.products.configurations;

import io.opentelemetry.api.baggage.Baggage;
import io.opentelemetry.api.trace.Span;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class TelemetryConfig {

    @Bean
    public Filter captureUserFromNetworkFilter() {
        return (ServletRequest request, ServletResponse response, FilterChain chain) -> {

            // 1. Extraemos el Baggage que OpenTelemetry ya leyó de las cabeceras HTTP
            // entrantes
            String userIdFromNetwork = Baggage.current().getEntryValue("user.id");

            if (userIdFromNetwork != null) {
                // 2. Buscamos el Span actual que Spring Boot creó automáticamente para este
                // Controller
                Span currentSpan = Span.current();

                // 3. Le clavamos la etiqueta para que sea visible en Jaeger dentro de este
                // microservicio
                currentSpan.setAttribute("network.origin.user.id", userIdFromNetwork);
            }

            // Continuar con la ejecución normal del endpoint de productos
            chain.doFilter(request, response);
        };
    }
}