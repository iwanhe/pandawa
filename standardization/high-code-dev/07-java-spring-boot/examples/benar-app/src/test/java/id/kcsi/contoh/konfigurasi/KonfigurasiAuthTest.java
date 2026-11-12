package id.kcsi.contoh.konfigurasi;

import static org.assertj.core.api.Assertions.assertThat;

import jakarta.validation.Validation;
import jakarta.validation.Validator;
import jakarta.validation.ValidatorFactory;
import java.util.List;
import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.Test;

/** JSB-602, JSB-701: konfigurasi IdP wajib; nilai kosong membuat aplikasi gagal start. */
class KonfigurasiAuthTest {

  private static ValidatorFactory pabrik;
  private static Validator validator;

  @BeforeAll
  static void siapkan() {
    pabrik = Validation.buildDefaultValidatorFactory();
    validator = pabrik.getValidator();
  }

  @AfterAll
  static void tutup() {
    pabrik.close();
  }

  @Test
  void menerimaKonfigurasiLengkapDanMembuangOriginKosong() {
    KonfigurasiAuth auth =
        new KonfigurasiAuth(
            "https://idp.contoh.id/realms/pandawa",
            "supplier-api",
            "https://idp.contoh.id/realms/pandawa/protocol/openid-connect/certs",
            List.of("https://supplier.contoh.id", ""));
    assertThat(validator.validate(auth)).isEmpty();
    assertThat(auth.corsOrigins()).containsExactly("https://supplier.contoh.id");
  }

  @Test
  void menolakIssuerKosongSehinggaTokenTidakBisaDimatikan() {
    KonfigurasiAuth auth =
        new KonfigurasiAuth("", "supplier-api", "https://idp.contoh.id/certs", null);
    assertThat(validator.validate(auth))
        .extracting(pelanggaran -> pelanggaran.getPropertyPath().toString())
        .contains("issuer");
  }
}
