package id.kcsi.contoh.supplier;

import java.util.List;

/**
 * Satu halaman data (JSB-303).
 *
 * @param data isi halaman
 * @param halaman nomor halaman, mulai 1
 * @param ukuran jumlah baris per halaman
 * @param total jumlah seluruh baris
 * @param <T> tipe baris
 */
public record Halaman<T>(List<T> data, int halaman, int ukuran, long total) {

  public Halaman {
    data = List.copyOf(data);
  }
}
