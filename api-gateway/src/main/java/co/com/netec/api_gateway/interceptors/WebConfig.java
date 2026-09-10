package co.com.netec.api_gateway.interceptors;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    private final GatewayInterceptor gatewayInterceptor;

    public WebConfig(GatewayInterceptor gatewayInterceptor) {
        this.gatewayInterceptor = gatewayInterceptor;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // Escucha absolutamente todas las rutas que entren al puerto 8000
        registry.addInterceptor(gatewayInterceptor).addPathPatterns("/**");
    }
}
