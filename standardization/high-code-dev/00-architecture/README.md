# 00 — Standar Arsitektur High-Code

> Bagian dari [Standar High-Code Development](../README.md) · Tim PANDAWA

| Atribut | Nilai |
|---|---|
| Prefix ID aturan | `ARC` |
| Status | **Draft** |
| Versi | 0.1.0 (kerangka) |
| File aturan | `Standar_Arsitektur_High_Code.xlsx` (belum dibuat) |
| Pembaruan terakhir | 2026-11-01 |

## Ringkasan

Kerangka arsitektur tujuh lapisan yang dipakai semua profil (Mandiri, Oracle EBS, SAP). Setiap profil memakai lapisan dan ID slot yang sama, lalu mengisi komponennya sendiri. Dilengkapi arsitektur data, asumsi beban, dan kalkulasi sizing.

## Berlaku untuk

| Mandiri | Oracle EBS | SAP |
|:-:|:-:|:-:|
| W | W | W |

`W` = wajib · `K` = kondisional (bila teknologi ini dipakai) · `—` = tidak berlaku

## Ruang Lingkup

- Tujuh lapisan: Edge & API, Experience, Core Services, Data, Integrasi, Enterprise Systems, Lintas Lapisan
- Katalog komponen per slot dan per profil: komponen standar, lisensi, alternatif, status pemakaian
- Arsitektur data: schema per modul, tabel berlaku/riwayat/audit, file di luar database, kerahasiaan, titik sambung ERP
- Asumsi beban dan kalkulasi sizing (vCPU, RAM, disk) dengan sumber angka tertulis
- Keputusan terbuka dan pencatatannya

## Rencana Kategori Aturan

Nomor aturan dikelompokkan per ratusan. Daftar ini rencana awal dan dapat berubah saat penyusunan.

| Rentang ID | Kategori |
|---|---|
| `ARC-1xx` | Lapisan dan slot komponen |
| `ARC-2xx` | Pemilihan komponen dan lisensi |
| `ARC-3xx` | Arsitektur data |
| `ARC-4xx` | Integrasi ERP dan sistem lain |
| `ARC-5xx` | Keamanan dan identitas |
| `ARC-6xx` | Sizing dan kapasitas |
| `ARC-7xx` | Operasi: observability, backup, CI/CD |

## Referensi Dasar

- Template Arsitektur Referensi profil Mandiri v0.6 (Excel) beserta suntingan tim
- Profil Oracle EBS: skill PANDAWA dan Oracle Technical Paper *Extending Oracle E-Business Suite Release 12.2 using Oracle APEX* v4.3 (Mei 2023)
- Profil SAP: proposal implementasi SAP Cloud ERP untuk KDK & GLT (Agustus 2026)

## Penegakan

| Jenis | Alat / cara |
|---|---|
| Validasi sizing | Rumus dan validasi V-1 s.d. V-7 di workbook |
| Review | Design review oleh Development Manager |

## Keputusan Komponen (profil Mandiri)

| ID | Topik | Keputusan |
|---|---|---|
| K-01 | Object storage | Amazon S3 |
| K-02 | Versioning skema database | Flyway |
| K-03 | API gateway | Kong Gateway |
| K-04 | — | Belum ditentukan |
| K-05 | CI/CD | Jenkins atau GitLab CE |
| K-06 | Container | Docker Compose |
| K-07 | — | Belum ditentukan |
| K-08 | — | Belum ditentukan |
| K-09 | — | Belum ditentukan |

## Hal yang Masih Perlu Diputuskan

1. Penggabungan profil Mandiri, Oracle EBS, dan SAP ke dalam satu workbook.
2. Profil Oracle EBS: posisi ORDS (app server EBS atau server terpisah) dan pemakaian schema APPS untuk aplikasi modular perlu dicek ulang terhadap panduan Oracle.
3. Profil SAP: sisi middleware di luar bahasa dan database (antrian, retry, anti-duplikasi, rekonsiliasi, secret, monitoring) belum dirancang.

## Isi Folder

| File | Isi |
|---|---|
| `README.md` | Dokumen ini |
| `Standar_Arsitektur_High_Code.xlsx` | Daftar aturan lengkap; dibuat dari [template aturan](../templates/Template_Aturan_Standar.xlsx) |
| [`checklist-review.md`](checklist-review.md) | Checklist review pull request |
| [`examples/`](examples/) | Contoh kode benar dan salah per ID aturan |
| [`CHANGELOG.md`](CHANGELOG.md) | Riwayat perubahan |
