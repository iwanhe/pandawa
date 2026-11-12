package id.kcsi.contoh.supplier;

import org.springframework.jdbc.core.simple.JdbcClient;
import org.springframework.stereotype.Repository;

/**
 * Pesan untuk sistem lain ditulis di transaksi yang sama dengan data bisnis (JSB-406). Pengiriman ke
 * ERP dilakukan proses terpisah, tidak di dalam transaksi ini.
 */
@Repository
class OutboxRepository {

  private final JdbcClient jdbc;

  OutboxRepository(JdbcClient jdbc) {
    this.jdbc = jdbc;
  }

  void tambah(String jenis, String kunciAgregat, String muatanJson) {
    jdbc.sql(
            "insert into outbox (jenis, kunci_agregat, muatan)"
                + " values (:jenis, :kunci, cast(:muatan as jsonb))")
        .param("jenis", jenis)
        .param("kunci", kunciAgregat)
        .param("muatan", muatanJson)
        .update();
  }
}
