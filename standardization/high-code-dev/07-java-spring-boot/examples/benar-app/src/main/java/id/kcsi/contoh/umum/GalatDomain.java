package id.kcsi.contoh.umum;

/** Error aturan bisnis. Dipetakan ke status dan kode di {@link PenanganGalat} (JSB-503). */
public class GalatDomain extends RuntimeException {

  private static final long serialVersionUID = 1L;

  private final KodeGalat kode;

  public GalatDomain(KodeGalat kode, String pesan) {
    super(pesan);
    this.kode = kode;
  }

  public KodeGalat kode() {
    return kode;
  }
}
