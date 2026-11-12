package id.kcsi.contoh.keamanan;

import id.kcsi.contoh.konfigurasi.KonfigurasiAuth;
import id.kcsi.contoh.umum.FilterKorelasi;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.Map;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.Customizer;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.core.DelegatingOAuth2TokenValidator;
import org.springframework.security.oauth2.core.OAuth2TokenValidator;
import org.springframework.security.oauth2.jose.jws.SignatureAlgorithm;
import org.springframework.security.oauth2.jwt.Jwt;
import org.springframework.security.oauth2.jwt.JwtClaimNames;
import org.springframework.security.oauth2.jwt.JwtClaimValidator;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.security.oauth2.jwt.JwtValidators;
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
import org.springframework.security.oauth2.server.resource.authentication.JwtAuthenticationConverter;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.session.DisableEncodeUrlFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

/**
 * Keamanan API (JSB-601 s.d. JSB-605).
 *
 * <p>Semua endpoint wajib membawa token dari penyedia identitas, kecuali health check. Tidak ada
 * konfigurasi yang dapat mematikan pemeriksaan ini (JSB-602).
 */
@Configuration
@EnableMethodSecurity
public class KeamananConfig {

  @Bean
  SecurityFilterChain rantaiKeamanan(HttpSecurity http, PenanganGagalAkses penangan)
      throws Exception {
    http.addFilterBefore(new FilterKorelasi(), DisableEncodeUrlFilter.class)
        // JSB-604: API stateless dengan Bearer token, tanpa cookie sesi.
        .csrf(csrf -> csrf.disable())
        .sessionManagement(s -> s.sessionCreationPolicy(SessionCreationPolicy.STATELESS))
        .cors(Customizer.withDefaults())
        .headers(h -> h.contentSecurityPolicy(c -> c.policyDirectives("default-src 'none'")))
        .authorizeHttpRequests(
            a ->
                a.requestMatchers(HttpMethod.GET, "/actuator/health", "/actuator/health/**")
                    .permitAll()
                    .anyRequest()
                    .authenticated())
        .oauth2ResourceServer(
            o ->
                o.jwt(j -> j.jwtAuthenticationConverter(pengubahPeran()))
                    .authenticationEntryPoint(penangan)
                    .accessDeniedHandler(penangan))
        .exceptionHandling(e -> e.authenticationEntryPoint(penangan).accessDeniedHandler(penangan));
    return http.build();
  }

  /** JSB-601: tanda tangan (JWKS), algoritma, issuer, masa berlaku, dan audience diperiksa. */
  @Bean
  JwtDecoder jwtDecoder(KonfigurasiAuth auth) {
    NimbusJwtDecoder pembaca =
        NimbusJwtDecoder.withJwkSetUri(auth.jwksUrl())
            .jwsAlgorithm(SignatureAlgorithm.RS256)
            .build();
    pembaca.setJwtValidator(validatorToken(auth));
    return pembaca;
  }

  /** Validator klaim token; dipakai juga oleh uji integrasi agar aturannya sama persis. */
  public static OAuth2TokenValidator<Jwt> validatorToken(KonfigurasiAuth auth) {
    OAuth2TokenValidator<Jwt> audience =
        new JwtClaimValidator<List<String>>(
            JwtClaimNames.AUD, aud -> aud != null && aud.contains(auth.audience()));
    return new DelegatingOAuth2TokenValidator<>(
        JwtValidators.createDefaultWithIssuer(auth.issuer()), audience);
  }

  /** JSB-604: hanya origin dari konfigurasi yang boleh memanggil API dari browser. */
  @Bean
  CorsConfigurationSource sumberCors(KonfigurasiAuth auth) {
    CorsConfiguration cors = new CorsConfiguration();
    cors.setAllowedOrigins(auth.corsOrigins());
    cors.setAllowedMethods(List.of("GET", "POST", "PUT", "PATCH", "DELETE"));
    cors.setAllowedHeaders(
        List.of("Authorization", "Content-Type", "Idempotency-Key", FilterKorelasi.HEADER));
    cors.setExposedHeaders(List.of(FilterKorelasi.HEADER));
    UrlBasedCorsConfigurationSource sumber = new UrlBasedCorsConfigurationSource();
    sumber.registerCorsConfiguration("/api/**", cors);
    return sumber;
  }

  /** Peran dari klaim realm_access.roles (format Keycloak) menjadi ROLE_&lt;peran&gt;. */
  private static JwtAuthenticationConverter pengubahPeran() {
    JwtAuthenticationConverter pengubah = new JwtAuthenticationConverter();
    pengubah.setJwtGrantedAuthoritiesConverter(KeamananConfig::peranDari);
    return pengubah;
  }

  private static Collection<GrantedAuthority> peranDari(Jwt jwt) {
    Map<String, Object> akses = jwt.getClaimAsMap("realm_access");
    Collection<GrantedAuthority> hasil = new ArrayList<>();
    if (akses != null && akses.get("roles") instanceof List<?> daftar) {
      for (Object peran : daftar) {
        hasil.add(new SimpleGrantedAuthority("ROLE_" + peran));
      }
    }
    return hasil;
  }
}
