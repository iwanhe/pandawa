package id.kcsi.contoh.supplier;

import java.util.Optional;
import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Repository;

/**
 * Kunci idempotensi di PostgreSQL (JSB-405, JSB-407). SQL eksplisit lewat JdbcClient dengan
 * parameter bernama (JSB-402, JSB-408).
 */
@Repository
class IdempotensiRepository {

  private final JdbcClient jdbc;

  IdempotensiRepository(JdbcClient jdbc) {
    this.jdbc = jdbc;
  }

  /** Mengklaim kunci. Kosong bila kunci baru; selain itu catatan yang sudah ada. */
  Optional<Catatan> klaim(String kunci, String sidik) {
    int baru =
        jdbc.sql(
                "insert into idempotensi (kunci, sidik) values (:kunci, :sidik)"
                    + " on conflict (kunci) do nothing")
            .param("kunci", kunci)
            .param("sidik", sidik)
            .update();
    if (baru == 1) {
      return Optional.empty();
    }
    return Optional.of(
        jdbc.sql(
                "select sidik, status_http, cast(respons as text) as respons"
                    + " from idempotensi where kunci = :kunci")
            .param("kunci", kunci)
            .query(
                (rs, baris) ->
                    new Catatan(
                        rs.getString("sidik"),
                        rs.getObject("status_http", Integer.class),
                        rs.getString("respons")))
            .single());
  }

  void selesaikan(String kunci, int statusHttp, String responsJson) {
    jdbc.sql(
            "update idempotensi set status_http = :status, respons = cast(:respons as jsonb)"
                + " where kunci = :kunci")
        .param("kunci", kunci)
        .param("status", statusHttp)
        .param("respons", responsJson)
        .update();
  }

  /**
   * Catatan idempotensi.
   *
   * @param sidik SHA-256 isi permintaan pertama
   * @param statusHttp status respons, null bila masih diproses
   * @param respons respons JSON tersimpan
   */
  record Catatan(String sidik, Integer statusHttp, String respons) {}
}
