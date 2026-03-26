# Knowledge Base: Requisition to Receipt OU Jakarta (RRJ) — Future Process Model
**PT Nojorono Tobacco International (NTI)**
**Dokumen Sumber:** BP080-DIST-RRJ NTI v1.0.docx
**Versi:** 1.0 | **Tanggal:** 14-Apr-2021 (Revisi: 29-Oct-21)
**Penyusun:** Arif Aqim (Trees Solutions) | **Functional Leader:** Francisco Edo

---

## 1. Ruang Lingkup

Modul Purchasing dan iProcurement untuk OU Jakarta mencakup:
- Pembuatan Master Data Buyer
- Maintain Approval Hierarchy
- Proses Purchase Requisition (PR)
- Proses Blanket Purchase Agreement (BPA)
- Proses Blanket Release
- Proses Purchase Order (Standard & Service)
- Proses Receipt (Penerimaan Barang & Work Confirmation)
- Proses Return to Vendor
- Proses Internal Requisition
- Proses Period End Closing

Platform: Oracle Release 12.2.4 standard.

---

## 2. Daftar Proses RRJ

| Kode Proses | Nama Proses | Frekuensi |
|---|---|---|
| RRJ-1-1 | Maintain Data Master Buyer | Bila Diperlukan |
| RRJ-1-2 | Maintain Approval Hierarchy | Bila Diperlukan |
| RRJ-1-3 | Proses Pengelolaan Katalog | Bila Diperlukan |
| RRJ-1-4 | Maintain Master Supplier | Bila Diperlukan |
| RRJ-1-5 | Maintain Master Supplier Karyawan | Bila Diperlukan |
| RRJ-2-1 | Maintain Purchase Requisition Catalog | Bila Diperlukan |
| RRJ-2-2 | Maintain Purchase Requisition Non-Catalog | Bila Diperlukan |
| RRJ-2-3 | Maintain Internal Requisition - Marketing | Bila Diperlukan |
| RRJ-2-4 | Pembatalan Purchase Requisition (Adhoc) | Bila Diperlukan |
| RRJ-3-1 | Maintain Blanket Purchase Agreement | Bila Diperlukan |
| RRJ-3-2 | Maintain Blanket Release | Bila Diperlukan |
| RRJ-4-1 | Maintain Purchase Order | Bila Diperlukan |
| RRJ-4-2 | Maintain Service Purchase Order | Bila Diperlukan |
| RRJ-4-3 | Pembatalan Purchase Order (Adhoc) | Bila Diperlukan |
| RRJ-4-4 | Update Nomor Contract di Purchase Order | Bila Diperlukan |
| RRJ-5-1 | Proses Penerimaan Barang – Non Marketing | Bila Diperlukan |
| RRJ-5-2 | Proses Pengembalian Barang – Non Marketing | Bila Diperlukan |
| RRJ-5-3 | Proses Pencatatan Work Confirmation | Bila Diperlukan |
| RRJ-5-4 | Proses Koreksi Work Confirmation | Bila Diperlukan |
| RRJ-5-5 | Proses Penerimaan Barang – Marketing | Bila Diperlukan |
| RRJ-5-6 | Proses Pengembalian Barang – Marketing | Bila Diperlukan |
| RRJ-6-1 | Period End Closing | Bulanan |

---

## 3. Master Data

### RRJ-1-1: Maintain Data Master Buyer
Buyer di Oracle adalah pegawai yang diberi hak akses untuk membuat proses pengadaan (BPA, Blanket Release, PO, Service PO). Dikelola oleh **Admin Marketing Budget Controller & Procurement**.

### RRJ-1-2: Maintain Approval Hierarchy
Approval hierarchy dipakai untuk menentukan jenjang approval:
- Purchase Requisition
- Blanket Purchase Agreement
- Blanket Release
- Purchase Order & Work Confirmation

**Penanggung Jawab:**
- **Admin Marketing Budget Controller & Procurement:** maintain data employee (nama, posisi, tanggal masuk/keluar)
- **IT Support System:** maintain login Oracle, approval hierarchy, cek & alihkan pending approval

### RRJ-1-3: Proses Pengelolaan Katalog
Katalog iProcurement berisi informasi item (barang/jasa) yang dapat digunakan Requestor untuk membuat PR. Konfigurasi meliputi:
1. Shopping Category (klasifikasi item)
2. Hierarchy Category (pengelompokan Shopping Category)
3. Mapping PO Category ke Shopping Category
4. Konfigurasi Stores (tampilan awal iProcurement)

> Jika pengelompokan katalog tidak dilakukan, item tidak muncul di iProcurement sehingga Requestor tidak bisa membuat PR.

### RRJ-1-4: Maintain Master Supplier
Informasi yang di-maintain:
- Nama Supplier & Alternate Name
- Supplier Site (Alamat & Kontak)
- Bank Account Supplier
- Nomor NPWP
- Account Liability dan Prepayment

**Dokumen yang diperlukan:** Form Vendor (diisi vendor) dan Form Internal (COA hutang & prepayment).

### Kebijakan RRJ-1-4
1. Nomor vendor otomatis menggunakan running number Oracle standard.
2. Penambahan COA hutang dan prepayment dilakukan oleh team accounting.
3. Penambahan bank dan bank branch baru dilakukan oleh team finance.

### RRJ-1-5: Maintain Master Supplier Karyawan
Karyawan sebagai supplier untuk transaksi uang muka. **Vendor Type = NTI Employee**. Satu vendor name untuk satu nama karyawan. Dikelola berdasarkan permintaan HRD.

---

## 4. Purchase Requisition

### RRJ-2-1: PR Catalog

**Jenis PR di OU Jakarta:**
| Jenis PR | PIC |
|---|---|
| PR Marketing/Brand | Admin Department/Brand |
| PR Project | Admin GA |
| PR ATK | Admin GA |
| PR Sparepart | Admin GA |
| PR IT | Admin GA |

**Aturan:**
- Hanya PR yang memiliki budget dan berstatus **Approved** yang dapat diproses menjadi PO atau Blanket Release.
- Jika budget marketing tidak tersedia → buat Marketing Activity (adendum).
- Jika budget non-marketing tidak tersedia → penyesuaian budget melalui modul GL.
- PR marketing **wajib** mengisi: Project, Task, Expenditure Type, Expenditure Item Date.

**Proses Approval PR Catalog (2 level):**
1. Manager Department / Brand Directive Manager
2. FA Admin

> Tidak ada batasan nilai per level approval.

### Katalog Tahapan RRJ-2-1

| No | Deskripsi | Agent |
|---|---|---|
| RRJ-2-1-10 | Meminta Pembuatan PR | Requestor |
| RRJ-2-1-20 | Membuat PR Catalog (pilih item di katalog iProcurement) | Admin Department, Brand Admin |
| RRJ-2-1-30 | Submit Approval PR | Admin Department, Brand Admin |
| RRJ-2-1-40 | Approve PR | Manager Department, Brand Directive Manager, FA Admin |
| RRJ-2-1-50 | Reject PR | Manager Department, Brand Directive Manager |
| RRJ-2-1-60 | Update PR (jika dikembalikan) | Admin Department, Brand Admin |
| RRJ-2-1-70 | Cancel PR | Admin Department, Brand Admin |

### RRJ-2-2: PR Non-Catalog
Untuk jasa yang tidak terdaftar di katalog, terutama jasa dengan termin pembayaran (kontrak jangka waktu). Semua PR Non-Catalog akan diproses sebagai Service Procurement.

**Proses Approval:** sama dengan PR Catalog (2 level: Manager/Brand Directive Manager + FA Admin).

### RRJ-2-3: Internal Requisition — Marketing
Permintaan barang dari NTI Jakarta ke NTI Kudus (rokok sample, dummy pack).
- Hanya IR yang memiliki budget dan berstatus **Approved** yang dapat melanjutkan ke Internal Sales Order.
- Approval IR: 2 level — Manager Department/Brand Directive Manager + FA Admin.

### RRJ-2-4: Pembatalan PR (Adhoc)
- PR **belum approve** → edit atau delete line di sistem
- PR **sudah approve** → cancel di sistem
- PR yang sudah menjadi PO → cancel PO terlebih dahulu

---

## 5. Blanket Purchase Agreement (BPA)

### RRJ-3-1: Maintain BPA
Kontrak pembelian item yang sudah terdaftar di item master. BPA mengikat item, harga satuan, dan total amount yang disepakati dengan rekanan. Realisasi dilakukan secara bertahap melalui **Blanket Release**.

**Approval BPA:** 1 level — Manager Budget Controller & Procurement.

**Aturan revisi harga BPA:**
- Harga baru ditambahkan pada line berikutnya
- Line dengan harga lama diubah menjadi nonaktif (agar historical perubahan harga terjaga)

### RRJ-3-2: Maintain Blanket Release
Blanket Release terbentuk dari PR. Memiliki **1 level approval** — Manager Budget Controller & Procurement.

- Blanket Release yang disetujui → otomatis generate & email dokumen ke rekanan
- Jika budget tidak tersedia → PR dikembalikan untuk penyesuaian budget

---

## 6. Purchase Order

### RRJ-4-1: Maintain Purchase Order (Standard PO)

**Aturan penting:**
- Semua PO harus melalui proses PR terlebih dahulu.
- Harga di PO adalah **DPP (Dasar Pengenaan Pajak)** — PPN/PPh diinput di AP Invoice.
- Approval PO: **1 level** — Manager Marketing Budget Controller & Procurement (tidak ada limitasi nilai).
- PO yang disetujui → otomatis generate & email ke vendor.

**Status PO:**
| Status | Keterangan |
|---|---|
| Belum approve (Incomplete) | Dapat di-delete |
| Sudah approve, belum terkirim | Cancel di sistem |
| Sudah approve, sudah menjadi komitmen | Close di sistem |

### RRJ-4-2: Maintain Service Purchase Order

**Tipe Termin Service PO:**

| Tipe | Deskripsi | Contoh |
|---|---|---|
| **Milestone** | Penyelesaian pekerjaan dalam beberapa tahap dengan persentase. Untuk item catalog yang dikombinasikan dengan jasa. | PO pemasangan billboard: Tahap 1 (60%), Tahap 2 (30%), Tahap 3 (10%) |
| **Rate** | Perhitungan quantity × price. | Gaji SPB/SPG event: Weekdays 5 hari × Rp 100.000 + Weekend 2 hari × Rp 150.000 |
| **Lumpsum** | Nilai penuh tanpa persentase dan tanpa perkalian. Untuk jasa non-catalog dengan termin. | PO pemasangan billboard dengan nilai tunggal Rp 100.000.000 |

**Approval Service PO:** 1 level — Manager Budget Controller & Procurement.

### RRJ-4-3: Pembatalan PO (Adhoc)
Hanya dapat dilakukan oleh Admin Marketing Budget Controller & Procurement. Qty yang dapat dibatalkan = qty yang **belum dilakukan penerimaan**.

### RRJ-4-4: Update Nomor Kontrak di PO
Admin Legal mengupdate DFF PO header (nomor dan tanggal kontrak). Admin Legal **hanya** dapat mengupdate DFF PO, tidak mengubah status PO yang berjalan.

---

## 7. Penerimaan Barang

### RRJ-5-1: Penerimaan Barang Non-Marketing

**Alur:**
1. Rekanan kirim barang → Admin Gudang periksa fisik
2. Jika ada barang rusak → langsung dikembalikan ke rekanan
3. Jika pemeriksaan memerlukan waktu → terima dahulu di Subinventory Good, lanjutkan pemeriksaan
4. Admin GA mencatat penerimaan sejumlah qty fisik
5. Setiap malam, GRN (Goods Receive Note) otomatis terkirim ke rekanan via batch sistem

**Penerimaan dapat dilakukan full atau parsial.**
**User:** Admin GA.

### RRJ-5-2: Pengembalian Barang Non-Marketing

**2 jenis retur:**
1. **Retur Administrasi** — pengembalian tanpa fisik barang (misal: koreksi harga PO)
2. **Retur Barang Reject** — dari hasil inspeksi barang rusak

> Jika invoice sudah terbentuk → saat melakukan retur, **Debit Memo otomatis terbentuk** di sistem.
> Jika invoice belum terbentuk → koreksi langsung di PO/BPA.

**Kebijakan:**
- Retur parsial → Invoice PO dibayar full, terbitkan Nota Retur (Debit Memo) untuk pemotongan tagihan berikutnya.
- Retur parsial + tukar guling → Invoice PO dibayar full pada pengiriman selanjutnya.

### RRJ-5-3: Proses Pencatatan Work Confirmation
Penerimaan jasa dari Service PO. User: Admin Department / Brand Admin (yang membuat PR).

**Dokumen:** SP3 (Surat Pernyataan Penyelesaian Pengerjaan).
**Approval:** 1 level — Manager Department / Brand Directive Manager.
**Output:** SRN (Service Receipt Note) — otomatis terkirim ke email rekanan.
**Penerimaan:** dapat full atau parsial, **tidak dapat backdated** apapun jenis termin.

> Jika ada ketidaksesuaian waktu pengerjaan → Work Confirmation dibuat progress 100% + Debit Memo Invoice sebagai denda.

### RRJ-5-4: Proses Koreksi Work Confirmation
Digunakan ketika ada pembatalan terkait regulasi setelah pekerjaan selesai (contoh: take down billboard). Koreksi ini mengurangi nilai biaya kepada rekanan dan **mengembalikan budget project**.

**Syarat:** Hanya untuk tipe termin **Lumpsum** (jasa) dan kombinasi item catalog dengan **Milestone**.

### RRJ-5-5: Penerimaan Barang Marketing
**Penerimaan dari rekanan:** sama seperti Non-Marketing (full atau parsial).
**Penerimaan dari pabrikan:** harus diterima semua qty dalam satu surat jalan (**tidak ada penerimaan parsial**).

> Khusus marketing: stok tidak langsung tercatat di sistem karena item didefinisikan sebagai **expense**. Diperlukan **custom program Miscellaneous Receipt** untuk mencatatkan stok berdasarkan penerimaan user.

### RRJ-5-6: Pengembalian Barang Marketing
Sama dengan Non-Marketing (Retur Administrasi & Retur Reject). User: Admin Department / Brand Admin.

> Stok tidak di-issue langsung di sistem → diperlukan **custom program Miscellaneous Issue** untuk mengeluarkan stok secara otomatis. Qty yang boleh diretur = qty yang tersedia di sistem.

---

## 8. Period End Closing

### RRJ-6-1: Proses Period End Closing

**Laporan yang dijalankan sebelum penutupan:**
- **Open Purchase Order** — PO yang masih outstanding (belum ada penerimaan)
- **Uninvoiced Receipt** — receipt yang sudah dilakukan tapi belum di-invoice (untuk follow up ke supplier)

**Katalog Tahapan RRJ-6-1:**

| No | Deskripsi | Frekuensi | Agent |
|---|---|---|---|
| RRJ-6-1-10 | Cetak Report Outstanding PO & Uninvoiced Receipt | Mingguan | Admin Marketing Budget Controller & Procurement |
| RRJ-6-1-20 | Konfirmasi Outstanding PO ke Gudang/Vendor | Bila Diperlukan | Admin Marketing Budget Controller & Procurement |
| RRJ-6-1-30 | Konfirmasi ke Requestor | Bila Diperlukan | Requestor |
| RRJ-6-1-40 | Close PO | Bila Diperlukan | Admin Marketing Budget Controller & Procurement |
| RRJ-6-1-50 | Buka Next Periode | Bulanan | Finance Accounting |
| RRJ-6-1-60 | Tutup Current Periode | Bulanan | Finance Accounting |

---

## 9. Analisa Gap RRJ

| Kebutuhan | Oracle Mapping | Gap | Solusi |
|---|---|---|---|
| Pencatatan Actual untuk penerimaan barang marketing atas proses IR | RRJ-5-1-30, RRJ-5-5-30 | Standard Oracle hanya mengenali komitmen di project/task saat receiving IR | Mendefinisikan expenditure yang berbeda agar dapat dikenali pada Internal Requisition |
| Pencatatan Actual untuk pengiriman barang marketing atas proses ISO | RRJ-5-2-30, RRJ-5-2-70, RRJ-5-6-30, RRJ-5-6-80 | Untuk retur Internal Sales Order, budget project tidak dapat dikembalikan | Diatur melalui SOP; budget yang terpakai tidak dapat dikembalikan jika sudah terjadi penerimaan |
| Pencatatan on-hand atas barang receiving (item expense) | RRJ-5-5-40 | Item marketing didefinisikan sebagai expense → stock on-hand tidak tercatat oleh sistem | **Custom program Miscellaneous Receipt** |
| Pencatatan on-hand atas barang issue (item expense) | RRJ-5-6-040, RRJ-5-6-090 | Item marketing didefinisikan sebagai expense → stok tidak di-issue oleh sistem | **Custom program Miscellaneous Issue** |
| Notifikasi email ke Admin Legal jika membutuhkan kontrak | RRJ-4-1-50 | Tidak ada di standard Oracle | **Custom alert** |
| Mencatat informasi Marketing Activity di PR | RRJ-2-1-20, RRJ-2-2-20 | Sistem tidak mewajibkan pengisian informasi Marketing Activity secara standard | **Custom Personalisasi di web** (mewajibkan pengisian untuk Admin Department/Brand Admin) |

---

## 10. Daftar Laporan RRJ

| Nama | Tipe | Tujuan |
|---|---|---|
| Purchase Order GA | Report | Informasi pembelian barang non-marketing |
| PO Monitoring | Report | Informasi nomor PR, penerimaan, invoice, dan pembayaran |
| Rekapitulasi PO per PAP | Report | Rekapitulasi PAP Activity per PO |
| Laporan Blanket Release | Report | Blanket Release ke rekanan via email |
| Laporan Purchase Order | Report | Purchase Order ke rekanan via email |
| Laporan Service PO | Report | Service PO ke rekanan via email |
| Laporan Internal Sales Order | Report | Internal Sales Order ke pabrikan via email |
| Laporan GRN | Report | GRN ke rekanan via email |
| Laporan SRN | Report | SRN ke rekanan via email |
| Laporan Koreksi Work Confirmation | Report | Koreksi Work Confirmation ke rekanan via email |
| Dokumen Retur | Report | Pengembalian barang marketing/non-marketing |
