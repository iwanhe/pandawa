# Changelog — Standar Java Spring Boot

Format mengikuti [Keep a Changelog](https://keepachangelog.com/id-ID/1.1.0/). Versi mengikuti aturan di [README utama](../README.md#11-siklus-hidup-dan-versi).

## [Belum dirilis]

## [0.2.0] - 2026-11-12

### Ditambahkan
- `Standar_Java_Spring_Boot.xlsx` dengan 61 aturan (JSB-1xx s.d. JSB-9xx) untuk Spring Boot 4.1.
- POM induk `pom.xml` (enforcer, Spotless/google-java-format, Checkstyle, SpotBugs + FindSecBugs, failsafe, JaCoCo), `config/checkstyle/checkstyle.xml`, `config/spotbugs/spotbugs-exclude.xml`, dan `mvn.template/` (disalin menjadi `.mvn/`).
- API contoh `examples/benar-app` (OAuth2 Resource Server dengan audience, model error sama dengan NestJS, transaksi + outbox + Idempotency-Key, actuator probes, log ECS, Dockerfile berlapis) dengan uji unit, uji integrasi Testcontainers, dan ArchUnit.
- Contoh salah `examples/salah` berisi pola temuan spike.
- Checklist review dipetakan ke ID aturan.
- Catatan: build Maven belum diverifikasi (akses Maven Central diblokir saat penyusunan).

### Diubah
- Status dari Evaluasi menjadi Draft (build belum diverifikasi).

## [0.1.0] - 2026-11-01

### Ditambahkan
- Kerangka folder: README, checklist review, folder contoh, dan changelog.
