package co.com.netec.users.configs;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestClient;

@Configuration // 🚀 Asegura que Spring detecte este componente al arrancar
public class RestClientConfig {

    @Bean
    public RestClient productRestClient(
            @Value("${api.products.url}") String baseUrl) {
        return RestClient.builder()
                .baseUrl(baseUrl)
                .build();
    }
}
