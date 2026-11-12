# Checklist Review — Java Spring Boot

Dipakai reviewer bersama [checklist PR umum](../templates/checklist-pr-umum.md). Isi kolom hasil dengan **Ya**, **Tidak**, atau **N/A**. Setiap **Tidak** dirujuk ke ID aturan di komentar review.

## Prasyarat (otomatis, harus hijau sebelum review)

| Periksa | Hasil |
|---|---|
| `mvn spotless:check` lulus (format google-java-format) | |
| `mvn verify` lulus: enforcer, Checkstyle, SpotBugs + FindSecBugs, uji unit, uji integrasi (Docker tersedia, tidak dilewati), ArchUnit | |
| Pemindaian Trivy (dependency dan image) lulus | |
| Pengecualian baru di `spotbugs-exclude.xml` atau `.trivyignore` disertai alasan | |

## Aturan yang Diperiksa Manual

### Struktur dan bean

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `JSB-102` | WAJIB | Kode dikelompokkan per fitur (id.kcsi.<aplikasi>.<fitur>) berisi controller, service, repository, entity, dan DTO fitur itu. Kode lintas fitur di paket umum, keamanan, konfigurasi. | |
| `JSB-103` | WAJIB | Kelas yang hanya dipakai di paketnya sendiri (repository, helper, entity bila memungkinkan) dibuat package-private. Hanya service dan DTO yang dipakai paket lain yang public. | |
| `JSB-204` | WAJIB | Bean memakai scope default (singleton) dan tidak menyimpan state per permintaan di field. Konfigurasi bean dikelompokkan di kelas @Configuration per topik. | |
| `JSB-205` | WAJIB | Klien sistem eksternal (ERP, S3, REST pihak lain) dibungkus bean dengan timeout connect dan read eksplisit (RestClient + pengaturan HTTP client), sehingga dapat diganti di uji. | |

### API

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `JSB-304` | WAJIB | Versi API di URI (/api/v1/...). API versioning Spring Framework 7 dengan path segment boleh dipakai. Endpoint health tetap di /actuator/health tanpa versi. | |
| `JSB-306` | WAJIB | Kontrak JSON sama dengan backend NestJS: properti camelCase, nilai uang sebagai string desimal, tanggal ISO-8601 dengan zona waktu, dan model error yang sama (JSB-501). | |
| `JSB-307` | SEBAIKNYA | Kontrak API didokumentasikan OpenAPI (springdoc atau berkas openapi.yaml) dan disimpan di repo. Swagger UI tidak dibuka di PROD. | |

### Persistensi dan integrasi

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `JSB-401` | WAJIB | Skema dikelola migrasi Flyway (db/migrasi/V<n>__<deskripsi>.sql) yang dijalankan pipeline dengan user DB khusus migrasi. Aplikasi memakai ddl-auto=none, starter Flyway hanya di scope test, dan user DB aplikasi tidak punya hak DDL. | |
| `JSB-402` | WAJIB | SQL dan JPQL selalu berparameter (parameter bernama JdbcClient, :param di @Query, derived query Spring Data). DILARANG menyusun SQL/JPQL dari penyambungan string berisi input. | |
| `JSB-404` | WAJIB | spring.jpa.open-in-view=false. Relasi entity LAZY; data terkait diambil dengan fetch join atau @EntityGraph. DILARANG query di dalam perulangan (N+1). | |
| `JSB-406` | WAJIB | Pesan ke sistem lain ditulis ke tabel outbox dalam transaksi yang sama dengan data bisnis, lalu dikirim proses terpisah (klaim dengan FOR UPDATE SKIP LOCKED, retry bertahap, timeout). DILARANG memanggil sistem lain di dalam transaksi database. | |
| `JSB-407` | WAJIB | Kunci idempotensi dan status outbox disimpan di PostgreSQL, bukan di memori proses atau cache lokal. | |
| `JSB-408` | WAJIB | Entity domain memakai JPA (Hibernate). SQL eksplisit (upsert, laporan, outbox) memakai JdbcClient. Pustaka akses data lain (jOOQ, MyBatis) hanya lewat ADR. | |
| `JSB-409` | SEBAIKNYA | Entity yang dapat diubah bersamaan oleh beberapa pengguna memakai optimistic locking (@Version). | |
| `JSB-410` | WAJIB | Pool koneksi HikariCP diatur eksplisit (ukuran maksimal, connection-timeout) dari konfigurasi. | |

### Error

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `JSB-503` | WAJIB | Error bisnis memakai exception domain dengan kode terdaftar (enum KodeGalat, mis. SUP-0409) dan status HTTP-nya, terpisah dari error teknis. | |

### Keamanan dan konfigurasi

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `JSB-602` | DILARANG | DILARANG pemeriksaan token dapat dimatikan lewat konfigurasi. Konfigurasi IdP berupa record @Validated dengan @NotBlank, sehingga aplikasi gagal start bila kosong. | |
| `JSB-604` | WAJIB | CSRF dimatikan hanya untuk API stateless dengan Bearer token (SessionCreationPolicy.STATELESS) dan dicatat di spotbugs-exclude.xml. Aplikasi dengan sesi cookie wajib mengaktifkan CSRF. CORS memakai daftar origin dari konfigurasi; DILARANG "*" bersama kredensial. | |
| `JSB-605` | WAJIB | Header keamanan bawaan Spring Security dipertahankan (ditambah CSP untuk API). Di belakang Kong/Cloudflare, server.forward-headers-strategy diatur agar skema dan IP klien benar. Rate limiting di Kong (K-03). | |
| `JSB-606` | WAJIB | Rahasia (password database, client secret) hanya dari variabel lingkungan atau secret store. application.yaml tidak memberi nilai bawaan untuk rahasia. env.contoh berisi nama variabel tanpa nilai asli. | |
| `JSB-607` | DILARANG | Actuator hanya mengekspos health (ditambah info/prometheus bila perlu, di port atau jalur internal). DILARANG mengekspos env, heapdump, beans, configprops, atau loggers ke publik. show-details: never. | |
| `JSB-608` | WAJIB | Upload file dibatasi ukurannya (spring.servlet.multipart.max-file-size), tipe diperiksa dari isi file, dan file disimpan di S3 (K-01), bukan disk container. | |
| `JSB-609` | WAJIB | Bila aplikasi terpaksa menyimpan password lokal (tanpa IdP), gunakan PasswordEncoderFactories.createDelegatingPasswordEncoder() (bcrypt/argon2). DILARANG plaintext, MD5, atau SHA tanpa salt. | |
| `JSB-703` | DILARANG | Satu application.yaml ditambah variabel lingkungan per lingkungan. Profil Spring hanya untuk perbedaan teknis (mis. uji). DILARANG percabangan logika bisnis berdasarkan profil atau lingkungan. | |

### Operasional

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `JSB-802` | DILARANG | DILARANG mencatat token, password, header Authorization, atau isi payload yang memuat data pribadi ke log. | |
| `JSB-804` | SEBAIKNYA | Tracing dan metrik memakai Micrometer + OpenTelemetry dan dikirim ke kolektor. | |
| `JSB-805` | WAJIB | Graceful shutdown aktif (server.shutdown: graceful, spring.lifecycle.timeout-per-shutdown-phase). | |
| `JSB-806` | SEBAIKNYA | Batas memori JVM ditetapkan eksplisit (-XX:MaxRAMPercentage atau -Xmx) sesuai batas memori container. Virtual threads (spring.threads.virtual.enabled) dipakai untuk beban yang banyak menunggu I/O. | |

### Build dan dependency

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `JSB-203` | WAJIB | @Transactional dipasang di method public service (readOnly = true untuk baca). DILARANG di controller, dan DILARANG mengandalkan @Transactional pada pemanggilan method dari kelas yang sama. | |
| `JSB-206` | SEBAIKNYA | Paket ditandai @NullMarked (JSpecify) dan diperiksa NullAway di CI. | |
| `JSB-905` | WAJIB | Versi dependency dikelola BOM Spring Boot. Override versi (mis. tomcat.version, jackson-bom.version) hanya sementara, dengan komentar alasan dan kapan dicabut. Versi tanpa alasan di POM aplikasi dilarang. | |
| `JSB-909` | WAJIB | Library pihak ketiga yang terikat versi mayor Spring Boot (mis. Flowable 8, versi pertama untuk Boot 4) dan library yang tidak dirawat (tanpa rilis > 12 bulan) dicatat di ADR sebelum dipakai. | |
