# 07 — Standar Java Spring Boot

> Bagian dari [Standar High-Code Development](../README.md) · Tim PANDAWA

| Atribut | Nilai |
|---|---|
| Prefix ID aturan | `JSB` |
| Status | **Evaluasi** |
| Versi | 0.1.0 (kerangka) |
| File aturan | `Standar_Java_Spring_Boot.xlsx` (belum dibuat) |
| Pembaruan terakhir | 2026-11-01 |

## Ringkasan

Standar backend Java Spring Boot di atas PostgreSQL. Spring Boot adalah salah satu dari dua kandidat backend; pilihan per aplikasi ditetapkan setelah spike NestJS vs Spring Boot selesai.

## Berlaku untuk

| Mandiri | Oracle EBS | SAP |
|:-:|:-:|:-:|
| K | K | K |

`W` = wajib · `K` = kondisional (bila teknologi ini dipakai) · `—` = tidak berlaku

## Ruang Lingkup

- Struktur proyek dan modul per domain
- Layering controller, service, repository, DTO
- Konfigurasi dan secret
- Persistence PostgreSQL, migrasi skema, transaksi
- Kontrak API dan model error
- Keamanan (Spring Security, OAuth2 / OIDC)
- Observability
- Testing
- Build, image container, dan supply chain Maven

## Rencana Kategori Aturan

Nomor aturan dikelompokkan per ratusan. Daftar ini rencana awal dan dapat berubah saat penyusunan.

| Rentang ID | Kategori |
|---|---|
| `JSB-1xx` | Struktur proyek dan modul per domain |
| `JSB-2xx` | Layering dan DTO |
| `JSB-3xx` | Konfigurasi, profile, dan secret |
| `JSB-4xx` | Persistence, Flyway, transaksi, BigDecimal |
| `JSB-5xx` | API: OpenAPI, validasi, model error |
| `JSB-6xx` | Keamanan: Spring Security, OAuth2 resource server, Keycloak |
| `JSB-7xx` | Observability: Actuator, log JSON, ID korelasi |
| `JSB-8xx` | Testing: JUnit 5, Testcontainers |
| `JSB-9xx` | Build, image container, supply chain Maven |

## Referensi Dasar

- Dokumentasi resmi Spring Boot — docs.spring.io/spring-boot
- Hasil spike NestJS vs Spring Boot — github.com/iwanhe/spike-nest-vs-spring

## Penegakan

| Jenis | Alat / cara |
|---|---|
| Format/lint | Spotless / Checkstyle |
| Test | JUnit 5, Testcontainers, JaCoCo |
| Keamanan | OWASP Dependency-Check / OSV-Scanner, Trivy |

## Pelajaran dari Spike (versi yang diuji: Spring Boot 4.1.1, Java 21, PostgreSQL 18)

- Override versi dependency untuk menambal kerentanan (mis. Tomcat, Jackson) bersifat sementara dan wajib dicabut setelah naik ke rilis Spring Boot yang sudah membawa perbaikan.
- Build wajib gagal bila ada temuan kritis/tinggi yang sudah punya perbaikan.
- Image dasar ditetapkan, dikunci, dan dipindai; proses berjalan sebagai non-root.
- Pemeriksaan token tidak boleh bisa dimatikan lewat konfigurasi.

## Isi Folder

| File | Isi |
|---|---|
| `README.md` | Dokumen ini |
| `Standar_Java_Spring_Boot.xlsx` | Daftar aturan lengkap; dibuat dari [template aturan](../templates/Template_Aturan_Standar.xlsx) |
| [`checklist-review.md`](checklist-review.md) | Checklist review pull request |
| [`examples/`](examples/) | Contoh kode benar dan salah per ID aturan |
| [`CHANGELOG.md`](CHANGELOG.md) | Riwayat perubahan |
