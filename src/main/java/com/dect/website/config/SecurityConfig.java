package com.dect.website.config;
import com.dect.website.auditTrail.AuditInterceptor;
import com.dect.website.auditTrail.CustomLoginFailureHandler;
import com.dect.website.helper.LoginSuccessHandler;
import com.dect.website.repository.primary.AuditTrailRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.annotation.web.configurers.HeadersConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.csrf.HttpSessionCsrfTokenRepository;
import org.springframework.security.web.header.writers.StaticHeadersWriter;
import org.springframework.security.web.header.writers.XXssProtectionHeaderWriter;
import org.springframework.security.web.header.writers.ReferrerPolicyHeaderWriter;
import org.springframework.security.web.header.writers.ReferrerPolicyHeaderWriter.ReferrerPolicy;



@EnableWebSecurity
@Configuration
@EnableMethodSecurity
public class SecurityConfig {

    String cspstring = "default-src 'self';" +
            "style-src 'self' 'unsafe-inline' https://fonts.googleapis.com;" +
            "style-src-elem 'self' https://fonts.googleapis.com;" +
            "media-src 'self';" +
            "child-src 'self' https://www.google.com/;" +
            "base-uri 'self';" +
            "object-src 'self';" +
            "font-src 'self' https://fonts.gstatic.com data:;" +
            "img-src 'self' data:;";



    @Autowired
    AuditTrailRepository auditTrailRepository;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        return http
//                .csrf((csrf) -> csrf.csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse()))
                .csrf((csrf) -> csrf.csrfTokenRepository(new HttpSessionCsrfTokenRepository()))
                .cors(AbstractHttpConfigurer::disable)
//                .addFilterBefore(requestLoggingFilter, UsernamePasswordAuthenticationFilter.class)
                .authorizeHttpRequests((authorizeRequests) ->
                        authorizeRequests
                                .requestMatchers("/secure/**").authenticated()
                                .requestMatchers("/**").permitAll()
                                .requestMatchers("/employment_services/**").permitAll()
                                .requestMatchers("/static/**").permitAll()
                                .requestMatchers("/static/css/pages/**").permitAll()
                                .requestMatchers("/","/refresh-captcha","/access-denied").permitAll()
                )
                .formLogin(login ->
                        login
                                .defaultSuccessUrl("/secure/dashboard", true)
                                .loginPage("/login")
                                .failureUrl("/login?error")
                                .failureHandler(new CustomLoginFailureHandler(new AuditInterceptor(auditTrailRepository)))
                                .permitAll()
                )
                .logout(logout ->
                        logout
                                .invalidateHttpSession(true)
                                .clearAuthentication(true)
                                .logoutUrl("/logout")
                                .logoutSuccessUrl("/login?logout")
                                .permitAll()
                ).sessionManagement((session) -> session
                        .sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED)
                        .sessionFixation()
                        .migrateSession()
                        .invalidSessionUrl("/login")
                )
                .headers((headers) -> headers
                        .contentSecurityPolicy((csp) -> csp.policyDirectives(cspstring))
                        .frameOptions(HeadersConfigurer.FrameOptionsConfig::sameOrigin)
                        .addHeaderWriter(new StaticHeadersWriter("Set-Cookie", "SameSite=Strict; HttpOnly; Secure"))
                        .xssProtection((xss) -> xss.headerValue(XXssProtectionHeaderWriter.HeaderValue.ENABLED_MODE_BLOCK))
                        .addHeaderWriter(new ReferrerPolicyHeaderWriter(ReferrerPolicy.SAME_ORIGIN))
                )
                .build();

    }



    @Bean

    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {

        return authenticationConfiguration.getAuthenticationManager();

    }

    @Bean
    public AuthenticationSuccessHandler authenticationSuccessHandler(){
        return new LoginSuccessHandler();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
