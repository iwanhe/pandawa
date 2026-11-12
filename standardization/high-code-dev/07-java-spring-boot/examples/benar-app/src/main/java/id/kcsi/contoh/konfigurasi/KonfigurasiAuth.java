package id.kcsi.contoh.konfigurasi;

import jakarta.validation.constraints.NotBlank;
import java.util.List;
import org.hibernate.validator.constraints.URL;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.validation.annotation.Validated;

/**
 * Konfigurasi penyedia identitas (JSB-701, JSB-602).
 *
 * <p>Semua nilai wajib. Bila kosong, aplikasi gagal start; tidak ada mode "tanpa token".
 *
 * @param issuer URL issuer token (klaim iss)
 * @param audience nilai klaim aud yang diterima aplikasi ini
 * @param jwksUrl URL kunci publik (JWKS) dari penyedia identitas
 * @param corsOrigins daftar origin frontend yang diizinkan memanggil API
 */
@Validated
@ConfigurationProperties(prefix = "aplikasi.auth")
public record KonfigurasiAuth(
    @NotBlank @URL String issuer,
    @NotBlank String audience,
    @NotBlank @URL String jwksUrl,
    List<String> corsOrigins) {

  public KonfigurasiAuth {
    corsOrigins =
        corsOrigins == null
            ? List.of()
            : corsOrigins.stream().filter(asal -> !asal.isBlank()).toList();
  }
}
