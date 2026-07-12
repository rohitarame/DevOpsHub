package com.DevOpsHub.config;

import io.swagger.v3.oas.models.OpenAPI;
import io.swagger.v3.oas.models.info.Info;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

@Configuration
public class OpenApiConfig {
    @Bean
    public OpenAPI DevOpsHubOpenAPI() {
        return new OpenAPI()
            .info(new Info()
                .title("DevOpsHub API")
                .description("Enterprise PaaS APIs for authentication, dashboard and deployment orchestration")
                .version("1.0.0"));
    }
}
