package id.kcsi.salah;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.web.SecurityFilterChain;

// CONTOH SALAH (JSB-602): pemeriksaan token dapat dimatikan lewat konfigurasi.
// Pola ini ditemukan di spike: bila AUTH_ISSUER kosong, semua permintaan lolos.
@Configuration
public class KeamananLonggar {

  @Bean
  SecurityFilterChain rantai(HttpSecurity http, @Value("${AUTH_ISSUER:}") String issuer) throws Exception {
    http.csrf(c -> c.disable()); // SALAH JSB-604: CSRF mati tanpa alasan tercatat (FindSecBugs)
    if (issuer.isBlank()) {
      http.authorizeHttpRequests(a -> a.anyRequest().permitAll()); // SALAH JSB-602
      return http.build();
    }
    http.authorizeHttpRequests(a -> a.anyRequest().authenticated());
    return http.build();
  }
}
