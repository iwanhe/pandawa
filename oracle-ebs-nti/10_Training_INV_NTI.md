# Knowledge Base: Training Material — Inventory OU Jakarta
**PT Nojorono Tobacco International (NTI)**
**Dokumen Sumber:** OPC - INV Training Material v1.0.docx & OPC - INV Training Material v1.0 (master item).docx
**Versi:** 1.0 | **Dibuat:** 18-Jul-21 | **Last Updated:** 8-Sep-21
**Author:** Arif Aqim

---

## 1. Ruang Lingkup

Training material ini mencakup operasional modul **Inventory OU Jakarta**:
- Master Data (Maintain Items, Category Code, Assignment ke Organization)
- Transaksi (Miscellaneous Transaction, Move Order, Transfer Antar Gudang, Penerimaan Antar Gudang)
- Proses Stock Opname (Physical Inventory)
- Proses Cycle Count
- Replenishment (Min-Max Planning)

**URL Login Sistem:** `http://vmorcl.ntiapps.net:8000`

---

## 2. Master Data

### 2.1 Maintain Items

**Menu:** `Items > Master Item`

**Langkah-langkah:**
1. Buka form Master Item
2. Isi field:

| Field | Req | Keterangan |
|---|---|---|
| Organization | G | Kode organisasi master item yang aktif |
| Item | R | Kode item sesuai struktur yang telah ditentukan |
| Description | R | Deskripsi item |
| Primary Unit Of Measure | R | Satuan utama item |

3. Pilih menu `Tools > Copy From` → pilih template:

| Template Name | Deskripsi |
|---|---|
| **Marketing** | Item yang akan di-maintain stoknya |
| **Marketing Expense** | Item yang **tidak** di-maintain stoknya |
| **Marketing Pabrikan** | Item pabrikan (rokok sample, dummy pack) |

4. Klik **Apply Template** → sesuaikan atribut jika perlu → **Save**

### 2.2 Define Category Code

**Menu:** `Tools > Categories` (dari dalam form Master Item)

**Langkah-langkah:**
1. Buka form Master Item yang sedang diedit → `Tools > Categories`
2. Muncul window Category Assignment

**Category Set default (diubah dari "Undefined" ke "EX Expense"):**
- NTI_ITEM CATEGORY
- NTI_PURCHASING CATEGORY

**Tambahan untuk item Marketing (2 category set baru):**
- **NTI_MKT_BRAND_CATEGORY**
- **NTI_MKT_MARKETING_CATEGORY**

3. Klik **Save**

### 2.3 Assignment Item ke Organization

**Menu:** `Tools > Organization Assignment` (dari dalam form Master Item)

**Langkah-langkah:**
1. Buka form Master Item → `Tools > Organization Assignment`
2. Centang IO mana yang akan di-assign pada checkbox **Assigned**
3. Atau klik tombol **Assign All** untuk assign ke semua IO yang ada
4. Klik **Save**

> **Perhatian:** Setelah checkbox **Assigned** di-save, **tidak dapat dibatalkan**. Tambahan assignment ke IO lain masih bisa dilakukan.

---

## 3. Transaksi Inventory

### 3.1 Miscellaneous Transaction

#### Miscellaneous Receipt (Penerimaan Barang Administratif)

**Menu:** `Transactions > Miscellaneous Transaction`

**Transaction Type yang tersedia:**
| Transaction Type | Deskripsi |
|---|---|
| MKT Administrasi Barang Hilang di Area | Pengadministrasian barang hilang di area |
| MKT Pengembalian Stok Marketing | Pengembalian stok marketing |
| MKT Penerimaan Stok Marketing | Penerimaan stok marketing (koreksi stok) |

**Langkah-langkah:**
1. Pilih transaction type
2. Klik **Transaction Lines**
3. Isi kolom **Item** (kode item)
4. Isi kolom **Subinventory** (kode gudang penerimaan)
5. Kolom **UOM** otomatis terisi dari primary UOM master item
6. Isi kolom **Quantity** (jumlah barang)
7. Ulangi untuk setiap barang yang akan dicatat
8. Klik **Save** (atau `Ctrl+S`)

#### Subinventory Transfer (Perpindahan Barang Administratif)

**Menu:** `Transactions > Subinventory Transfer`

**Langkah-langkah:**
1. Pilih transaction type (sama dengan Miscellaneous Transaction)
2. Klik **Transaction Lines**
3. Isi kolom **Item**
4. Isi kolom **Subinventory** (gudang pengeluaran/asal)
5. Isi kolom **To Subinv** (gudang penerimaan/tujuan)
6. Isi kolom **UOM** (auto dari master item)
7. Isi kolom **Quantity**
8. Klik **Save**

---

### 3.2 Move Order

#### Move Order Issue (Pengeluaran Barang dengan Approval)

**Menu:** `Move Orders > Move Orders`

**Transaction Type yang tersedia:**
| Transaction Type | Deskripsi |
|---|---|
| MKT Pemusnahan Barang Rusak | Pemusnahan barang marketing |
| MKT Pengiriman Dummy Pack ke Vendor | Pengiriman Dummy Pack ke Vendor Table Top |
| MKT Permintaan Department | Permintaan departemen terhadap barang marketing |
| MKT Karantina Barang Rusak | Pemindahan barang rusak ke Subinv Reject |

**Langkah-langkah:**
1. Pilih transaction type → isi detail Move Order
2. Klik **Save** → klik **Approve**

#### Move Order Transfer (Perpindahan Barang dengan Approval)

**Menu:** `Move Orders > Move Orders`

Transaction Type: sama dengan Move Order Issue.
Langkah: sama dengan Move Order Issue.

---

### 3.3 Allocate Move Order

**Menu:** `Move Orders > Transact Move Orders`

**Tujuan:** Memberikan alokasi barang (lokasi gudang & identitas barang — nomor lot atau serial), baik disuggest oleh sistem maupun manual.

**Langkah-langkah:**
1. Isi nomor Move Order → klik **Find**
2. Centang item yang akan di-allocate
3. Klik tombol **Suggest** untuk mendapatkan saran dari sistem
4. Klik tombol **Detail** untuk update allocation secara manual
5. Kolom **Allocation** akan terisi:
   - **Single** = item didapatkan dari 1 source
   - **Multiple** = item didapatkan dari lebih dari 1 source

---

### 3.4 Transact Move Order

**Menu:** `Move Orders > Transact Move Orders`

**Langkah-langkah:**
1. Isi nomor Move Order → klik **Find**
2. Centang item yang akan di-transact
3. Klik **Transact**

---

### 3.5 Cancel / Close Move Order

**Menu:** `Move Orders > Move Orders`

1. Cari nomor Move Order → klik **Find**
2. Pilih menu `Tools > Cancel Order` atau `Tools > Close Order`

**Pilihan aksi:**

| Aksi | Keterangan |
|---|---|
| **Cancel Order** | Batalkan seluruh move order (kondisi: belum ada item yang dipenuhi) |
| **Close Order** | Batalkan sisa item yang belum dipenuhi dalam satu dokumen move order |
| **Cancel Line** | Batalkan 1 line atau lebih (kondisi: belum ada item yang dipenuhi di line tersebut) |
| **Close Line** | Batalkan sisa item yang belum dipenuhi dalam 1 line atau lebih |

---

### 3.6 Transfer Antar Gudang (Inter-Organization Transfer)

**Menu:** `Transactions > Inter-organization Transfer`

| Field | Req | Keterangan |
|---|---|---|
| Date | G | Default tanggal sekarang; dapat diubah backdate |
| To Organization | R | Organization tujuan transfer |
| Type | R | Transaction Type: **"MKT Transfer Area"** |
| Number | R | Nomor pengiriman (surat jalan internal) |

**Langkah-langkah:**
1. Isi field header → klik **Enter**
2. Isi detail baris:

| Field | Req | Keterangan |
|---|---|---|
| Item | R | Kode barang |
| Subinventory | R | Subinventory asal |
| To Subinventory | O | Subinventory tujuan |
| UOM | R | Otomatis dari master item; dapat diganti |
| Qty | R | Quantity barang |

3. Klik **Save** → sistem generate nomor transaksi

**Cetak Surat Jalan:**
- `View > Request > Submit New Request`
- **Untuk 1 area, beda IO:** Name = `XODI INV – Form Pengeluaran Barang`
- **Untuk beda area, beda IO:** Name = `XODI INV – Surat Perintah Jalan`
- Isi parameter → Submit → pantau sampai **Complete** → klik **View Output**

---

### 3.7 Penerimaan Antar Gudang (Receiving)

**Menu:** `Transactions > Receiving > Receipts`

| Field | Req | Keterangan |
|---|---|---|
| Operating Unit | R | **NTI – Jakarta (OU)** |
| Source Type | R | **Internal** |
| Shipment | R | Nomor pengiriman / surat jalan internal |

**Langkah-langkah:**
1. Isi field → klik **Find**
2. Review detail penerimaan (Quantity, UOM, Item otomatis terisi)
3. Isi **Subinventory** (tempat penerimaan barang)
4. Klik **Save** → sistem generate nomor receipt

> **Aturan:** Penerimaan antar gudang harus **full receipt** — tidak ada penerimaan parsial untuk satu surat jalan.

---

### 3.8 View Material Transaction

**Menu:** `Transaction > Material Transaction`

**Parameter pencarian:**

| Field | Keterangan |
|---|---|
| Transaction Dates | Range tanggal transaksi |
| Item | Kode item |
| Subinventory | Subinventory |
| Lot | Nomor lot |
| Source Type | Tipe sumber transaksi |
| Transaction Type | Tipe transaksi |

**Region yang tersedia di hasil:**
- **Location** — lokasi transaksi per Subinventory (MKT.GOOD / MKT.REJECT)
- **Intransit** — posisi item dalam transaksi inventory (IR/ISO)
- **Transaction Type** — semua transaksi inventory per item

---

## 4. Proses Stock Opname (Physical Inventory)

### 4.1 Input Informasi Stock Opname

**Menu:** `Counting > Physical Inventory > Physical Inventories`

**Isi data:**
| Field | Keterangan |
|---|---|
| Name | Nama Physical Inventory |
| Description | Deskripsi |
| Date | Tanggal men-capture data inventory |
| Approval Required | Always / Never / Out of Tolerances |
| Count Subinventories | All (semua) / Specific (tertentu) |
| Allow Dynamic Tags | Jika ada barang fisik yang tidak ada di sistem → sistem generate tag baru |

### 4.2 Snapshot Inventory On Hand

1. Buka Physical Inventories → klik **Snapshot**
2. Klik **Generate Physical Inventory Tags**
3. Isi **Starting Tag** (kombinasi huruf & angka)
4. Klik **OK**

### 4.3 Cetak Detail Stock Opname

**Menu:** `View > Request > Submit New Request`

**Program:** Physical Inventory Tags

| Field | Req | Keterangan |
|---|---|---|
| Physical Inventory | R | Nama Physical Inventory |
| Subinventory | O | Kosongkan atau isi subinventory tertentu |
| Sort By | R | Kolom yang ingin di-sort |
| Range | R | Pilih print semua atau partial |
| From Tag / To | O | Range tag yang dicetak |

### 4.4 Update Physical Tag Count (Upload Hasil Stock Opname)

**Langkah-langkah:**
1. Admin Gudang Area melakukan perhitungan fisik → kirim hasil ke pusat
2. Admin Marketing Service menyesuaikan format laporan ke **format file interface**
3. Upload file: `FND GFM File Upload`
4. Jalankan program: `PBR INV Upload Update TAG Program` → `View > Request`
5. Setelah **Complete**, buka menu: `Counting > Physical Inventory > Tag Counts`
6. Cari nama Physical Inventory → klik **Find**
7. Sistem otomatis input jumlah stok di kolom **Qty** berdasarkan file yang di-upload

### 4.5 Verifikasi Hasil Stock Opname

**Menu:** `View > Request > Submit New Request`

**Program:** `XNTI INV – Laporan Stock Opname`

| Field | Req | Keterangan |
|---|---|---|
| IO | R | Pilih lokasi hasil stock opname |

### 4.6 Adjustment

**Menu:** `Counting > Physical Inventory > Approve Adjustment`

- Klik **Approve All** untuk menyetujui semua perubahan qty
- Klik **Reject All** untuk menolak semua perubahan qty
- Klik **Save**

---

## 5. Proses Cycle Count

Proses ad-hoc untuk memastikan stok satu atau sekelompok item sesuai fisik gudang.

### 5.1 Cetak Laporan Stock Inventory

**Program:** `XODI INV – Laporan Persediaan`
(`View > Request > Submit New Request`)

### 5.2 Adjustment Minus (Stok Sistem > Stok Fisik)

**Menu:** `Move Orders > Move Orders`

1. Pilih transaction type **MKT Permintaan Department** atau sesuai kebutuhan
2. Klik **Save** → **Approve**
3. Lakukan **Allocate Move Order** (lihat sub-bab 3.3)
4. Lakukan **Transact Move Order** (lihat sub-bab 3.4)

### 5.3 Adjustment Plus (Stok Sistem < Stok Fisik)

**Menu:** `Transactions > Miscellaneous Transaction`

1. Pilih transaction type **MKT Penerimaan Stok Marketing**
2. Klik **Transaction Lines**
3. Isi Item, Subinventory, UOM (auto), Quantity
4. Klik **Save**

---

## 6. Replenishment: Min-Max Planning

**Menu:** `Replenishment > Min-Max Planning`

Fitur untuk menjalankan perencanaan pengisian stok berdasarkan batas minimum dan maksimum yang telah ditetapkan di item master.

---

## 7. Proses Cycle Count Lanjutan (ABC Analysis)

### 7.1 Mendefinisikan ABC Compile
**Menu:** `ABC Compiles`
Mengelompokkan item berdasarkan nilai (ABC analysis) untuk menentukan frekuensi cycle count.

### 7.2 Mencetak ABC Descending Value Report
Laporan item diurutkan berdasarkan nilai dari tertinggi ke terendah.

### 7.3 Mendefinisikan ABC Class
**Menu:** `ABC Classes`
Mendefinisikan kelas A, B, C berdasarkan persentase nilai/jumlah item.

### 7.4 Mendefinisikan ABC Assignment Groups
**Menu:** `ABC Assignment Groups`
Mengelompokkan item ke dalam kelas ABC yang sudah didefinisikan.

### 7.5 Mendefinisikan Cycle Counts
**Menu:** `Cycle Counts`
Mendefinisikan program cycle count beserta schedule hitungnya per kelas ABC.

### 7.6 Me-request Perhitungan Cycle Count
Generate request perhitungan berdasarkan jadwal cycle count yang sudah ditentukan.

### 7.7 Memulai Proses Perhitungan Cycle Count
Jalankan program untuk memulai proses hitungan aktual di gudang.

### 7.8 Mencetak Inventory Count Listing Report
Cetak daftar item yang harus dihitung beserta informasi sistem.

### 7.9 Mengentri Hasil Perhitungan
**Dua cara:**
- **Oracle Form:** Input langsung via form Cycle Count Entries
- **MSCA (Mobile Supply Chain Applications):** Input via barcode scanner/mobile device

### 7.10 Mencetak Inventory Count Variance Report
Laporan selisih antara stok sistem dan hasil hitungan fisik.

### 7.11 Menyetujui dan Melakukan Perubahan Stok
Review variance → approve adjustment yang telah diverifikasi.

---

## 8. Checklist Operasional Inventory Bulanan

| No | Aktivitas | PIC |
|---|---|---|
| 1 | Review semua Material Transaction periode berjalan | Admin Marketing Service |
| 2 | Verifikasi transaksi dengan dokumen fisik (Berita Acara, Surat Jalan) | Admin Marketing Service |
| 3 | Jalankan Create Accounting Final (mode: Final–Post) | Admin Marketing Budget Controller & Procurement |
| 4 | Close Period Inventory saat ini | Admin Marketing Budget Controller & Procurement |
| 5 | Open Period Inventory selanjutnya | Admin Marketing Budget Controller & Procurement |

> **Catatan:** Create Accounting di modul Cost Management dipegang oleh **Finance Accounting**.

---

## 9. Troubleshooting Umum Inventory

| Masalah | Kemungkinan Penyebab | Solusi |
|---|---|---|
| Item tidak muncul di LOV | Item belum di-assign ke IO yang bersangkutan | Lakukan Organization Assignment di Master Item |
| Stok tidak terupdate setelah receiving dari RRJ | Item marketing = expense; stok tidak otomatis tercatat | Jalankan custom program Miscellaneous Receipt |
| Move Order tidak bisa di-transact | Stok on-hand tidak tersedia / allocation belum dilakukan | Pastikan ada on-hand; lakukan Allocate Move Order terlebih dahulu |
| Transfer antar gudang tidak bisa dilakukan | Shipping Network belum di-setup antara dua IO | Setup Shipping Network oleh tim IT/Implementor |
| Period Inventory tidak bisa ditutup | Masih ada transaksi pending | Selesaikan semua transaksi; jalankan Create Accounting Final |
| Upload stock opname gagal | Format file tidak sesuai template interface | Perbaiki format file CSV sesuai template; upload ulang |
| Adjustment tidak muncul setelah upload tag count | Concurrent program belum complete | Pantau status program; refresh tampilan setelah Complete |
