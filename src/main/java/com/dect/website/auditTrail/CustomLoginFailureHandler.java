package com.dect.website.auditTrail;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;
import java.io.IOException;

@Component
public class CustomLoginFailureHandler implements AuthenticationFailureHandler {

    private final AuditInterceptor auditInterceptor;

    public CustomLoginFailureHandler(AuditInterceptor auditInterceptor) {
        this.auditInterceptor = auditInterceptor;
    }

    @Override
    public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response, AuthenticationException exception) throws IOException, ServletException {

        auditInterceptor.logFailedLoginAttempt(request, response, "Unsuccessful login");

        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);

        response.sendRedirect("/login?error");
    }
}
