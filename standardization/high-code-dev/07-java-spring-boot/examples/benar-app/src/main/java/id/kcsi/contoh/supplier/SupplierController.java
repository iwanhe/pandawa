package id.kcsi.contoh.supplier;

import jakarta.validation.Valid;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.Pattern;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.RestController;

/**
 * Controller tipis: input divalidasi, lalu satu panggilan service (JSB-202, JSB-301). Versi API di
 * URI (JSB-304).
 */
@RestController
@RequestMapping("/api/v1/supplier")
public class SupplierController {

  private final SupplierService service;

  SupplierController(SupplierService service) {
    this.service = service;
  }

  @GetMapping
  public Halaman<SupplierDto> daftar(
      @RequestParam(defaultValue = "1") @Min(1) int halaman,
      @RequestParam(defaultValue = "20") @Min(1) @Max(100) int ukuran) {
    return service.daftar(halaman, ukuran);
  }

  @GetMapping("/{supplierId}")
  public SupplierDto byId(@PathVariable long supplierId) {
    return service.byId(supplierId);
  }

  /** JSB-405: Idempotency-Key wajib; JSB-603: hanya peran pengelola-supplier. */
  @PostMapping
  @ResponseStatus(HttpStatus.CREATED)
  @PreAuthorize("hasRole('pengelola-supplier')")
  public SupplierDto tambah(
      @Valid @RequestBody SupplierBaru data,
      @RequestHeader("Idempotency-Key") @Pattern(regexp = "^[\\w-]{8,100}$") String kunci) {
    return service.tambah(data, kunci);
  }
}
