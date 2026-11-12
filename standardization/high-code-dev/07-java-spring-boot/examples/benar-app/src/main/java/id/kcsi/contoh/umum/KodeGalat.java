package id.kcsi.contoh.umum;

/** Kode error bisnis yang terdaftar (JSB-503). Kode sama dengan backend NestJS. */
public enum KodeGalat {
  SUPPLIER_TIDAK_ADA("SUP-0404", 404),
  SUPPLIER_DUPLIKAT("SUP-0409", 409),
  IDEMPOTENSI_BEDA_ISI("IDM-0422", 422),
  IDEMPOTENSI_DIPROSES("IDM-0409", 409);

  private final String kode;
  private final int status;

  KodeGalat(String kode, int status) {
    this.kode = kode;
    this.status = status;
  }

  public String kode() {
    return kode;
  }

  public int status() {
    return status;
  }
}
