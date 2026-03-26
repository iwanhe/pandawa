# Knowledge Base: Training Material — Requisition to Receipt (RRJ) dengan Integrasi OPC
**PT Nojorono Tobacco International (NTI)**
**Dokumen Sumber:** OPC - PO Training Material v1.0.docx
**Versi:** 1.0 | **Dibuat:** 18-Jul-21 | **Last Updated:** 7-Sep-21
**Author:** Arif Aqim

---

## 1. Ruang Lingkup

Training material ini mencakup proses **Requisition to Receipt OU Jakarta (RRJ)** dengan integrasi ke **Oracle Project Costing (OPC)**. Modul yang dibahas:
- Master Maintenance (Supplier, Employee, Buyer)
- Pembuatan Requisition (PR Catalog, Non-Catalog, Internal Requisition)
- Pembuatan Purchase Order (BPA, Standard PO, Blanket Release, Service PO)
- Penerimaan Barang (Goods Receipt, Work Confirmation)
- Pengembalian Barang (Return Items, Koreksi Work Confirmation)
- Buka/Tutup Periode Purchasing

---

## 2. Akses Sistem Oracle

### Login ke Oracle
1. Buka URL: `http://vmorcl.ntiapps.net:8000` (atau sesuai konfigurasi)
2. Masukkan Oracle User Name & Password
3. Pilih **User Responsibility** yang sesuai
4. Password: min 5 karakter, maks 30 karakter

### User Responsibilities yang Relevan
| Kode | Modul |
|---|---|
| GL | General Ledger |
| AP | Accounts Payable |
| FA | Fixed Assets |
| AR | Accounts Receivable |
| CM | Cash Management |
| iProc | iProcurement |
| PO | Purchase Order |
| OM | Order Management |
| INV | Inventory |

---

## 3. Master Maintenance

### 3.1 Master Supplier

**Tujuan:** Membuat data supplier baru

**Langkah-langkah:**
1. Menu: `Suppliers > Entry`
2. Klik **Create Supplier** → isi field mandatory → klik **Apply**
3. Isi **Alternate Name** (nama sesuai NPWP) → **Save**
4. Tab **Organization** di Company Profile → pilih type supplier (misal: Third Party) → **Save**
5. Tab **Address Book** → klik **Create** → isi field site supplier → klik **Continue**
6. Assign supplier site ke Operating Unit → klik **Apply**
7. Tab **Tax Details** → centang withholding tax di supplier & site
8. Tab **Banking Details** → klik **Create** → isi data bank → klik **Apply** → **Save**
9. Tab **Accounting** (Terms and Control) → update Liability Account & Prepayment per site
10. Tab **Payment Details** & **Invoice Management** → isi field yang diperlukan
11. Tab **Purchasing** → isi field yang diperlukan → **Save**

### 3.2 Master Supplier Karyawan
Sama dengan prosedur Master Supplier, dengan **Vendor Type = NTI Employee**. Data ini digunakan untuk transaksi uang muka karyawan (cash advance).

### 3.3 Maintain Job
- Menu: `Setup > Personnel > Job`
- Klik New → isi: Job Group, Name, Dates (mulai awal tahun)
- Save

### 3.4 Maintain Position
- Menu: `Setup > Personnel > Position`
- Isi: Start Date, Name, Organization (EMP Business Group), Job, Status (Active)
- Save

### 3.5 Master Employee
- Menu: `Setup > Personnel > Employees`
- Isi: Last Name, Employee Number, Gender, Employment Dates
- Tab **Assignment**: isi Position, Organization, Job, Supervisor (atasan untuk approval supplier karyawan)
- Save

### 3.6 Maintain Buyer
- Menu: `Setup > Personnel > Buyer`
- Klik New → isi nama employee yang akan diberi otorisasi pembelian
- Save

---

## 4. Pembuatan Requisition

### 4.1 Purchase Requisition Catalog (PR Marketing dengan Integrasi OPC)

**Tujuan:** Membuat permintaan pembelian item catalog untuk kebutuhan marketing.

**Langkah-langkah:**
1. Masuk ke **iProcurement Home Page**
2. Navigasi: `Shop > Store > Main Store > Purchasing > EX Expense`
3. Pilih item + quantity → klik **Add to Cart**
4. Klik **View Cart** untuk review
5. Isi informasi header PR:

| Field | Req | Keterangan |
|---|---|---|
| Description | R | Deskripsi PR (default: deskripsi item pertama) |
| Justification | O | Alasan pembelian |
| Need-By-Date | R | Tanggal barang dibutuhkan |

6. Pilih **Deliver-To-Location** → klik **Show Delivery and Billing**
7. **Isi informasi Billing OPC (WAJIB untuk marketing):**

| Field | Req | Keterangan |
|---|---|---|
| **Project** | **R** | **Nomor Marketing Activity** |
| **Task** | **R** | **Nomor Task Marketing Activity** |
| **Expenditure Type** | **R** | **Deskripsi COA Marketing Activity** |
| **Expenditure Organization** | **R** | **NTI – Jakarta (OU)** |
| **Expenditure Item Date** | **R** | **Tanggal komitmen penggunaan Marketing Activity** |
| GL Date | R | Keterangan GL Date saat pembuatan PR |

8. Klik **Update** untuk update line informasi Billing (Project/Task & Charge Account)
9. Klik **Generate Account** untuk auto-generate charge account
10. Klik **Submit** untuk proses approval

### 4.2 Purchase Requisition Non-Catalog (PR Jasa Marketing dengan Integrasi OPC)

**Tujuan:** Membuat permintaan jasa yang tidak terdaftar di katalog (biasanya jasa dengan termin pembayaran).

**Langkah-langkah:**
1. Masuk ke **iProcurement Home Page**
2. Navigasi: `Shop > Non-Catalog Request`
3. Isi form:

| Field | Req | Keterangan |
|---|---|---|
| Request Type | R | Services-New |
| Item Description | R | Deskripsi jasa yang dibutuhkan |
| Category | R | Category jasa (EX Expense) |
| Amount | R | Nominal jasa |
| Currency | R | IDR (default) |
| Supplier Name | O | Tidak wajib di PR |
| Site | O | Tidak wajib di PR |

4. Klik **Add to Cart** → review → **View Cart**
5. Isi informasi header PR (Description, Justification, Need-By-Date)
6. Isi **Billing OPC** (sama seperti PR Catalog — Project, Task, Expenditure Type, dst.)
7. Klik **Update** → **Submit**

### 4.3 Internal Requisition (Marketing)

**Tujuan:** Permintaan barang dari NTI Jakarta ke NTI Kudus (rokok sample, dummy pack).

**Langkah-langkah:**
1. Masuk ke **iProcurement Home Page**
2. Navigasi: `Shop > Store > Pabrikan Store > Purchasing`
3. Pilih kategori: **FG SKM Lokal**, **FG SKT Lokal**, atau **WP Dummy**
4. Pilih item → klik tombol Source → pilih **Internal Requisition** → **Add to Cart**
5. Review cart → isi header IR (Description, Justification, Need-By-Date)
6. Isi **Billing OPC** (Project, Task, Expenditure Type, Expenditure Organization, Expenditure Item Date, GL Date)
7. Klik **Update** → **Generate Account** → **Submit**

### 4.4 Cancel Purchase Requisition

**Syarat:** Status PR = **Approved** dan belum ada line yang dibuat menjadi PO.

**Langkah-langkah:**
1. Menu: `iProcurement > Shop > Requisitions`
2. Pilih PR berstatus "Approved" → klik **Cancel**
3. Pilih line yang akan di-cancel → **Review** → **Submit Cancel**

---

## 5. Pembuatan Purchase Order

### 5.1 Blanket Purchase Agreement (BPA)

**Tujuan:** Mencatat perjanjian pembelian item dalam periode tertentu dengan total nominal yang disepakati.

**Langkah-langkah:**
1. Menu: `Purchase Orders > Purchase Order`
2. Pilih Doc Type: **Blanket Purchase Agreement**
3. Isi Header BPA:

| Field | Req | Keterangan |
|---|---|---|
| Supplier | R | Nama supplier |
| Site | R | Site supplier |
| Ship-to | R | Lokasi pengiriman |
| Bill-to | R | Lokasi pembayaran |
| Amount Agreed | R | Total nilai agreement/contract |
| Description | O | Notes tambahan |

4. Isi DFF Header untuk informasi kontrak (Nomor Kontrak, Tanggal Mulai, Tanggal Berakhir)
5. Isi Lines BPA: Num, Type, Item, Category, Description, UOM, **Price**
   > **Catatan:** Tidak dapat diinputkan Quantity dan tidak ada informasi di level Shipment pada BPA.
6. (Opsional) Klik **Price Break** untuk informasi diskon berdasarkan quantity
7. Isi Terms: Payment, Effective Date, Amount Limit, Minimum Release
8. Klik **Save** → klik **Approve** untuk proses persetujuan

### 5.2 Autocreate Standard Purchase Order

**Tujuan:** Membuat Standard PO berdasarkan PR yang sudah Approved.

**Langkah-langkah:**
1. Menu: `AutoCreate`
2. Isi Operating Unit, Nomor Requisition → klik **Find**
3. Pilih PR line → pilih Action = **Create**, Document Type = **Standard PO**, Grouping = sesuai kebutuhan
4. Klik **Automatic** → isi Supplier & Purchasing Org → klik **Create**
5. Update informasi PO Header:

| Field | Keterangan |
|---|---|
| Supplier | Nama supplier |
| Site | Site supplier |
| Ship-to | Lokasi pengiriman |
| Description | Notes tambahan |

6. Isi DFF Header (Attention Name, Ref Quotation, Nomor Kontrak, dll.)
7. Review Lines PO: Num, Type, Item, Category, UOM, Quantity, Price, Need By Date
8. Klik **Terms** untuk info payment term; isi Supplier Note jika ada detail tambahan
9. Klik **Shipments** untuk lihat detail Shipment (Org, Ship-to, Quantity, Need By Date)
10. Klik **Distributions** untuk lihat Charge Account → `Ctrl+L` untuk detail segment
11. Klik tab **Project** untuk verifikasi informasi Project & Task
12. Klik **Approve** → klik **Approve** pada form konfirmasi

### 5.3 Autocreate Blanket Release

**Tujuan:** Membuat Blanket Release dari PR berdasarkan BPA yang sudah ada.

**Langkah-langkah:**
1. Menu: `AutoCreate`
2. Isi Nomor Requisition → klik **Find** → pilih PR line
3. Pilih Action = **Create**, Document Type = **Blanket Release**
4. Klik **Automatic** → isi nomor BPA (Global Agreement) → klik **Create**
5. Review & update Blanket Release Header dan Lines
6. Klik **Approve**

### 5.4 Autocreate Service Purchase Order

**Tujuan:** Membuat Service PO untuk jasa dengan termin pembayaran.

**Langkah-langkah:**
1. Menu: `Buyer Work Center > Requisitions`
2. Cari nomor requisition → pilih line → klik **Add to Document Builder**
3. Isi Document Builder: Agreement (opsional), **Supplier**, Site, Currency, Style = **Service PO**
4. Klik **Create** → review header Service PO
5. Isi DFF Header: context STANDARD → isi Nomor Kontrak, Tanggal Mulai/Berakhir Kontrak
6. Review Lines → isi Tab **Pay Items**:

| Field | Keterangan |
|---|---|
| Type | **Milestone**: untuk item catalog (kombinasi barang + jasa dengan % penyelesaian) |
|      | **Lump Sum**: untuk item non-catalog jasa dengan partial receipt |
|      | **Rate**: untuk perhitungan per satuan (qty × price); misal gaji SPB/SPG per hari |
| Value (%) | Persentase penyelesaian (untuk Milestone) |
| Price | Harga per pay item |

7. Untuk memecah line berdasarkan termin: klik tombol **Split** pada kolom Actions
8. Tab **Distributions**: lihat Charge Account & Project/Task (klik **Go To Details Page**)
9. Klik **Save** → klik **Approve**

### 5.5 Cancel Purchase Order

**Syarat:** Status PO = **Approved**.

1. Menu: `Purchase Orders Summary`
2. Cari PO → klik nomor PO → pilih menu `Tools > Control`
3. Pilih **Cancel PO** → pilih line yang akan di-cancel → klik tombol konfirmasi
4. Pastikan muncul pesan bahwa proses cancel berhasil

### 5.6 Update Nomor Kontrak di Purchase Order

**Standard PO:**
1. Buka PO → klik DFF di header → isi Nomor Kontrak, Tanggal Mulai, Tanggal Berakhir → Save

**Service PO:**
1. Menu: `Buyer Work Center > Orders` → cari nomor Service PO → pilih **Update**
2. Di header, pilih context STANDARD → isi Nomor Kontrak & tanggal → Save

---

## 6. Penerimaan Barang

### 6.1 Penerimaan Barang Marketing & Non-Marketing

1. Menu: `iProcurement > Receiving > Receive Items`
2. Isi parameter pencarian:

| Field | Keterangan |
|---|---|
| Requestor | Nama pembuat PR |
| Requisition Number | Nomor PR yang akan diterima |
| Supplier | Nama supplier |
| Order Number | Nomor PO |
| Item Due | Pilih "Anytime" untuk tampil tanpa filter tanggal |

3. Klik **Go** → pilih line → isi Receipt Quantity
4. Klik **Next** (Receipt Information):

| Field | Keterangan |
|---|---|
| Receipt Date | Tanggal penerimaan barang |
| SJ Vendor | Nomor Surat Jalan dari Vendor |
| Tgl Area | Tanggal penerimaan di Area |
| Receipt Comments | Catatan penerimaan |

5. Klik **Submit**

### 6.2 Pencatatan Work Confirmation (Service PO)

**Tujuan:** Penerimaan jasa dari Service PO.

1. Menu: `iProcurement > Requisitions`
2. Klik nomor Service PO di kolom Order
3. Pilih Actions: **Create Work Confirmation** → klik **Go**
4. Pilih line → klik **Next**:

| Field | Keterangan |
|---|---|
| Work Confirmation | Informasi nama pekerjaan |
| Description | Deskripsi pekerjaan |
| Periode of Performance | Periode performa pekerjaan |

5. Klik **Submit** untuk proses persetujuan Work Confirmation

---

## 7. Pengembalian Barang

### 7.1 Return Items

> **Catatan:** Sebelum Return, lakukan pemindahan barang dari Subinventory **MKT.GOOD** ke **MKT.REJECT** menggunakan Move Order Transfer terlebih dahulu.

1. Menu: `iProcurement > Receiving > Return Items`
2. Isi parameter: Receipt Created By, Receipt Number, Requisition Number, Order Number, Supplier
3. Klik **Go** → isi Return Quantity
4. Isi Return Details: Reason (wajib), Return Material Authorization, Comments
5. Klik **Next** → klik **Submit**

### 7.2 Koreksi Work Confirmation

> **Catatan:** Koreksi hanya bisa untuk tipe pay item **Lump Sum** dan kombinasi item catalog dengan **Milestone**.

1. Menu: `iProcurement > Receiving > Work Confirmation`
2. Cari nomor Work Confirmation → klik link nomor WC
3. Klik **Correct** → ubah kolom Requested/Delivered atau Progress (%) → isi Comments
4. Klik **Submit**

---

## 8. Buka/Tutup Periode Purchasing

### 8.1 Buka Periode

1. Menu: `Setup > Financials > Accounting > Control Purchasing Periods`
2. Isi nama periode di **Period Name** → tekan Find
3. Ubah status dari **Never Opened** → **Open**
4. Klik **Save**

### 8.2 Tutup Periode

1. Menu: `Setup > Financials > Accounting > Control Purchasing Periods`
2. Cari periode yang akan ditutup → klik Find
3. Ubah status dari **Open** → **Closed**
4. Klik **Save**

| Status | Keterangan |
|---|---|
| **Open** | Transaksi dapat dilakukan |
| **Closed** | Periode ditutup; dapat dibuka kembali jika diperlukan |

---

## 9. Checklist Integrasi OPC pada Transaksi RRJ

### Pada Pembuatan PR (wajib untuk transaksi marketing)
- [ ] Project = Nomor Marketing Activity (status: Approved)
- [ ] Task = Nomor Task dari Marketing Activity
- [ ] Expenditure Type = Kode COA Marketing Activity (sesuai mapping)
- [ ] Expenditure Organization = NTI – Jakarta (OU)
- [ ] Expenditure Item Date = Tanggal komitmen penggunaan Marketing Activity
- [ ] GL Date = Tanggal GL saat pembuatan PR

### Pada Pembuatan PO
- [ ] Informasi Project/Task mengikuti PR secara otomatis
- [ ] Verifikasi di tab **Distributions** → tab **Project**
- [ ] Jika ada kontrak: update DFF Header dengan Nomor Kontrak & tanggal

### Pada Penerimaan Barang
- [ ] Receipt dilakukan setelah PO Approved
- [ ] Untuk marketing: proses dilanjutkan dengan Miscellaneous Receipt (custom program)
- [ ] Pastikan Create Accounting dijalankan agar transaksi masuk sebagai **Actual** di OPC

---

## 10. Troubleshooting Umum

| Masalah | Kemungkinan Penyebab | Solusi |
|---|---|---|
| Budget error saat submit PR | Budget Marketing Activity tidak mencukupi | Lakukan Adendum Marketing Activity untuk tambah budget |
| Project/Task tidak muncul di LOV | Status Marketing Activity belum Approved atau sudah Closed/Freeze | Pastikan status MA = Approved |
| PR tidak bisa di-autocreate ke PO | PR belum Approved atau sudah ada PO | Cek status PR di Requisitions list |
| Work Confirmation tidak bisa di-approve | User tidak ada di approval hierarchy | Cek maintenance Approval Hierarchy |
| Periode sudah Closed, PR tidak bisa dibuat | Periode Purchasing sudah tertutup | Buka periode baru di Control Purchasing Periods |
| Charge Account tidak ter-generate | Project/Task/Expenditure Type belum diisi | Lengkapi informasi Billing OPC sebelum Submit |
