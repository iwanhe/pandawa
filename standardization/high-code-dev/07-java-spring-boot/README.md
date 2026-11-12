# 07 — Standar Java Spring Boot

> Bagian dari [Standar High-Code Development](../README.md) · Tim PANDAWA

| Atribut | Nilai |
|---|---|
| Prefix ID aturan | `JSB` |
| Status | **Draft — build belum diverifikasi** (lihat [Status Pengujian](#status-pengujian)) |
| Versi | 0.2.0 |
| Versi yang diacu | Spring Boot 4.1.2, Java 21 (25 dianjurkan untuk proyek baru), Maven 3.9, PostgreSQL 18, Testcontainers 2 |
| File aturan | [`Standar_Java_Spring_Boot.xlsx`](Standar_Java_Spring_Boot.xlsx) — sumber utama |
| POM induk | [`pom.xml`](pom.xml) — dipakai aplikasi sebagai `<parent>`; membawa semua pemeriksaan |
| Konfigurasi | [`config/checkstyle/checkstyle.xml`](config/checkstyle/checkstyle.xml), [`config/spotbugs/spotbugs-exclude.xml`](config/spotbugs/spotbugs-exclude.xml), [`mvn.template/`](mvn.template/) (salin menjadi `.mvn/`) |
| Pembaruan terakhir | 2026-11-12 |

## Ringkasan

Standar backend Spring Boot untuk Tim PANDAWA. Kontrak API, model error, idempotensi, dan outbox **disamakan dengan [standar 08 NestJS](../08-nestjs/)**, sehingga frontend tidak perlu tahu backend mana yang melayani.

| Jumlah aturan | WAJIB | DILARANG | SEBAIKNYA | BOLEH | Ditegakkan alat |
|:-:|:-:|:-:|:-:|:-:|:-:|
| 61 | 47 | 8 | 6 | 0 | 32 (52%) |

## Berlaku untuk

| Mandiri | Oracle EBS | SAP |
|:-:|:-:|:-:|
| K | K | K |

`K` = kondisional: berlaku bila backend aplikasi memakai Spring Boot. Pilihan Spring Boot atau NestJS ditetapkan per aplikasi lewat ADR. Aturan outbox (JSB-406) berlaku bila aplikasi mengirim data ke ERP atau sistem lain.

## Status Pengujian

Berbeda dengan standar 01–05 dan 08, **build Maven standar ini belum dijalankan**: akses ke Maven Central diblokir di lingkungan penyusunan, sehingga dependency dan plugin tidak dapat diunduh.

Yang sudah diperiksa:

- Sintaks ke-27 file Java (contoh benar dan salah) lulus parser Java 21 (`java-parser` dari prettier-plugin-java 2.11.0).
- `pom.xml`, `checkstyle.xml`, dan `spotbugs-exclude.xml` adalah XML yang valid.
- Nama API yang paling berisiko dicocokkan dengan dokumentasi: bean `JsonMapper` Jackson 3, starter `spring-boot-starter-flyway`, artifact Testcontainers 2 (`testcontainers-postgresql`, kelas `org.testcontainers.postgresql.PostgreSQLContainer`).
- Versi plugin diambil dari catatan rilis: Checkstyle 13.4.2, SpotBugs Maven Plugin 4.9.8.5, Spotless 3.6.0, JaCoCo 0.8.15, ArchUnit 1.5.1.

Yang **belum** terbukti: kompilasi, hasil Checkstyle/SpotBugs/Spotless, 10 uji unit, 8 uji integrasi, dan 7 aturan ArchUnit. Langkah verifikasi pertama:

```bash
cd standardization/high-code-dev/07-java-spring-boot
cp -r mvn.template .mvn     # sekali; Windows: xcopy mvn.template .mvn\ /E /I
mvn spotless:apply          # format sesuai google-java-format (contoh ditulis tanpa formatter)
mvn verify                  # butuh JDK 21+, Maven 3.9+, Docker untuk uji integrasi
mvn verify -P contoh-salah  # HARUS gagal; lihat examples/README.md untuk melihat temuan per alat
```

Hasil `mvn verify` (berhasil atau gagal) dicatat di bagian ini dan di CHANGELOG sebelum status dinaikkan.

## Keputusan Utama

| Topik | Pilihan standar | Alternatif yang diizinkan |
|---|---|---|
| Build | Maven + POM induk standar (`standar-spring-induk`) | Gradle lewat ADR |
| Validasi | Bean Validation pada record DTO + method validation Spring 7 | — |
| Akses data | JPA (Hibernate) untuk entity, `JdbcClient` untuk SQL eksplisit | jOOQ/MyBatis lewat ADR (JSB-408) |
| Migrasi | Flyway dijalankan pipeline; starter Flyway hanya scope test | — |
| Autentikasi | OAuth2 Resource Server, JWKS + issuer + audience + RS256 | — (tidak bisa dimatikan, JSB-602) |
| Model error | `{ success, correlationId, errors[] }` sama dengan NestJS | — (ProblemDetail tidak dipakai agar seragam) |
| Format kode | google-java-format lewat Spotless | — |
| Analisis statis | Checkstyle (aturan non-format) + SpotBugs + FindSecBugs + ArchUnit | NullAway (SEBAIKNYA, JSB-206) |
| Uji | JUnit + Mockito + AssertJ; *IT dengan Testcontainers PostgreSQL + MockMvc | — (H2 dilarang) |
| Log | Structured logging ECS bawaan Spring Boot + MDC correlationId | — |

## Cara Memakai

1. Buat proyek di Spring Initializr (Spring Boot 4.1.x, Maven, Java 21/25), lalu ganti `<parent>` dengan POM induk standar ini. Salin `config/` ke root repo aplikasi, dan `mvn.template/` sebagai `.mvn/`.
2. Ikuti struktur [`examples/benar-app`](examples/benar-app/): paket per fitur, `KeamananConfig`, `PenanganGalat` + `PenanganGagalAkses`, `FilterKorelasi`, `KonfigurasiAuth`, dan `ArsitekturTest`.
3. Jalankan sebelum membuka pull request:
   ```bash
   mvn spotless:apply && mvn verify
   ```
4. Aturan yang tidak dapat dicek alat diperiksa dengan [`checklist-review.md`](checklist-review.md).

## Hal Khusus Spring Boot 4

| Perubahan | Dampak pada standar |
|---|---|
| Starter modular; `spring-boot-starter-web` menjadi `-webmvc`; Flyway butuh `spring-boot-starter-flyway` | JSB-106; enforcer melarang starter classic |
| Jackson 3 (paket `tools.jackson`, bean `JsonMapper`); anotasi tetap `com.fasterxml.jackson.annotation` | Checkstyle melarang import `com.fasterxml.jackson.databind` |
| Method validation bawaan Spring Framework 7 | Constraint langsung pada `@RequestParam`/`@RequestHeader` (JSB-301) |
| JSpecify null-safety | NullAway dianjurkan (JSB-206) |
| Structured logging bawaan | `logging.structured.format.console: ecs` (JSB-801) |
| Testcontainers 2: artifact berawalan `testcontainers-`, JUnit 4 dihapus | JSB-902 |

## Pelajaran dari Spike

| Temuan di [spike](https://github.com/iwanhe/spike-nest-vs-spring) (`app-spring`) | Aturan |
|---|---|
| `AUTH_ISSUER` kosong membuat `anyRequest().permitAll()` | JSB-602 |
| Token hanya diperiksa issuer, audience tidak | JSB-601 |
| `@Value` dan `System.getenv("MODE_UJI")` di service dan pekerja outbox | JSB-702, JSB-703 |
| Password bawaan `spike_dev_only` di application.properties | JSB-606 |
| Override `tomcat.version` dan `jackson-bom.version` untuk tambalan CVE | JSB-905 |
| Memori diam sekitar 440–480 MB; varian heap 256 MB tetap lulus | JSB-806 |
| Digest base image dikunci + Dependabot; gerbang Trivy | JSB-906, JSB-907 |
| Flowable 8.0.0 adalah versi pertama untuk Boot 4 | JSB-909 |

## Hal yang Masih Perlu Diputuskan

1. Kriteria memilih Spring Boot atau NestJS per aplikasi (hasil spike dan kompetensi tim).
2. Java 21 atau 25 sebagai baseline; contoh memakai 21 mengikuti spike.
3. Naik ke Spring Boot 4.2 setelah rilis 19 Nov 2026, atau bertahan di 4.1 sampai pilot selesai.
4. NullAway diwajibkan atau tetap anjuran.

## Daftar Aturan

Ringkasan dari [`Standar_Java_Spring_Boot.xlsx`](Standar_Java_Spring_Boot.xlsx). Alasan, contoh benar/salah, dan catatan lengkap ada di file Excel.

### JSB-1xx — Struktur dan proyek (7 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `JSB-101` | WAJIB | Proyek baru memakai Spring Boot 4.1 (patch terbaru) di atas Java LTS 21 atau 25, dibangun dengan Maven dan memakai POM induk standar ini sebagai parent. | maven-enforcer-plugin (requireJavaVersion, requireMavenVersion) |
| `JSB-102` | WAJIB | Kode dikelompokkan per fitur (id.kcsi.<aplikasi>.<fitur>) berisi controller, service, repository, entity, dan DTO fitur itu. Kode lintas fitur di paket umum, keamanan, konfigurasi. | review |
| `JSB-103` | WAJIB | Kelas yang hanya dipakai di paketnya sendiri (repository, helper, entity bila memungkinkan) dibuat package-private. Hanya service dan DTO yang dipakai paket lain yang public. | review |
| `JSB-104` | WAJIB | Penamaan: paket huruf kecil tanpa garis bawah; kelas PascalCase dengan sufiks peran (Controller, Service, Repository, Entity, Config, Dto); method dan variabel camelCase; konstanta UPPER_SNAKE_CASE. Tanpa import wildcard. | Checkstyle (TypeName, ConstantName, AvoidStarImport, ...) |
| `JSB-105` | DILARANG | DILARANG siklus dependensi antarpaket fitur. | ArchUnit slices().beFreeOfCycles() |
| `JSB-106` | WAJIB | Memakai starter modular Spring Boot 4 (spring-boot-starter-webmvc, -data-jpa, -security-oauth2-resource-server, -actuator) dengan pasangan starter -test di scope test. Starter classic dan H2 dilarang. | maven-enforcer-plugin (bannedDependencies) |
| `JSB-107` | WAJIB | Kode diformat google-java-format lewat Spotless. Build gagal bila belum diformat; perbaiki dengan mvn spotless:apply. | spotless-maven-plugin (check) |

### JSB-2xx — Bean dan dependency injection (6 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `JSB-201` | WAJIB | Dependency diterima lewat constructor dan disimpan di field private final. DILARANG @Autowired pada field atau setter. | ArchUnit NO_CLASSES_SHOULD_USE_FIELD_INJECTION |
| `JSB-202` | WAJIB | Controller tipis: menerima input yang sudah divalidasi, memanggil service, mengembalikan DTO. Controller tidak memakai repository, EntityManager, JdbcClient, JdbcTemplate, atau entity. | ArchUnit (aturan CONTROLLER_TANPA_AKSES_DATA) |
| `JSB-203` | WAJIB | @Transactional dipasang di method public service (readOnly = true untuk baca). DILARANG di controller, dan DILARANG mengandalkan @Transactional pada pemanggilan method dari kelas yang sama. | ArchUnit (CONTROLLER_TANPA_TRANSAKSI); self-invocation lewat review |
| `JSB-204` | WAJIB | Bean memakai scope default (singleton) dan tidak menyimpan state per permintaan di field. Konfigurasi bean dikelompokkan di kelas @Configuration per topik. | review |
| `JSB-205` | WAJIB | Klien sistem eksternal (ERP, S3, REST pihak lain) dibungkus bean dengan timeout connect dan read eksplisit (RestClient + pengaturan HTTP client), sehingga dapat diganti di uji. | review |
| `JSB-206` | SEBAIKNYA | Paket ditandai @NullMarked (JSpecify) dan diperiksa NullAway di CI. | review |

### JSB-3xx — API, DTO, validasi (7 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `JSB-301` | WAJIB | Semua input HTTP divalidasi Bean Validation di batas aplikasi: @Valid @RequestBody pada record DTO bercontraint, serta constraint pada @RequestParam, @PathVariable, dan @RequestHeader. Field JSON tak dikenal ditolak (spring.jackson.deserialization.fail-on-unknown-properties=true). | uji integrasi (400 untuk isian salah, field asing, tanpa header) |
| `JSB-302` | WAJIB | Request dan respons memakai record DTO. Entity JPA tidak pernah diterima atau dikembalikan controller. | ArchUnit (controller tidak bergantung pada kelas @Entity) |
| `JSB-303` | WAJIB | Endpoint daftar dipaginasi; ukuran halaman dibatasi (@Max(100)) dan respons memuat total. | uji integrasi (ukuran=500 → 400) |
| `JSB-304` | WAJIB | Versi API di URI (/api/v1/...). API versioning Spring Framework 7 dengan path segment boleh dipakai. Endpoint health tetap di /actuator/health tanpa versi. | review |
| `JSB-305` | WAJIB | Kode status HTTP sesuai semantik: 201 untuk pembuatan (@ResponseStatus), 200 baca/ubah, 204 tanpa isi, 400 validasi, 401, 403, 404, 409 konflik, 422 aturan bisnis. | uji integrasi (status tiap skenario) |
| `JSB-306` | WAJIB | Kontrak JSON sama dengan backend NestJS: properti camelCase, nilai uang sebagai string desimal, tanggal ISO-8601 dengan zona waktu, dan model error yang sama (JSB-501). | review |
| `JSB-307` | SEBAIKNYA | Kontrak API didokumentasikan OpenAPI (springdoc atau berkas openapi.yaml) dan disimpan di repo. Swagger UI tidak dibuka di PROD. | review |

### JSB-4xx — Persistensi dan integrasi (10 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `JSB-401` | WAJIB | Skema dikelola migrasi Flyway (db/migrasi/V<n>__<deskripsi>.sql) yang dijalankan pipeline dengan user DB khusus migrasi. Aplikasi memakai ddl-auto=none, starter Flyway hanya di scope test, dan user DB aplikasi tidak punya hak DDL. | review |
| `JSB-402` | WAJIB | SQL dan JPQL selalu berparameter (parameter bernama JdbcClient, :param di @Query, derived query Spring Data). DILARANG menyusun SQL/JPQL dari penyambungan string berisi input. | SpotBugs + FindSecBugs (SQL_INJECTION_*), sebagian |
| `JSB-403` | WAJIB | Uang dan kuantitas memakai BigDecimal ↔ NUMERIC(p,s). BigDecimal dibuat dari String, dibandingkan dengan compareTo. DILARANG double/float untuk nilai uang. | Checkstyle (pola nama uang bertipe double/float), SpotBugs DMI_BIGDECIMAL_CONSTRUCTED_FROM_DOUBLE |
| `JSB-404` | WAJIB | spring.jpa.open-in-view=false. Relasi entity LAZY; data terkait diambil dengan fetch join atau @EntityGraph. DILARANG query di dalam perulangan (N+1). | review |
| `JSB-405` | WAJIB | POST yang membuat data atau memicu proses ke ERP wajib menerima header Idempotency-Key. Kunci dan sidik isi disimpan; permintaan ulang dengan isi sama mendapat respons tersimpan, isi berbeda mendapat 422. | uji integrasi (ulang, isi beda, tanpa header) |
| `JSB-406` | WAJIB | Pesan ke sistem lain ditulis ke tabel outbox dalam transaksi yang sama dengan data bisnis, lalu dikirim proses terpisah (klaim dengan FOR UPDATE SKIP LOCKED, retry bertahap, timeout). DILARANG memanggil sistem lain di dalam transaksi database. | review |
| `JSB-407` | WAJIB | Kunci idempotensi dan status outbox disimpan di PostgreSQL, bukan di memori proses atau cache lokal. | review |
| `JSB-408` | WAJIB | Entity domain memakai JPA (Hibernate). SQL eksplisit (upsert, laporan, outbox) memakai JdbcClient. Pustaka akses data lain (jOOQ, MyBatis) hanya lewat ADR. | review |
| `JSB-409` | SEBAIKNYA | Entity yang dapat diubah bersamaan oleh beberapa pengguna memakai optimistic locking (@Version). | review |
| `JSB-410` | WAJIB | Pool koneksi HikariCP diatur eksplisit (ukuran maksimal, connection-timeout) dari konfigurasi. | review |

### JSB-5xx — Error (4 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `JSB-501` | WAJIB | Semua respons gagal memakai model { success: false, correlationId, errors: [{ code, message }] } lewat @RestControllerAdvice, termasuk 401 dan 403 dari Spring Security (AuthenticationEntryPoint dan AccessDeniedHandler diteruskan ke advice). | uji integrasi (401, 403, 400, 404, 409, 422) |
| `JSB-502` | DILARANG | DILARANG mengirim detail teknis ke klien: server.error.include-stacktrace=never dan include-message=never; error tak dikenal menjadi SYS-0500 dan detailnya hanya ke log. | uji unit PenanganGalat |
| `JSB-503` | WAJIB | Error bisnis memakai exception domain dengan kode terdaftar (enum KodeGalat, mis. SUP-0409) dan status HTTP-nya, terpisah dari error teknis. | review |
| `JSB-504` | DILARANG | DILARANG catch kosong, menangkap Exception/Throwable/RuntimeException di kode biasa, dan printStackTrace. | Checkstyle (EmptyCatchBlock, IllegalCatch, logLewatSlf4j) |

### JSB-6xx — Keamanan (9 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `JSB-601` | WAJIB | Spring Security OAuth2 Resource Server: semua endpoint authenticated kecuali health check. JwtDecoder memverifikasi tanda tangan (JWKS), algoritma RS256, issuer, masa berlaku, dan audience. | uji integrasi (tanpa token, audience lain → 401) |
| `JSB-602` | DILARANG | DILARANG pemeriksaan token dapat dimatikan lewat konfigurasi. Konfigurasi IdP berupa record @Validated dengan @NotBlank, sehingga aplikasi gagal start bila kosong. | uji unit KonfigurasiAuthTest; pola permitAll diperiksa saat review |
| `JSB-603` | WAJIB | Otorisasi per method dengan @PreAuthorize("hasRole(...)") dan @EnableMethodSecurity. Peran dipetakan dari klaim IdP. Setiap aturan peran diuji (403). | uji integrasi (peran salah → 403) |
| `JSB-604` | WAJIB | CSRF dimatikan hanya untuk API stateless dengan Bearer token (SessionCreationPolicy.STATELESS) dan dicatat di spotbugs-exclude.xml. Aplikasi dengan sesi cookie wajib mengaktifkan CSRF. CORS memakai daftar origin dari konfigurasi; DILARANG "*" bersama kredensial. | review |
| `JSB-605` | WAJIB | Header keamanan bawaan Spring Security dipertahankan (ditambah CSP untuk API). Di belakang Kong/Cloudflare, server.forward-headers-strategy diatur agar skema dan IP klien benar. Rate limiting di Kong (K-03). | review |
| `JSB-606` | WAJIB | Rahasia (password database, client secret) hanya dari variabel lingkungan atau secret store. application.yaml tidak memberi nilai bawaan untuk rahasia. env.contoh berisi nama variabel tanpa nilai asli. | review |
| `JSB-607` | DILARANG | Actuator hanya mengekspos health (ditambah info/prometheus bila perlu, di port atau jalur internal). DILARANG mengekspos env, heapdump, beans, configprops, atau loggers ke publik. show-details: never. | review |
| `JSB-608` | WAJIB | Upload file dibatasi ukurannya (spring.servlet.multipart.max-file-size), tipe diperiksa dari isi file, dan file disimpan di S3 (K-01), bukan disk container. | review |
| `JSB-609` | WAJIB | Bila aplikasi terpaksa menyimpan password lokal (tanpa IdP), gunakan PasswordEncoderFactories.createDelegatingPasswordEncoder() (bcrypt/argon2). DILARANG plaintext, MD5, atau SHA tanpa salt. | review |

### JSB-7xx — Konfigurasi (3 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `JSB-701` | WAJIB | Konfigurasi aplikasi dibaca lewat record @ConfigurationProperties + @Validated, didaftarkan dengan @ConfigurationPropertiesScan. Aplikasi gagal start bila tidak valid. | uji unit konfigurasi |
| `JSB-702` | DILARANG | DILARANG @Value dan System.getenv di kode aplikasi; nilai diambil dari record konfigurasi (JSB-701). | Checkstyle (konfigurasiLewatProperties) |
| `JSB-703` | DILARANG | Satu application.yaml ditambah variabel lingkungan per lingkungan. Profil Spring hanya untuk perbedaan teknis (mis. uji). DILARANG percabangan logika bisnis berdasarkan profil atau lingkungan. | review |

### JSB-8xx — Observability dan operasional (6 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `JSB-801` | WAJIB | Log lewat SLF4J dalam format terstruktur (logging.structured.format.console: ecs). Setiap permintaan membawa correlationId di MDC dan header X-Correlation-Id. DILARANG System.out/err, printStackTrace, dan java.util.logging. | Checkstyle (logLewatSlf4j), ArchUnit (standard streams, JUL) |
| `JSB-802` | DILARANG | DILARANG mencatat token, password, header Authorization, atau isi payload yang memuat data pribadi ke log. | review |
| `JSB-803` | WAJIB | Probe /actuator/health/liveness dan /actuator/health/readiness aktif dan publik; readiness ikut memeriksa database. | uji integrasi |
| `JSB-804` | SEBAIKNYA | Tracing dan metrik memakai Micrometer + OpenTelemetry dan dikirim ke kolektor. | review |
| `JSB-805` | WAJIB | Graceful shutdown aktif (server.shutdown: graceful, spring.lifecycle.timeout-per-shutdown-phase). | review |
| `JSB-806` | SEBAIKNYA | Batas memori JVM ditetapkan eksplisit (-XX:MaxRAMPercentage atau -Xmx) sesuai batas memori container. Virtual threads (spring.threads.virtual.enabled) dipakai untuk beban yang banyak menunggu I/O. | review |

### JSB-9xx — Uji, build, rantai pasok (9 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `JSB-901` | WAJIB | Logika service diuji unit dengan JUnit + Mockito + AssertJ tanpa konteks Spring. | maven-surefire-plugin (mvn verify) |
| `JSB-902` | WAJIB | Uji integrasi (*IT) memakai @SpringBootTest + Testcontainers PostgreSQL (@ServiceConnection) + MockMvc dengan spring-security-test, minimal: tanpa token (401), peran salah (403), isian salah (400), alur sukses, idempotensi, dan satu error bisnis. CI wajib punya Docker. DILARANG H2 sebagai pengganti PostgreSQL. | maven-failsafe-plugin + Testcontainers |
| `JSB-903` | WAJIB | Uji arsitektur ArchUnit (ArsitekturTest) ada di setiap aplikasi dan berjalan di mvn verify. | ArchUnit (JUnit) |
| `JSB-904` | WAJIB | mvn verify menjalankan enforcer, Spotless, Checkstyle, SpotBugs + FindSecBugs, uji unit, uji integrasi, dan ArchUnit. Pengecualian SpotBugs hanya di spotbugs-exclude.xml dengan alasan tertulis. | POM induk standar |
| `JSB-905` | WAJIB | Versi dependency dikelola BOM Spring Boot. Override versi (mis. tomcat.version, jackson-bom.version) hanya sementara, dengan komentar alasan dan kapan dicabut. Versi tanpa alasan di POM aplikasi dilarang. | review |
| `JSB-906` | WAJIB | Image container memakai JRE (bukan JDK), berjalan sebagai user non-root, base image dikunci tag dan digest, jar dipecah per lapisan, dan dipindai Trivy; build gagal bila ada temuan CRITICAL/HIGH yang sudah ada perbaikannya. Digest diperbarui lewat Dependabot/Renovate. | Trivy image (CI) |
| `JSB-907` | WAJIB | Dependency dipindai di CI (Trivy fs atau OWASP Dependency-Check) dengan gerbang CRITICAL/HIGH yang sudah ada perbaikannya. Temuan yang diterima dicatat di .trivyignore beserta alasan dan tanggal kedaluwarsa. | Trivy fs (CI) |
| `JSB-908` | SEBAIKNYA | Laporan cakupan JaCoCo dibuat untuk uji unit dan integrasi; ambang minimal ditetapkan per proyek setelah pilot. | jacoco-maven-plugin (laporan) |
| `JSB-909` | WAJIB | Library pihak ketiga yang terikat versi mayor Spring Boot (mis. Flowable 8, versi pertama untuk Boot 4) dan library yang tidak dirawat (tanpa rilis > 12 bulan) dicatat di ADR sebelum dipakai. | review |

## Referensi

- Dokumentasi Spring Boot 4.1 — https://docs.spring.io/spring-boot/4.1/
- Spring Security Reference — https://docs.spring.io/spring-security/reference/
- Spike NestJS vs Spring Boot — https://github.com/iwanhe/spike-nest-vs-spring
- Checkstyle — https://checkstyle.org · SpotBugs — https://spotbugs.github.io · Find Security Bugs — https://find-sec-bugs.github.io
- ArchUnit — https://www.archunit.org · Testcontainers for Java — https://java.testcontainers.org · Spotless — https://github.com/diffplug/spotless

## Isi Folder

| File | Isi |
|---|---|
| `README.md` | Dokumen ini |
| [`Standar_Java_Spring_Boot.xlsx`](Standar_Java_Spring_Boot.xlsx) | Daftar aturan lengkap (sumber utama) |
| [`pom.xml`](pom.xml) | POM induk: enforcer, Spotless, Checkstyle, SpotBugs + FindSecBugs, failsafe, JaCoCo |
| [`config/checkstyle/checkstyle.xml`](config/checkstyle/checkstyle.xml) | Aturan Checkstyle (non-format) |
| [`config/spotbugs/spotbugs-exclude.xml`](config/spotbugs/spotbugs-exclude.xml) | Pengecualian SpotBugs beserta alasan |
| [`mvn.template/`](mvn.template/) | Disalin menjadi `.mvn/`: `maven.config` dan `jvm.config` (akses kompiler untuk google-java-format) |
| [`checklist-review.md`](checklist-review.md) | Checklist review |
| [`examples/benar-app/`](examples/benar-app/) | API supplier contoh |
| [`examples/salah/`](examples/salah/) | Contoh pelanggaran (build harus gagal) |
| [`CHANGELOG.md`](CHANGELOG.md) | Riwayat perubahan |
