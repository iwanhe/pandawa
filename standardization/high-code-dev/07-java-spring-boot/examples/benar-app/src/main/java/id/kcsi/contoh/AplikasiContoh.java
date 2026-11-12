package id.kcsi.contoh;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationPropertiesScan;

/** Titik masuk aplikasi contoh. Paket per fitur di bawah id.kcsi.contoh (JSB-102). */
@SpringBootApplication
@ConfigurationPropertiesScan
public class AplikasiContoh {

  public static void main(String[] args) {
    SpringApplication.run(AplikasiContoh.class, args);
  }
}
