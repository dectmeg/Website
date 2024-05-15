package com.dect.website.config;
import com.dect.website.auditTrail.AuditInterceptor;
import com.dect.website.auditTrail.CustomLoginFailureHandler;
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
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.csrf.CookieCsrfTokenRepository;


@EnableWebSecurity
@Configuration
@EnableMethodSecurity
public class SecurityConfig {

    String cspstring = "default-src 'self';"
            + "style-src 'self' 'unsafe-inline' data:;"
            + "media-src * data:;"
            + "child-src 'self' blob: https://www.google.com/;"
            + "base-uri 'self' blob:;"
            + "object-src 'self' data:;"
            + "font-src 'self' data: https://fonts.gstatic.com;"
            + "img-src 'self' data:;";

    @Autowired
    AuditTrailRepository auditTrailRepository;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        return http
                .csrf((csrf) -> csrf.csrfTokenRepository(CookieCsrfTokenRepository.withHttpOnlyFalse()))
                .cors(AbstractHttpConfigurer::disable)
//                .addFilterBefore(requestLoggingFilter, UsernamePasswordAuthenticationFilter.class)
                .authorizeHttpRequests((authorizeRequests) ->
                        authorizeRequests
                                .requestMatchers("/secure/**").authenticated()
                                .requestMatchers("/**").permitAll()
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
                )
                .headers((headers) -> headers
                        .contentSecurityPolicy((csp) -> csp.policyDirectives(cspstring))
                        .frameOptions(HeadersConfigurer.FrameOptionsConfig::sameOrigin))
                .build();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {

        return authenticationConfiguration.getAuthenticationManager();

    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

}
