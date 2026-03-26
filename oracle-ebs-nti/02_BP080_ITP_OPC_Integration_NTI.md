# Knowledge Base: Invoice to Payment (ITP) — Integrasi dengan Oracle Project Costing (OPC)
**PT Nojorono Tobacco International (NTI)**
**Dokumen Sumber:** BP080_FIN_ITP NTI v1.0.docx
**Versi:** 1.0 | **Tanggal:** 19-Apr-21 (Revisi: 1-Sep-21)
**Penyusun:** Juliana Inahyani (Trees Solutions) | **Functional Leader:** Francisco Edo

---

## 1. Ruang Lingkup

Dokumen ini membahas proses **Invoice to Payment (ITP)** untuk OU Jakarta dengan integrasinya ke Oracle Project Costing (OPC). Ruang lingkup mencakup:
- Maintain Tax (PPN & PPh)
- Request for Payment
- Request for Advance (Uang Muka)
- Request for Settlement (Realisasi Uang Muka)
- Pembayaran

Integrasi OPC berlaku pada transaksi marketing yang menggunakan **Project Number, Task, Expenditure Type, dan Expenditure Item Date**.

> **Penting:** Dokumen FPM ini **hanya untuk OU Jakarta** dengan integrasinya ke OPC.

---

## 2. Daftar Proses Invoice to Payment

| Kode Proses | Nama Proses | Nomor Aktivitas | Nama Aktivitas | Frekuensi |
|---|---|---|---|---|
| ITP-1-1 | Master Data PPN dan PPh | ITP-1-1-10 | Permintaan Penambahan kode PPN/PPh Baru | Bila Diperlukan |
| ITP-1-1 | Master Data PPN dan PPh | ITP-1-1-20 | Memeriksa Kode PPN Atau PPh | Bila Diperlukan |
| ITP-1-1 | Master Data PPN dan PPh | ITP-1-1-30 | Mengisi Kode PPN dan PPh | Bila Diperlukan |
| ITP-1-1 | Master Data PPN dan PPh | ITP-1-1-40 | Informasikan Kode PPN dan PPh | Bila Diperlukan |
| ITP-2-1 | Invoice PO Trade | ITP-2-1-10 s/d ITP-2-1-60 | Proses lengkap Invoice PO | Bila Diperlukan |
| ITP-2-2 | Invoice Non PO | ITP-2-2-10 s/d ITP-2-2-60 | Proses lengkap Invoice Non PO | Bila Diperlukan |
| ITP-2-3 | Invoice Interface | ITP-2-3-10 s/d ITP-2-3-30 | Invoice dari HRIS | Bila Diperlukan |
| ITP-2-4 | Invoice Uang Muka | ITP-2-4-10 s/d ITP-2-4-50 | Prepayment | Bila Diperlukan |
| ITP-2-5 | Realisasi Karyawan | ITP-2-5-10 s/d ITP-2-5-70 | Offset Uang Muka | Bila Diperlukan |
| ITP-2-6 | Debit Memo ke Supplier | ITP-2-6-10 s/d ITP-2-6-50 | Pengembalian barang/jasa | Bila Diperlukan |
| ITP-3-1 | Replenish Petty Cash | ITP-3-1-10 s/d ITP-3-1-40 | Invoice AP Petty Cash | Bila Diperlukan |
| ITP-4-1 | Pembayaran Invoice | ITP-4-1-10 s/d ITP-4-1-30 | Payment via Bank | Bila Diperlukan |
| ITP-5-1 | Period End Closing | ITP-5-1-10 s/d ITP-5-1-70 | Tutup Periode AP | Bulanan |

---

## 3. ITP-1-1: Master Data PPN dan PPh

### Gambaran Umum
Proses penambahan kode PPN dan PPh yang digunakan di transaksi Pembelian dan Invoice AP.

### Contoh Jenis PPN
- **PPN 10%:** PPN Masukan/Keluaran rate 10%, harga jual tidak termasuk pajak
- **PPN 10% Inclusive:** PPN Masukan/Keluaran rate 10%, harga jual sudah termasuk pajak
- **PPN 0%:** Tanpa PPN, untuk transaksi export

### Contoh Jenis PPh
- PPh 23 2% untuk NPWP
- PPh 23 4% untuk Non NPWP
- PPh Pasal 4 Ayat 2
- PPh Pasal 15 1.2%
- PPh 21 atas jasa orang pribadi

### Katalog Tahapan ITP-1-1

| No | Deskripsi | Agent | Otomatis |
|---|---|---|---|
| ITP-1-1-10 | Requestor meminta penambahan kode PPN/PPh | Requestor | Manual |
| ITP-1-1-20 | Tax Admin memeriksa kode di Oracle | Admin AP | System |
| ITP-1-1-30 | Tax Admin membuat Kode PPN/PPh Baru | Admin AP | System |
| ITP-1-1-40 | Menginformasikan kode pajak baru | Admin AP | Manual |

### Kebijakan ITP-1-1
- Master PPN dan PPh di-setup per OU (Operating Unit).

---

## 4. ITP-2-1: Invoice PO (Trade)

### Gambaran Umum
Proses pembuatan Invoice AP untuk transaksi yang menggunakan PO.

**Dokumen yang diperlukan:**
- SP3 (Surat Pernyataan Penyelesaian Pengerjaan)
- GRN (Good Received Note) / SRN
- Invoice
- Faktur Pajak
- PO

**Jurnal yang terbentuk:**
```
Invoice PO Trade:
  Dr. AP Accrue
  Dr. PPN (Jika Ada)
    Cr. Hutang
    Cr. PPh (Jika Ada)

Offset Uang Muka (jika ada):
  Dr. Hutang
    Cr. Prepayment / Advance
```

> Proses Matching Invoice menggunakan **3-Way Matching** (Invoice matching dengan Good Received Note).

### Format Penomoran Invoice (NPP)

| Tipe Invoice | Format Nomor | Keterangan |
|---|---|---|
| Invoice Standard | 216 000001 | Generate by system |
| Invoice Prepayment | 217 000001 | Generate by system |
| Invoice Debit/Credit Memo (non RFP) | 218 000001 | Generate by system |
| Invoice Withholding Tax | 219 000001 | Generate by system |

> Voucher Number di-reset oleh bagian IT setiap tahun.

### Katalog Tahapan ITP-2-1

| No | Deskripsi | Agent | Otomatis |
|---|---|---|---|
| ITP-2-1-10 | Membuat Invoice Match to Receipt | AP Staff | System |
| ITP-2-1-20 | Cetak Nota Permintaan Pembayaran (NPP) | AP Staff | System |
| ITP-2-1-30 | Validate Invoice | AP Head Pooling Admin | System |
| ITP-2-1-35 | Perbaiki Invoice Match to Receipt | AP Staff | System |
| ITP-2-1-40 | Generate Nomor Bukti Potong PPh | AP Staff | System |
| ITP-2-1-50 | Cetak CSV PPN Masukan/Bukti Potong PPh | AP Staff | System |

### Kebijakan ITP-2-1
1. Create Accounting bisa dijalankan secara scheduler atau manual sesuai kebutuhan.
2. Invoicing yang mengandung PPh ter-cut off setiap akhir bulan. Buyer dan staff AP wajib follow up ke vendor.

---

## 5. ITP-2-2: Invoice Non PO

### Gambaran Umum
Invoice AP Non PO untuk transaksi yang **tidak menggunakan PO** dan **bukan untuk transaksi marketing**.

**Jenis Transaksi:**
- Medical
- Insurance
- Pembayaran rutin (Listrik, Gaji)
- Legal
- Sumbangan

**Jurnal yang terbentuk:**
```
Dr. Expense
Dr. PPN (Jika Ada)
  Cr. Hutang
  Cr. PPh (Jika Ada)

Offset Uang Muka (Jika ada):
  Dr. Hutang
    Cr. Prepayment / Advance
```

### Keterkaitan dengan OPC
Untuk Invoice Non-PO yang terkait dengan **biaya marketing** (SBSG, Project Leader, Driver), wajib mengisi:
- Project Number
- Task
- Expenditure Type
- Expenditure Item Date

Pembentukan kombinasi akun menggunakan **custom program account generator** (sama dengan PR marketing).

### Kebijakan ITP-2-2
1. Jika ada kelebihan uang muka atas invoice, harus dikembalikan ke rekening perusahaan.
2. Create Accounting bisa dijalankan secara scheduler atau manual.
3. Invoicing yang mengandung PPh ter-cut off setiap akhir bulan.

---

## 6. ITP-2-3: Invoice Interface (dari HRIS)

### Gambaran Umum
Proses Invoice AP Interface untuk transaksi yang berhubungan dengan **Payroll**. Data dari HRIS diinterface ke Oracle Account Payables sebagai Invoice dengan status **Never Validate**.

**Jurnal yang terbentuk:**
```
Dr. Expense Gaji
  Cr. Hutang
  Cr. PPh (Jika Ada)
```

### Katalog Tahapan ITP-2-3

| No | Deskripsi | Agent | Otomatis |
|---|---|---|---|
| ITP-2-3-10 | Invoice terbentuk dari interface HRIS (status: Never Validate) | Finance Team | System |
| ITP-2-3-20 | Cetak Nota Permintaan Pembayaran | Finance Team | System |
| ITP-2-3-30 | Validate Invoice | Finance Team | System |

---

## 7. ITP-2-4: Invoice Uang Muka (Prepayment)

### Gambaran Umum
Proses pembuatan invoice uang muka pembelian atau uang muka karyawan.

**Jenis Transaksi:**
- Perjalanan Dinas (Form Cash Advance)
- Pembayaran uang muka Supplier (dokumen PO)
- Advance lainnya (Form Cash Advance — bukan pembelian eksternal)

**3 Sumber Data Pengajuan Uang Muka:**
1. **PO dengan TOP COD/CBD** — pembelian ke supplier; prepayment dan pembayaran dari rekening Jakarta
2. **PO dengan PCC (Petty Cash Card)** — Prepayment Jakarta, pembayaran dari rekening Kudus
3. **Cash Advance** — perjalanan dinas dan operasional; approval diperlukan jika amount ≥ Rp 5.000.000,-

**Ketentuan:**
- Hanya diperbolehkan 2 transaksi open prepayment sekaligus untuk cash advance perjalanan dinas/operasional.
- Approval diperlukan jika prepayment ≥ Rp 5.000.000,-.

**Jurnal yang terbentuk:**
```
Dr. Prepayment/Advance
Dr. PPN (Jika ada)
  Cr. Hutang
```

### Katalog Tahapan ITP-2-4

| No | Deskripsi | Agent |
|---|---|---|
| ITP-2-4-10 | Membuat Invoice Uang Muka (berdasarkan Cash Advance / PO CBD/COD) | AP Staff |
| ITP-2-4-20 | Cetak Nota Permintaan Pembayaran | AP Staff |
| ITP-2-4-30 | Validate Invoice | AP Head Pooling Admin |
| ITP-2-4-40 | Perbaiki Invoice (jika tidak sesuai) | AP Staff |
| ITP-2-4-50 | Cetak CSV PPN Masukan | AP Staff |

### Kebijakan ITP-2-4
1. Approval Memo Tugas berdasarkan level of authority: dalam negeri s/d Manajer; luar negeri s/d Direktur.
2. GL Date pencatatan invoice uang muka sesuai tanggal pengeluaran uang/payment date.

---

## 8. ITP-2-5: Realisasi Uang Muka

### Gambaran Umum
Proses offset uang muka dengan invoice realisasi atas pemakaian uang muka yang diterima sebelumnya.

**Jurnal berdasarkan kondisi:**

**Uang Muka = Invoice Realisasi:**
```
Invoice Realisasi:
  Dr. Expense
  Dr. PPN (Jika Ada)
    Cr. Hutang; Cr. PPh (Jika ada)
Apply Prepayment:
  Dr. Hutang
    Cr. Prepayment/Advance
```

**Uang Muka > Invoice Realisasi:**
```
Pengembalian Sisa Uang Muka:
  Dr. Bank
    Cr. Clearing Advance
Invoice Realisasi:
  Dr. Expense; Dr. Clearing Advance; Dr. PPN (Jika Ada)
    Cr. Hutang; Cr. PPh (Jika ada)
Apply Prepayment:
  Dr. Hutang
    Cr. Prepayment/Advance
```

**Uang Muka < Invoice Realisasi:**
```
Invoice Realisasi:
  Dr. Expense; Dr. PPN (Jika Ada)
    Cr. Hutang; Cr. PPh (Jika ada)
Apply Prepayment:
  Dr. Hutang
    Cr. Prepayment/Advance
Pembayaran Kekurangan:
  Dr. Hutang
    Cr. Cash Clearing
```

### Kebijakan ITP-2-5
1. Pengembalian uang muka lebih besar dari realisasi harus disertai bukti transfer atau bukti pengembalian cash advance.
2. Invoicing realisasi yang mengandung PPh ter-cut off setiap akhir bulan.

---

## 9. ITP-2-6: Debit Memo ke Supplier

### Gambaran Umum
Proses pembuatan Debit Memo untuk pengembalian barang/jasa yang tidak sesuai. Debit Memo ter-generate otomatis dari sistem.

**Jurnal yang terbentuk:**
```
Dr. Hutang
  Cr. AP Accrue/Expense
  Cr. PPN
```

### Kebijakan ITP-2-6
1. Sebelum release Debit Memo, ajukan ke bagian pajak untuk penerbitan Faktur Pajak Retur.
2. Pemotongan PPh yang sudah terjadi sebelumnya tidak mempengaruhi nilai debit memo (PPh diabaikan).

---

## 10. ITP-3-1: Replenish Petty Cash

### Gambaran Umum
Proses Replenish Petty Cash menggunakan invoice AP.

**Kriteria Transaksi yang Diperbolehkan:**
- Nominal **tidak lebih dari Rp 5.000.000,-** per transaksi
- Tidak mengandung pajak (PPN dan PPh)
- Bukan transaksi pembelian inventory atau aset
- Bukan transaksi aktivitas marketing
- Merupakan transaksi urgent yang tidak memungkinkan prosedur PR-PO
- Bukan transaksi ke rekanan yang terdaftar di master supplier

Staff AP menarik transaksi petty cash setiap minggu dalam format Excel untuk invoicing AP.

### Kebijakan ITP-3-1
- Penarikan transaksi replenish petty cash wajib cut-off di setiap akhir bulan.

---

## 11. ITP-4-1: Pembayaran Bank

### Gambaran Umum
Proses pembayaran invoice melalui bank.

**Alur Pembayaran:**
1. Cetak Report Aging Supplier untuk NPP yang sudah jatuh tempo
2. Pembuatan Payment secara system Oracle
3. Cetak Report Rekapitulasi Pembayaran untuk nominal cek
4. Cetak Report BBK dan Slip Transfer/Setoran
5. Filling

### Format Penomoran Bukti Bank Keluar (Payment Number)
```
Format: 1012100001
        │││└──── Auto Numbering
        │└┘───── Tahun
        └──────── Kode Cash/Bank (3 digit terakhir COA Bank)
```

### Kode Bank NTI Jakarta

| Kode COA | Kode Bank | Nama Bank |
|---|---|---|
| 111304 | 304 | Bank Mandiri Jakarta (115-0000999-088) |
| 111305 | 305 | Bank Mandiri Giro Jakarta (115-0077-880880) |

**Jurnal Pembayaran:**
```
Saat Pembayaran Bank:
  Dr. Hutang
    Cr. Bank Clearing

Saat Rekonsiliasi Bank:
  Dr. Bank Clearing
    Cr. Bank
```

### Katalog Tahapan ITP-4-1

| No | Deskripsi | Agent | Output |
|---|---|---|---|
| ITP-4-1-10 | Cetak Rekap AP Aging Report | Finance Admin | Rekapitulasi NPP |
| ITP-4-1-20 | Pembuatan Payment berdasarkan Aging Report | Finance Admin | — |
| ITP-4-1-30 | Cetak Bukti Pembayaran | Finance Admin | Bukti Bank Keluar, Rekapitulasi Pembayaran |

### Kebijakan ITP-4-1
1. Jika ada kesalahan informasi rekening supplier, update di master supplier.
2. Lakukan rekonsiliasi bank/clear transaksi dengan modul Cash Management.

---

## 12. ITP-5-1: Period End Closing

### Gambaran Umum
Proses tutup buku bulanan di modul Account Payables.

**Sebelum Penutupan, jalankan:**
- Rekonsiliasi bank statement
- Period Close Exception Report — menampilkan transaksi AP yang bermasalah (status "Incomplete", "Never Validated", belum Create Accounting)
- AP PO Reconciliation
- Rekonsiliasi saldo AP di subledger & GL
- Rekonsiliasi semua akun perantara

### Katalog Tahapan ITP-5-1

| No | Deskripsi | Frekuensi | Agent | Otomatis |
|---|---|---|---|---|
| ITP-5-1-10 | Buka Periode Berikutnya | Bulanan | AP Head Polling Admin | System |
| ITP-5-1-20 | Jalankan Create Accounting | Bila Diperlukan | AP Head Polling Admin | System |
| ITP-5-1-30 | Cetak Report | Bila Diperlukan | AP Head Polling Admin | System |
| ITP-5-1-40 | Jalankan Subledger Period Close Exception Report | Bila Diperlukan | AP Head Polling Admin | System |
| ITP-5-1-50 | Proses Transaksi yang Belum Selesai | Bila Diperlukan | AP Head Polling Admin | System |
| ITP-5-1-60 | Rekonsiliasi AP-GL | Bulanan | AP Head Polling Admin | Manual |
| ITP-5-1-70 | Tutup Periode Berjalan | Bulanan | AP Head Polling Admin | System |

### Kebijakan ITP-5-1
- Biaya listrik atau biaya rutin lainnya akan di-accrued di akhir periode dengan jurnal manual, dan di-reverse di bulan berikutnya.
- Proses closing AP bisa selesai **paling lambat tanggal 5 di bulan berikutnya**.

---

## 13. Daftar Laporan AP (Custom Reports)

| No | Nama Report | Tipe | Tujuan |
|---|---|---|---|
| 1 | XODI AP - Nota Permintaan Pembayaran | Report | Bukti invoicing, validasi, dan perintah bayar |
| 2 | XODI AP - Aging Supplier | Report | Kontrol invoice yang belum dibayar |
| 3 | XODI AP - Bukti Bank Keluar / Bukti Kas | Report | Bukti pembayaran sistem |
| 4 | XODI AP - Setoran Mandiri | Report | Slip setoran ke Bank Mandiri |
| 5 | XODI AP - Bukti Setoran | Report | Slip setoran Bank BCA |
| 6 | XODI AP - Permohonan Pengiriman Uang | Report | Slip permohonan transfer BCA |
| 7 | XODI AP - Rekapitulasi Pembayaran | Report | Pengajuan penerbitan cek harian |
| 8 | XODI AP - CSV PPH23 | Report | Generate nomor bukti potong & upload ke e-bukpot |
| 9 | XODI AP - Update sequence next no PPh | Report | Update nomor bukti potong jika ada revisi |
| 10 | XODI AP - Laporan Mutasi Bank | Report | Membantu clear transaksi di Cash Management |
| 11 | XODI AP - Laporan Mutasi Bank Summary | Report | Summary clear transaksi Cash Management |
| 12 | XODI AP - Uncleared Transactions | Report | Kontrol transaksi belum ter-clear di Cash Management |
| 13 | Interface Invoice dari HRIS | Interface | Interface HRIS ke AP Invoice |
| 14 | XODI AP – Outstanding Prepayment | Report | Outstanding Prepayment |
| 15 | Account Payable Trial Balance | Report | Trial Balance AP |
| 16 | XODI AP - Laporan Pembelian | Report | Semua transaksi pembelian per periode |
| 17 | Report Uninvoiced Receipt | Report | Penerimaan barang yang belum ter-invoicing |
| 18 | Daftar Norminatif | Report | Daftar pembelian barang dengan akun normatif |
| 19 | Daftar Barang Promosi | Report | Invoice Validate Register |
| 20 | XNTI GL - Trial Balance Consolidation | Report | Total nominal per lokasi (Kudus & Jakarta) |
| 21 | FSG Consol - Laba/Rugi | Report | Laporan Laba/Rugi NTI |
| 22 | FSG Consol - Neraca | Report | Laporan Neraca NTI |

---

## 14. Poin Kritis Integrasi ITP ↔ OPC

| Titik Integrasi | Keterangan |
|---|---|
| Invoice Non-PO Marketing | Wajib isi Project Number, Task, Expenditure Type, Expenditure Item Date |
| Invoice PO Marketing | Project info mengikuti PR yang dibuatkan PO-nya |
| Create Accounting | Harus dijalankan sebelum transaksi diakui sebagai Actual di OPC |
| Supplier Cost Interface | Program yang transfer data dari AP Invoice ke OPC setelah Create Accounting |
| Period Close AP | Harus selesai sebelum period close OPC dijalankan |
