# Knowledge Base: Inventory OU Jakarta (INJ) — Future Process Model
**PT Nojorono Tobacco International (NTI)**
**Dokumen Sumber:** BP080-DIST-INJ NTI v1.0.docx
**Versi:** 1.0 | **Tanggal:** 14-Apr-2021 (Revisi: 29-Oct-21)
**Penyusun:** Arif Aqim (Trees Solutions) | **Functional Leader:** Francisco Edo

---

## 1. Ruang Lingkup

Modul Inventory OU Jakarta mencakup:
- Pembuatan Master Item
- Move Order (Issue & Transfer)
- Stock Opname (Physical Inventory & Cycle Count)
- Adjustment Quantity (Miscellaneous Transactions)
- Inter Organization Transfer
- Proses Closing Inventory

Berintegrasi dengan: Requisition to Receipt OU Jakarta (RRJ).

Platform: Oracle Release 12.2.4 standard.

---

## 2. Daftar Proses Inventory OU Jakarta

| Kode Proses | Nama Proses | Frekuensi |
|---|---|---|
| INJ-1-1 | Maintain Master Item | Bila Diperlukan |
| INJ-2-1 | Move Order Issue | Bila Diperlukan |
| INJ-2-2 | Move Order Transfer | Bila Diperlukan |
| INJ-2-3 | Physical Inventory | Bila Diperlukan |
| INJ-2-4 | Cycle Count | Bila Diperlukan |
| INJ-2-5 | Miscellaneous Receipt | Bila Diperlukan |
| INJ-2-6 | SubInventory Transfer | Bila Diperlukan |
| INJ-2-7 | Pencatatan Transfer Antar Gudang | Bila Diperlukan |
| INJ-2-8 | Pencatatan Penerimaan Antar Gudang | Bila Diperlukan |
| INJ-2-9 | Inspeksi Barang Rusak | Bila Diperlukan |
| INJ-3-1 | Period End Closing | Bulanan |

---

## 3. Struktur Organisasi — Inventory OU Jakarta

### Operating Unit
| Kode OU | Nama OU |
|---|---|
| JKT | NTI - Jakarta (OU) |

### Inventory Organization (IO)
| Tipe IO | Deskripsi |
|---|---|
| **IO HO Jakarta** | Pemodelan HO Jakarta; untuk penerimaan barang non-marketing |
| **IO Regional Office** | Pemodelan area Distribution Centre (DC). Contoh: DC Bandung, DC Jakarta |
| **IO Branch** | Pemodelan area Cabang. Contoh: Cabang Bogor, Cabang Jakarta Selatan |
| **IO Sub Branch** | Pemodelan area Sub Cabang (perpanjangan Cabang). Contoh: Sub Cabang BIMA (menginduk ke Mataram) |
| **IO POS** | Pemodelan area POS (tidak ada Financial Accounting Supervisor). Contoh: POS Bau Bau (menginduk ke Kendari) |

### Subinventory (untuk semua IO kecuali HO Jakarta)
| Subinventory | Description |
|---|---|
| **MKT.GOOD** | Penyimpanan barang marketing kondisi bagus |
| **MKT.REJECT** | Penyimpanan barang marketing kondisi reject |

---

## 4. INJ-1-1: Maintain Master Item

### Gambaran Umum
Proses pendaftaran kode item baru. Tipe item di OU Jakarta:

**Item Expense**
- Digunakan untuk PR dan PO; saat penerimaan diakui sebagai expense, tidak ada stok yang di-maintain.
- Contoh: Item Jasa, Item Project GA, Item IT, Item ATK, Item Sparepart

**Item Inventory Expense**
- Stoknya di-maintain di gudang, tapi tanpa value/cost karena sudah diakui sebagai expense saat penerimaan.
- Contoh: Item Marketing, Rokok Sample, Dummy Pack

### UOM Conversion
Jika suatu item membutuhkan perbedaan UOM:
- **Intraclass:** 1 meter = 100 cm; 1 kg = 1000 gr
- **Interclass:** 1 roll = 25 meter; 1 kg = 15 bal

### Katalog Tahapan INJ-1-1

| No | Deskripsi | Agent |
|---|---|---|
| INJ-1-1-010 | Meminta Pembaharuan Item | Requestor |
| INJ-1-1-020 | Isi Form Master Item Baru | Requestor |
| INJ-1-1-030 | Melengkapi Permintaan (FA input COA, Admin Legal input contract) | Finance Accounting, Admin Legal |
| INJ-1-1-040 | Proses Validasi Data (cek apakah item sudah ada di Oracle) | Admin Marketing Budget Controller & Procurement |
| INJ-1-1-050 | Register Master Item & Assign ke IO | Admin Marketing Budget Controller & Procurement |
| INJ-1-1-060 | Form Dikembalikan untuk diReview (jika item sudah ada) | Requestor |
| INJ-1-1-070 | Info ke Pengaju Master Item | Admin Marketing Budget Controller & Procurement |
| INJ-1-1-080 | Isi Form Update Item | Requestor |
| INJ-1-1-090 | Approve Permintaan Update Item | Finance Accounting |
| INJ-1-1-100 | Update Attribute Item | Admin Marketing Budget Controller & Procurement |

### Kebijakan INJ-1-1
- Master item non-marketing dibuat di **Kudus** berdasarkan input dari OU Jakarta.

---

## 5. INJ-2-1: Move Order Issue

### Gambaran Umum
Proses transaksi pengeluaran atau pemusnahan stok barang sesuai permintaan user selama fisik barang masih ada.

**Contoh penggunaan:**
- Mengeluarkan barang untuk memenuhi permintaan departemen
- Mengeluarkan barang untuk pemusnahan barang rusak (reject)
- Mengeluarkan barang untuk pengiriman Dummy Pack ke vendor Table Top

**Setiap pengeluaran harus membuat Berita Acara sebagai verifikasi.**
**Dijalankan di sistem oleh Admin Marketing Service.**

### Katalog Tahapan INJ-2-1

| No | Deskripsi | Agent |
|---|---|---|
| INJ-2-1-10 | Request pengeluaran/pemusnahan barang | Requestor |
| INJ-2-1-20 | Memusnahkan Fisik Barang | Admin Gudang |
| INJ-2-1-30 | Membuat Berita Acara | Admin Gudang |
| INJ-2-1-40 | Membuat Move Order Issue | Admin Marketing Service |
| INJ-2-1-50 | Allocate Move Order | Admin Marketing Service |
| INJ-2-1-60 | Transact Move Order | Admin Marketing Service |

---

## 6. INJ-2-2: Move Order Transfer

### Gambaran Umum
Proses perpindahan barang antar area (subinventory).

**Contoh penggunaan:**
- Pemindahan barang rusak dari MKT.GOOD ke MKT.REJECT
- Karantina barang yang ditunda pemakaiannya
- Memindahkan kembali barang yang sudah dapat digunakan ke MKT.GOOD

**Dijalankan di sistem oleh Admin Marketing Service.**

### Katalog Tahapan INJ-2-2

| No | Deskripsi | Agent |
|---|---|---|
| INJ-2-2-10 | Request perpindahan barang | Requestor |
| INJ-2-2-20 | Membuat Move Order Transfer | Admin Marketing Service |
| INJ-2-2-30 | Allocate Move Order Transfer | Admin Marketing Service |
| INJ-2-2-40 | Transact Move Order Transfer | Admin Marketing Service |

---

## 7. INJ-2-3: Physical Inventory

### Gambaran Umum
Proses stock opname periodik untuk memastikan jumlah barang di sistem sesuai dengan gudang fisik.

**Alur proses:**
1. Admin Marketing Service mencetak laporan Physical Inventory Tag Listing dan Physical Inventory Tag
2. Admin Gudang melakukan perhitungan fisik
3. Hasil stock opname di-upload ke sistem via **custom interface program**
4. Penghitungan ulang dapat dilakukan jika diperlukan
5. Approval untuk adjustment dilakukan oleh **Brand Directive Manager**

> Jika dalam 1 PT ada lebih dari 1 Brand Directive Manager, perlu ditentukan 1 orang yang akan approve untuk gudang tersebut.

### Katalog Tahapan INJ-2-3

| No | Deskripsi | Agent |
|---|---|---|
| INJ-2-3-010 | Request Perform Physical Inventory | Admin Marketing Service |
| INJ-2-3-020 | Define Physical Inventory | Admin Marketing Service |
| INJ-2-3-030 | Take Snapshot Inventory | Admin Marketing Service |
| INJ-2-3-040 | Generate Tag Sheet | Admin Marketing Service |
| INJ-2-3-050 | Cetak Laporan untuk Stock Opname | Admin Marketing Service |
| INJ-2-3-060 | Eksekusi Perhitungan Physical | Admin Gudang |
| INJ-2-3-070 | Upload Hasil Hitung Physical Inventory (via custom interface) | Admin Marketing Service |
| INJ-2-3-080 | Cetak Laporan Hasil Physical Inventory | Admin Marketing Service |
| INJ-2-3-090 | Investigasi Variance | Admin Marketing Service |
| INJ-2-3-100 | Approve Inventory Adjustment | Brand Directive Manager |
| INJ-2-3-110 | Print Inventory Count Result | Admin Marketing Service |
| INJ-2-3-120 | Launch Adjustment | Admin Marketing Service |

---

## 8. INJ-2-4: Cycle Count

### Gambaran Umum
Proses ad-hoc untuk memastikan jumlah barang di sistem untuk satu atau sekelompok item sesuai dengan fisik gudang.

**Aturan adjustment:**
- Stok sistem < stok fisik → **Miscellaneous Receipt** (Adj Plus)
- Stok sistem > stok fisik → **Move Order Issue** (Adj Minus)

**Jika adjustment tidak perlu dilakukan:** Admin Marketing Service menginformasikan ke user (biasanya karena stok sistem sudah benar dan perlu tindakan terhadap fisiknya).

### Katalog Tahapan INJ-2-4

| No | Deskripsi | Agent |
|---|---|---|
| INJ-2-4-10 | Inisiasi Cycle Count | Admin Gudang |
| INJ-2-4-20 | Cetak Laporan Stock Inventory | Admin Marketing Services |
| INJ-2-4-30 | Eksekusi Perhitungan | Admin Gudang |
| INJ-2-4-40 | Verifikasi Hasil Cycle Count | Admin Gudang |
| INJ-2-4-50 | Buat Berita Acara Adjustment | Admin Gudang, Admin Marketing Service |
| INJ-2-4-60 | Verifikasi Berita Acara Adjustment | Brand Directive Manager |
| INJ-2-4-70 | Miscellaneous Receipt (jika stok sistem < fisik) | Admin Marketing Service |
| RRJ-2-1 | Move Order Issue (jika stok sistem > fisik) | Admin Marketing Service |
| INJ-2-4-80 | Informasikan ke User Tidak Jadi Adjustment | Admin Gudang, Admin Marketing Service |

---

## 9. INJ-2-5: Miscellaneous Receipt

### Gambaran Umum
Penerimaan barang secara administratif. Digunakan untuk koreksi menambah stok karena kesalahan transaksi (qty transaksi > qty seharusnya). Nomor dokumen pendukung/Berita Acara dicatatkan pada transaksi.

> Jika fisik barang masih ada, proses pengeluaran/pemusnahan dilakukan melalui Move Order Issue, bukan Miscellaneous Receipt.

### Katalog Tahapan INJ-2-5

| No | Deskripsi | Agent |
|---|---|---|
| INJ-2-5-10 | Info Kesalahan Issue Qty | Admin Gudang |
| INJ-2-5-20 | Miscellaneous Receipt di sistem | Admin Marketing Service |

---

## 10. INJ-2-6: SubInventory Transfer

### Gambaran Umum
Perpindahan barang secara administratif (berdasarkan dokumen dari cabang bahwa fisik sudah terlebih dahulu dipindahkan).

**Contoh penggunaan:**
- Barang rusak dipindahkan ke MKT.REJECT dari hasil pemeriksaan
- Penundaan/karantina barang ke MKT.REJECT
- Barang yang selesai karantina dikembalikan ke MKT.GOOD

> Jika fisik barang masih ada, perpindahan dilakukan melalui Move Order Transfer.

---

## 11. INJ-2-7 & INJ-2-8: Transfer dan Penerimaan Antar Gudang

### INJ-2-7: Pencatatan Transfer Antar Cabang
Proses pengiriman (transfer) antar Cabang yang dimodelkan sebagai IO di sistem OU Jakarta.

**Digunakan saat:**
- Dari IO JKT ke IO DC/Cabang (atau sebaliknya)
- Dari IO DC ke IO Cabang (atau sebaliknya)
- Antar Cabang
- Pengiriman kembali ke gudang asal (untuk kasus barang hilang/kurang)

### Katalog Tahapan INJ-2-7

| No | Deskripsi | Agent |
|---|---|---|
| INJ-2-7-10 | Menyiapkan Barang dan Menentukan Tujuan | Admin Gudang, Admin Marketing Service |
| INJ-2-7-20 | Pencatatan Transaksi (Inter-Org Transfer) | Admin Marketing Service |
| INJ-2-7-30 | Cetak Surat Jalan | Admin Marketing Service |
| INJ-2-7-40 | Menginformasikan Pengiriman ke Cabang | Admin Cabang |

### Kebijakan INJ-2-7
- Jika ada biaya pengiriman, input melalui PR PO sesuai Project Task yang digunakan.

### INJ-2-8: Pencatatan Penerimaan Antar Cabang
**Aturan:** Setiap pengiriman satu nomor surat jalan harus diterima semua qty-nya (tidak ada penerimaan parsial).

**Penanganan ketidaksesuaian:**
- **Barang kurang:** Gudang penerima melakukan transfer kembali ke gudang asal secara administratif
- **Barang hilang dalam perjalanan:** Buat Berita Acara → kirim kembali stok ke gudang asal untuk ditindaklanjuti
- **Barang rusak dalam perjalanan:** Ajukan pengeluaran → musnahkan → Move Order Issue

---

## 12. INJ-2-9: Inspeksi Barang Rusak

### Gambaran Umum
Proses inspeksi saat barang rusak/cacat ditemukan. Admin Gudang melakukan Move Order Transfer ke subinventory MKT.REJECT, kemudian menginformasikan ke Admin Marketing Service → Buyer → Rekanan.

**Keputusan rekanan:**
- **Retur** → proses pengembalian barang marketing
- **Musnah** → pengeluaran barang via Move Order Issue

> Untuk item expense: **tidak diperkenankan proses tukar guling** agar pengakuan expense saat penerimaan terjadi di periode yang sama dengan penerimaan awalnya.

---

## 13. INJ-3-1: Period End Closing

### Gambaran Umum
Proses buka/tutup periode inventory. Bertujuan untuk:
- Memastikan tidak ada transaksi pending di gudang
- Memastikan semua jurnal transaksi penerimaan sudah terkirim ke GL
- Memastikan periode gudang sudah ditutup untuk periode GL yang akan ditutup
- Memastikan periode gudang sudah dibuka untuk periode GL selanjutnya

> **Perhatian:** Untuk period yang sudah ditutup **tidak bisa dibuka kembali**.

### Katalog Tahapan INJ-3-1

| No | Deskripsi | Frekuensi | Agent |
|---|---|---|---|
| INJ-3-1-10 | Review Material Transaction | Bulanan | Admin Marketing Service |
| INJ-3-1-20 | Verifikasi Transaksi Pada Periode Tersebut | Bulanan | Admin Marketing Service |
| INJ-3-1-30 | Run Create Accounting Final (mode: Final – Post) | Bulanan | Admin Marketing Budget Controller & Procurement |
| INJ-3-1-40 | Close Period Saat Ini | Bulanan | Admin Marketing Budget Controller & Procurement |
| INJ-3-1-50 | Open Period Selanjutnya | Bulanan | Admin Marketing Budget Controller & Procurement |

### Kebijakan INJ-3-1
- Create Accounting di modul Cost Management dipegang oleh **Finance Accounting**.

---

## 14. Daftar Laporan Inventory OU Jakarta

| No | Nama Laporan | Tujuan |
|---|---|---|
| 1 | Cetak Laporan Physical Inventory Listing | Daftar stock opname |
| 2 | Cetak Laporan Stock Inventory | Daftar stock inventory |
| 3 | Cetak Surat Jalan | Surat Jalan transfer antar gudang (Inter-Org) |
| 4 | Cetak Laporan Pengeluaran Barang | Laporan barang keluar |
| 5 | Laporan Stok Barang Promosi | Laporan stok barang promosi per merk rokok |
| 6 | Laporan PO ke GRV | Laporan penerimaan barang dari PO |
| 7 | Laporan Stock Opname (Kudus) | Laporan stock opname |
| 8 | Laporan Persediaan (Kudus) | Laporan kartu stok barang |

---

## 15. Analisa Gap

| Kebutuhan | Oracle Mapping | Gap | Solusi |
|---|---|---|---|
| (Tidak ada gap yang didokumentasikan di INJ) | — | — | — |
