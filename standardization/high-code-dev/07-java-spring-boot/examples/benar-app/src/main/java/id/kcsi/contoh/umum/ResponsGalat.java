package id.kcsi.contoh.umum;

import java.util.List;

/**
 * Model error tunggal untuk semua respons gagal (JSB-501). Bentuknya sama dengan backend NestJS.
 *
 * @param success selalu false
 * @param correlationId ID korelasi permintaan, sama dengan header X-Correlation-Id
 * @param errors daftar error
 */
public record ResponsGalat(boolean success, String correlationId, List<Rincian> errors) {

  public ResponsGalat {
    errors = List.copyOf(errors);
  }

  static ResponsGalat satu(String correlationId, String kode, String pesan) {
    return new ResponsGalat(false, correlationId, List.of(new Rincian(kode, pesan)));
  }

  /**
   * Satu error.
   *
   * @param code kode error terdaftar
   * @param message pesan untuk pengguna, tanpa detail teknis
   */
  public record Rincian(String code, String message) {}
}
