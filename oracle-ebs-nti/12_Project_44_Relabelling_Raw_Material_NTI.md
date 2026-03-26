# Knowledge Base: Project 44 — Relabelling Raw Material Master Data
**PT Nojorono Group — Oracle EBS**
**Dokumen Sumber:** 03_Project_44_Relabelling_Raw_Material.docx
**Dirangkum per:** 23 March 2026
**Sumber Asli:** Folder 44 RELABELLING RAW MATERIAL MASTER DATA — Google Drive (01 PROJECT)
**PMO:** it.pmo@nojorono.com

---

## 1. Ringkasan Eksekutif

Project 44 adalah proyek pembersihan dan restrukturisasi **master data bahan baku (raw material)** di Oracle EBS Nojorono Group.

- **Periode:** Agustus 2025 — Desember 2025
- **Durasi:** ±5 bulan
- **Status:** ✅ **SELESAI Q4 2025**
- **Melibatkan:** Konsultan eksternal (dipilih secara formal melalui Vendor Selection)

---

## 2. Latar Belakang dan Tujuan

Setelah bertahun-tahun operasional Oracle EBS (sejak 2016), item master bahan baku mengalami akumulasi data tidak konsisten. Masalah yang ditemukan:

- Penamaan tidak standar
- Duplikasi item
- Klasifikasi yang kurang tepat
- Atribut yang tidak lengkap

**Dampak masalah tersebut:**
- Akurasi laporan material usage tidak optimal
- Kesulitan cost tracking per jenis bahan baku
- Inefisiensi procurement (duplicate item/supplier)
- Kesulitan traceability lot untuk tembakau dan cengkeh
- Inkonsistensi data antara modul Inventory, Purchasing, dan OPM

### Tujuan Proyek
1. Standardisasi penamaan item bahan baku sesuai konvensi baru
2. Pembersihan data master item yang duplikat atau tidak aktif
3. Review dan pembaruan atribut item: unit of measure, lot control, item category
4. Penyesuaian data item dengan kebutuhan OPM (formula, recipe) yang telah direstrukturisasi
5. Memastikan konsistensi data antara semua modul Oracle EBS yang terhubung
6. Menyiapkan environment akses (Env Access) untuk proses relabelling
7. Validasi data stock C48 pasca relabelling

---

## 3. Ruang Lingkup

### Area yang Dicakup

| Modul/Area | Deskripsi Scope |
|---|---|
| **Oracle Inventory** | Item Master (raw material), item attributes, category assignment, UOM |
| **OPM Product Development** | Update Formula dan Recipe yang menggunakan item yang di-relabel |
| **Purchasing** | Supplier-item relationship update, blanket PO review |
| **OPM Process Execution** | Review production batch template yang menggunakan item lama |
| **OPM Costing** | Update cost references untuk item yang di-relabel |
| **Data Stock C48** | Validasi dan adjustment data stok untuk item C48 pasca relabelling |

### Exclusion (Di Luar Scope)
- Perubahan pada item finished goods (hanya raw material)
- Restrukturisasi Chart of Account (sudah dikerjakan di Project 12)
- Penambahan modul baru Oracle EBS
- Hardware atau infrastructure upgrade

---

## 4. Struktur Dokumen Proyek

| Sub-Folder | Konten | Dibuat |
|---|---|---|
| **00 Vendor Selection** | Seleksi vendor/konsultan untuk relabelling | Agustus 2025 |
| **01 Proposal** | Proposal kegiatan relabelling dan rencana kerja | Agustus 2025 |
| **02 Project Charter** | Scope, tujuan, dan komitmen proyek resmi | Agustus 2025 |
| **03 Project Plan** | Jadwal dan milestone relabelling | Agustus 2025 |
| **04 FSD** | Functional Specification Document (inkl. Data Stock C48 & Env Access) | Des 2025 |
| **05 Gap Analysis** | Analisis gap antara item master existing dan standar baru | Agustus 2025 |
| **06 Test Scenario** | Skenario testing untuk validasi item yang di-relabel | Agustus 2025 |
| **07 Risk and Issue List** | Daftar risiko dan issue selama relabelling | Agustus 2025 |
| **08 Weekly Report** | Laporan perkembangan mingguan | Agustus 2025 |
| **09 Minutes of Meeting** | Notulen rapat kemajuan | Agustus 2025 |
| **10 SIT and UAT Sign Off** | Dokumen sign-off testing setelah relabelling | Agustus 2025 |
| **11 CM and Live Documents** | Change Management dan dokumen live | Agustus 2025 |
| **12 Project Closure** | Dokumen penutupan proyek dan lesson learned | Agustus 2025 |
| **13 Other Docs** | Dokumen pendukung lainnya | Des 2025 |

---

## 5. Proses Teknis Relabelling

### Pendekatan Relabelling

```
1. Assessment Awal
   └── Inventarisasi seluruh item raw material yang perlu di-relabel

2. Definisi Standar Penamaan Baru
   └── Berdasarkan konvensi terbaru Nojorono Group

3. Gap Analysis
   └── Item mana yang perlu rename, merge, inactivate, atau update atribut

4. FSD (Functional Spec)
   └── Dokumentasi teknis perubahan per item

5. Environment Setup (Env Access — 10 Des 2025)
   └── Akses ke environment Oracle EBS yang sesuai

6. Eksekusi Relabelling di Sistem
   └── Menggunakan item update procedure Oracle EBS

7. Validasi Data Stock C48 (30 Des 2025)
   └── Memastikan tidak ada selisih stok setelah perubahan item

8. SIT dan UAT
   └── Testing skenario transaksi dengan item yang sudah di-relabel

9. Go-Live
   └── Aktivasi item baru dan deaktivasi item lama
```

### Dampak Relabelling pada Modul Oracle EBS

| Modul | Dampak Relabelling |
|---|---|
| **Inventory Management** | Item master update, category re-assignment, UOM standardization |
| **Purchasing (PO)** | Supplier-item catalog update, blanket PO revision |
| **OPM Product Development** | Formula & Recipe update dengan item label baru |
| **OPM Process Execution** | Production batch template revision |
| **OPM Costing** | Item cost update, cost component mapping revision |
| **Order Management (OM)** | Price list item update jika ada raw material yang dijual |
| **General Ledger** | Akun inventory mapping review untuk item baru |

### Data Stock C48
Sub-dokumen "01 Data Stock C48" (dibuat 30 Desember 2025) dalam folder 04 FSD memvalidasi data stok untuk item dengan kode C48 (kemungkinan kode untuk salah satu bahan baku cengkeh atau tembakau). Validasi meliputi:
- On-hand quantity item C48 tetap akurat setelah relabelling
- Nilai inventory (inventory valuation) tidak berubah secara tidak semestinya
- Lot tracking untuk item C48 tetap terjaga
- Transaksi historis masih bisa diakses melalui item number lama atau baru

### Environment Access (Env Access)
Dokumen "Env Access" (dibuat 10 Desember 2025) dalam folder 04 FSD mendokumentasikan:
- Akses ke Production environment untuk eksekusi relabelling
- Akses ke Development/Test environment untuk testing pra-live
- Credential dan privilege yang dibutuhkan tim relabelling
- Prosedur backup sebelum eksekusi massal

---

## 6. Timeline dan Milestone

| Periode | Aktivitas / Milestone |
|---|---|
| **Agustus 2025** | Proyek dimulai: Vendor Selection, Project Charter, Proposal, Project Plan, Gap Analysis awal |
| **Agt–Sep 2025** | FSD development, test scenario design, risk identification |
| **Okt–Nov 2025** | Eksekusi relabelling di Development environment, SIT |
| **Des 2025 (awal)** | UAT, sign-off, Env Access setup (10 Des 2025) |
| **Des 2025 (akhir)** | Validasi Data Stock C48 (30 Des 2025), finalisasi FSD |
| **Des 2025–Jan 2026** | Project Closure |

---

## 7. Status Akhir Proyek

| Dokumen/Item | Status | Keterangan |
|---|---|---|
| 01 Proposal | ✅ Selesai | Finalisasi Agustus 2025 |
| 02 Project Charter | ✅ Selesai | Disetujui Agustus 2025 |
| 03 Project Plan | ✅ Selesai | Finalisasi Agustus 2025 |
| 04 FSD (inkl. Data Stock C48 & Env Access) | ✅ Selesai | Update terakhir 30 Des 2025 |
| 05 Gap Analysis | ✅ Selesai | Finalisasi Agustus 2025 |
| 06 Test Scenario | ✅ Selesai | Finalisasi Agustus 2025 |
| 10 SIT and UAT Sign Off | ✅ Selesai | Sign-off completed |
| 11 CM and Live Documents | ✅ Selesai | Go-Live executed |
| 12 Project Closure | ✅ Selesai | Lesson learned didokumentasikan |
| 13 Other Docs | ✅ Selesai | Update terakhir 15 Des 2025 |
| **Overall Proyek** | ✅ **SELESAI Q4 2025** | Berhasil dalam 4–5 bulan |

---

## 8. Manfaat yang Dicapai

1. **Akurasi data master item meningkat** — tidak ada lagi duplikasi atau penamaan tidak konsisten
2. **Laporan material usage lebih akurat** dan mudah dianalisis
3. **Proses procurement lebih efisien** — item catalog bersih
4. **OPM Formula & Recipe lebih akurat** karena menggunakan item master yang clean
5. **Costing lebih akurat** — item cost component terpetakan dengan benar
6. **Audit trail lebih jelas** — setiap item dapat ditelusuri dengan konsisten
7. **Onboarding user baru lebih mudah** — standar penamaan jelas
8. **Basis yang solid** untuk pengembangan Oracle EBS selanjutnya (integrasi baru, ekspansi modul)

---

## 9. Keterkaitan dengan Proyek Lain

| Proyek | Keterkaitan |
|---|---|
| **Oracle EBS 2016** | Basis data master item yang direlabel berasal dari implementasi awal 2016 |
| **Project 12: OPM Restructure & DB Upgrade** | OPM Restructure (selesai Feb 2025) membutuhkan item master yang bersih; Project 44 adalah tindak lanjut langsung |
| **Project 03: ERP 3 PT Non-Rokok (KDK, GLT, MNM)** | Proposal teknis KDK/GLT/MNM (2024) mencantumkan kebutuhan standarisasi item master yang selaras |
| **Proyek Relabelling → OPM** | Item yang telah di-relabel menjadi dasar update Formula, Recipe, dan Production Batch di OPM |
