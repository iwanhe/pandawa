package id.kcsi.salah;

import java.util.*; // SALAH JSB-104: wildcard import (Checkstyle AvoidStarImport)
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

// CONTOH SALAH: jangan ditiru. Setiap pelanggaran diberi ID aturannya.
@RestController // SALAH JSB-304: tanpa versi API di URI
@Transactional // SALAH JSB-203: transaksi di controller (ArchUnit)
public class SupplierSalahController {

  @Autowired private JdbcTemplate jdbc; // SALAH JSB-201: injeksi field (ArchUnit)

  @Value("${batas.maks:1000}") // SALAH JSB-702: @Value tersebar (Checkstyle)
  private int batasMaks;

  @GetMapping("/supplier")
  public List<Map<String, Object>> cari(@RequestParam String nama) {
    System.out.println("cari supplier " + nama); // SALAH JSB-801 (Checkstyle, ArchUnit)
    // SALAH JSB-402: SQL disusun dari input pengguna (FindSecBugs SQL_INJECTION_SPRING_JDBC)
    return jdbc.queryForList("select * from supplier where nama like '%" + nama + "%'");
  }

  @PostMapping("/supplier")
  public Object tambah(@RequestBody Map<String, Object> isi) { // SALAH JSB-301: tanpa DTO dan validasi
    try {
      SupplierSalah s = new SupplierSalah();
      s.kode = (String) isi.get("kode");
      s.batasKredit = Double.parseDouble(String.valueOf(isi.get("batasKredit"))); // SALAH JSB-403
      if (s.batasKredit > batasMaks) {
        String env = System.getenv("MODE"); // SALAH JSB-702 (Checkstyle)
      }
      return s; // SALAH JSB-302: entity dikembalikan ke klien (ArchUnit)
    } catch (Exception e) { // SALAH JSB-504: menangkap Exception (Checkstyle IllegalCatch)
      e.printStackTrace(); // SALAH JSB-801 (Checkstyle)
      return Map.of("error", e.getMessage()); // SALAH JSB-501, JSB-502: status 200 dan pesan teknis
    }
  }
}
