package co.com.netec.users.configs;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestClient;

@Configuration // 🚀 Asegura que Spring detecte este componente al arrancar
public class RestClientConfig {
    private static final Logger log = LoggerFactory.getLogger(RestClientConfig.class);

    @Bean
    public RestClient productRestClient(
            @Value("${api.products.url}") String baseUrl) {
        log.debug("[* * * * * * ] ------> [URL_PRODUCTS]: [{}]", baseUrl);
        return RestClient.builder()
                .baseUrl(baseUrl)
                .build();
    }

    // @Bean
    // public OtlpGrpcSpanExporter otlpHttpSpanExporter(@Value("${tracing.url}")
    // String url) {
    // return OtlpGrpcSpanExporter.builder().setEndpoint(url).build();
    // }
}
