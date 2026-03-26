# Knowledge Base: Training Material — Account Payables (AP) OU Jakarta
**PT Nojorono Tobacco International (NTI)**
**Dokumen Sumber:** OPC - AP Training Material v.1.0.docx
**Versi:** 1.0 | **Dibuat:** 26-Aug-21 | **Last Updated:** 24-Mar-26
**Author:** Juliana Inahyani

---

## 1. Ruang Lingkup

Training material ini mencakup operasional modul **Oracle Account Payables** untuk OU Jakarta:
- Transaksi Invoice (Standard, Match to Receipt, Prepayment, Interface)
- Pembatalan Invoice
- Pembayaran (Single Payment, Payment Manager)
- Inquiry (Invoice, Payment, Supplier)
- Master Data (Supplier, Withholding Tax)

---

## 2. Master Data

### 2.1 Master Data PPh (Withholding Tax)

**Menu:** `Setup >> Tax >> Withholding >> Codes`

**Langkah-langkah:**
1. Buka menu Withholding Codes
2. Isi informasi kode PPh yang diperlukan
3. Isi DFF (Informasi Tambahan): Kode grouping dan Kode Pajak
4. Save

> **Catatan:** Setup Tax Code dilakukan setelah supplier tipe Tax Authority (Kas Negara) beserta supplier site-nya sudah di-setup.

### 2.2 Master Supplier Data

**Menu:** `Suppliers > Entry`

**Langkah-langkah:**
1. Klik **Create Supplier** → isi field mandatory → klik **Apply**
2. Isi Alternate Name (nama sesuai NPWP) → **Save**
3. Tab **Organization** → update informasi, pilih type supplier → **Save**
4. Tab **Address Book** → klik **Create** → isi data site → klik **Continue** → Assign ke Operating Unit → klik **Apply**
5. Tab **Tax Details** → centang withholding tax di supplier dan supplier site
6. Tab **Banking Details** → klik **Create** → isi data bank → klik **Apply** → **Save**
7. Tab **Accounting** (Terms and Control) → update Liability Account & Prepayment per site
8. Tab **Payment Details** → isi informasi pembayaran
9. Tab **Invoice Management** → isi ketentuan invoice
10. Tab **Purchasing** → isi informasi purchasing
11. Klik **Close Window**

---

## 3. Transaksi Invoice

### 3.1 Memasukkan Invoice Batches

**Menu:** `Invoices >> Entry >> Invoice Batches`

**Langkah-langkah:**
1. Buka menu Invoice Batches → isi atau cari nama batch
2. Klik **Invoices** untuk masuk ke form invoice

**Field Invoice Header yang penting:**

| Field | Req | Keterangan |
|---|---|---|
| Operating Unit | R | Operating Unit perusahaan |
| Type | R | Standard / Mixed / Prepayment / Credit Memo / Debit Memo / Expense Report / Withholding Tax |
| PO Number | O | Isi jika invoice terkait PO |
| Trading Partner | R | Nama supplier |
| Supplier Site | R | Lokasi/site supplier |
| Invoice Date | R | Tanggal di invoice |
| Date Invoice Received | R | Tanggal terima invoice |
| Invoice Number | R | Nomor invoice |
| Invoice Currency | R | Mata uang invoice |
| Payment Terms | R | Menghitung due date pembayaran |
| Invoice Amount | R | Total nilai invoice (negatif untuk Credit/Debit Memo) |
| Supplier Tax Invoice Number | O | Nomor faktur pajak supplier |
| Supplier Tax Invoice Date | O | Tanggal faktur pajak supplier |
| GL Date | O | Tanggal invoice dicatat di GL |
| Document Category Name | R | Nomor invoice running number Oracle |

3. Klik tab **Lines** → isi invoice lines:

| Field | Req | Keterangan |
|---|---|---|
| Type | R | Item / Freight / Miscellaneous / Tax / Withholding Tax |
| Amount | R | Nilai transaksi per line |
| Description | R | Deskripsi per line |
| Default Distribution Account | R | COA expense per line |
| Tax Classification Code | O | Kode PPN masukan per line |
| Invoice Withholding Tax | O | Kode PPh per line |
| **Project** | **O** | **Kode Project (untuk transaksi marketing)** |
| **Expenditure Type** | **O** | **Kode Expenditure Type (untuk transaksi marketing)** |
| **Task** | **O** | **Kode Task (untuk transaksi marketing)** |

4. Klik **Distributions** untuk lihat/edit distribusi akun per line
5. Klik **Schedules Payments** untuk lihat/edit jadwal pembayaran bertahap
6. Klik **Save** → pilih invoice → klik **Actions 1** → centang **Validate** → centang **Approved**

---

### 3.2 Match Invoice ke Receipt (3-Way Matching)

**Menu:** `Invoices >> Entry >> Invoice Batches`

1. Buat invoice baru dengan Type = **Standard** → isi field PO Number (sistem otomatis isi supplier, site, currency)
2. Klik combo box di kanan → klik **Match**
3. Pada form **Find Receipts for Matching**, isi nomor PO di field Num
4. Klik **Find** → muncul form **Match to Receipts**
5. Centang **Match** → isi Quantity Invoiced dan Unit Price
6. Klik **Match** → tutup form → kembali ke Invoice

**Field kunci pada Match to Receipts:**

| Field | Keterangan |
|---|---|
| Quantity Invoiced | Harus sama dengan quantity di PO |
| Unit Price | Harga dari PO |
| Match Amount | Quantity × Unit Price — harus sama dengan nilai tagihan supplier |

7. Klik **Save** → **Validate** → **Approved**

> **Catatan untuk invoice aset:** Sistem otomatis membentuk invoice line dan distribusi dari data PO. Pastikan "Track As Asset" tercentang di invoice line dan distribution.

---

### 3.3 Membetulkan Kode Project, Expenditure Type, dan Task

**Digunakan saat:** ada kesalahan pengisian informasi OPC pada invoice yang sudah diinput.

**Langkah-langkah:**
1. Buka invoice batch → buka invoice yang bersangkutan
2. Klik tab **Lines**
3. Tambahkan baris baru:
   - **Amount Negatif** → untuk mengurangi amount project yang salah → isi informasi Project/Expenditure Type/Task yang **salah**
   - **Amount Positif** → untuk amount project yang benar → isi informasi Project/Expenditure Type/Task yang **benar**
4. Klik **Save**

---

### 3.4 Prepayment Invoice

**3.4.1 Create Prepayment Invoice**

1. Buka Invoice Batches → buat invoice baru dengan Type = **Prepayment**
2. Isi invoice line
3. **Save** → **Validate** → **Approved**

**3.4.2 Apply Prepayment Invoice**

1. Buat invoice baru Type = **Standard** → pilih Trading Partner yang memiliki prepayment (muncul warning)
2. Isi invoice lines
3. Klik **Actions 1** → centang **Apply/Unapply Prepayment** → klik **OK**
4. Pada form Apply/Unapply Prepayments:
   - Centang **Apply** untuk prepayment yang akan di-apply
   - Isi **Amount To Apply** dan **GL Date**
   - Klik **Apply**
5. Prepayment berpindah ke bagian **Existing Prepayment Applications**
6. Tutup form → kembali ke Invoice
7. **Save** → **Validate** → **Approved**

---

### 3.5 Approve Invoice Prepayment (Perjalanan Dinas)

**Proses approval untuk Invoice Prepayment Perjalanan Dinas dan Operasional:**

1. Login Oracle sebagai **Approver**
2. Masuk ke **Worklist / Notification**
3. Klik transaksi yang akan di-approve
4. Klik **APPROVE** atau **Reject**

---

### 3.6 Apply dan Release Holds

**3.6.1 Release Hold pada Invoice**

1. Buka invoice dengan status **Needs Revalidation**
2. Klik tab **Holds** → perbaiki kesalahan
3. Klik tab **Releases** → pilih Release Name (alasan release)
4. Klik **OK** → tutup form Holds
5. **Validate** → **Approved**

**3.6.2 Apply Hold pada Payment (menahan pembayaran)**

1. Buka invoice → klik **Scheduled Payments**
2. Centang **Hold** pada baris yang ingin ditahan
3. **Save**

**3.6.3 Release Hold pada Payment**

1. Buka invoice → klik **Scheduled Payments**
2. Unchecked **Hold** pada baris yang ingin dilepas
3. **Save**

**3.6.4 Split Scheduled Payment**

1. Buka invoice → klik **Scheduled Payments**
2. Isi informasi jadwal pembayaran yang diinginkan
3. **Save**

---

### 3.7 Membatalkan Invoice

**Syarat:** Invoice belum di-post ke GL.

1. Buka Invoice Batches → arahkan ke invoice yang akan dibatalkan
2. Klik **Actions 1** → centang **Cancel Invoices** → klik **OK**
3. Konfirmasi pembatalan pada form Caution → klik **Yes**
4. Status invoice berubah menjadi **Cancelled**
5. **Save**

---

## 4. Pembayaran (Payments)

### 4.1 Single Payment

**Menu:** `Payments >> Entry >> Payment`

| Field | Req | Keterangan |
|---|---|---|
| Type | R | **Quick** (belum jatuh tempo) / **Manual** (sesuai jatuh tempo) / **Refund** |
| Trading Partner | R | Nama supplier |
| Bank Account | R | Bank internal untuk pembayaran |
| Payment Date | R | Tanggal pembayaran |
| Payment Method | R | Metode pembayaran |
| Payment Process Profile | R | Profile proses pembayaran |
| Document | R | Buku cek pembayaran |
| Document Num | R | Nomor cek |
| Payment Amount | R | Jumlah yang dibayarkan (dikontrol agar tidak melebihi total invoice) |
| Curr | R | Harus sama dengan kurs pada invoice |

**Langkah-langkah:**
1. Isi field yang diperlukan → klik **Apply**
2. Pilih invoice yang akan dibayar → isi Payment Amount per invoice
3. **Save**

### 4.2 Void Single Payment

1. Buka Payment → cari invoice yang akan di-void
2. Klik **Actions 1** → centang **VOID** → klik **OK**

### 4.3 Payment Manager (Pembayaran Massal)

Digunakan untuk pembayaran batch invoice ke banyak supplier sekaligus. Menggunakan fitur Payment Manager dengan template, scheduling, dan instruksi pembayaran.

---

## 5. Inquiry

### 5.1 Invoice Inquiry

**Menu:** `Invoices >> Inquiry >> Invoices`

**Parameter pencarian:**

| Region | Field | Keterangan |
|---|---|---|
| **Trading Partner** | Name, Supplier Number, Supplier Site, PO Number | Filter berdasarkan supplier/PO |
| **Invoices** | Number, Type, Amounts, Dates, Currency, Invoice Batch | Filter berdasarkan detail invoice |
| **Invoice Status** | Status (Unvalidated/Prepayment/Cancelled/dll.), Accounting, Payment, Approval | Filter berdasarkan status |
| **Holds** | Status (Held/Held or Released), Name, Reason | Filter berdasarkan hold |

> Semakin banyak informasi yang diisi, semakin cepat sistem menemukan invoice.

**Informasi tambahan yang dapat diakses:**
- **View Payments** → Payment Overview: detail pembayaran per invoice
- **Invoice Overview**: detail lengkap invoice

### 5.2 Payment Inquiry

**Menu:** `Payments >> Inquiry >> Payment Overview`

Parameter: Operating Unit, Payment Numbers, Payment Dates, Payee (Name, NPWP, Supplier Number, Site), Voucher Number range.

### 5.3 Supplier Inquiry

**Menu:** `Suppliers >> Inquiry`

Parameter: Supplier Name, Supplier Number, Taxpayer ID, Tax Registration Number.

Tombol yang tersedia:
- **Calculate Balance Owed** — menampilkan total hutang yang belum dibayar

| Field | Keterangan |
|---|---|
| Unpaid Amount | Total nilai invoice yang belum dibayar |
| Future Dated Payments | Total Future Dated Payments |
| Less Available Prepayment | Total uang muka yang belum dikurangi invoice |
| **Balance Owed** | **= Unpaid Amount – Available Prepayment** |
| Number of Invoice | Jumlah invoice belum dibayar |

---

## 6. Integrasi AP dengan Modul OPC

### Titik Integrasi Kritis

| Kondisi | Yang Harus Dilakukan |
|---|---|
| Invoice Non-PO untuk biaya marketing | Wajib isi: Project, Task, Expenditure Type, Expenditure Item Date di tab Lines |
| Invoice PO marketing | Project/Task otomatis mengikuti dari PR/PO |
| Kesalahan Project/Task pada invoice | Tambahkan baris koreksi (negatif untuk hapus, positif untuk ganti) |
| Create Accounting | Harus dijalankan agar transaksi AP masuk sebagai **Actual** di OPC |
| Supplier Cost Interface | Jalankan setelah Create Accounting agar data mengalir ke modul OPC |

### Urutan Proses AP → OPC

```
Invoice AP diinput (dengan Project/Task/Expenditure Type)
     ↓
Validate & Approve Invoice
     ↓
Jalankan Create Accounting
     ↓
Transfer to GL
     ↓
[OPC] Jalankan PRC: Interface Supplier Costs
     ↓
Transaksi tercatat sebagai ACTUAL di modul OPC
     ↓
[OPC] Jalankan PRC: Update Project Summary Amounts
     ↓
Data muncul di Project Status Inquiry
```

---

## 7. Format Penomoran Dokumen AP

| Tipe Dokumen | Format | Keterangan |
|---|---|---|
| Invoice Standard | 216 XXXXXX | Running number, reset tiap tahun |
| Invoice Prepayment | 217 XXXXXX | Running number, reset tiap tahun |
| Invoice Debit/Credit Memo | 218 XXXXXX | Running number, reset tiap tahun |
| Invoice Withholding Tax | 219 XXXXXX | Running number, reset tiap tahun |
| Bukti Bank Keluar / Payment | 1012100001 | Kode Bank + Tahun + Auto Numbering |

---

## 8. Checklist Operasional AP Bulanan

| No | Aktivitas | Keterangan |
|---|---|---|
| 1 | Semua invoice sudah diinput dan divalidate | Status = Approved |
| 2 | PPh ter-cut off di akhir bulan | Follow up ke vendor; cut-off setiap akhir bulan |
| 3 | Jalankan Create Accounting | Mode Final untuk posting ke GL |
| 4 | Rekonsiliasi bank statement | Clear transaksi di Cash Management |
| 5 | Jalankan Period Close Exception Report | Cek invoice Incomplete/Never Validated/belum CA |
| 6 | Selesaikan transaksi yang bermasalah | Update/delete invoice/payment yang pending |
| 7 | Rekonsiliasi AP-GL | Pastikan saldo subledger = saldo GL |
| 8 | Buka periode berikutnya | Buka dulu sebelum tutup periode berjalan |
| 9 | Tutup periode berjalan | Paling lambat tgl 5 bulan berikutnya |

---

## 9. Troubleshooting Umum AP

| Masalah | Kemungkinan Penyebab | Solusi |
|---|---|---|
| Invoice tidak bisa di-validate | Ada line yang error atau hold | Cek tab Holds; perbaiki masalah; Re-validate |
| Invoice tidak bisa dibayar (Hold Payment) | Hold Payment aktif di Scheduled Payments | Release Hold di Scheduled Payments |
| Debit Memo tidak otomatis terbentuk | Invoice belum terbentuk untuk GRN tersebut | Buat invoice terlebih dahulu, baru lakukan return |
| Salah isi Project/Task pada invoice | — | Buat baris koreksi (negatif + positif) |
| Invoice dengan PPh tidak bisa di-cutoff | PPh sudah ter-cutoff di periode sebelumnya | Follow up ke vendor untuk penerbitan bukti potong |
| Period tidak bisa ditutup | Masih ada invoice Incomplete/Never Validated | Selesaikan semua invoice yang outstanding terlebih dahulu |
