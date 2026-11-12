package id.kcsi.contoh.supplier;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import java.math.BigDecimal;

/** Entity supplier. Tidak pernah dikembalikan ke klien; diubah menjadi SupplierDto (JSB-302). */
@Entity
@Table(name = "supplier")
public class SupplierEntity {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  @Column(name = "supplier_id")
  private Long supplierId;

  @Column(name = "kode", nullable = false, length = 20)
  private String kode;

  @Column(name = "nama", nullable = false, length = 100)
  private String nama;

  @Column(name = "kota", nullable = false, length = 60)
  private String kota;

  /** JSB-403: NUMERIC(18,2) dipetakan ke BigDecimal. */
  @Column(name = "batas_kredit", nullable = false, precision = 18, scale = 2)
  private BigDecimal batasKredit;

  protected SupplierEntity() {
    // dipakai JPA
  }

  SupplierEntity(String kode, String nama, String kota, BigDecimal batasKredit) {
    this.kode = kode;
    this.nama = nama;
    this.kota = kota;
    this.batasKredit = batasKredit;
  }

  Long getSupplierId() {
    return supplierId;
  }

  String getKode() {
    return kode;
  }

  String getNama() {
    return nama;
  }

  String getKota() {
    return kota;
  }

  BigDecimal getBatasKredit() {
    return batasKredit;
  }
}
