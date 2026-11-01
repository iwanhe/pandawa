# Checklist Review — Golang

Dipakai reviewer bersama [checklist PR umum](../templates/checklist-pr-umum.md). Isi kolom hasil dengan **Ya**, **Tidak**, atau **N/A**. Setiap **Tidak** dirujuk ke ID aturan di komentar review.

## Prasyarat (otomatis, harus hijau sebelum review)

| Periksa | Hasil |
|---|---|
| `golangci-lint run ./...` dengan `.golangci.yml` standar: 0 temuan (GO-502) | |
| `go test -race ./...` lulus (GO-504) | |
| `govulncheck ./...` tanpa kerentanan yang punya perbaikan (GO-610) | |
| Setiap `//nolint` menyebut linter dan alasan, dan alasannya dapat diterima (GO-503) | |

## Aturan yang Diperiksa Manual

Hanya aturan WAJIB/DILARANG dan SEBAIKNYA yang paling sering dilanggar. Daftar lengkap ada di `Standar_Golang.xlsx` (filter kolom Penegakan = Review manual).

### Error

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `GO-111` | SEBAIKNYA | Jenis error dipilih sesuai kebutuhan: errors.New untuk pesan statis, fmt.Errorf untuk pesan dinamis, var Err... bila pemanggil perlu mencocokkan, tipe custom bila dinamis dan perlu dicocokkan. | |
| `GO-112` | SEBAIKNYA | Error yang diteruskan diberi konteks singkat dengan fmt.Errorf. Gunakan %w bila pemanggil perlu mencocokkan penyebabnya. Hindari frasa "gagal ..." / "failed to". | |
| `GO-115` | WAJIB | Setiap error ditangani satu kali: dikembalikan (dibungkus) ATAU dicatat lalu ditangani. Tidak dicatat lalu dikembalikan. | |
| `GO-118` | DILARANG | Kode produksi tidak memakai panic untuk menangani error; fungsi mengembalikan error. Panic hanya untuk kegagalan inisialisasi program. Test memakai t.Fatal. | |

### Konkurensi dan resource

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `GO-104` | WAJIB | sync.Mutex / sync.RWMutex dipakai sebagai field non-pointer yang tidak diekspor, tidak di-embed dan tidak dibuat dengan new. | |
| `GO-107` | SEBAIKNYA | Channel tidak di-buffer atau berukuran 1. Ukuran lain wajib disertai komentar: dasar ukurannya dan perilaku saat penuh. | |
| `GO-119` | WAJIB | Operasi atomic memakai tipe atomic bertipe dari sync/atomic (atomic.Int64, atomic.Bool, ...). | |
| `GO-127` | WAJIB | Tidak ada goroutine fire-and-forget. Setiap goroutine punya waktu berhenti yang pasti atau sinyal berhenti, dan dapat ditunggu sampai selesai (WaitGroup atau channel done). | |
| `GO-128` | WAJIB | Package yang butuh goroutine latar mengekspos objek dengan method Close / Stop / Shutdown yang menghentikan goroutine dan menunggu sampai selesai. | |

### Data, waktu, dan struktur

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `GO-101` | DILARANG | Interface diteruskan sebagai nilai. Pointer ke interface tidak dipakai. | |
| `GO-102` | SEBAIKNYA | Tipe yang kontraknya wajib memenuhi sebuah interface diverifikasi saat kompilasi dengan assertion var _. | |
| `GO-105` | WAJIB | Slice dan map disalin di batas API: saat diterima lalu disimpan, dan saat state internal dikembalikan ke pemanggil. | |
| `GO-108` | SEBAIKNYA | Enum dengan iota dimulai dari 1, kecuali nilai nol memang default yang diinginkan. | |
| `GO-109` | WAJIB | Instan waktu memakai time.Time, periode memakai time.Duration. Pilih AddDate untuk hari kalender, Add untuk durasi tepat. | |
| `GO-110` | WAJIB | Waktu yang dipertukarkan dengan sistem luar memakai time.Time / RFC 3339 dengan zona waktu. Bila harus angka, satuannya ditulis di nama field. | |
| `GO-120` | DILARANG | Variabel global tidak diubah saat runtime, termasuk function pointer. Gunakan dependency injection. | |
| `GO-121` | SEBAIKNYA | Hindari meng-embed tipe di struct yang diekspor. Tulis method delegasi yang memang dibutuhkan. | |
| `GO-305` | WAJIB | Nama package huruf kecil, singkat, tanpa underscore atau huruf kapital, bentuk tunggal, dan bukan nama generik (util, common, shared, lib). | |
| `GO-307` | WAJIB | Alias import hanya dipakai bila nama package berbeda dari elemen terakhir path, atau ada konflik nama. | |

### Uang, database, dan integrasi

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `GO-602` | DILARANG | Nominal uang dan kuantitas memakai tipe desimal (mis. github.com/shopspring/decimal). float32 / float64 tidak dipakai untuk nominal. | |
| `GO-603` | WAJIB | Nominal di JSON dikirim dan diterima sebagai string desimal. | |
| `GO-604` | WAJIB | Query database selalu berparameter. SQL tidak disusun dari input pengguna. | |
| `GO-606` | WAJIB | Setiap panggilan keluar (HTTP, database, API SAP) punya timeout eksplisit. http.DefaultClient dan http.Client tanpa Timeout tidak dipakai. | |
| `GO-611` | WAJIB | Error ke klien API memakai kode error domain terdaftar. Error bisnis dipisah dari error teknis; detail teknis hanya ditulis di log. | |

### Keamanan dan logging

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `GO-607` | WAJIB | Log memakai log/slog format JSON dengan pesan konstan dan atribut correlationId. Kredensial, token, harga, dan data pribadi tidak pernah ditulis ke log. | |
| `GO-613` | DILARANG | Verifikasi token dan otorisasi tidak dapat dimatikan lewat konfigurasi. | |

### Testing

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `GO-402` | WAJIB | Test table tidak berisi logika bercabang di dalam loop. Bila perlu, pecah menjadi beberapa tabel atau fungsi test. | |
| `GO-401` | SEBAIKNYA | Logika yang diuji dengan banyak kondisi memakai table-driven test dengan subtest. Slice bernama tests, kasus bernama tt, field masukan dan harapan berprefix give dan want. | |

### Versi dan supply chain

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `GO-601` | WAJIB | Versi Go adalah salah satu dari dua rilis mayor terbaru yang didukung resmi, ditetapkan di go.mod. | |
| `GO-609` | WAJIB | go.mod dan go.sum di-commit; build CI memakai -mod=readonly. Modul baru direview nama, pemelihara, dan aktivitasnya sebelum dipakai. | |
