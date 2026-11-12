package id.kcsi.contoh.keamanan;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.AuthenticationEntryPoint;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;

/**
 * Meneruskan 401 dan 403 dari rantai Spring Security ke PenanganGalat, sehingga bentuk respons sama
 * dengan error lain (JSB-501).
 */
@Component
class PenanganGagalAkses implements AuthenticationEntryPoint, AccessDeniedHandler {

  private final HandlerExceptionResolver resolver;

  PenanganGagalAkses(@Qualifier("handlerExceptionResolver") HandlerExceptionResolver resolver) {
    this.resolver = resolver;
  }

  @Override
  public void commence(
      HttpServletRequest permintaan, HttpServletResponse respons, AuthenticationException galat) {
    resolver.resolveException(permintaan, respons, null, galat);
  }

  @Override
  public void handle(
      HttpServletRequest permintaan, HttpServletResponse respons, AccessDeniedException galat) {
    resolver.resolveException(permintaan, respons, null, galat);
  }
}
