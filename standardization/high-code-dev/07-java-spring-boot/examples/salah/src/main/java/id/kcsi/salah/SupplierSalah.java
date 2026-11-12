package id.kcsi.salah;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;

// CONTOH SALAH: jangan ditiru.
@Entity
public class SupplierSalah {
  @Id public Long id; // SALAH: field public (Checkstyle VisibilityModifier)
  public String kode;
  public double batasKredit; // SALAH JSB-403: uang sebagai double (Checkstyle uangBigDecimal)
}
