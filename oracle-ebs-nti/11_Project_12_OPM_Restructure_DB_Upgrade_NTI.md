# Knowledge Base: Project 12 — OPM Restructure & DB Upgrade
**PT Nojorono Group — Oracle EBS**
**Dokumen Sumber:** 02_Project_12_OPM_Restructure_DB_Upgrade.docx
**Dirangkum per:** 23 March 2026
**Sumber Asli:** Folder 12 OPM Restructure & DB Upgrade — Google Drive (01 PROJECT)

---

## 1. Ringkasan Eksekutif

Project 12 adalah proyek strategis PT Nojorono Group yang bertujuan melakukan:
- **Restrukturisasi modul Oracle Process Manufacturing (OPM)**
- **Upgrade database Oracle EBS**

**Status:** ✅ **SELESAI — Go-Live Februari 2025**

**Tim Inti:**
| Email | Peran | Pihak |
|---|---|---|
| it.pmo@nojorono.com | PMO / Project Owner | Nojorono |
| wara.sunindya@gmail.com | Lead Technical Consultant | Vendor/Konsultan |
| bimawapratama@gmail.com | Technical Consultant (FSD & TDD / Trees Development) | Vendor/Konsultan |

---

## 2. Latar Belakang

Setelah implementasi awal Oracle EBS 2016, PT Nojorono Group mengidentifikasi kebutuhan:
1. Restrukturisasi setup OPM agar lebih sesuai dengan proses bisnis aktual tembakau dan cengkeh
2. Upgrade database Oracle untuk meningkatkan performa, stabilitas, dan keamanan sistem
3. Perbaikan struktur trees (hierarki organisasi/GL) dalam database
4. Penambahan integrasi baru: NNA Integration (Auto Ship Confirm) dan NTI Delphi Integration
5. Penyesuaian untuk pita cukai 2025
6. Migrasi dan pembaruan custom program yang sudah ada

---

## 3. Ruang Lingkup Pekerjaan

### 3.1 OPM Restructure

| Area | Deskripsi |
|---|---|
| **Formula & Recipe** | Review dan restrukturisasi formula tembakau, cengkeh, dan produk turunannya |
| **Organization Setup** | Penyesuaian struktur Oracle Organization (Inventory Org, Cost Org, Process Org) |
| **Cost Method** | Review metode costing (PMAC vs Standard) dan realignment dengan kebutuhan laporan keuangan |
| **Trees Development** | Pembangunan ulang hierarki/trees dalam database Oracle EBS |
| **NNA Integration — Auto Ship Confirm** | Integrasi baru untuk otomasi proses ship confirm di NNA |
| **NTI Delphi Integration** | Integrasi dengan sistem Delphi untuk PT NTI |
| **Pita Cukai 2025 (3 PT)** | Penyesuaian konfigurasi pita cukai untuk kebutuhan 2025 |

### 3.2 Database Upgrade

- Upgrade versi Oracle Database ke versi yang lebih baru
- Performance tuning dan optimize indexing
- Simulasi upgrade database (September 2024)
- Perubahan jam kerja sementara selama proses upgrade simulasi
- Travel dinas tim IT ke lokasi: NCT (Nojorono Cigarette Tulungagung), ATI, NSTI
- Post-upgrade validation dan testing

---

## 4. Struktur Dokumen Proyek

| Sub-Folder | Konten | Update Terakhir |
|---|---|---|
| 01 Proposal | Proposal teknis dan komersial proyek | Des 2024 |
| 02 Project Charter | Dokumen inisiasi dan scope proyek | Jul 2024 |
| 03 Project Plan-Schedule | Jadwal implementasi dan milestone | Jul 2024 |
| 04 FSD & TDD | Functional Spec Document & Technical Design Document (Trees, NNA, NTI, Pita Cukai) | Feb 2025 |
| 05 GAP Analysis | Analisis gap sistem existing vs kebutuhan baru | Jul 2024 |
| 06 Test Script - Scenario | Script testing untuk SIT dan UAT | Okt 2024 |
| 07 Risk and Issue List | Daftar risiko dan issue proyek | Jul 2024 |
| 08 Weekly - Periodic Report | Laporan mingguan dan periodik | Jul 2024 |
| 09 Minutes Of Meeting | Notulen rapat | Jul 2024 |
| 10 SIT and UAT Sign Off | Dokumen sign-off SIT dan UAT | Jul 2024 |
| 11 CM and Live Documents | Change Management dan dokumen Go-Live | Jul 2024 |
| 12 Project Closure - Lesson Learned | Penutupan proyek dan lesson learned | Jul 2024 |
| 13 Administration Docs | Dokumen administrasi (memo, surat, dll.) | Des 2024 |
| 14 Upgrade Activities | Aktivitas teknis upgrade database | Feb 2025 |
| 15 Go Live | Dokumen pasca Go-Live dan hypercare | Feb 2025 |

---

## 5. Proses Bisnis yang Terimpak

### 5.1 OPM Process Manufacturing

| Modul | Dampak Restrukturisasi |
|---|---|
| **OPM Product Development** | Review dan update Formula, Routing, Recipe untuk tembakau (GLT), cengkeh (KDK), dan produk ekspanded |
| **OPM Process Execution** | Penyesuaian Production Batch flow, resource allocation, dan lot tracking pasca restructure |
| **OPM Quality Management** | Alignment ulang spesifikasi quality dengan formula yang direstrukturisasi |
| **OPM Costing / Financial** | Realignment cost method dan cost organization setelah restructure OPM |
| **Inventory Management** | Update lot attributes, item setup, dan organization assignment |
| **General Ledger** | Trees development untuk struktur akun GL yang lebih optimal |

### 5.2 Integrasi Baru

**NNA Integration — Auto Ship Confirm**
- Otomasi proses ship confirm untuk NNA (Nojorono Niaga Abadi)
- Mengurangi manual entry di Order Management
- Status: ✅ Selesai (dokumen FSD Okt 2024, implementasi ~Feb 2025)

**NTI Delphi Integration**
- Integrasi data antara sistem Delphi PT NTI dengan Oracle EBS
- Transfer data produksi/inventory
- Status: ✅ Selesai (dokumen dibuat Sep 2024)

**Pita Cukai 2025 (3 PT)**
- Update konfigurasi pita cukai di Oracle EBS untuk memenuhi regulasi fiskal 2025
- Status: ✅ Selesai (dokumen Sep 2024)

### 5.3 Database Upgrade Activities

- Simulasi upgrade: September–Oktober 2024 (ada memo perubahan jam kerja sementara)
- Tim IT melakukan perjalanan dinas ke lokasi NCT, ATI, dan NSTI untuk eksekusi upgrade
- Testing pasca-upgrade di Development/UAT environment sebelum Production
- Monitoring sistem pasca Go-Live (Februari 2025)

---

## 6. Timeline dan Milestone

| Periode | Aktivitas / Milestone |
|---|---|
| **Juli 2024** | Proyek dimulai: Project Charter, Project Plan, awal FSD development |
| **Agustus 2024** | Gap Analysis selesai, FSD & TDD in progress, NNA & NTI integration design |
| **September 2024** | Simulasi DB Upgrade, perubahan jam kerja sementara, NNA & NTI FSD finalisasi |
| **Oktober 2024** | Test Script scenario finalisasi, SIT dimulai |
| **November 2024** | Kontrak OPM & DB Upgrade ditandatangani, Administration Docs finalisasi |
| **Desember 2024** | Administration Docs update, Project Plan finalisasi, UAT |
| **Januari 2025** | Upgrade Activities intensif, preparation Go-Live |
| **Februari 2025** | ✅ **GO-LIVE** |

---

## 7. Status Akhir Proyek

| Item | Status | Keterangan |
|---|---|---|
| 14 Upgrade Activities | ✅ Selesai | Terakhir dimodifikasi 27 Feb 2025 |
| 15 Go Live | ✅ Selesai | Terakhir dimodifikasi 27 Feb 2025 — dalam fase hypercare |
| 04 FSD & TDD | ✅ Selesai | Terakhir dimodifikasi 11 Feb 2025 |
| 13 Administration Docs | ✅ Selesai | Terakhir dimodifikasi 28 Des 2024 |
| Trees Development | ✅ Selesai | Sub-folder terakhir update Feb 2025 |
| NNA Auto Ship Confirm | ✅ Selesai | Terintegrasi ~Februari 2025 |
| NTI Delphi Integration | ✅ Selesai | Dokumen dibuat Sep 2024 |
| Pita Cukai 2025 (3 PT) | ✅ Selesai | Dokumen Sep 2024 |
| OPM Restructure | ✅ Selesai | Go-Live Februari 2025 |
| DB Upgrade | ✅ Selesai | Go-Live Februari 2025 |

---

## 8. Keterkaitan dengan Proyek Lain

| Proyek | Hubungan |
|---|---|
| **Oracle EBS 2016** | Basis sistem yang di-upgrade dan di-restructure |
| **Project 44: Relabelling Raw Material** | OPM Restructure (selesai Feb 2025) membutuhkan item master yang bersih; Project 44 menjadi tindak lanjut langsung |

---

## 9. Catatan

Project 12 merupakan proyek dengan dampak besar terhadap performa sistem Oracle EBS Nojorono Group. Dengan selesainya proyek ini pada Februari 2025, sistem Oracle EBS berjalan di atas database yang lebih baru dan OPM yang lebih terstruktur, mendukung akurasi costing, kualitas data produksi, dan integrasi dengan sistem pihak ketiga.
