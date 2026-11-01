# Architecture Decision Record (ADR)

Catatan keputusan arsitektur yang menyimpang dari standar atau memilih di antara beberapa opsi yang sama-sama sah.

## Kapan ADR wajib

- Memakai teknologi atau komponen di luar katalog standar.
- Memilih di antara opsi yang ditawarkan standar untuk satu aplikasi (mis. backend NestJS atau Spring Boot).
- Mengubah keputusan arsitektur yang sudah tercatat.

## Konvensi

- Nama file: `ADR-NNN-<ringkasan-kebab-case>.md`, nomor berurutan dan tidak dipakai ulang.
- Dibuat dari [template ADR](../templates/template-adr.md).
- Status: **Diusulkan** → **Disetujui** / **Ditolak** → **Digantikan oleh ADR-NNN** (bila ada).
- ADR yang disetujui tidak diedit isinya; perubahan dibuat sebagai ADR baru yang menggantikan.

## Daftar ADR

| Nomor | Judul | Status | Tanggal |
|---|---|---|---|
| — | Belum ada ADR | — | — |

## Kandidat ADR

| Topik | Pemicu |
|---|---|
| Pilihan backend: NestJS atau Spring Boot | Hasil spike `iwanhe/spike-nest-vs-spring` |
| Prefix objek custom Oracle EBS | Tiga versi berbeda di sumber (lihat `01-plsql`) |
