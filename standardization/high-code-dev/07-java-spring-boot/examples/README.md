# Contoh Kode — Java Spring Boot

```
examples/
├── benar-app/                          API supplier Spring Boot 4.1 (modul Maven, parent = POM induk)
│   ├── db/migrasi/V1__supplier.sql         tabel supplier, outbox, idempotensi (format Flyway, sama dengan 08)
│   ├── src/main/java/id/kcsi/contoh/
│   │   ├── AplikasiContoh.java             @SpringBootApplication + @ConfigurationPropertiesScan
│   │   ├── konfigurasi/KonfigurasiAuth     record @ConfigurationProperties + @Validated
│   │   ├── keamanan/                       KeamananConfig (Resource Server, audience, CORS, CSP), PenanganGagalAkses
│   │   ├── umum/                           PenanganGalat, ResponsGalat, GalatDomain, KodeGalat, FilterKorelasi
│   │   └── supplier/                       controller, service, repository JPA, repository JdbcClient, DTO record
│   ├── src/main/resources/application.yaml
│   ├── src/test/java/id/kcsi/contoh/
│   │   ├── ArsitekturTest.java             ArchUnit (JSB-903)
│   │   ├── konfigurasi/KonfigurasiAuthTest, umum/PenanganGalatTest, supplier/SupplierServiceTest   uji unit
│   │   └── supplier/SupplierApiIT.java     uji integrasi: Testcontainers PostgreSQL + MockMvc + token RSA uji
│   ├── Dockerfile, .dockerignore           image JRE berlapis, non-root
│   └── env.contoh                          daftar variabel lingkungan
└── salah/                              modul yang sengaja melanggar (profil Maven contoh-salah)
```

## Menjalankan

Dari folder `07-java-spring-boot` (JDK 21+, Maven 3.9+, Docker untuk uji integrasi):

```bash
cp -r mvn.template .mvn   # sekali; Windows: xcopy mvn.template .mvn\ /E /I
mvn spotless:apply   # sekali, agar format sesuai google-java-format
mvn verify           # semua pemeriksaan + uji unit + uji integrasi + ArchUnit
```

Uji integrasi membuat container `postgres:18-alpine` sendiri dan menjalankan migrasi `db/migrasi` lewat Flyway (scope test). Token ditandatangani kunci RSA buatan uji, jadi tidak perlu IdP sungguhan. Tanpa Docker, `SupplierApiIT` dilewati; jangan anggap lulus.

## Contoh Salah

Build harus gagal. Karena Maven berhenti di pemeriksaan pertama yang gagal, jalankan per alat untuk melihat semua temuan:

```bash
mvn -P contoh-salah -pl examples/salah -am checkstyle:check                                   # Checkstyle
mvn -P contoh-salah -pl examples/salah -am verify -Dcheckstyle.skip -Dspotless.check.skip      # SpotBugs + ArchUnit
```

Temuan yang diharapkan:

| Alat | Pelanggaran |
|---|---|
| Checkstyle | import wildcard (JSB-104), field public (VisibilityModifier), `double batasKredit` (JSB-403), `@Value` dan `System.getenv` (JSB-702), `System.out` dan `printStackTrace` (JSB-801), `catch (Exception e)` (JSB-504) |
| SpotBugs + FindSecBugs | SQL dari penyambungan string pada `JdbcTemplate` (JSB-402), CSRF dimatikan tanpa pengecualian tercatat (JSB-604) |
| ArchUnit | controller memakai entity (JSB-302), `@Transactional` di controller (JSB-203), injeksi field (JSB-201), akses `System.out` (JSB-801) |
| Review manual | guard yang `permitAll` bila issuer kosong (JSB-602), endpoint tanpa versi (JSB-304), error berstatus 200 dengan pesan teknis (JSB-501, JSB-502) |

Tabel di atas adalah hasil yang **diharapkan**; akan diperbarui dengan hasil nyata setelah build pertama.
