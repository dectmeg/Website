package com.dect.website.auditTrail;

import com.dect.website.repository.primary.AuditTrailRepository;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

// WebMvcConfig.java
@Configuration
public class WebMvcConfig implements WebMvcConfigurer {
    private final AuditTrailRepository auditTrailRepository;

    public WebMvcConfig(AuditTrailRepository auditTrailRepository) {
        this.auditTrailRepository = auditTrailRepository;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new AuditInterceptor(auditTrailRepository));
    }
}

