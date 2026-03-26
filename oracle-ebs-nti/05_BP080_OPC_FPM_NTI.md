# Knowledge Base: Oracle Project Costing (OPC) — Future Process Model
**PT Nojorono Tobacco International (NTI)**
**Dokumen Sumber:** BP080-OPC_OPC NTI v1.0.docx
**Versi:** 1.0 | **Tanggal:** 14-Apr-21 (Revisi: 29-Oct-21)
**Penyusun:** Citra Andriani (Trees Solutions) | **Functional Leader:** Francisco Edo

---

## 1. Ruang Lingkup

Modul Oracle Project Costing (OPC) di NTI Jakarta mencakup:
- **Pengelolaan Master Data Project** — Expenditure Type
- **Pencatatan Transaksi Data Project** — Pembentukan Kode Project, Task & Budget
- **Pencatatan Realisasi Biaya Project**
- **Proses Akhir Periode**

Modul ini berintegrasi dengan:
- Inventory OU Jakarta (INJ)
- Requisition to Receipt Jakarta (RRJ)
- Invoice to Payment (ITP)
- Marketing Planning to Monitoring (MPM)

Departemen terkait: Marketing, Logistik, Purchasing, Finance Accounting.

Platform: Oracle Release 12.2.4 standard.

---

## 2. Proses Bisnis OPC — Daftar Aktivitas

| Kode Proses | Nama Proses | Nomor Aktivitas | Nama Aktivitas | Frekuensi |
|---|---|---|---|---|
| OPC-1-1 | Pengelolaan Expenditure Type | OPC-1-1-10 | Mengajukan Usulan Penambahan/Revisi Expenditure Type | Bila Diperlukan |
| OPC-1-1 | Pengelolaan Expenditure Type | OPC-1-1-20 | Melakukan Verifikasi Ketersediaan Expenditure Type | Bila Diperlukan |
| OPC-1-1 | Pengelolaan Expenditure Type | OPC-1-1-30 | Melakukan Revisi Expenditure Type | Bila Diperlukan |
| OPC-1-1 | Pengelolaan Expenditure Type | OPC-1-1-40 | Membuat Expenditure Type Baru | Bila Diperlukan |
| OPC-1-1 | Pengelolaan Expenditure Type | OPC-1-1-50 | Menginformasikan Ketersediaan Expenditure Type | Bila Diperlukan |
| OPC-2-1 | Pembentukan Kode Project, Task & Budget | OPC-2-1-10 | Menjalankan proses penarikan data dari Marketing Activity ke Module OPC | Bila Diperlukan |
| OPC-2-1 | Pembentukan Kode Project, Task & Budget | OPC-2-1-20 | Generate Kode Project Baru | Bila Diperlukan |
| OPC-2-1 | Pembentukan Kode Project, Task & Budget | OPC-2-1-30 | Generate Kode Task Baru | Bila Diperlukan |
| OPC-2-1 | Pembentukan Kode Project, Task & Budget | OPC-2-1-40 | Generate Budget | Bila Diperlukan |
| OPC-2-1 | Pembentukan Kode Project, Task & Budget | OPC-2-1-50 | Menutup Kode Project | Bila Diperlukan |
| OPC-2-1 | Pembentukan Kode Project, Task & Budget | OPC-2-1-60 | Melakukan Update atas Data Project/Task/Budget | Bila Diperlukan |
| OPC-2-1 | Pembentukan Kode Project, Task & Budget | OPC-2-1-70 | Memastikan Project, Task & Budget terbentuk | Bila Diperlukan |
| OPC-2-2 | Pencatatan Realisasi Biaya Project | OPC-2-1-10 | Adanya transaksi atas barang/jasa untuk marketing | Bila Diperlukan |
| OPC-3-1 | Proses Akhir Periode | OPC-3-1-10 | Membuka Periode Selanjutnya | Bulanan |
| OPC-3-1 | Proses Akhir Periode | OPC-3-1-20 | Menjalankan Proses Penarikan Data ke Oracle Project Costing | Bulanan |
| OPC-3-1 | Proses Akhir Periode | OPC-3-1-30 | Menjalankan Report Transaction Exception Details | Bulanan |
| OPC-3-1 | Proses Akhir Periode | OPC-3-1-40 | Menutup Periode | Bulanan |
| OPC-3-1 | Proses Akhir Periode | OPC-3-1-50 | Menyelesaikan Transaksi pada Periode Berjalan | Bulanan |

---

## 3. Proses OPC-1-1: Pengelolaan Expenditure Type

### Gambaran Umum
Proses ini dimulai dari usulan **Brand Manager, Brand Admin, Marketing Manager, atau Admin Department** untuk menambah atau merevisi Expenditure Type menggunakan form manual ke AP Supervisor.

**Expenditure Type** adalah pendefinisian detail biaya yang dikenakan saat melakukan transaksi realisasi proyek. Satu Expenditure Type mewakili 1 (satu) akun biaya marketing. Beberapa Expenditure Type dapat dikelompokkan ke dalam **Expenditure Category**.

Terkait perpajakan/Laporan Normatif, Expenditure Type dapat dibedakan untuk biaya marketing normatif dan non-normatif.

### Contoh Expenditure Category dan Type

| Expenditure Category | Expenditure Type | Natural Account |
|---|---|---|
| STRATEGIC INVESTMENT OUTLET | SIO JASA | 610201 |
| STRATEGIC INVESTMENT OUTLET | SIO RELASI GIFT | 610905 |
| STRATEGIC INVESTMENT OUTLET | SIO PRODUCT TRIAL | 610904 |
| STRATEGIC INVESTMENT OUTLET | SIO MERCHANDISE | 610205 |
| STREET BRAND VISIBILITY | SBV IKLAN | 610202 |
| STREET BRAND VISIBILITY | SBV PAJAK RETRIBUSI | 610406 |

### Katalog Tahapan OPC-1-1

| No | Deskripsi | Frekuensi | Agent | Otomatis |
|---|---|---|---|---|
| OPC-1-1-10 | Mengajukan Usulan Penambahan/Revisi Expenditure Type | Bila Diperlukan | Brand Manager, AMO, Marketing Manager, Admin Department | Manual |
| OPC-1-1-20 | Melakukan Verifikasi Ketersediaan Expenditure Type | Bila Diperlukan | AP Supervisor | Manual |
| OPC-1-1-30 | Melakukan Revisi Expenditure Type | Bila Diperlukan | AP Supervisor | Manual |
| OPC-1-1-40 | Membuat Expenditure Type Baru | Bila Diperlukan | AP Supervisor | Manual |
| OPC-1-1-50 | Menginformasikan Ketersediaan Expenditure Type | Bila Diperlukan | AP Supervisor | Manual |

### Kebijakan OPC-1-1
- AP Supervisor menentukan akun per masing-masing Expenditure Type.

---

## 4. Proses OPC-2-1: Pembentukan Kode Project, Task & Budget

### Gambaran Umum
Proses ini dimulai ketika **Brand Admin & Admin Department** membuat Marketing Activity pada Add-On Program Marketing Activity. Setelah Marketing Activity disetujui, sistem menjalankan penarikan data dari Marketing Activity ke modul Oracle Project Costing.

**Pemetaan Data:**

| Add-On Program Marketing Activity | Oracle Project Costing |
|---|---|
| Nomor Marketing Activity | Project Number |
| Nama Program | Project Name |
| Task | Task |
| Nilai | Budget |
| Periode Pelaksanaan Mulai | Activity Start |
| Periode Pelaksanaan Selesai | Activity End |

**1 (satu) Marketing Activity = 1 (satu) Project.**

### Pengaturan Budget
- Menggunakan **control budget** pada level **Lowest Task** untuk semua department Marketing.
- PT NTI menggunakan metode **Absolute** dengan **amount type PTD (Project to Date)**.
- Control budget dilakukan per Project; nilai transaksi di Purchasing dan Payables tidak dapat melebihi budget per Marketing Activity.
- Di modul General Ledger, control budget encumbrance untuk biaya marketing bersifat **Advisory**.

### Metode Budget (Standard Oracle)
| Metode | Keterangan |
|---|---|
| Advisory | Jika nilai transaksi melampaui budget, sistem hanya memberi peringatan; transaksi tetap dapat diproses |
| Absolute | Jika nilai transaksi melampaui budget, sistem langsung mem-block permintaan |
| None | Tidak ada penjagaan budget |

### Katalog Tahapan OPC-2-1

| No | Deskripsi | Frekuensi | Agent | Otomatis |
|---|---|---|---|---|
| MPM-3-1 | Pembuatan Marketing Activity | Bila Diperlukan | — | — |
| OPC-2-1-10 | Menjalankan proses penarikan data dari Marketing Activity ke Module OPC | Bila Diperlukan | — | Otomatis (Scheduler) |
| OPC-2-1-20 | Generate Kode Project Baru | Bila Diperlukan | — | Otomatis |
| OPC-2-1-30 | Generate Kode Task Baru | Bila Diperlukan | — | Otomatis |
| OPC-2-1-40 | Generate Budget | Bila Diperlukan | — | Otomatis |
| OPC-2-1-50 | Menutup Kode Project | Bila Diperlukan | — | Otomatis |
| OPC-2-1-60 | Update Data Project/Task/Budget (adendum) | Bila Diperlukan | — | Otomatis |
| OPC-2-1-70 | Memastikan Project, Task & Budget terbentuk | Bila Diperlukan | Admin Department | Manual |

### Kebijakan OPC-2-1
1. Melakukan concurrent schedule atas program penarikan data Marketing Activity ke modul Oracle Project Costing.
2. Admin Department memastikan bahwa Project, Task & Budget terbentuk.

---

## 5. Proses OPC-2-2: Pencatatan Realisasi Biaya Project

### Gambaran Umum
Setelah kode Project, Task & Budget terbentuk, transaksi pada **sub-module Purchasing dan Payables** terkait barang/jasa marketing harus mencantumkan:
- **Project Number** — identifikasi unik project
- **Task** — aktivitas yang didefinisikan pada saat project dibentuk
- **Expenditure Type** — pendefinisian detail biaya
- **Expenditure Item Date** — tanggal pencatatan biaya realisasi project (divalidasi terhadap tanggal start/end task)

### Metode Pembuatan PR Marketing

**PR Catalog**
- Untuk barang/jasa yang menggunakan katalog
- Contoh: barang dengan kode item & jasa dengan termin/milestone pembayaran yang sudah ditentukan

**PR Non-Catalog**
- Untuk barang/jasa yang tidak menggunakan katalog
- Contoh: jasa yang belum dapat ditentukan termin pembayaran

**Pembuatan kontrak lintas tahun:** Lakukan break-down line pada PR untuk membedakan period berjalan dan tahun berikutnya. Contoh: kontrak pemasangan Billboard.

**PR Event:** Dibuat secara bulky/estimasi. Jika target tidak tercapai, saat receiving dicatat sesuai aktual (tidak perlu revisi PR & PO). Sisa budget dari PR/PO Event harus di-close agar dapat kembali ke Marketing Activity.

### Pembentukan Kombinasi Akun PR Marketing (Custom Account Generator)

| Segment | Deskripsi |
|---|---|
| Segment 1 | Company |
| Segment 2 | Department (berdasarkan kode department pembuat PR) |
| Segment 3 | Product (berdasarkan nama brand) |
| Segment 4 | Location (default 0701 - MKT) |
| Segment 5 | Project (default 000000 – Non-Project) |
| Segment 6 | Account (berdasarkan Expenditure Type yang dipilih) |
| Segment 7 | Future (default) |

**Kode Department:**
| Kode | Nama |
|---|---|
| O01 | Brand |
| O02 | Marcom |
| O03 | FMM |
| O04 | Riset |
| O05 | Corporate Brand |
| O06 | Trade in Outlet (SA) |
| O07 | Modern Market |

### Invoice Non-PO
Semua transaksi marketing harus melalui jalur PR & PO. Namun untuk transaksi tertentu (Biaya Gaji, Lembur & Claim untuk SBSG, Project Leader, Driver) dapat menggunakan **Invoice Non-PO**. Admin wajib memasukkan Project Number, Task, Expenditure Type & Expenditure Item Date.

### Katalog Tahapan OPC-2-2

| No | Deskripsi | Agent | Otomatis |
|---|---|---|---|
| MPM-3-1 | Pembuatan Marketing Activity (jika belum tersedia) | — | — |
| OPC-2-1-10 | Adanya transaksi barang/jasa untuk marketing | Brand Admin, Admin Department | Manual |
| RRI-2-1 | Maintain Purchase Requisition Catalog | — | — |
| RRI-2-2 | Maintain Purchase Requisition Non-Catalog | — | — |
| ITP-2-2 | Invoice Non-PO | — | — |

### Kebijakan OPC-2-2
- Pembelian barang marketing melalui jalur PR/Direct Invoice wajib mengisi: Project Number, Task, Expenditure Type & Expenditure Item Date.

---

## 6. Proses OPC-3-1: Proses Akhir Periode

### Gambaran Umum
Marketing Budget Controller menjalankan proses tutup periode untuk modul Oracle Project Costing. Periode harus ditutup untuk mencegah transaksi dibukukan di periode yang telah berlalu. Setelah menutup, Marketing Budget Controller harus membuka periode berikutnya.

Proses buka dan tutup periode adalah **independen** — buka periode dapat dijalankan meskipun periode berjalan masih berstatus Open.

### Status Periode OPC

| Status | Keterangan |
|---|---|
| **Open** | Transaksi hanya bisa dilakukan di periode dengan status ini |
| **Closed** | Periode sudah ditutup; tidak ada transaksi baru. Masih bisa diubah kembali ke Open jika dibutuhkan |
| **Pending Close** | Transaksi tidak bisa dibukukan; masih ada transaksi yang belum terselesaikan |
| **Permanently Closed** | Periode ditutup permanen; tidak dapat diubah kembali ke Open |
| **Never Opened** | Periode baru yang belum pernah dibuka; transaksi tidak dapat dilakukan |
| **Future** | Periode belum dibuka, namun transaksi sudah bisa diinput. Jurnal dan interface tidak dapat dilakukan hingga status berubah ke Open |

> **Catatan Penting:** Pastikan di setiap awal tahun, ubah status PA Period dari **Never Opened** menjadi **Future**. Hal ini bertujuan untuk mengakomodir kebutuhan transaksi cross-year.

### Laporan Transaction Exception Details
Sebelum penutupan periode, jalankan laporan **Transaction Exception Details** untuk menganalisa transaksi yang belum terselesaikan. Laporan ini menampilkan data Purchasing, Inventory, Invoice AP yang belum diintegrasikan ke modul Oracle Project Costing.

### Katalog Tahapan OPC-3-1

| No | Deskripsi | Frekuensi | Agent | Otomatis |
|---|---|---|---|---|
| OPC-3-1-10 | Membuka Periode Selanjutnya | Bulanan | Marketing Budget Controller | Manual |
| OPC-3-1-20 | Menjalankan proses penarikan data ke modul OPC | Bulanan | Marketing Budget Controller | Manual |
| OPC-3-1-30 | Menjalankan Report Transaction Exception Details | Bulanan | Marketing Budget Controller | Manual |
| OPC-3-1-40 | Menyelesaikan Transaksi pada Periode Berjalan | Bulanan | Brand Admin & Admin Department | Manual |
| OPC-3-1-50 | Menutup Periode | Bulanan | Marketing Budget Controller | Manual |

### Kebijakan OPC-3-1
- Marketing Budget Controller harus menjalankan laporan **Transaction Exception Details** sebelum penutupan periode.

---

## 7. Analisa Gap OPC

| Kebutuhan | Oracle Mapping | Gap | Solusi |
|---|---|---|---|
| Menjalankan proses penarikan data dari Marketing Activity ke Module OPC | OPC-2-1-10 | Secara fitur standard Oracle, tidak dapat diakomodir atas kebutuhan marketing | Menggunakan kustomisasi concurrent process untuk menarik data dari add-on Marketing Activity ke Module OPC |

---

## 8. Integrasi dengan Modul Lain

```
Marketing Activity (Add-On) 
       ↓ (setelah Approved)
Oracle Project Costing (OPC)
  ├── Project Number = Nomor Marketing Activity
  ├── Task = Line Marketing Activity
  └── Budget = Nilai Marketing Activity
       ↓ (melalui concurrent scheduler)
Sub-Module:
  ├── Purchasing (PR/PO) → Commitment
  ├── Payables (Invoice) → Actual
  └── Inventory (Receipt) → Actual
       ↓ (Create Accounting → Transfer to GL)
General Ledger
```

### Supplier Cost Interface
Proses pengiriman data biaya dari transaksi pembelian (PR, PO, Receipt, AP Invoice) ke modul Oracle Project Costing. Biaya terkirim ke Project setelah jurnal biaya dari transaksi ditransfer ke GL.

### Update Project Summary Amounts
Memperbarui data kemajuan pembebanan proyek di modul Oracle Project. Proses dilakukan secara **scheduler**.

---

## 9. Referensi Roles & Responsibilities

| Role | Tanggung Jawab |
|---|---|
| AP Supervisor | Membuat, merevisi, dan menentukan akun per Expenditure Type |
| Brand Manager / AMO / Marketing Manager / Admin Department | Mengajukan usulan penambahan/revisi Expenditure Type dan membuat PR/Invoice marketing |
| Admin Department | Memastikan Project, Task & Budget terbentuk; monitor Marketing Activity |
| Marketing Budget Controller | Mengelola proses buka/tutup periode OPC; menjalankan concurrent process |

---

## 10. Catatan Implementasi

- Dokumen ini merupakan **Future Process Model** yang disepakati oleh PT NTI dan Trees Solutions.
- Seluruh proses yang tidak dapat diakomodir oleh fitur standard Oracle diselesaikan melalui **kustomisasi (add-on/concurrent process)**.
- Proses perubahan pada sistem harus melalui persetujuan project team PT NTI.
