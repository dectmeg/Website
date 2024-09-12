package com.dect.website.helper;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

@Component
public class LoginSuccessHandler implements AuthenticationSuccessHandler {

    @Override
    public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication) throws IOException, ServletException {

        String captcha = request.getParameter("captcha");
        String hiddenCaptcha = request.getParameter("hiddenCaptcha");

        if (captcha != null && captcha.equals(hiddenCaptcha)) {
            response.sendRedirect("/secure/dashboard"); // Redirect to secure dashboard on successful login
        } else {
            response.sendRedirect("/login?captcha"); // Redirect to login page with captcha error
        }
    }
}
