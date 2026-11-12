package id.kcsi.contoh.supplier;

import id.kcsi.contoh.umum.GalatDomain;
import id.kcsi.contoh.umum.KodeGalat;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HexFormat;
import java.util.Optional;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tools.jackson.databind.json.JsonMapper;

/**
 * Logika bisnis supplier (JSB-202, JSB-203). Satu transaksi untuk kunci idempotensi, data
 * supplier, dan pesan outbox (JSB-404 s.d. JSB-407).
 */
@Service
public class SupplierService {

  private static final int STATUS_DIBUAT = 201;

  private final SupplierRepository supplier;
  private final IdempotensiRepository idempotensi;
  private final OutboxRepository outbox;
  private final JsonMapper json;

  SupplierService(
      SupplierRepository supplier,
      IdempotensiRepository idempotensi,
      OutboxRepository outbox,
      JsonMapper json) {
    this.supplier = supplier;
    this.idempotensi = idempotensi;
    this.outbox = outbox;
    this.json = json;
  }

  @Transactional(readOnly = true)
  public Halaman<SupplierDto> daftar(int halaman, int ukuran) {
    Page<SupplierEntity> hasil =
        supplier.findAll(PageRequest.of(halaman - 1, ukuran, Sort.by("supplierId")));
    return new Halaman<>(
        hasil.map(SupplierService::keDto).getContent(), halaman, ukuran, hasil.getTotalElements());
  }

  @Transactional(readOnly = true)
  public SupplierDto byId(long supplierId) {
    return supplier
        .findById(supplierId)
        .map(SupplierService::keDto)
        .orElseThrow(
            () ->
                new GalatDomain(
                    KodeGalat.SUPPLIER_TIDAK_ADA, "Supplier " + supplierId + " tidak ditemukan"));
  }

  @Transactional
  public SupplierDto tambah(SupplierBaru data, String kunciIdempotensi) {
    String sidik = sidikDari(data);
    Optional<IdempotensiRepository.Catatan> lama = idempotensi.klaim(kunciIdempotensi, sidik);
    if (lama.isPresent()) {
      return ulangi(lama.get(), sidik);
    }
    if (supplier.existsByKode(data.kode())) {
      throw new GalatDomain(
          KodeGalat.SUPPLIER_DUPLIKAT, "Kode supplier " + data.kode() + " sudah terdaftar");
    }
    SupplierDto dto =
        keDto(
            supplier.save(
                new SupplierEntity(data.kode(), data.nama(), data.kota(), data.batasKredit())));
    String muatan = json.writeValueAsString(dto);
    outbox.tambah("supplier.dibuat", String.valueOf(dto.supplierId()), muatan);
    idempotensi.selesaikan(kunciIdempotensi, STATUS_DIBUAT, muatan);
    return dto;
  }

  private SupplierDto ulangi(IdempotensiRepository.Catatan lama, String sidik) {
    if (!lama.sidik().equals(sidik)) {
      throw new GalatDomain(
          KodeGalat.IDEMPOTENSI_BEDA_ISI, "Idempotency-Key sudah dipakai untuk isi yang berbeda");
    }
    if (lama.statusHttp() == null) {
      throw new GalatDomain(
          KodeGalat.IDEMPOTENSI_DIPROSES, "Permintaan dengan kunci ini masih diproses");
    }
    return json.readValue(lama.respons(), SupplierDto.class);
  }

  private static SupplierDto keDto(SupplierEntity entity) {
    return new SupplierDto(
        entity.getSupplierId(),
        entity.getKode(),
        entity.getNama(),
        entity.getKota(),
        entity.getBatasKredit());
  }

  /** SHA-256 isi permintaan; nilai uang dinormalisasi agar 10.5 dan 10.50 dianggap sama. */
  static String sidikDari(SupplierBaru data) {
    String isi =
        String.join(
            "\n",
            data.kode(),
            data.nama(),
            data.kota(),
            data.batasKredit().stripTrailingZeros().toPlainString());
    try {
      byte[] hash = MessageDigest.getInstance("SHA-256").digest(isi.getBytes(StandardCharsets.UTF_8));
      return HexFormat.of().formatHex(hash);
    } catch (NoSuchAlgorithmException galat) {
      throw new IllegalStateException("SHA-256 tidak tersedia", galat);
    }
  }
}
