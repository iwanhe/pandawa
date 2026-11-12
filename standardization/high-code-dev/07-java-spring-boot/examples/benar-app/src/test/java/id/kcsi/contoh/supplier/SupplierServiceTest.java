package id.kcsi.contoh.supplier;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;
import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyString;
import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.never;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import id.kcsi.contoh.umum.GalatDomain;
import id.kcsi.contoh.umum.KodeGalat;
import java.math.BigDecimal;
import java.util.Optional;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.test.util.ReflectionTestUtils;
import tools.jackson.databind.json.JsonMapper;

/** JSB-901: uji unit service tanpa konteks Spring; dependency diganti mock. */
class SupplierServiceTest {

  private static final SupplierBaru DATA =
      new SupplierBaru("SUP-001", "PT Sumber Makmur", "Kudus", new BigDecimal("1250000.50"));

  private SupplierRepository supplier;
  private IdempotensiRepository idempotensi;
  private OutboxRepository outbox;
  private SupplierService service;

  @BeforeEach
  void siapkan() {
    supplier = mock(SupplierRepository.class);
    idempotensi = mock(IdempotensiRepository.class);
    outbox = mock(OutboxRepository.class);
    service = new SupplierService(supplier, idempotensi, outbox, JsonMapper.builder().build());
    when(idempotensi.klaim(anyString(), anyString())).thenReturn(Optional.empty());
    when(supplier.save(any(SupplierEntity.class)))
        .thenAnswer(
            panggilan -> {
              SupplierEntity entity = panggilan.getArgument(0);
              ReflectionTestUtils.setField(entity, "supplierId", 7L);
              return entity;
            });
  }

  @Test
  void menyimpanSupplierDanMenulisOutboxSertaIdempotensi() {
    SupplierDto hasil = service.tambah(DATA, "kunci-uji-0001");

    assertThat(hasil)
        .isEqualTo(
            new SupplierDto(7L, "SUP-001", "PT Sumber Makmur", "Kudus", new BigDecimal("1250000.50")));
    verify(outbox).tambah(eq("supplier.dibuat"), eq("7"), anyString());
    verify(idempotensi).selesaikan(eq("kunci-uji-0001"), eq(201), anyString());
  }

  @Test
  void menolakKodeDuplikatDenganGalatDomain() {
    when(supplier.existsByKode("SUP-001")).thenReturn(true);

    assertThatThrownBy(() -> service.tambah(DATA, "kunci-uji-0002"))
        .isInstanceOfSatisfying(
            GalatDomain.class, galat -> assertThat(galat.kode()).isEqualTo(KodeGalat.SUPPLIER_DUPLIKAT));
    verify(supplier, never()).save(any());
  }

  @Test
  void mengulangResponsTersimpanBilaKunciDanIsiSama() {
    String sidik = SupplierService.sidikDari(DATA);
    String tersimpan =
        "{\"supplierId\":7,\"kode\":\"SUP-001\",\"nama\":\"PT Sumber Makmur\","
            + "\"kota\":\"Kudus\",\"batasKredit\":\"1250000.50\"}";
    when(idempotensi.klaim("kunci-uji-0003", sidik))
        .thenReturn(Optional.of(new IdempotensiRepository.Catatan(sidik, 201, tersimpan)));

    SupplierDto hasil = service.tambah(DATA, "kunci-uji-0003");

    assertThat(hasil.supplierId()).isEqualTo(7L);
    assertThat(hasil.batasKredit()).isEqualByComparingTo("1250000.50");
    verify(supplier, never()).save(any());
  }

  @Test
  void menolakKunciSamaDenganIsiBerbeda() {
    when(idempotensi.klaim(eq("kunci-uji-0004"), anyString()))
        .thenReturn(Optional.of(new IdempotensiRepository.Catatan("sidik-lain", 201, "{}")));

    assertThatThrownBy(() -> service.tambah(DATA, "kunci-uji-0004"))
        .isInstanceOf(GalatDomain.class)
        .hasMessageContaining("isi yang berbeda");
  }

  @Test
  void sidikMenganggap10Koma5Dan10Koma50Sama() {
    SupplierBaru a = new SupplierBaru("SUP-9", "A", "B", new BigDecimal("10.5"));
    SupplierBaru b = new SupplierBaru("SUP-9", "A", "B", new BigDecimal("10.50"));
    assertThat(SupplierService.sidikDari(a)).isEqualTo(SupplierService.sidikDari(b));
  }

  @Test
  void melemparSupplierTidakAdaBilaIdTidakDitemukan() {
    when(supplier.findById(99L)).thenReturn(Optional.empty());
    assertThatThrownBy(() -> service.byId(99L)).isInstanceOf(GalatDomain.class);
  }
}
