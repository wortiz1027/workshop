package co.com.netec.api_gateway.interceptors;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class GatewayInterceptor implements HandlerInterceptor {

    private static final Logger log = LoggerFactory.getLogger(GatewayInterceptor.class);

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
            throws Exception {
        // 🚀 CAPTURA LA URL COMPLETA (Ej: http://localhost:8000/api/products/xyz)
        String fullUrl = request.getRequestURL().toString();
        String queryString = request.getQueryString();
        if (queryString != null) {
            fullUrl += "?" + queryString;
        }

        log.info("🚨 [GATEWAY WEBMVC INICIO]");
        log.info("🌐 URL Completa Detectada: {}", fullUrl);
        log.info("🛤️ URI de enrutamiento interna: {}", request.getRequestURI());
        log.info("👤 User-Agent del Cliente: {}", request.getHeader("User-Agent"));

        // Auditamos si viajan cabeceras de tracking previas
        log.info("🆔 TraceId en Cabecera: {}", request.getHeader("X-Trace-Id"));
        log.info("-------------------------------------------------------------------");

        return true;
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
            throws Exception {
        // 🚀 CAPTURA LA URL DE SALIDA CALCULADA POR SPRING CLOUD GATEWAY
        // Almacenada en los atributos internos del hilo del Servlet
        Object routeUriAttr = request
                .getAttribute("org.springframework.cloud.gateway.support.ServerWebExchangeUtils.gatewayRequestUrlAttr");

        log.info("🎯 [GATEWAY WEBMVC FINALIZACIÓN]");
        log.info("🛤️ Ruta destino final calculada: {}",
                (routeUriAttr != null) ? routeUriAttr.toString() : "NINGUNA (Se quedó local / 404)");
        log.info("📊 Código HTTP devuelto al cliente: {}", response.getStatus());
        log.info("-------------------------------------------------------------------");
    }
}
