package co.com.netec.users.configurations;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.beans.factory.config.ConfigurableBeanFactory;
import org.springframework.boot.restclient.autoconfigure.RestClientBuilderConfigurer;
import org.springframework.cloud.client.loadbalancer.LoadBalanced;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Primary;
import org.springframework.context.annotation.Scope;
import org.springframework.web.client.RestClient;

@Configuration
public class RestClientConfig {
    private static final Logger log = LoggerFactory.getLogger(RestClientConfig.class);

    // @Bean
    // @LoadBalanced
    // public RestClient.Builder loadBalancedBuilder() {
    // return RestClient.builder();
    // }
    //
    // @Bean
    // public RestClient productRestClient(RestClient.Builder loadBalancedBuilder,
    // @Value("${api.products.url}") String baseUrl) {
    // log.info("[url:{}][message: url to connect api products via Eureka
    // LoadBalancer...]", baseUrl);
    // return loadBalancedBuilder
    // .baseUrl(baseUrl)
    // .build();
    // }

    @Bean
    @Primary
    @Scope(ConfigurableBeanFactory.SCOPE_PROTOTYPE)
    public RestClient.Builder restClientBuilder(RestClientBuilderConfigurer configurer) {
        return configurer.configure(RestClient.builder());
    }

    @Bean
    @LoadBalanced
    public RestClient.Builder loadBalancedRestClientBuilder(RestClientBuilderConfigurer configurer) {
        return configurer.configure(RestClient.builder());
    }

    @Bean
    public RestClient serviceARestClient(@LoadBalanced RestClient.Builder builder,
            @Value("${api.products.url}") String baseUrl) {
        return builder.baseUrl(baseUrl).build();
    }
}
