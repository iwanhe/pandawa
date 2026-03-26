# Knowledge Base: Training Material — Marketing OU Jakarta dengan Oracle Project Costing (OPC)
**PT Nojorono Tobacco International (NTI)**
**Dokumen Sumber:** OPC - MKT Training Material.docx
**Versi:** 1.0 | **Dibuat:** 18-Jul-21 | **Last Updated:** 26-Aug-21
**Author:** Citra Andriani

---

## 1. Ruang Lingkup

Training material ini mencakup keseluruhan proses **Marketing OU Jakarta** yang terintegrasi dengan **Oracle Project Costing (OPC)**:
- Master Data Marketing
- Input Data Target Volume & Est. Revenue
- Expenditure Type
- Form Master OOH & HORECA
- Budgeting Period
- Publish BSE
- Marketing Program (Upload & Adendum)
- Marketing Activity (Original & Adendum)
- Proses Persetujuan
- Monitoring Project
- Period End Processing

---

## 2. Master Data Marketing

### 2.1 Pengelolaan Master Data Marketing Program Name

**Menu:** `Data Master Marketing` (Name: `PBR_MKT_KODE_PROGRAM`)

| Field | Req | Keterangan |
|---|---|---|
| Value | M | Kode Program (3 Digit Char) |
| Translated Value | M | Default dari Kode Program |
| Description | M | Nama Program |
| **DFF (Context: PBR_MKT_KODE_PROGRAM)** | | |
| Background | M | Background Program Name (maks 256 char) |
| Background Baris-2 | O | Lanjutan Background |
| Purpose | M | Purpose Program Name (maks 256 char) |
| Purpose Baris-2 | O | Lanjutan Purpose |

### 2.2 Pengelolaan Master Data Marketing Activity Name

**Menu:** `Data Master Marketing` (Name: `PBR_MKT_KODE_ACTIVITY`)

| Field | Req | Keterangan |
|---|---|---|
| Value | M | Kode Activity (maks 10 Digit Char) |
| Translated Value | M | Default dari Kode Activity |
| Description | M | Nama Activity Program |
| **DFF (Context: PBR_MKT_KODE_ACTIVITY)** | | |
| Program Name | M | Activity yang terkait dengan Program Name |
| Kode Department | M | Department yang terkait dengan Activity Name |

### 2.3 Pengelolaan Master Data Marketing Task Name

**Menu:** `Data Master Marketing` (Name: `PBR_MKT_KODE_TASK`)

| Field | Req | Keterangan |
|---|---|---|
| Value | M | Kode Task (maks 10 Digit Char) |
| Translated Value | M | Default dari Kode Task |
| Description | M | Nama Task |
| **DFF (Context: PBR_MKT_KODE_TASK)** | | |
| Activity Name | M | Task yang terkait dengan Activity Name |
| Kontrak | M | Penanda apakah dibutuhkan kontrak atau tidak |
| **Expenditure Type** | **M** | **Mapping untuk segment Account pada COA Accounting** |

> **Keterkaitan OPC:** Field **Expenditure Type** di master Task adalah titik mapping antara Task marketing dengan akun biaya di Oracle Project Costing.

### 2.4 Pengelolaan Master Data Marketing Kode Brand

**Menu:** `Data Master Marketing` (Name: `PBR_MKT_KODE_BRAND`)

| Field | Req | Keterangan |
|---|---|---|
| Value | M | Kode Brand |
| Translated Value | M | Default dari Kode Brand |
| Description | M | Nama Brand |
| **DFF (Context: PBR_MKT_KODE_BRAND)** | | |
| Akun Product | M | Mapping untuk segment Product pada COA Accounting |
| Family | M | Pengelompokkan brand |

### 2.5 Pengelolaan Master Data Marketing Kode Department

**Menu:** `Data Master Marketing` (Name: `PBR_MKT_KODE_DEPARTMENT`)

| Field | Req | Keterangan |
|---|---|---|
| Value | M | Kode Department |
| Translated Value | M | Default dari Kode Department |
| Description | M | Nama Department |
| **DFF (Context: PBR_MKT_KODE_DEPARTMENT)** | | |
| Akun Product | M | Mapping untuk segment Department pada COA Accounting |
| Division | M | Divisi dari department |

### 2.6 Pengelolaan Master Data Marketing Kode Branch

**Menu:** `Data Master Marketing` (Name: `PBR_MKT_KODE_BRANCH`)

| Field | Req | Keterangan |
|---|---|---|
| Value | M | Kode Branch |
| Translated Value | M | Default dari Kode Branch |
| Description | M | Nama Branch |

---

## 3. Input Data Target Volume & Est. Revenue

### 3.1 Pencatatan Target Volume

**Menu:** `Input Data` (Name: `PBR_MKT_TARGET_VOLUME`)

| Field | Req | Keterangan |
|---|---|---|
| Value | M | Kode Program (3 Char) & Tahun — Contoh: `CLM-2021` |
| Translated Value | M | Default dari Value |
| Description | O | Dapat disamakan dengan Value |
| **DFF (Context: PBR_MKT_TARGET_VOL)** | | |
| Year | M | Tahun Marketing Program |
| Brand | M | Kode Brand |
| Target Volume | M | Target Volume per Brand & per Tahun |

### 3.2 Pencatatan Est. Revenue

**Menu:** `Input Data` (Name: `PBR_MKT_EST_REVENUE`)

| Field | Req | Keterangan |
|---|---|---|
| Value | M | Kode Program (3 Char) & Tahun — Contoh: `CLM-2021` |
| Translated Value | M | Default dari Value |
| Description | O | Dapat disamakan dengan Value |
| **DFF (Context: PBR_MKT_EST_REV)** | | |
| Year | M | Tahun Marketing Program |
| Brand | M | Kode Brand |
| Est. Revenue | M | Est. Revenue per Brand & per Tahun |

---

## 4. Expenditure Type (Integrasi OPC)

### 4.1 Pembuatan/Revisi Master Expenditure Category

**Menu:** `Project > Expenditures > Expenditure Categories`

| Field | Req | Keterangan |
|---|---|---|
| Name | M | Nama Expenditure Category (harus unique) |
| Description | O | Penjelasan Expenditure Category |
| Effective date from | M | Tanggal mulai berlaku |
| Effective date to | O | Tanggal berakhir |

### 4.2 Pembuatan/Revisi Master Expenditure Type

**Menu:** `Project > Expenditures > Expenditure Types`

| Field | Req | Keterangan |
|---|---|---|
| **Tab Classifications** | | |
| Name | M | Nama Expenditure Type (harus unique) |
| Expenditure Category | M | Pilih dari Expenditure Category yang sudah terdaftar |
| Revenue Category | M | Isi 'Default' (modul billing tidak diaktifkan di NTI) |
| UOM | M | Isi 'Unit' |
| **Tab Description, Dates** | | |
| Description | M | Isi dengan kode natural account |
| Effective date from | M | Tanggal mulai berlaku |
| Effective date to | O | Tanggal berakhir |
| **Tab Expenditure Type Class** | | |
| Expenditure Type Class | O | Isi 'Supplier Invoices' (class yang digunakan NTI) |
| Effective date from | M | Tanggal mulai berlaku class |

### 4.3 Mapping Expenditure Type dengan Natural Akun

**Menu:** `Project > Expenditures > Lookup Sets`

**Cari:** `PBR Auto Accounting Lookup`
- View > Query By Example > Enter
- Isi Name: `PBR Auto Accounting Lookup`
- View > Query By Example > Run

| Field | Req | Keterangan |
|---|---|---|
| Intermediate Value | M | Nama Expenditure Type (sama persis dengan data Expenditure Type) |
| Segment Value | M | Segment Natural Account |

> **Penting:** Intermediate Value harus sama persis dengan nama Expenditure Type yang terdaftar di sistem.

---

## 5. Form Master OOH & HORECA

### 5.1 Mencari Data Master OOH & HORECA

**Menu:** `Form Master OOH & HORECA`

| Field | Req | Keterangan |
|---|---|---|
| MC Code | O | LOV nomor MC (contoh: CLM/OOH/21/0001) — dapat dicari dengan wildcard `%` |
| MC Type | D | Auto berdasarkan Responsibility |
| Branch | O | LOV Branch |
| Brand | D | Auto berdasarkan Responsibility |
| Point Status | O | New / Active / Inactive / Cancel |

Klik **Search** untuk menampilkan hasil → klik **Open** untuk membuka detail.

### 5.2 Membuat Data Master OOH & HORECA

1. Klik **New** → isi form:

| Field | Req | Keterangan |
|---|---|---|
| MC Code | D | Auto generate setelah Save |
| MC Description | M | Deskripsi OOH/HORECA |
| Address Name | M | Alamat lokasi |
| Province | M (OOH) | LOV Provinsi |
| Kabupaten/Kota | M (OOH) | LOV Kab/Kota |
| Kecamatan | M (OOH) | LOV Kecamatan |
| OOH/HRC Type | M | Billboard, LED/Video TR, Neon Box, dll. (OOH) atau Image/Non-Image (HORECA) |
| Outlet Name | M (HORECA) | Nama Outlet |
| Brand | D | Auto berdasarkan Responsibility |
| Branch | M | LOV Branch |
| Point Type | M | Permanent / Temporary |
| Point Qty | M | Jumlah titik |
| Ownership Status | M | Own / Rent |
| Point Status | O | New / Active / Inactive / Cancel |
| Reason | M (jika Cancel/Inactive) | Alasan |
| Wide, Length | O | Dimensi (meter) |
| Area | D | Wide × Length (auto) |
| Muka | M (OOH) | 1 Muka / 2 Muka |
| Jenis | M (OOH) | BL / FL / NL |

2. Klik **Save** → MC Code otomatis terbentuk
3. Untuk attachment: arahkan kursor ke header → klik ikon **Attachment** di toolbar → upload file

### 5.3 Input Additional Information OOH/HORECA (Terkait PO)

1. Buka data master OOH/HORECA
2. Klik tombol **Additional Information**

| Field | Req | Keterangan |
|---|---|---|
| MC Code | D | Auto dari MC Code yang dipilih |
| Marketing Activity No. | M | Nomor Marketing Activity |
| PO No. | M | Nomor PO (status Approved) |
| Vendor Name | D | Auto dari PO Number |
| Vendor Site | D | Auto dari PO Number |
| Contract No. | D | Auto dari PO Number |
| Contract Start Date | D | Auto dari PO Number |
| Contract End Date | D | Auto dari PO Number |
| Target Installation Date | O | Tanggal target mulai pemasangan |
| Target Installation End | O | Tanggal target selesai pemasangan |
| Amount PO | D | Auto dari PO Number |

---

## 6. Budgeting Period

### 6.1 Membuka Period Budgeting (Beginning & Addendum)

**Menu:** `Form Period Budgeting`

> Dalam satu waktu ada 2 Periode Budget yang Open:
> - Periode Budget **Addendum** untuk tahun berjalan
> - Periode Budget **Beginning** untuk tahun berikutnya

Klik **New** → isi form:

| Field | Req | Keterangan |
|---|---|---|
| Year | M | Tahun Marketing Program |
| Start Date | M | Periode Awal Budgeting |
| End Date | M | Periode Akhir Budgeting |
| Period Type | D | Auto berdasarkan Year yang dipilih |
| Period Name | D | Auto berdasarkan Period Type |
| Status | M | **Open** untuk membuka periode |

Klik **Save**

### 6.2 Edit Period Budgeting (Freeze / Close / Reopen)

1. Pilih periode yang akan diubah → klik **Edit**
2. Ubah **Status** sesuai kebutuhan:

| Status | Kondisi Penggunaan |
|---|---|
| **Open** | Periode aktif; upload/adendum dapat dilakukan |
| **Freeze** | BSE sedang dalam proses penandatanganan hardcopy; tidak dapat upload/revisi |
| **Close** | Periode ditutup; tidak dapat upload/revisi; Marketing Program jadi View Only |

3. Klik **Save**

> **Perhatian:** Status **Freeze** hanya bisa diterapkan jika tidak ada Marketing Program dengan status **In-Process** pada periode Beginning. Untuk Addendum, Marketing Program harus berstatus **Draft**, **Rejected**, atau **Approved**.

---

## 7. Publish BSE

### Menjalankan Program Publish BSE

> **Prasyarat:** Status Budgeting Period harus **FREEZE** sebelum menjalankan Publish BSE.

1. Menu: `View > Requests` → klik **Submit a New Request** → pilih **Single Request** → klik OK
2. Pilih Name: `PBR MKT Program Publish BSE`
3. Isi Parameter:

| Field | Req | Keterangan |
|---|---|---|
| Year | M | Tahun Marketing Program |
| Period Name | M | Period name atas budgeting period |
| Total BSE | D | Total BSE Marketing Program (auto) |

4. Klik **OK** → klik **Submit**
5. Pantau status concurrent → klik **Refresh** sampai status **Complete Normal**
6. Klik **View Output** untuk melihat informasi Total BSE & Total Record yang berhasil di-publish

> **Efek setelah Publish:** Periode Budgeting otomatis berubah ke status **CLOSE**.

---

## 8. Marketing Program

### 8.1 Upload Marketing Program (Original)

> **Prasyarat:** Periode Budgeting = **Beginning**, Status = **Open**

**Persiapan File Excel:**
- Format: CSV dengan delimiter titik koma (`;`)
- Format tanggal: `DD-MON-YYYY`
- Format amount: tanpa separator ribuan
- Nama file: `YYMMDD-[BRAND]-MKT-[DESKRIPSI].csv` (misal: `210715-CLM-MKT-MP2022.csv`)
- Satu file = satu brand

**Langkah Upload:**
1. Menu: `File Upload` → klik **Browse** → pilih file CSV
2. Klik **Upload** untuk memindahkan file ke database → klik **Submit**
3. Jalankan program upload:
   - `View > Requests > Submit a New Request`
   - Name: `PBR MKT Upload Marketing Program`
   - Parameter: **File Name** (nama file beserta tanggal upload)
4. Klik **Submit** → pantau sampai **Complete Normal**
5. Klik **View Output** untuk lihat Marketing Program yang berhasil di-upload
6. Review hasil di Form Marketing Program atau Laporan Upload MKT Program

**Catatan Penting:**
- Jika 1 data error, seluruh upload gagal (rollback semua)
- Upload dengan nomor batch yang sama akan mengganti data sebelumnya (delete + create baru)
- Nama file yang sudah berhasil di-upload tidak bisa digunakan ulang

### 8.2 Review/Revisi Marketing Program Original

**Menu:** `Form Marketing Program`

1. Masukkan parameter → klik **Search** → klik **Open**
2. Review/revisi data (hanya bisa jika status **Draft**)

**Field Marketing Program Header:**

| Field | Keterangan |
|---|---|
| Marketing Program No. | Auto generate by system |
| Addm | Periode Adendum (auto berdasarkan periode budgeting) |
| Marketing Program Name | Berdasarkan master data marketing |
| Type | **Original** (jika periode Beginning); **Addendum** (jika periode Addendum) |
| Status | Draft / In Process / Approved / Rejected / Published / Closed |
| Year, Period Start, Period End | Periode Marketing Program |
| Brand, Program Purpose | Auto berdasarkan Responsibility |
| Original Amount | Total nilai keseluruhan lines (auto) |

**Field Marketing Program Lines:**

| Field | Keterangan |
|---|---|
| Branch | Kode Cabang |
| Dept | Auto berdasarkan Activity Name (kode department) |
| Activity | Activity Name |
| Fund Available Amount | Sisa budget per line |
| Amount-XX | Nilai budget (dapat diinput per bulan) |

**Tombol penting:**
- **Clear** (`Ctrl+R`): hapus input sebelum Save
- **Save** (`Ctrl+S`): simpan data

### 8.3 Adendum Marketing Program

1. Cari Marketing Program yang akan di-adendum → klik **Open**
2. Klik **Adendum**
3. Isi tambahan field khusus adendum:

| Field | Req | Keterangan |
|---|---|---|
| Addendum Type | M | Perubahan Budget / Perubahan Mekanisme |
| Addendum Reason | M | Alasan adendum |
| Addendum Amount | D | Nilai delta adendum (auto) |
| Final Amount | D | Total Original + Adendum (auto) |
| Amount-XX | M | Nilai budget periode adendum (nilai **delta**) |

4. Klik **Save** → klik **Submit for Approval** (`Ctrl+B`)
5. Lihat status approval: `Tools > View Action History`

---

## 9. Marketing Activity

### 9.1 Pembuatan Marketing Activity Original

**Menu:** `Form Marketing Activity`

1. Klik **New** → isi form header:

| Field | Req | Keterangan |
|---|---|---|
| Marketing Program No. | M | LOV (filter: status Approved, periode aktif, per Brand & Department) |
| Marketing Activity No. | D | Auto generate by system |
| Marketing Activity Name | M | Berdasarkan Marketing Program yang dipilih |
| Branch | D | Auto dari MA Name (kecuali NAS — bisa diganti) |
| MA Status | D | Draft (awal) |
| Type | D | Auto (Original/Addendum) |
| Department | D | Auto berdasarkan Responsibility |
| Brand | D | Auto berdasarkan Responsibility |
| MC Code | M (OOH/HORECA) | Berdasarkan OOH/HORECA Code |
| Renewal | M (OOH/HORECA) | Perpanjangan atau Baru |
| Marketing Fund Available | D | Sisa budget per Activity Name dari Marketing Program |
| Original Amount | D | Total nilai lines (auto) |
| Program Purpose | M | Brand Building / Business Building |
| Sub Program Name | M | Free Text |
| Detail | M | Free Text |

2. Isi Lines Marketing Activity:

| Field | Req | Keterangan |
|---|---|---|
| Task | M | LOV Task berdasarkan Activity Name |
| Activity Start | M | Tanggal mulai activity |
| Activity End | M | Tanggal selesai activity |
| Original Amount | D | Auto dari input (auto) |

> **Penting untuk multi-year:** Buat 2 lines terpisah untuk membedakan periode tahun berjalan dan tahun berikutnya.

3. **Wajib lampirkan minimal 1 attachment:**
   - Klik ikon Attachment di toolbar → klik Browse → upload file → klik Next → Confirm

4. Klik **Save** → Nomor Marketing Activity otomatis terbentuk
5. Klik **Submit for Approval** (`Ctrl+B`)
6. Pantau status: `Tools > View Action History`

**Tombol khusus Marketing Activity:**
| Tombol | Shortcut | Fungsi |
|---|---|---|
| Freeze | `Ctrl+Z` | Freeze sementara (tidak bisa transaksi PR baru) |
| Close | `Ctrl+L` | Close permanen (tidak bisa transaksi apapun) |
| Clear | `Ctrl+R` | Hapus input sebelum Save |
| Save | `Ctrl+S` | Simpan |
| Submit Approval | `Ctrl+B` | Proses persetujuan |

**Untuk OOH/HORECA — tambahan informasi setelah Approved:**
- `Tools > Additional Information`
- Isi PO No., dan data otomatis terisi (Vendor Name, Contract No., Tanggal, Amount)

### 9.2 Pembuatan Adendum Marketing Activity

1. Cari Marketing Activity yang akan di-adendum → klik **Open**
2. Klik **Adendum**
3. Isi tambahan field khusus adendum:

| Field | Req | Keterangan |
|---|---|---|
| Addendum Type | M | Perubahan Budget / Perubahan Mekanisme |
| Addendum Reason | M | Alasan adendum |
| Addendum Amount | M | Nilai delta per line (nilai **delta** bukan total baru) |
| Final Amount | D | Total Original + Adendum (auto) |

4. Lampirkan minimal 1 attachment → **Save** → **Submit for Approval**

---

## 10. Proses Persetujuan Marketing Activity & Marketing Program

**Sebagai Approver:**

1. Login ke Oracle → klik **Worklist / Notification Summary**
2. Klik subject dokumen yang perlu disetujui
3. Review informasi → klik tombol **View Details** untuk buka form lengkap
4. Pada bagian bawah, pilih action:

| Action | Keterangan |
|---|---|
| **Approve** | Dokumen disetujui → diteruskan ke approver berikutnya |
| **Reject** | Dokumen ditolak → kembali ke requestor; Note menjadi mandatory |

5. Isi **Note** (opsional untuk Approve; wajib untuk Reject)
6. Klik tombol action → klik **Return to Worklist**

---

## 11. Monitoring Project (Project Status Inquiry)

### 11.1 Project Status Inquiry

**Menu:** `Project Status > Project Status Inquiry`

1. Masukkan nomor Marketing Activity / Project No. → klik **Find**
2. Klik **Open** untuk lihat detail per task
3. Untuk melihat **Commitment** (PR/PO): klik **Commitment** → klik **Find**
4. Untuk melihat **Actual** (Receipt/Invoice):
   - Klik **Actual**
   - Masukkan PA Period → klik **Find**
   - Klik **PO Receipt** untuk data penerimaan barang
   - Klik **AP Invoice** untuk data invoice

> Jika data tidak muncul, jalankan program: `PRC: Update Project Summary Amounts`
> Menu: `View > Requests > Submit a New Request`

### 11.2 Project & Task Inquiry

**Menu:** `Projects`

| Field | Keterangan |
|---|---|
| Number | Nomor Marketing Activity |
| Status | Approved / Addendum / Freeze / Closed |
| Trans Duration | Program Start–End dari Marketing Program |

**Status Project:**
| Status | Keterangan |
|---|---|
| **Approved** | Marketing Activity Approved; dapat digunakan untuk transaksi PR baru |
| **Addendum** | Marketing Activity sedang dalam proses adendum; tidak dapat buat PR baru |
| **Freeze** | Marketing Activity di-freeze; tidak dapat buat PR baru |
| **Closed** | Marketing Activity Closed; tidak dapat digunakan untuk transaksi apapun |

**Lihat Task:** Pilih bagian Task → klik **Open**

| Field | Keterangan |
|---|---|
| Task Number | Line Number dari Marketing Activity |
| Task Name | Task Name |
| Trans Start Date | Activity Start dari Marketing Activity |
| Trans Finish Date | Activity End dari Marketing Activity |

### 11.3 Budget Inquiry

**Menu:** `Budgets`

1. Masukkan nomor Marketing Activity (Project Number) → klik **Find**
2. Budget Type: **Approved Cost Budget** (default)
3. Klik **Open** untuk lihat budget per task
4. Navigasi task: klik **Next** / **Previous**

---

## 12. Period End Processing (OPC)

### 12.1 Open / Close Period OPC

**Menu:** `Setup > System > PA Periods`

1. Pilih Operating Unit: **NTI – Jakarta (OU)**
2. Klik **Find** → cari periode yang akan diubah
3. Ubah Status:

| Status | Keterangan |
|---|---|
| **Open** | Transaksi dapat dilakukan |
| **Closed** | Periode ditutup; dapat dibuka kembali jika perlu |
| **Future** | Belum dibuka; transaksi bisa diinput tapi jurnal/interface belum bisa |
| **Pending Close** | Masih ada transaksi yang belum selesai |
| **Permanently Closed** | Ditutup permanen; tidak dapat diubah ke Open |
| **Never Opened** | Belum pernah dibuka |

4. Untuk bulan berjalan: klik **Set as Reporting Period** → centang **Reporting Period** di bulan aktif
5. Klik **Save**

> **Penting awal tahun:** Ubah semua PA Period dari **Never Opened** ke **Future** untuk akomodasi transaksi cross-year.

### 12.2 Rekonsiliasi Data (Sebelum Tutup Periode)

**Langkah-langkah Rekonsiliasi:**

1. Pastikan sudah menjalankan **Create Accounting** di modul Purchasing, Cost Management & Payables
2. Pastikan sudah menjalankan program **Cost Collection Manager**
3. Jalankan program berikut di `View > Requests > Submit a New Request`:

| Program | Fungsi |
|---|---|
| `PRC: Interface Supplier Costs` | Transfer data biaya dari subledger ke OPC |
| `PRC: Update Project Summary Amounts` | Update summary project |
| `PRC: Maintain Budgetary Control Balances` | Maintain saldo budgetary control |
| `PRC: Refresh Project Summary amounts` | Refresh summary amounts |

4. Jalankan report **EXC: Transaction Exception Details by PA Period** untuk memastikan tidak ada transaksi yang menggantung
5. Setelah dipastikan tidak ada data menggantung → lakukan **Close Period** (mengacu ke proses 12.1)

---

## 13. Checklist Period End Processing OPC

| No | Aktivitas | Status |
|---|---|---|
| 1 | Create Accounting di modul Purchasing sudah dijalankan | ☐ |
| 2 | Create Accounting di modul Cost Management sudah dijalankan | ☐ |
| 3 | Create Accounting di modul Payables sudah dijalankan | ☐ |
| 4 | Cost Collection Manager sudah dijalankan | ☐ |
| 5 | PRC: Interface Supplier Costs sudah dijalankan | ☐ |
| 6 | PRC: Update Project Summary Amounts sudah dijalankan | ☐ |
| 7 | PRC: Maintain Budgetary Control Balances sudah dijalankan | ☐ |
| 8 | PRC: Refresh Project Summary Amounts sudah dijalankan | ☐ |
| 9 | Report Transaction Exception Details = tidak ada data menggantung | ☐ |
| 10 | Close Period OPC dijalankan | ☐ |

---

## 14. Troubleshooting Umum

| Masalah | Kemungkinan Penyebab | Solusi |
|---|---|---|
| Error saat Upload Marketing Program | Data tidak sesuai format/validasi gagal | Cek log error concurrent; perbaiki file CSV; upload ulang |
| Status Freeze tidak bisa diterapkan | Ada Marketing Program status In-Process | Selesaikan approval Marketing Program terlebih dahulu |
| Marketing Activity tidak bisa di-Close | Masih ada commitment pending (PR/PO open) | Close/cancel semua PR & PO yang outstanding |
| Project tidak muncul di Project Status Inquiry | Program Update Project Summary belum dijalankan | Jalankan `PRC: Update Project Summary Amounts` |
| Budget error saat membuat PR | Budget Marketing Activity tidak cukup | Lakukan Adendum Marketing Activity |
| Attachment wajib tapi lupa diisi | — | Upload minimal 1 file attachment sebelum Submit Approval |
| Expenditure Type tidak di-mapping | Mapping di Lookup Sets belum dibuat | Tambahkan di `PBR Auto Accounting Lookup` |
| Additional Information OOH tidak bisa diisi | Status Marketing Activity belum Approved | Pastikan MA sudah berstatus Approved sebelum isi Additional Info |
