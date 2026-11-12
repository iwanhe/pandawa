package id.kcsi.contoh.umum;

import static org.assertj.core.api.Assertions.assertThat;

import org.junit.jupiter.api.Test;
import org.springframework.http.ResponseEntity;

/** JSB-501, JSB-502: model error standar, tanpa detail teknis ke klien. */
class PenanganGalatTest {

  private final PenanganGalat penangan = new PenanganGalat();

  @Test
  void memetakanGalatDomainKeStatusDanKodenya() {
    ResponseEntity<ResponsGalat> hasil =
        penangan.domain(new GalatDomain(KodeGalat.SUPPLIER_DUPLIKAT, "Kode sudah terdaftar"));
    assertThat(hasil.getStatusCode().value()).isEqualTo(409);
    assertThat(hasil.getBody()).isNotNull();
    assertThat(hasil.getBody().success()).isFalse();
    assertThat(hasil.getBody().errors())
        .containsExactly(new ResponsGalat.Rincian("SUP-0409", "Kode sudah terdaftar"));
  }

  @Test
  void menyembunyikanPesanTeknisDiBalikSys0500() {
    ResponseEntity<ResponsGalat> hasil =
        penangan.lainnya(new IllegalStateException("relation \"supplier\" does not exist"));
    assertThat(hasil.getStatusCode().value()).isEqualTo(500);
    assertThat(hasil.getBody()).isNotNull();
    assertThat(hasil.getBody().errors().get(0).code()).isEqualTo("SYS-0500");
    assertThat(hasil.getBody().toString()).doesNotContain("does not exist");
  }
}
