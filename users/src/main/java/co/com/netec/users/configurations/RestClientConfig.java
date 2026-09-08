package co.com.netec.users.configurations;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestClient;

@Configuration
public class RestClientConfig {
    private static final Logger log = LoggerFactory.getLogger(RestClientConfig.class);

    @Bean
    public RestClient productRestClient(RestClient.Builder client,
            @Value("${api.products.url}") String baseUrl) {
        log.info("[url:{}][message: url to connect api products...]", baseUrl);
        return client
                .baseUrl(baseUrl)
                .build();
    }
}
