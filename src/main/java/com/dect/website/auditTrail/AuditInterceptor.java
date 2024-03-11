// AuditInterceptor.java
package com.dect.website.auditTrail;

import com.dect.website.entity.primary.AuditTrail;
import com.dect.website.repository.primary.AuditTrailRepository;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;

import java.time.LocalDateTime;

@Component
public class AuditInterceptor implements HandlerInterceptor {
    private final AuditTrailRepository auditTrailRepository;

    public AuditInterceptor(AuditTrailRepository auditTrailRepository) {
        this.auditTrailRepository = auditTrailRepository;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        // Identify specific APIs to track

        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();

        String username = "";
        if (authentication != null && authentication.isAuthenticated()) {
            username = authentication.getName();
        }

        HttpSession session = request.getSession(false);
        String requestURI = request.getRequestURI();
        if (request.getServletPath().matches ("/secure/.*")) {
            String ipAddress = request.getRemoteAddr();
            String userAgent = request.getHeader("User-Agent");
            String url = request.getRequestURI();
            String httpMethod = request.getMethod();
            LocalDateTime requestedOn = LocalDateTime.now();
            String responseStatus = String.valueOf(response.getStatus());

            AuditTrail auditTrail = new AuditTrail();
            auditTrail.setIpAddress(ipAddress);
            auditTrail.setUserAgent(userAgent);
            auditTrail.setUrl(url);
            auditTrail.setUserName(username);
            auditTrail.setHttpMethod(httpMethod);
            auditTrail.setRequestedOn(requestedOn);
            auditTrail.setResponseStatus(responseStatus);
            auditTrail.setAction("Logged in");

            auditTrailRepository.save(auditTrail);
        }
        return true;
    }

    public void logFailedLoginAttempt(HttpServletRequest request, HttpServletResponse response, String action) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String username = authentication != null ? authentication.getName() : "Anonymous";

        String ipAddress = request.getRemoteAddr();
        String userAgent = request.getHeader("User-Agent");
        String url = request.getRequestURI();
        String httpMethod = request.getMethod();
        LocalDateTime requestedOn = LocalDateTime.now();
        String responseStatus = String.valueOf(response.getStatus());

        AuditTrail auditTrail = new AuditTrail();
        auditTrail.setIpAddress(ipAddress);
        auditTrail.setUserAgent(userAgent);
        auditTrail.setUrl(url);
        auditTrail.setUserName(username);
        auditTrail.setHttpMethod(httpMethod);
        auditTrail.setRequestedOn(requestedOn);
        auditTrail.setResponseStatus(responseStatus);
        auditTrail.setAction(action);

        auditTrailRepository.save(auditTrail);
    }
}
