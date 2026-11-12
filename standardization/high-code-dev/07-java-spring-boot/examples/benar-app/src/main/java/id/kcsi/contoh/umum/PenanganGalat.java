package id.kcsi.contoh.umum;

import java.util.Map;
import java.util.stream.Collectors;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.TypeMismatchException;
import org.springframework.http.HttpStatus;
import org.springframework.http.HttpStatusCode;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.HttpMessageNotReadableException;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.web.ErrorResponse;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.ServletRequestBindingException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.method.annotation.HandlerMethodValidationException;

/**
 * Satu model error untuk semua respons gagal (JSB-501, JSB-502).
 *
 * <p>401 dan 403 dari Spring Security juga sampai ke sini lewat PenanganGagalAkses. Detail teknis
 * hanya ditulis ke log bersama ID korelasi.
 */
@RestControllerAdvice
public class PenanganGalat {

  private static final Logger LOG = LoggerFactory.getLogger(PenanganGalat.class);
  private static final String KODE_VALIDASI = "VAL-0400";
  private static final Map<Integer, String> KODE_HTTP =
      Map.of(400, KODE_VALIDASI, 401, "AUTH-0401", 403, "AUTH-0403", 404, "HTTP-0404");

  @ExceptionHandler(GalatDomain.class)
  ResponseEntity<ResponsGalat> domain(GalatDomain galat) {
    return respons(
        HttpStatusCode.valueOf(galat.kode().status()), galat.kode().kode(), galat.getMessage());
  }

  @ExceptionHandler(MethodArgumentNotValidException.class)
  ResponseEntity<ResponsGalat> isianTidakValid(MethodArgumentNotValidException galat) {
    String pesan =
        galat.getBindingResult().getFieldErrors().stream()
            .map(f -> f.getField() + ": " + f.getDefaultMessage())
            .sorted()
            .collect(Collectors.joining("; "));
    return respons(HttpStatus.BAD_REQUEST, KODE_VALIDASI, pesan);
  }

  @ExceptionHandler(HandlerMethodValidationException.class)
  ResponseEntity<ResponsGalat> parameterTidakValid(HandlerMethodValidationException galat) {
    return respons(HttpStatus.BAD_REQUEST, KODE_VALIDASI, "Parameter permintaan tidak valid");
  }

  @ExceptionHandler({
    HttpMessageNotReadableException.class,
    TypeMismatchException.class,
    ServletRequestBindingException.class
  })
  ResponseEntity<ResponsGalat> formatTidakValid(Exception galat) {
    return respons(
        HttpStatus.BAD_REQUEST, KODE_VALIDASI, "Format permintaan atau header wajib tidak valid");
  }

  @ExceptionHandler(AuthenticationException.class)
  ResponseEntity<ResponsGalat> tidakTerautentikasi(AuthenticationException galat) {
    return respons(HttpStatus.UNAUTHORIZED, "AUTH-0401", "Token tidak ada atau tidak sah");
  }

  @ExceptionHandler(AccessDeniedException.class)
  ResponseEntity<ResponsGalat> tidakBerhak(AccessDeniedException galat) {
    return respons(HttpStatus.FORBIDDEN, "AUTH-0403", "Tidak berhak melakukan operasi ini");
  }

  /** Error lain: status dari Spring MVC dipertahankan; selebihnya 500 tanpa detail teknis. */
  @ExceptionHandler(Exception.class)
  ResponseEntity<ResponsGalat> lainnya(Exception galat) {
    if (galat instanceof ErrorResponse bawaan) {
      int status = bawaan.getStatusCode().value();
      return respons(
          bawaan.getStatusCode(),
          KODE_HTTP.getOrDefault(status, "HTTP-0" + status),
          "Permintaan tidak dapat diproses");
    }
    LOG.error("Galat tidak tertangani", galat);
    return respons(HttpStatus.INTERNAL_SERVER_ERROR, "SYS-0500", "Terjadi kesalahan teknis.");
  }

  private static ResponseEntity<ResponsGalat> respons(
      HttpStatusCode status, String kode, String pesan) {
    return ResponseEntity.status(status)
        .body(ResponsGalat.satu(FilterKorelasi.sekarang(), kode, pesan));
  }
}
