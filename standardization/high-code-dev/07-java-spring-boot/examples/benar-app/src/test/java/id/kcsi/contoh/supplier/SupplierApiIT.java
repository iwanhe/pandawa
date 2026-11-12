package id.kcsi.contoh.supplier;

import static org.assertj.core.api.Assertions.assertThat;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.header;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.jsonPath;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import com.jayway.jsonpath.JsonPath;
import com.nimbusds.jose.jwk.JWKSet;
import com.nimbusds.jose.jwk.RSAKey;
import com.nimbusds.jose.jwk.source.ImmutableJWKSet;
import id.kcsi.contoh.keamanan.KeamananConfig;
import id.kcsi.contoh.konfigurasi.KonfigurasiAuth;
import id.kcsi.contoh.umum.FilterKorelasi;
import java.security.KeyPair;
import java.security.KeyPairGenerator;
import java.security.NoSuchAlgorithmException;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.time.Instant;
import java.util.List;
import java.util.Map;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.context.TestConfiguration;
import org.springframework.boot.testcontainers.service.connection.ServiceConnection;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.http.MediaType;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.security.oauth2.jose.jws.SignatureAlgorithm;
import org.springframework.security.oauth2.jwt.JwsHeader;
import org.springframework.security.oauth2.jwt.JwtClaimsSet;
import org.springframework.security.oauth2.jwt.JwtDecoder;
import org.springframework.security.oauth2.jwt.JwtEncoder;
import org.springframework.security.oauth2.jwt.JwtEncoderParameters;
import org.springframework.security.oauth2.jwt.NimbusJwtDecoder;
import org.springframework.security.oauth2.jwt.NimbusJwtEncoder;
import org.springframework.security.test.web.servlet.setup.SecurityMockMvcConfigurers;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;
import org.testcontainers.junit.jupiter.Container;
import org.testcontainers.junit.jupiter.Testcontainers;
import org.testcontainers.postgresql.PostgreSQLContainer;

/**
 * JSB-902: uji integrasi lewat HTTP (MockMvc + Spring Security) terhadap PostgreSQL sungguhan.
 *
 * <p>Token ditandatangani kunci RSA buatan uji; decoder uji (kelas KunciUji, dideteksi otomatis)
 * memakai validator yang sama dengan produksi. Butuh Docker; tanpa Docker kelas ini dilewati.
 */
@SpringBootTest(
    properties = {
      "DATABASE_URL=jdbc:postgresql://diganti-testcontainers/uji",
      "DATABASE_USERNAME=uji",
      "DATABASE_PASSWORD=uji",
      "AUTH_ISSUER=" + SupplierApiIT.ISSUER,
      "AUTH_AUDIENCE=" + SupplierApiIT.AUDIENCE,
      "AUTH_JWKS_URL=https://idp.contoh.id/tidak-dipanggil-saat-uji",
      "spring.flyway.locations=filesystem:db/migrasi"
    })
@Testcontainers(disabledWithoutDocker = true)
class SupplierApiIT {

  static final String ISSUER = "https://idp.contoh.id/realms/pandawa";
  static final String AUDIENCE = "supplier-api";
  private static final KeyPair PASANGAN = buatPasanganKunci();

  @Container @ServiceConnection
  static final PostgreSQLContainer POSTGRES = new PostgreSQLContainer("postgres:18-alpine");

  @Autowired private WebApplicationContext konteks;
  @Autowired private JdbcClient jdbc;
  private MockMvc mvc;

  @BeforeEach
  void siapkan() {
    mvc =
        MockMvcBuilders.webAppContextSetup(konteks)
            .apply(SecurityMockMvcConfigurers.springSecurity())
            .build();
  }

  @Test
  void healthDapatDiaksesTanpaToken() throws Exception {
    mvc.perform(get("/actuator/health/liveness")).andExpect(status().isOk());
    mvc.perform(get("/actuator/health/readiness")).andExpect(status().isOk());
  }

  @Test
  void menolakTanpaTokenDenganModelErrorStandar() throws Exception {
    MvcResult hasil =
        mvc.perform(get("/api/v1/supplier"))
            .andExpect(status().isUnauthorized())
            .andExpect(jsonPath("$.success").value(false))
            .andExpect(jsonPath("$.errors[0].code").value("AUTH-0401"))
            .andReturn();
    String idKorelasi = JsonPath.read(hasil.getResponse().getContentAsString(), "$.correlationId");
    assertThat(hasil.getResponse().getHeader(FilterKorelasi.HEADER)).isEqualTo(idKorelasi);
  }

  @Test
  void menolakTokenDenganAudienceLain() throws Exception {
    String token = token(List.of("pembaca"), "aplikasi-lain");
    mvc.perform(get("/api/v1/supplier").header("Authorization", "Bearer " + token))
        .andExpect(status().isUnauthorized());
  }

  @Test
  void menolakPenggunaTanpaPeranPengelola() throws Exception {
    mvc.perform(buat(token(List.of("pembaca")), "kunci-uji-0001", isian("SUP-101", "PT A")))
        .andExpect(status().isForbidden())
        .andExpect(jsonPath("$.errors[0].code").value("AUTH-0403"));
  }

  @Test
  void menolakIsianTidakValidFieldTakDikenalDanTanpaKunci() throws Exception {
    String pengelola = token(List.of("pengelola-supplier"));
    mvc.perform(buat(pengelola, "kunci-uji-0002", isian("sup kecil", "PT A")))
        .andExpect(status().isBadRequest())
        .andExpect(jsonPath("$.errors[0].code").value("VAL-0400"));
    String denganFieldAsing = isian("SUP-102", "PT A").replace("}", ",\"nomorRekening\":\"123\"}");
    mvc.perform(buat(pengelola, "kunci-uji-0003", denganFieldAsing))
        .andExpect(status().isBadRequest());
    mvc.perform(
            post("/api/v1/supplier")
                .header("Authorization", "Bearer " + pengelola)
                .contentType(MediaType.APPLICATION_JSON)
                .content(isian("SUP-103", "PT A")))
        .andExpect(status().isBadRequest());
  }

  @Test
  void menyimpanMenulisOutboxDanMengulangResponsUntukKunciSama() throws Exception {
    String pengelola = token(List.of("pengelola-supplier"));
    String pertama =
        mvc.perform(buat(pengelola, "kunci-uji-0004", isian("SUP-104", "PT Sumber Makmur")))
            .andExpect(status().isCreated())
            .andExpect(jsonPath("$.batasKredit").value("1250000.50"))
            .andReturn()
            .getResponse()
            .getContentAsString();
    String ulang =
        mvc.perform(buat(pengelola, "kunci-uji-0004", isian("SUP-104", "PT Sumber Makmur")))
            .andExpect(status().isCreated())
            .andReturn()
            .getResponse()
            .getContentAsString();

    assertThat(ulang).isEqualTo(pertama);
    Integer jumlahOutbox =
        jdbc.sql("select count(*) from outbox where muatan ->> 'kode' = :kode")
            .param("kode", "SUP-104")
            .query(Integer.class)
            .single();
    assertThat(jumlahOutbox).isEqualTo(1);
  }

  @Test
  void menolakKunciSamaIsiBerbedaDanKodeDuplikat() throws Exception {
    String pengelola = token(List.of("pengelola-supplier"));
    mvc.perform(buat(pengelola, "kunci-uji-0005", isian("SUP-105", "PT B")))
        .andExpect(status().isCreated());
    mvc.perform(buat(pengelola, "kunci-uji-0005", isian("SUP-105", "PT Lain")))
        .andExpect(status().is(422))
        .andExpect(jsonPath("$.errors[0].code").value("IDM-0422"));
    mvc.perform(buat(pengelola, "kunci-uji-0006", isian("SUP-105", "PT B")))
        .andExpect(status().isConflict())
        .andExpect(jsonPath("$.errors[0].code").value("SUP-0409"));
  }

  @Test
  void membatasiUkuranHalamanDanMengembalikan404() throws Exception {
    String pembaca = "Bearer " + token(List.of("pembaca"));
    mvc.perform(get("/api/v1/supplier").param("ukuran", "500").header("Authorization", pembaca))
        .andExpect(status().isBadRequest());
    mvc.perform(get("/api/v1/supplier").param("ukuran", "10").header("Authorization", pembaca))
        .andExpect(status().isOk())
        .andExpect(jsonPath("$.ukuran").value(10))
        .andExpect(header().exists(FilterKorelasi.HEADER));
    mvc.perform(get("/api/v1/supplier/999999").header("Authorization", pembaca))
        .andExpect(status().isNotFound())
        .andExpect(jsonPath("$.errors[0].code").value("SUP-0404"));
  }

  private static MockHttpServletRequestBuilder buat(String token, String kunci, String isi) {
    return post("/api/v1/supplier")
        .header("Authorization", "Bearer " + token)
        .header("Idempotency-Key", kunci)
        .contentType(MediaType.APPLICATION_JSON)
        .content(isi);
  }

  private static String isian(String kode, String nama) {
    return "{\"kode\":\"" + kode + "\",\"nama\":\"" + nama + "\",\"kota\":\"Kudus\","
        + "\"batasKredit\":\"1250000.50\"}";
  }

  private static String token(List<String> peran) {
    return token(peran, AUDIENCE);
  }

  private static String token(List<String> peran, String audience) {
    RSAKey kunci =
        new RSAKey.Builder((RSAPublicKey) PASANGAN.getPublic())
            .privateKey((RSAPrivateKey) PASANGAN.getPrivate())
            .keyID("uji")
            .build();
    JwtEncoder penanda = new NimbusJwtEncoder(new ImmutableJWKSet<>(new JWKSet(kunci)));
    Instant sekarang = Instant.now();
    JwtClaimsSet klaim =
        JwtClaimsSet.builder()
            .issuer(ISSUER)
            .audience(List.of(audience))
            .subject("pengguna-uji")
            .issuedAt(sekarang)
            .expiresAt(sekarang.plusSeconds(300))
            .claim("realm_access", Map.of("roles", peran))
            .build();
    JwsHeader kepala = JwsHeader.with(SignatureAlgorithm.RS256).keyId("uji").build();
    return penanda.encode(JwtEncoderParameters.from(kepala, klaim)).getTokenValue();
  }

  private static KeyPair buatPasanganKunci() {
    try {
      KeyPairGenerator pembuat = KeyPairGenerator.getInstance("RSA");
      pembuat.initialize(2048);
      return pembuat.generateKeyPair();
    } catch (NoSuchAlgorithmException galat) {
      throw new IllegalStateException(galat);
    }
  }

  /** Decoder uji: kunci publik lokal, validator klaim sama dengan produksi. */
  @TestConfiguration
  static class KunciUji {

    @Bean
    @Primary
    JwtDecoder jwtDecoderUji(KonfigurasiAuth auth) {
      NimbusJwtDecoder pembaca =
          NimbusJwtDecoder.withPublicKey((RSAPublicKey) PASANGAN.getPublic()).build();
      pembaca.setJwtValidator(KeamananConfig.validatorToken(auth));
      return pembaca;
    }
  }
}
