# Knowledge Base: Ringkasan Implementasi Oracle EBS 2016
**PT Nojorono Group**
**Dokumen Sumber:** 01_Oracle_EBS_2016_Summary.docx
**Dirangkum per:** 23 March 2026
**Sumber Asli:** Folder Oracle EBS 2016 — Google Drive (owner: iwan.herdian.erp@gmail.com)

---

## 1. Ringkasan Eksekutif

Proyek Oracle E-Business Suite (EBS) 2016 merupakan inisiatif strategis PT Nojorono Group untuk mengimplementasikan sistem ERP terintegrasi. Implementasi menggunakan **Oracle EBS versi 12.2** dengan metodologi **AIM (Application Implementation Methodology)** yang mencakup fase:
- Inception
- Design
- Construction
- Deployment
- Operations

---

## 2. Latar Belakang dan Tujuan

PT Nojorono Group bergerak di industri rokok (SKT/SKM) dengan berbagai anak perusahaan di bidang tembakau, cengkeh, percetakan, dan distribusi. Sebelum implementasi Oracle EBS, perusahaan belum memiliki sistem ERP terintegrasi sehingga terdapat gap dalam pencatatan keuangan, manajemen inventory, produksi, dan pelaporan konsolidasi.

### Tujuan Implementasi
1. Mengintegrasikan seluruh proses bisnis dalam satu sistem ERP
2. Menghasilkan laporan keuangan yang komprehensif dan real-time
3. Menstandardisasi proses bisnis yang efektif dan efisien
4. Menyediakan sistem pendukung pengambilan keputusan manajemen
5. Sinkronisasi dan rekonsiliasi antara transaksi operasional dan akuntansi
6. Mendukung kebutuhan bisnis yang terus berkembang

---

## 3. Ruang Lingkup Modul Oracle EBS

### 3.1 Modul Financial

| Modul | Fungsi Utama |
|---|---|
| **General Ledger (GL)** | Pencatatan jurnal, Chart of Account fleksibel, budgeting, multi-currency, financial reporting |
| **Account Payables (AP)** | Manajemen hutang dagang, payment processing, invoice matching dengan PO |
| **Account Receivables (AR)** | Manajemen piutang dagang, receipt, rekonsiliasi bank |
| **Fixed Assets (FA)** | Pengelolaan aset tetap, depresiasi, transfer, retirement, asset opname |
| **Cash Management** | Rekonsiliasi bank, cash forecasting, manajemen posisi kas |
| **eBTax** | Konfigurasi PPN, withholding tax, faktur pajak |

### 3.2 Modul Distribution

| Modul | Fungsi Utama |
|---|---|
| **Purchasing (PO)** | Supplier management, Purchase Requisition, Purchase Order, receiving, approval workflow |
| **Order Management (OM)** | Sales Order, price list, shipping execution, order to cash process |
| **Inventory Management** | Item master, stock tracking, lot management, subinventory, locator, interorg transfer |

### 3.3 Modul Manufacturing (OPM — Oracle Process Manufacturing)

| Modul | Fungsi Utama |
|---|---|
| **OPM Product Development** | Formula, Routing, Recipe management, lifecycle produk dari konsep hingga produksi |
| **OPM Process Execution** | Production Batch management, konsistensi manufaktur, toll-in/jasa processing |
| **OPM Quality Management** | Quality inspection (incoming, WIP, FG), COA report, sampling plan |
| **OPM Financials / Costing** | Actual costing, standard costing, PMAC, cost component class, GL cost allocation |

---

## 4. Detail Proses Bisnis Per Modul

### 4.1 General Ledger (GL)
- Konfigurasi Chart of Account fleksibel (hingga 30 segmen, maks 256 digit total)
- Jurnal: manual, recurring, reversing, statistical, intercompany
- Budgetary control: upload dan maintain budget, top-down/bottom-up/middle-out
- Multi-currency dengan automatic revaluation journal
- Financial Reporting menggunakan FSG (Financial Statement Generator)
- Trial Balance, P&L Report, laporan konsolidasi multi-entity
- Period control (Open, Closed, Permanently Closed)
- Account drilldown dari GL ke Subledger

### 4.2 Account Payables (AP)
- Supplier master management (terpusat)
- Invoice entry: manual, PO matching, Pay on Receipt auto-invoice
- Prepayment dan settlement ke invoice
- Payment Manager: template, scheduling, instruksi pembayaran
- Interface ke internet banking / host-to-host API
- Budgetary control & integrasi dengan modul AP
- Rekonsiliasi dengan Oracle Cash Management

### 4.3 Account Receivables (AR)
- Customer master management
- Invoice: manual entry atau interface dari Order Management (ship confirm)
- Receipt: manual entry, apply ke open invoice
- Multi-currency dengan automatic selisih kurs (Spot Rate, Corporate Rate, User Rate)
- VAT output & Withholding Tax rekonsiliasi
- Auto jurnal entry

### 4.4 Fixed Assets (FA)
- Asset category dengan metode depresiasi (Straight Line, Double Declining)
- Asset books: Commercial dan Fiscal
- Transaksi mutasi/transfer aset antar lokasi/departemen
- Retirement (parsial dan penuh)
- CIP (Construction in Progress) asset management
- Asset Tag Number (Barcode/QR Code) — customization
- Asset Opname (physical inventory)
- Integrasi dari AP module atau manual upload
- Auto journal entry depresiasi terjadwal

### 4.5 Purchasing (PO)
- Supplier master dan approval hierarchy
- Purchase Requisition (PR) per departemen dengan approval
- Purchase Order (manual, auto-create dari PR, Planned PO)
- Receiving transaction untuk barang/jasa dari vendor
- Blanket Purchase Agreement (kontrak payung)
- Automatic email notification ke supplier setelah PO approved
- Central procurement tembakau dan cengkeh langsung ke petani
- Integrasi barcode + timbangan (weighing integration) untuk material masuk
- Prepayment processing untuk pembelian tembakau/cengkeh

### 4.6 Order Management (OM)
- Customer master dan credit management
- Sales Order entry dan approval
- Price list dan discount management
- Pick Release — Ship Confirm process
- Reserve finished goods dari warehouse
- Auto Invoice ke AR (setelah ship confirm)
- Service order untuk jasa trucking dan pengolahan limbah
- Intercompany order management

### 4.7 Inventory Management
- Item master: category, unit of measure, lot control, grade tracking
- Multi-level storage: Organization → Subinventory → Locator
- Lot management: lot attributes (grade, tahun panen, supplier lot, expired date)
- Lot Specific Conversion (berat per lot bisa berbeda)
- Material transactions: receipt, issue, transfer, misc issue/receipt
- Interorg Transfer (antar gudang/lokasi perusahaan)
- License Plate Number (LPN) untuk WMS barcode scanning
- Lot genealogy untuk traceability produksi
- Cycle counting dan physical inventory

### 4.8 OPM Product Development
- Formula management: material, co-product, by-product, ingredient
- Routing: resources, department, operations
- Recipe: recipe validity rules, version control
- ERES (E-Record & E-Signature) untuk approval master data
- Prototype percetakan menggunakan formula dan routing

### 4.9 OPM Process Execution
- Production Batch: manual creation atau dari Firm Planned Order
- Konsistensi manufaktur melalui kontrol ketat bahan baku
- Toll-in/jasa processing (pengolahan tembakau/cengkeh milik pihak lain)
- WIP transaction untuk tracking material usage per batch
- Resource usage recording (machine, labour, downtime)
- Penyusutan produksi: quantity aktual di-input saat WIP completion
- Flow produksi percetakan (job order based)
- Production batch report dan material usage report

### 4.10 OPM Quality Management
- Quality inspection checkpoint: Receiving (incoming material), WIP, Finished Goods
- Test method dan specification management per produk
- Sampling plan
- COA (Certificate of Analysis) report
- Lot status update berdasarkan hasil QC
- Integrasi dengan legacy QC system
- A/B Test untuk inspeksi cengkeh
- Return to Vendor process berdasarkan hasil QC rejection

### 4.11 OPM Costing (OPM Financials)
- Actual Costing (PMAC — Period Moving Average Cost) untuk financial reporting
- Standard Costing dan Lot Costing untuk management reporting
- Cost Component Class: breakdown cost per komponen (material, resource, overhead)
- GL Cost Allocation: pembebanan biaya (sewa mesin, penyimpanan) ke item cost
- Costing per job order (batch detail report)
- Cost estimation flow: standard cost simulation per versi BOM
- Subledger reconciliation (subledger vs GL)
- Auto journal entry terjadwal

---

## 5. Struktur Folder dan Fase Implementasi

| Folder | Deskripsi |
|---|---|
| **1-Inception** | Product Overview, Project Charter awal, scope definition |
| **2-Design** | Future Process Model (FPM), Functional Design Document (FDD), Gap Analysis |
| **3-Construction** | Custom development, konfigurasi sistem, CRP, SIT, UAT |
| **4-Deployment** | End User Training, data migration, opening balance upload, Go-Live |
| **5-Operations** | Post go-live support, hypercare, knowledge transfer |
| **90-Issue Log** | Log seluruh issue/bug dan statusnya |
| **91-Timeline** | Jadwal proyek dan milestone tracking |
| **92-Progress Meeting** | Notulen rapat kemajuan proyek |
| **93-BAST** | Berita Acara Serah Terima dokumen |
| **94-Template** | Template standar dokumen proyek |
| **Tambahan Custom Report** | Spesifikasi custom report tambahan di luar scope awal |

---

## 6. Tim Implementasi

Implementasi melibatkan konsultan implementor Oracle berpengalaman di industri tembakau, rokok, dan manufaktur proses. Referensi konsultan mencakup: PT Gudang Garam Tbk., PT Surya Madistrindo, PT HM Sampoerna, PT Surya Inti Tembakau, dan berbagai perusahaan FMCG lainnya.

### Peran dalam Proyek

| Peran | Tanggung Jawab |
|---|---|
| **Steering Committee** | Manajemen senior, pengarah dan pengambil keputusan strategis |
| **Project Manager (PM)** | Pengendalian proyek, milestone, komunikasi stakeholder |
| **Change Management / PMO** | Pemantauan progres, SOP, sosialisasi perubahan |
| **Business Process Owner (BPO)** | Subject matter expert per area bisnis |
| **Key User (KU)** | Requirement gathering, testing, training end user |
| **Functional Consultant** | Konfigurasi sistem, FPM, testing |
| **Technical Consultant / Developer** | Custom development, report, integration |
| **Database Administrator (DBA)** | Backup, cloning instance, database performance |

---

## 7. Deliverables Proyek

| Fase | Deliverables |
|---|---|
| **Initiation** | Project Plan, Kick-off Meeting Document |
| **Definition** | Future Process Model (FPM), Functional Design Document (FDD) |
| **Execution & Application** | Development Instance, CRP Scenario Script, UAT Instance, UAT Scenario Script |
| **Launch** | End User Manual, Data Conversion, Migration Strategy Document, Go Live Checklist |
| **Support (Go-Live)** | Production Instance, Application Setup Document, Technical Design Document |

---

## 8. Customization dan Add-On

| Customization | Keterangan |
|---|---|
| **Tax Localization** | Assign Faktur Pajak Number + Faktur Pajak CSV (prebuilt) |
| **Custom Reports** | Hingga 30 custom/revisi report |
| **Personalization** | Hingga 10 personalisasi baru |
| **Custom Program** | Update Lot Status Integration |
| **Tambahan Custom Report** | Dokumen tambahan di luar scope awal |
| **Barcode Application (APEX)** | Stock on-hand, weighing integration untuk tembakau/cengkeh |
| **Integration** | Barcode Scanner + Weighing Integration (Phase 2) |
| **Asset Tag Number Generator** | Barcode/QR Code untuk aset |

---

## 9. Keterkaitan dengan Proyek Lanjutan

| Proyek | Hubungan dengan Oracle EBS 2016 |
|---|---|
| **Project 12: OPM Restructure & DB Upgrade** | Restrukturisasi OPM dan upgrade database Oracle; Go-Live Feb 2025 |
| **Project 44: Relabelling Raw Material** | Pembersihan dan standardisasi item master bahan baku; berlangsung Agt–Des 2025 |
| **ERP 3 PT Non-Rokok (KDK, GLT, MNM)** | Proposal teknis untuk anak perusahaan non-rokok berbasis Oracle EBS yang sama |
