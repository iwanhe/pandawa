# Knowledge Base: Marketing Planning to Monitoring (MPM) — Integrasi dengan Oracle Project Costing (OPC)
**PT Nojorono Tobacco International (NTI)**
**Dokumen Sumber:** BP080-MKT_MPM NTI v1.0.docx
**Versi:** 1.0 | **Tanggal:** 14-Apr-21 (Revisi: 29-Oct-21)
**Penyusun:** Citra Andriani (Trees Solutions) | **Functional Leader:** Francisco Edo

---

## 1. Ruang Lingkup

Modul Marketing Planning to Monitoring (MPM) mencakup:
- **Pengelolaan Master Data Marketing**
- **Marketing & Budget Planning** (Marketing Program)
  - Pembuatan Marketing Program
  - Pembuatan Adendum Marketing Program
  - Pembuatan Target Volume & Est. Revenue
- **Pengelolaan Marketing Activity**
  - Pembuatan Marketing Activity
  - Pembuatan Adendum Marketing Activity
  - Pembuatan Master Data & Additional Information OOH/HORECA
- **Monitoring Marketing Budget**

Integrasi MPM ke OPC terjadi pada saat **Marketing Activity disetujui** → sistem otomatis membentuk **Project, Task & Budget** di modul Oracle Project Costing (proses OPC-2-1).

---

## 2. Daftar Proses MPM

| Kode Proses | Nama Proses | Frekuensi |
|---|---|---|
| MPM-1-1 | Pengelolaan Master Data Marketing | Bila Diperlukan |
| MPM-2-1 | Pembuatan Marketing Program | Tahunan |
| MPM-2-2 | Pembuatan Adendum Marketing Program | Bila Diperlukan |
| MPM-2-3 | Pembuatan Target Volume & Est. Revenue | Tahunan |
| MPM-3-1 | Pembuatan Marketing Activity | Bila Diperlukan |
| MPM-3-2 | Pembuatan Adendum Marketing Activity | Bila Diperlukan |
| MPM-3-3 | Pembuatan Master Data & Additional Information OOH/HORECA | Bila Diperlukan |
| MPM-4-1 | Pengelolaan Monitoring Marketing Budget | Bila Diperlukan |

---

## 3. MPM-1-1: Pengelolaan Master Data Marketing

### Gambaran Umum
Proses penambahan atau revisi master data marketing. Dimulai dari usulan Brand Manager, AMO, Marketing Manager ke Brand Admin.

**Master data marketing meliputi:**
- Kode Brand
- Kode Department
- Kode Cabang
- Kode Program
- Kode Aktivitas
- Kode Task

### Kode Brand NTI

| Kode Brand | Nama Brand |
|---|---|
| CLM | Clas Mild |
| CMS | Clas Mild Silver |
| MD | Minak Djinggo |
| MDR | Minak Djinggo Rempah |

### Kode Department NTI

| Kode Department | Nama Department |
|---|---|
| MB | Marketing Brand |
| MC | Marketing Communication |
| OOH | MC-OOH |
| ATL | MC-ATL MEDIA |
| HRC | MC-HORECA |
| ACT | MC-ACTIVATION |
| MF | Marketing Field |
| MM | Modern Market |
| SA | Sales Activity |
| MP | Marketing Corporate |
| RS | Riset |

### Kode Cabang NTI (Sebagian)

| Kode | Nama Cabang | Kode | Nama Cabang |
|---|---|---|---|
| BAU | Bau Bau | MED | Medan |
| BD2 | Bandung Branch | MLG | Malang |
| BGR | Bogor | MTR | Mataram |
| BJM | Banjarmasin | PDG | Padang |
| BKS | Bekasi | PKB | Pekanbaru |
| DPS | Denpasar | SMG | Semarang Branch |
| JAS | Jakarta Selatan | SUB | Subang |
| JOG | Yogyakarta | UPG | Ujung Pandang |
| KUD | Kudus | NAS | Nasional |

### Contoh Kode Program & Activity

| Kode Program | Kode Activity | Kode Task |
|---|---|---|
| Above the Line | Tv Production | ATL - TV Production |
| Above the Line | Radio Production | ATL - Radio Production |
| Digital | Digital - Web Site Production | Digital - Web Site Production |
| OOH | Billboard | OOH - New Billboard - Production |
| OOH | Billboard | OOH - Extension Billboard - Production |
| General Trade – POSM | GT POSM Production | POSM - Production |
| General Trade – POSM | GT POSM Placement | POSM - SKPD |

### Katalog Tahapan MPM-1-1

| No | Deskripsi | Agent |
|---|---|---|
| MPM-1-1-10 | Mengajukan Usulan Penambahan/Revisi Data Master Marketing (form manual) | Brand Manager, AMO, Marketing Manager |
| MPM-1-1-20 | Melakukan Verifikasi Ketersediaan Data Master Marketing | Brand Admin |
| MPM-1-1-30 | Melakukan Revisi Data Master Marketing | Brand Admin |
| MPM-1-1-40 | Membuat Data Master Marketing | Brand Admin |
| MPM-1-1-50 | Menginformasikan Ketersediaan Data Master Marketing | Brand Admin |

### Kebijakan MPM-1-1
1. Brand Admin adalah PIC untuk pengelolaan master data marketing.
2. Pengajuan usulan dilakukan dengan mengisi form yang disampaikan ke Brand Admin.
3. Brand Admin harus melakukan penambahan & pembaruan data master di template Excel marketing program.

---

## 4. MPM-2-1: Pembuatan Marketing Program

### Gambaran Umum
Proses pembuatan Marketing Program (budget planning) tahunan. Dimulai pada **periode Q4 tahun berjalan** untuk tahun berikutnya.

**Alur Proses:**
1. Marketing Budget Controller membuka Periode Budgeting
2. AMO (cabang) mengajukan Marketing Program per Brand dalam file Excel
3. RFMM mengkonsolidasi data kode department SA, MF, MM per region
4. RFMM mengirimkan file Excel terkonsolidasi ke BE/ABM
5. BE/ABM mengkonsolidasi per Brand dan meng-upload ke sistem
6. Brand Manager & Head of Brand mereview
7. Marketing Budget Controller mengubah status ke FREEZE sebelum proses BSE
8. Marketing Budget Controller mencetak BSE (Budget Spending Expenditure)
9. BSE direview oleh Marketing Budget Controller & BOD, ditandatangani
10. Jika disetujui → Marketing Budget Controller melakukan Publish BSE
11. Status periode budgeting otomatis menjadi CLOSED

### Template File Excel Upload Marketing Program

| Kolom | Deskripsi |
|---|---|
| No. Batch | User Defined |
| Nama Marketing Program | Berdasarkan master data marketing |
| Year | Tahun Marketing Program |
| Periode Start | Periode Awal |
| Periode End | Periode Akhir |
| Kode Brand | Berdasarkan master data marketing |
| Program Purpose | Berdasarkan master data marketing |
| Kode Branch | Berdasarkan master data marketing |
| Activity | Berdasarkan master data marketing |
| Budget | Nilai budget (dapat didefinisikan per bulan) |

**Format file:** CSV dengan delimiter titik koma (`;`)
**Format penamaan:** `YYMMDD-[BRAND]-MKT-[DESKRIPSI].csv` (Contoh: `210715-CLM-MKT-MP2022.csv`)
**Satu file = satu brand**

### Penomoran Marketing Program
Otomatis dihasilkan oleh sistem berdasarkan kombinasi:
- Batch_num + Program_name + Year + Period Start/End + Brand_Code + Program_Purpose

### Status Periode Budgeting

| Status | Keterangan |
|---|---|
| **Open** | Proses upload/adendum Marketing Program dapat dilakukan |
| **Freeze** | Upload/revisi tidak dapat dilakukan (BSE sedang dalam proses penandatanganan) |
| **Close** | Upload/revisi tidak dapat dilakukan; Marketing Program menjadi View Only |

### Kebijakan MPM-2-1
1. Cabang tidak punya akses ke sistem Oracle — data diisi di Excel, dikonsolidasi RFMM, dikirim ke BE/ABM.
2. Marketing Budget Controller memegang kontrol atas proses buka/tutup periode budgeting.
3. Penomoran Batch & Marketing Program otomatis dari sistem.
4. Marketing Program yang sudah berjalan **tidak boleh direvisi langsung** — hanya melalui proses Adendum.
5. Tidak ada proses approval di dalam sistem untuk pembuatan Marketing Program (approval hanya untuk Adendum).
6. Nilai rekapitulasi BSE bersifat **fix**.
7. Sebelum cetak BSE, ubah status periode ke **FREEZE**.

---

## 5. MPM-2-2: Pembuatan Adendum Marketing Program

### Gambaran Umum
Dilakukan saat diperlukan perubahan atas Marketing Program yang sudah berjalan. Ditinjau per semester oleh BOD, Marketing Budget Controller, Head of Brand & Brand Manager.

**Tipe Adendum:**
- Perubahan Periode Marketing Program
- Perubahan Mekanisme Spesifikasi
- Perubahan Nilai Marketing Program

**Proses Approval Adendum Marketing Program:**
```
BE/ABM → Brand Manager → Head of Brand → Marketing Budget Controller Manager → Marketing Director
```

### Ketentuan Adendum Marketing Program
1. Proses adendum **hanya dapat dilakukan** saat periode budgeting berstatus **Open**.
2. Adendum **tidak dapat mengubah** Marketing Program dengan budget tahun lalu (meskipun periode masih berjalan).
   - Contoh: Marketing Program CLM/2021/001 dengan periode Apr 2021–Mar 2022. Pada Jan 2022, adendum TIDAK dapat dilakukan.
3. Nilai yang diinput pada adendum adalah **nilai delta-nya** (perubahan).
   - Contoh: MA = 10.000.000 → Adendum menjadi 13.000.000 → nilai yang diinput = **3.000.000**
4. Marketing Program yang sudah berjalan dan memiliki Marketing Activity → transaksi Marketing Activity **tidak di-freeze**.
5. Budget Marketing Program di-freeze jika **belum ada** Marketing Activity yang menggunakannya.
6. Adendum pembatalan **hanya bisa** dilakukan jika belum ada transaksi Marketing Activity.
7. Pembatalan Marketing Program **tidak menambah nilai BSE**.

---

## 6. MPM-3-1: Pembuatan Marketing Activity

### Gambaran Umum
Proses pembuatan Marketing Activity yang menjadi trigger pembentukan **Project, Task & Budget** di OPC. Dimulai dari pembuatan SPAP secara manual oleh cabang (AMO), setelah disetujui dijadikan dasar pembuatan Marketing Activity di sistem.

**Setiap Marketing Activity wajib mengacu pada 1 nomor Marketing Program.**
**1 Marketing Activity = 1 Activity.**
**Pembuatan Marketing Activity tidak boleh melebihi budget Marketing Program.**

### Struktur Form Marketing Activity Header

| Field | Keterangan |
|---|---|
| No. Marketing Program | LOV (filter: status Approved, periode aktif, per Brand & Department) |
| Periode Marketing Program | Auto dari Marketing Program |
| Brand | Auto dari Marketing Program |
| Activity | Auto dari Marketing Program |
| Nama Program | Auto dari Marketing Program |
| Cabang | Auto dari Marketing Program |
| No. Marketing Activity | Generate by System |
| Sub Program | Free Text |
| Detail | Free Text |

### Struktur Form Marketing Activity Lines (Detail)

| Field | Keterangan |
|---|---|
| Task Name | LOV (berdasarkan Activity Name yang dipilih) |
| Activity Start | Date |
| Activity End | Date |
| Amount | Free Text |

> **Catatan OOH/HORECA:** Khusus department MC-OOH & HORECA, tambahan field **MC Code** & **Renewal** harus diisi.

> **Transaksi multi-year (OOH/HORECA/ATL):** Harus dibuat 2 lines terpisah. Contoh: Line 1 = Billboard (01 Nov 21–31 Dec 21), Line 2 = Billboard (01 Jan 22–31 Jan 22)

### Status Marketing Activity

| Status | Keterangan |
|---|---|
| **Draft** | Belum selesai atau belum diajukan approval |
| **In Process** | Sedang dalam proses persetujuan; View Only |
| **Active/Approved** | Sudah dapat digunakan untuk transaksi PR/PO/Invoice/Inventory |
| **Close** | Sudah ditutup; tidak dapat digunakan; tidak dapat di-Open kembali; tidak bisa di-Close jika masih ada commitment pending |
| **Freeze** | Di-freeze sementara; tidak dapat digunakan untuk transaksi PR baru |

### Proses Approval Marketing Activity per Department

| Department | Limit | Approval Hierarchy |
|---|---|---|
| SA | Any Limit | Marketing Budgetary Control |
| MF | Any Limit | Marketing Budgetary Control → Direksi |
| RS | < Rp 100 Juta | Riset Manager → Marketing Budgetary Control |
| RS | > Rp 100 Juta | Riset Manager → Marketing Budgetary Control → Direksi |
| MC-OOH | < Rp 100 Juta | Manager → OOH Manager → GM Marcom → Marketing Budgetary Control |
| MC-OOH | > Rp 100 Juta | Manager → OOH Manager → GM Marcom → Marketing Budgetary Control → Direksi |
| MC-HORECA | < Rp 100 Juta | Manager → HORECA Manager → GM Marcom → Marketing Budgetary Control |
| MC-HORECA | > Rp 100 Juta | Manager → HORECA Manager → GM Marcom → Marketing Budgetary Control → Direksi |
| MC-ACTIVATION | < Rp 100 Juta | Manager → ACT Manager → GM Marcom → Marketing Budgetary Control |
| MC-ACTIVATION | > Rp 100 Juta | Manager → ACT Manager → GM Marcom → Marketing Budgetary Control → Direksi |
| MC-ATL MEDIA | < Rp 100 Juta | Manager → ATL Manager → GM Marcom → Marketing Budgetary Control |
| MC-ATL MEDIA | > Rp 100 Juta | Manager → ATL Manager → GM Marcom → Marketing Budgetary Control → Direksi |
| MP | < Rp 100 Juta | GM Marcom → Marketing Budgetary Control |
| MP | > Rp 100 Juta | GM Marcom → Marketing Budgetary Control → Direksi |
| MM | Any Limit | Marketing Budgetary Control → Direksi |
| MB | Any Limit | Manager Brand → GM Brand → Marketing Budgetary Control → Direksi |

### Katalog Tahapan MPM-3-1

| No | Deskripsi | Agent | Otomatis |
|---|---|---|---|
| MPM-3-1-10 | Pembuatan SPAP (manual, di luar sistem) | AMO | Manual |
| MPM-3-1-20 | Membuat/Revisi Marketing Activity | Admin Department | Manual |
| MPM-3-1-30 | Melakukan Proses Persetujuan Marketing Activity | Marketing Manager, Senior Manager, Marketing Budget Controller, BOD | Manual |
| OPC-2-1 | Pembentukan Kode Project, Task & Budget (setelah MA Approved) | — | Otomatis |

### Kebijakan MPM-3-1
1. Pembuatan Marketing Activity harus mengacu pada nomor Marketing Program.
2. Penomoran Marketing Activity otomatis dari sistem.
3. Satu Marketing Activity terdiri dari 1 (satu) activity.
4. Tidak boleh melebihi budget Marketing Program.
5. OOH/HORECA: wajib mengisi informasi tambahan pada bagian Detail.
6. Persetujuan Marketing Activity dilakukan dalam sistem sesuai limit otorisasi.
7. Close Marketing Activity dilakukan oleh user pembuat; dapat dilakukan jika sudah melewati periode, adanya pembatalan, atau ingin mengembalikan sisa budget ke Marketing Program.

---

## 7. MPM-3-2: Pembuatan Adendum Marketing Activity

### Gambaran Umum
Proses adendum atas Marketing Activity yang sudah ada.

**Tipe Adendum:**
- Adendum Perubahan Periode & Budget
- Adendum Pembatalan
- Adendum Mekanisme Spesifikasi

### Ketentuan Adendum Marketing Activity
1. Nilai yang diinput adalah **nilai delta-nya**.
2. Budget Marketing Activity di-freeze jika **belum ada transaksi realisasi** (PR/PO/Invoice).
   - Contoh: Total MA = 10.000.000, Commitment = 2.000.000 → sisa 8.000.000 yang di-freeze.
3. Adendum pembatalan **tidak dapat dilakukan** jika masih ada transaksi commitment pending.
4. Adendum dengan status **Close** mengembalikan nilai budget ke Marketing Program.
5. Pembuatan adendum **tidak perlu maintain version**.

### Proses Approval Adendum Marketing Activity per Department

| Department | Limit | Approval Hierarchy |
|---|---|---|
| SA | < Rp 50 Juta | RFMM → Marketing Budgetary Control |
| SA | Rp 50–100 Juta | RFMM → Direktur Sales → Marketing Budgetary Control |
| SA | > Rp 100 Juta | RFMM → Direktur Sales → Direktur Marketing → Marketing Budgetary Control |
| MF | < Rp 50 Juta | Marketing Service Manager → Marketing Budgetary Control |
| MF | Rp 50–100 Juta | Marketing Service Manager → Direktur Sales → Marketing Budgetary Control |
| MF | > Rp 100 Juta | Marketing Service Manager → Direktur Sales → Direktur Marketing → Marketing Budgetary Control |
| RS | < Rp 100 Juta | Riset Manager → Marketing Budgetary Control |
| RS | > Rp 100 Juta | Riset Manager → Direktur Marketing → Marketing Budgetary Control |
| MC (OOH/Event/Horeca) | < Rp 100 Juta | Manager → Senior Manager → Marketing Budgetary Control |
| MC (OOH/Event/Horeca) | > Rp 100 Juta | Manager → Senior Manager → Direktur Marketing → Marketing Budgetary Control |
| MM | < Rp 50 Juta | Section Head Key Account → Marketing Budgetary Control |
| MM | Rp 50–100 Juta | Section Head Key Account → Direktur Sales → Marketing Budgetary Control |
| MM | > Rp 100 Juta | Section Head Key Account → Direktur Sales → Direktur Marketing → Marketing Budgetary Control |

---

## 8. MPM-3-3: Master Data & Additional Information OOH/HORECA

### Gambaran Umum
Pembuatan dan pemeliharaan master data untuk titik OOH (Out of Home) dan HORECA. Khusus untuk Marketing Activity departemen MC-OOH dan MC-HORECA, wajib memasukkan informasi **MC Code** di dalam sistem.

### Field Master Data OOH/HORECA

| Field | Mandatory | Keterangan |
|---|---|---|
| MC Code | — | Generate by System setelah disimpan |
| MC Type | — | Auto berdasarkan Responsibility |
| MC Description | M | Deskripsi OOH/HORECA |
| Address Name | M | Alamat OOH/Event |
| Province | M (jika OOH) | LOV Provinsi |
| Kabupaten/Kota | M (jika OOH) | LOV dependent ke Provinsi |
| Kecamatan | M (jika OOH) | LOV dependent ke Kab/Kota |
| OOH/HRC Type | M | Billboard, LED/Video TR, Midi Billboard, Neon Box, Others, Road Panel (OOH); Image/Non-Image (HORECA) |
| Outlet Name | M (jika HORECA) | Nama Outlet HORECA |
| Brand | — | Auto berdasarkan Responsibility |
| Branch | M | LOV Branch |
| Point Type | M | Permanent / Temporary |
| Point Qty | M | Jumlah titik |
| Ownership Status | M | Own / Rent |
| Wide, Length, Area | O | Dimensi billboard |
| Muka | M (jika OOH) | 1 Muka / 2 Muka |
| Jenis | M (jika OOH) | BL / FL / NL |

### Additional Information OOH/HORECA (Terkait PO)

| Field | Keterangan |
|---|---|
| Marketing Activity No. | Nomor Marketing Activity |
| PO No. | Nomor PO (status Approved) |
| Vendor Name | Auto dari PO Number |
| Contract No. | Auto dari PO Number |
| Contract Start Date | Auto dari PO Number |
| Contract End Date | Auto dari PO Number |
| Target Installation Date | Manual |
| Target Installation End | Manual |
| Amount PO | Auto dari PO Number |

---

## 9. MPM-4-1: Monitoring Marketing Budget

### Gambaran Umum
Pemantauan kemajuan Marketing Activity berdasarkan pencatatan biaya melalui transaksi di sub-modul Purchasing dan Payables. Pembaruan data dilakukan secara **scheduler**.

### Program Pembaruan Data ke OPC

| Program | Fungsi |
|---|---|
| **Supplier Cost Interface** | Pengiriman data biaya dari transaksi PR, PO, Receipt, AP Invoice ke modul OPC. Biaya terkirim setelah jurnal ditransfer ke GL. |
| **Update Project Summary Amounts** | Memperbarui data kemajuan pembebanan proyek di modul Oracle Project. |

### Jenis Transaksi yang Dapat Dimonitor

| Jenis | Tipe Transaksi |
|---|---|
| **Commitment** | Purchase Requisition & Purchase Order |
| **Actual** | PO Receipt/Work Confirmation & Direct Invoice |

### Katalog Tahapan MPM-4-1

| No | Deskripsi | Agent | Otomatis |
|---|---|---|---|
| OPC-2-2 | Pencatatan Realisasi Biaya Project | — | — |
| MPM-4-1-10 | Menjalankan Proses Penarikan Data Realisasi (scheduler) | — | Otomatis |
| MPM-4-1-20 | Melakukan Monitor Kemajuan Marketing Activity (setelah Create Accounting & GL) | Admin Department | Manual |
| MPM-4-1-30 | Mencetak Laporan yang Dibutuhkan | Admin Department | Manual |
| — | BI Dashboard (untuk kebutuhan analisa) | Marketing Manager, Senior Manager, Marketing Budget Controller, BOD | Manual |

---

## 10. Analisa Gap MPM

| Kebutuhan | Oracle Mapping | Gap | Solusi |
|---|---|---|---|
| Upload Marketing Program dari file Excel | MPM-2-1-40 & MPM-2-1-70 | Standard Oracle tidak bisa | Add-on: Form Upload Marketing Program |
| Revisi/adendum marketing program | MPM-2-1-80, MPM-2-2-30 & MPM-2-2-40 | Standard Oracle tidak bisa | Add-on: Form Marketing Program |
| Publish BSE | MPM-2-1-120 & MPM-2-2-80 | Standard Oracle tidak bisa | Add-on: Program Publish BSE |
| Membuka/Menutup Periode Adendum | MPM-2-2-10 & MPM-2-2-90 | Standard Oracle tidak bisa | Add-on: Form Open/Close Period Adendum |
| Proses Persetujuan Adendum Marketing Program | MPM-2-2-50 | Standard Oracle tidak bisa | Add-on: Workflow approval |
| Membuat/Revisi Marketing Activity & Adendum | MPM-3-1-20, MPM-3-2-20, MPM-3-2-30 | Standard Oracle tidak bisa | Add-on: Form Marketing Activity |
| Persetujuan Marketing Activity & Adendum | MPM-3-1-30 & MPM-3-2-40 | Standard Oracle tidak bisa | Add-on: Workflow approval |
| Informasi tambahan OOH/HORECA | MPM-3-3-20 | Standard Oracle tidak bisa | Add-on: Form Master OOH/HORECA & Form Spesifikasi |

---

## 11. Daftar Laporan MPM

| No | Nama Report | Tipe | Tujuan |
|---|---|---|---|
| 1 | Report BSE | Report | Total rekapan Marketing Program, Target Volume & Est. Revenue per Brand per tahun |
| 2 | Report Marketing Activity | Report | Operational report; tanda tangan basah untuk RFMM yang tidak dapat akses sistem |
| 3 | Report Review Uploaded Marketing Program | Report | Daftar Marketing Program yang berhasil di-upload |
| 4 | Report List Marketing Program (Summary) | Report | Daftar Marketing Program beserta sisa budget |
| 5 | Report List Marketing Activity (Summary) | Report | Daftar Marketing Activity beserta total per masing-masing |
| 6 | Report List Adendum Marketing Program | Report | Daftar Adendum Marketing Program |
| 7 | Report List Adendum Marketing Activity | Report | Daftar Adendum Marketing Activity |
| 8 | Report Detail Transaksi Marketing Activity | Report | Detail transaksi realisasi per Marketing Activity |
| 9 | OOH Monitoring & Maintenance | Analisa | Monitoring data OOH |
| 10 | HORECA Monitoring & Maintenance | Analisa | Monitoring data HORECA |
| 11 | Report Activity Summary Budget by Kode (MB/SA/MF) by Brand by PT | Report | Rekap BSE per Brand & per Kode Department |
| 12 | Summary Monitoring Budget | Analisa | Monitoring Budget BSE secara summary |
| 13 | Glossary Code ID Item Barang Promosi | Report | Daftar kode item barang marketing |

---

## 12. Alur Integrasi MPM → OPC (Ringkasan)

```
[TAHUNAN] Budget Planning
  Marketing Program dibuat (upload Excel → sistem)
  ↓ BSE disetujui & di-Publish
  ↓ Periode Budgeting CLOSE

[OPERASIONAL] Marketing Activity
  SPAP dibuat (manual) → disetujui di luar sistem
  ↓
  Marketing Activity dibuat di sistem (Add-On)
  ↓ Approval (sesuai limit otorisasi)
  ↓ Status = APPROVED
  ↓ ← [TRIGGER KE OPC]
  
[OPC] Pembentukan Project, Task & Budget
  Project Number = Nomor Marketing Activity
  Task           = Line Marketing Activity
  Budget         = Nilai Marketing Activity
  ↓ (Concurrent Scheduler)
  
[TRANSAKSI] Realisasi Marketing Activity
  PR/PO (Purchasing) → Commitment di OPC
  Receipt/Work Confirmation → Actual di OPC (setelah Create Accounting)
  Invoice AP → Actual di OPC (setelah Create Accounting)
  ↓
  
[MONITORING] Project Status Inquiry / BI Dashboard
  Commitment & Actual per Project/Task
```
