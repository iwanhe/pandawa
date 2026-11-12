package id.kcsi.contoh.supplier;

import jakarta.validation.constraints.DecimalMin;
import jakarta.validation.constraints.Digits;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import java.math.BigDecimal;

/**
 * Isian pembuatan supplier, divalidasi di batas HTTP (JSB-301).
 *
 * @param kode kode unik, huruf besar, angka, atau tanda hubung
 * @param nama nama supplier
 * @param kota kota supplier
 * @param batasKredit batas kredit, maksimal 2 angka desimal
 */
public record SupplierBaru(
    @NotBlank @Pattern(regexp = "^[A-Z0-9-]{3,20}$") String kode,
    @NotBlank @Size(max = 100) String nama,
    @NotBlank @Size(max = 60) String kota,
    @NotNull @DecimalMin("0.00") @Digits(integer = 16, fraction = 2) BigDecimal batasKredit) {}
