package co.com.netec.products.configurations;

import io.opentelemetry.api.trace.Span;
import jakarta.servlet.Filter;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.ServletRequest;
import jakarta.servlet.ServletResponse;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Component;
import java.io.IOException;

@Component
public class TraceIdFilter implements Filter {
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        if (response instanceof HttpServletResponse httpResponse) {
            String traceId = Span.current().getSpanContext().getTraceId();
            httpResponse.setHeader("X-Trace-Id", traceId);
        }
        chain.doFilter(request, response);
    }
}
