# 06 — Standar CI/CD Oracle APEX

> Bagian dari [Standar High-Code Development](../README.md) · Tim PANDAWA

| Atribut | Nilai |
|---|---|
| Prefix ID aturan | `CIA` |
| Status | **Siap pilot** |
| Versi | 0.1.0 (kerangka) |
| File aturan | `Standar_CICD_Oracle_APEX.xlsx` (belum dibuat) |
| Pembaruan terakhir | 2026-11-01 |

## Ringkasan

Standar pipeline build, validasi, dan deploy aplikasi Oracle APEX dan objek database dengan ADT (APEX Deployment Tool) dari DEV ke UAT ke PROD.

## Berlaku untuk

| Mandiri | Oracle EBS | SAP |
|:-:|:-:|:-:|
| K | W | — |

`W` = wajib · `K` = kondisional (bila teknologi ini dipakai) · `—` = tidak berlaku

## Ruang Lingkup

- Branching dan pull request
- Struktur repo dan konfigurasi ADT
- Validasi di pull request
- Deploy ke UAT dan PROD beserta gerbang persetujuan
- Backup dan rollback
- Keamanan runner dan secret
- Online patching untuk objek di database EBS

## Rencana Kategori Aturan

Nomor aturan dikelompokkan per ratusan. Daftar ini rencana awal dan dapat berubah saat penyusunan.

| Rentang ID | Kategori |
|---|---|
| `CIA-1xx` | Branching dan pull request |
| `CIA-2xx` | Struktur repo dan konfigurasi ADT |
| `CIA-3xx` | Validasi pull request |
| `CIA-4xx` | Deploy UAT |
| `CIA-5xx` | Deploy PROD dan persetujuan |
| `CIA-6xx` | Backup dan rollback |
| `CIA-7xx` | Keamanan runner, secret, dan log |
| `CIA-8xx` | Online patching EBS (EBR, adop) |

## Referensi Dasar

- ADT — APEX Deployment Tool (Jan Kvetina)
- Deployment Process PANDAWA
- Catatan keputusan CI/CD APEX Jalur Oracle, 1 November 2026

## Penegakan

| Jenis | Alat / cara |
|---|---|
| Deploy | ADT `patch -target <ENV> -patch <TASK> -deploy` |
| Backup/cek | SQLcl |
| Secret scan | Gitleaks CLI 8.30.1 |
| Keamanan APEX | APEX SERT + Advisor (G4, manual) |

## Keputusan yang Sudah Diambil

- ADT adalah satu-satunya mesin deploy. SQLcl hanya untuk backup, restore, dan pemeriksaan.
- Self-hosted runner per environment (`pandawa-oracle-uat`, `pandawa-oracle-prod`). Validasi PR berjalan di runner GitHub tanpa secret.
- Tidak ada restore otomatis. Rollback APEX manual dari artifact `apex-backup-<ENV>`; rollback database lewat `rollback.sql` bersama DBA.
- PROD hanya dari `main`, wajib bukti `evidence-UAT-<task>`, nomor CR, dan bukti SERT/Advisor.
- Semua GitHub Action dikunci ke commit SHA 40 karakter.

## Temuan Teknis ADT yang Wajib Diantisipasi

- ADT selalu keluar dengan exit code 0 walau gagal; status dibaca dari log `[ERROR]` dan penanda keluaran.
- ADT dapat mencetak perintah CONNECT berisi password saat SQLcl gagal; log wajib disamarkan sebelum diunggah.
- ADT membutuhkan Python 3.11; template `db_init` bawaan men-set `NLS_TERRITORY` ke CZECH REPUBLIC dan wajib disesuaikan.

## Hal yang Masih Perlu Diputuskan

| ID | Topik |
|---|---|
| K-1 | Database pilot: database mandiri atau EBS 12.2 |
| K-2 | Pemakaian `apex_keep_original_id` |
| K-3 | Otomasi gerbang keamanan G4 |
| K-4 | Akun smoke test di PROD |
| K-5 | Login aplikasi lewat menu EBS |
| — | Integrasi proses rilis dengan EBR, `AD_ZD_TABLE.UPGRADE`, dan siklus adop |

## Isi Folder

| File | Isi |
|---|---|
| `README.md` | Dokumen ini |
| `Standar_CICD_Oracle_APEX.xlsx` | Daftar aturan lengkap; dibuat dari [template aturan](../templates/Template_Aturan_Standar.xlsx) |
| [`checklist-review.md`](checklist-review.md) | Checklist review pull request |
| [`examples/`](examples/) | Contoh kode benar dan salah per ID aturan |
| [`CHANGELOG.md`](CHANGELOG.md) | Riwayat perubahan |
