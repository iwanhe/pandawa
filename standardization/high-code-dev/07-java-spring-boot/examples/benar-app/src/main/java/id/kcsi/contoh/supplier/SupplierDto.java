package id.kcsi.contoh.supplier;

import com.fasterxml.jackson.annotation.JsonFormat;
import java.math.BigDecimal;

/**
 * Data supplier untuk klien (JSB-302). Nilai uang dikirim sebagai string desimal, sama dengan
 * backend NestJS (JSB-306).
 *
 * @param supplierId ID supplier
 * @param kode kode supplier
 * @param nama nama supplier
 * @param kota kota supplier
 * @param batasKredit batas kredit
 */
public record SupplierDto(
    long supplierId,
    String kode,
    String nama,
    String kota,
    @JsonFormat(shape = JsonFormat.Shape.STRING) BigDecimal batasKredit) {}
