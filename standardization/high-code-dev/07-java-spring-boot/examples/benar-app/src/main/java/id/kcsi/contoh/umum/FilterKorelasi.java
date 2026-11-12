package id.kcsi.contoh.umum;

import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.UUID;
import java.util.regex.Pattern;
import org.slf4j.MDC;
import org.springframework.web.filter.OncePerRequestFilter;

/**
 * ID korelasi mengikuti satu permintaan dari awal sampai akhir (JSB-801).
 *
 * <p>Dipasang paling awal di rantai Spring Security (lihat KeamananConfig), sehingga respons 401 dan
 * 403 juga membawa ID korelasi. Nilai dari klien hanya dipakai bila lolos pola.
 */
public final class FilterKorelasi extends OncePerRequestFilter {

  public static final String HEADER = "X-Correlation-Id";
  public static final String KUNCI_MDC = "correlationId";
  private static final Pattern POLA = Pattern.compile("^[\\w-]{8,100}$");

  /** ID korelasi permintaan yang sedang berjalan. */
  public static String sekarang() {
    String id = MDC.get(KUNCI_MDC);
    return id == null ? "tanpa-konteks" : id;
  }

  @Override
  protected void doFilterInternal(
      HttpServletRequest permintaan, HttpServletResponse respons, FilterChain rantai)
      throws ServletException, IOException {
    String kiriman = permintaan.getHeader(HEADER);
    String id =
        kiriman != null && POLA.matcher(kiriman).matches()
            ? kiriman
            : UUID.randomUUID().toString();
    MDC.put(KUNCI_MDC, id);
    respons.setHeader(HEADER, id);
    try {
      rantai.doFilter(permintaan, respons);
    } finally {
      MDC.remove(KUNCI_MDC);
    }
  }
}
