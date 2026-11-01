# 05 — Standar Golang

> Bagian dari [Standar High-Code Development](../README.md) · Tim PANDAWA

| Atribut | Nilai |
|---|---|
| Prefix ID aturan | `GO` |
| Status | **Draft** |
| Versi | 0.2.0 |
| File aturan | [`Standar_Golang.xlsx`](Standar_Golang.xlsx) — sumber utama |
| Konfigurasi linter | [`.golangci.yml`](.golangci.yml) (golangci-lint v2) |
| Pembaruan terakhir | 2026-11-01 |

## Ringkasan

Standar penulisan Go untuk Tim PANDAWA. Aturan GO-1xx s.d. GO-5xx diparafrasekan dari **Uber Go Style Guide**; GO-6xx adalah tambahan PANDAWA untuk nominal uang, database, context, timeout, logging, secret, supply chain, dan container. Go dipakai terutama untuk middleware integrasi SAP.

| Jumlah aturan | WAJIB | DILARANG | SEBAIKNYA | Ditegakkan linter |
|:-:|:-:|:-:|:-:|:-:|
| 77 | 38 | 7 | 32 | 30 (39%) |

## Berlaku untuk

| Mandiri | Oracle EBS | SAP |
|:-:|:-:|:-:|
| K | — | W |

`W` = wajib · `K` = kondisional (bila Go dipakai) · `—` = tidak berlaku

## Cara Memakai

1. Salin [`.golangci.yml`](.golangci.yml) ke root repo aplikasi.
2. Jalankan sebelum membuka pull request:
   ```bash
   gofmt -l . && golangci-lint run ./... && go test -race ./... && govulncheck ./...
   ```
3. Pasang perintah yang sama di pipeline CI; temuan memblokir merge (GO-502).
4. Aturan yang ditegakkan lewat review diperiksa dengan [`checklist-review.md`](checklist-review.md).
5. Pengecualian linter ditulis `//nolint:<linter> // <alasan>` (GO-503). Penyimpangan dari aturan WAJIB/DILARANG memakai [waiver](../waiver/).

## Adaptasi terhadap Uber Go Style Guide

| Aturan | Uber | PANDAWA | Alasan |
|---|---|---|---|
| GO-119 | `go.uber.org/atomic` | Tipe atomic bertipe dari `sync/atomic` | Tersedia di standard library sejak Go 1.19; tidak menambah dependency |
| GO-126 | Tag wajib, gaya nama bebas | Tag wajib, JSON **camelCase** | Selaras kontrak API PANDAWA |
| GO-315 | Kembalikan `nil` untuk slice kosong | Tetap, kecuali respons API yang kontraknya array → `[]T{}` | Slice `nil` diserialisasi JSON sebagai `null` |
| GO-502 | Linter minimum: errcheck, goimports, revive, govet, staticcheck | Minimum Uber + 24 linter tambahan dan formatter gofmt | Menegakkan lebih banyak aturan secara otomatis |

## Daftar Aturan

Ringkasan dari [`Standar_Golang.xlsx`](Standar_Golang.xlsx). Alasan, contoh benar/salah, dan catatan lengkap ada di file Excel.

### GO-1xx — Pedoman (28 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `GO-101` | DILARANG | Interface diteruskan sebagai nilai. Pointer ke interface tidak dipakai. | review |
| `GO-102` | SEBAIKNYA | Tipe yang kontraknya wajib memenuhi sebuah interface diverifikasi saat kompilasi dengan assertion var _. | review |
| `GO-103` | SEBAIKNYA | Receiver dalam satu tipe konsisten. Pakai receiver pointer bila method mengubah data atau struct-nya besar. | recvcheck |
| `GO-104` | WAJIB | sync.Mutex / sync.RWMutex dipakai sebagai field non-pointer yang tidak diekspor, tidak di-embed dan tidak dibuat dengan new. | review |
| `GO-105` | WAJIB | Slice dan map disalin di batas API: saat diterima lalu disimpan, dan saat state internal dikembalikan ke pemanggil. | review |
| `GO-106` | WAJIB | Resource (file, lock, rows, response body, koneksi) dilepas dengan defer segera setelah berhasil didapat. rows.Err() diperiksa setelah iterasi. | bodyclose, sqlclosecheck, rowserrcheck |
| `GO-107` | SEBAIKNYA | Channel tidak di-buffer atau berukuran 1. Ukuran lain wajib disertai komentar: dasar ukurannya dan perilaku saat penuh. | review |
| `GO-108` | SEBAIKNYA | Enum dengan iota dimulai dari 1, kecuali nilai nol memang default yang diinginkan. | review |
| `GO-109` | WAJIB | Instan waktu memakai time.Time, periode memakai time.Duration. Pilih AddDate untuk hari kalender, Add untuk durasi tepat. | review |
| `GO-110` | WAJIB | Waktu yang dipertukarkan dengan sistem luar memakai time.Time / RFC 3339 dengan zona waktu. Bila harus angka, satuannya ditulis di nama field. | review |
| `GO-111` | SEBAIKNYA | Jenis error dipilih sesuai kebutuhan: errors.New untuk pesan statis, fmt.Errorf untuk pesan dinamis, var Err... bila pemanggil perlu mencocokkan, tipe custom bila dinamis dan perlu dicocokkan. | review |
| `GO-112` | SEBAIKNYA | Error yang diteruskan diberi konteks singkat dengan fmt.Errorf. Gunakan %w bila pemanggil perlu mencocokkan penyebabnya. Hindari frasa "gagal ..." / "failed to". | review |
| `GO-113` | WAJIB | Error dicocokkan dengan errors.Is / errors.As, bukan dengan == atau type assertion langsung. | errorlint |
| `GO-114` | WAJIB | Variabel error global diberi prefix Err (diekspor) atau err (tidak diekspor). Tipe error custom berakhiran Error. | errname |
| `GO-115` | WAJIB | Setiap error ditangani satu kali: dikembalikan (dibungkus) ATAU dicatat lalu ditangani. Tidak dicatat lalu dikembalikan. | review |
| `GO-116` | WAJIB | Error yang dikembalikan fungsi selalu diperiksa. Bila sengaja diabaikan, tulis _ = dan komentar alasannya. | errcheck |
| `GO-117` | WAJIB | Type assertion memakai bentuk comma-ok. | forcetypeassert, errcheck (check-type-assertions) |
| `GO-118` | DILARANG | Kode produksi tidak memakai panic untuk menangani error; fungsi mengembalikan error. Panic hanya untuk kegagalan inisialisasi program. Test memakai t.Fatal. | review |
| `GO-119` | WAJIB | Operasi atomic memakai tipe atomic bertipe dari sync/atomic (atomic.Int64, atomic.Bool, ...). | review |
| `GO-120` | DILARANG | Variabel global tidak diubah saat runtime, termasuk function pointer. Gunakan dependency injection. | review |
| `GO-121` | SEBAIKNYA | Hindari meng-embed tipe di struct yang diekspor. Tulis method delegasi yang memang dibutuhkan. | review |
| `GO-122` | DILARANG | Nama bawaan Go (error, string, len, new, copy, ...) tidak dipakai sebagai identifier. | predeclared, revive (redefines-builtin-id) |
| `GO-123` | SEBAIKNYA | Hindari init(). Bila tak terhindarkan: deterministik, tanpa I/O, tanpa membaca environment, dan tidak bergantung pada init() lain. | gochecknoinits |
| `GO-124` | DILARANG | init() tidak menjalankan goroutine. | gochecknoinits |
| `GO-125` | WAJIB | os.Exit / log.Fatal hanya dipanggil di main(), paling banyak satu kali. Logika program ada di run() yang mengembalikan error. | revive (deep-exit) |
| `GO-126` | WAJIB | Field struct yang di-marshal (JSON, YAML) wajib diberi tag. Nama field JSON memakai camelCase. | musttag, tagliatelle |
| `GO-127` | WAJIB | Tidak ada goroutine fire-and-forget. Setiap goroutine punya waktu berhenti yang pasti atau sinyal berhenti, dan dapat ditunggu sampai selesai (WaitGroup atau channel done). | review |
| `GO-128` | WAJIB | Package yang butuh goroutine latar mengekspos objek dengan method Close / Stop / Shutdown yang menghentikan goroutine dan menunggu sampai selesai. | review |

### GO-2xx — Performa (3 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `GO-201` | SEBAIKNYA | Konversi tipe primitif ke/dari string memakai strconv, bukan fmt. | perfsprint |
| `GO-202` | SEBAIKNYA | Konversi string tetap ke []byte dilakukan sekali, di luar loop. | review |
| `GO-203` | SEBAIKNYA | Kapasitas slice dan map ditentukan saat dibuat bila ukurannya diketahui. | prealloc |

### GO-3xx — Gaya (25 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `GO-301` | SEBAIKNYA | Panjang baris dibatasi secara lunak 99 karakter. | review |
| `GO-302` | WAJIB | Gaya dalam satu codebase konsisten. Perubahan gaya diterapkan minimal per package. | review |
| `GO-303` | SEBAIKNYA | Deklarasi yang berkaitan (import, const, var, type) dikelompokkan dalam satu blok; yang tidak berkaitan tidak digabung. | review |
| `GO-304` | WAJIB | Import dibagi dua kelompok: standard library, lalu lainnya. | goimports |
| `GO-305` | WAJIB | Nama package huruf kecil, singkat, tanpa underscore atau huruf kapital, bentuk tunggal, dan bukan nama generik (util, common, shared, lib). | review |
| `GO-306` | WAJIB | Nama fungsi memakai MixedCaps. Fungsi test boleh memakai underscore untuk mengelompokkan kasus (TestHitung_Diskon). | revive (var-naming) |
| `GO-307` | WAJIB | Alias import hanya dipakai bila nama package berbeda dari elemen terakhir path, atau ada konflik nama. | review |
| `GO-308` | SEBAIKNYA | Urutan dalam file: type, const, var; konstruktor setelah tipenya; method dikelompokkan per receiver; fungsi utilitas di akhir. Fungsi diurutkan kira-kira sesuai alur pemanggilan. | review |
| `GO-309` | SEBAIKNYA | Kurangi nesting: tangani error dan kondisi khusus lebih dulu, lalu return atau continue lebih awal. | nestif |
| `GO-310` | SEBAIKNYA | Hindari else yang tidak perlu: isi nilai default lalu timpa dengan satu if. | revive (indent-error-flow, superfluous-else) |
| `GO-311` | SEBAIKNYA | Variabel tingkat atas dideklarasikan dengan var tanpa tipe, kecuali tipe yang diinginkan berbeda dari tipe ekspresinya. | review |
| `GO-312` | SEBAIKNYA | Variabel dan konstanta tingkat atas yang tidak diekspor diberi prefix _. Pengecualian: nilai error memakai prefix err. | review |
| `GO-313` | SEBAIKNYA | Field embedded ditulis di atas daftar field dan dipisah satu baris kosong. Embed hanya bila semua method dan field-nya memang layak menjadi bagian tipe luar; mutex tidak pernah di-embed. | embeddedstructfieldcheck |
| `GO-314` | SEBAIKNYA | Variabel lokal yang langsung diberi nilai memakai :=. Nilai nol yang disengaja (mis. slice kosong) memakai var. | review |
| `GO-315` | SEBAIKNYA | nil adalah slice yang sah: periksa kosong dengan len(s) == 0, bukan s == nil; slice nol (var s []T) langsung dipakai. | review |
| `GO-316` | SEBAIKNYA | Cakupan variabel dipersempit (mis. if err := ...; err != nil) selama tidak menambah nesting. | review |
| `GO-317` | SEBAIKNYA | Hindari parameter telanjang yang maknanya tidak jelas (bool, literal). Beri komentar /* nama */ atau ganti bool dengan tipe khusus. | review |
| `GO-318` | SEBAIKNYA | Gunakan raw string literal (backtick) untuk menghindari escape, misalnya SQL multi-baris atau regex. | review |
| `GO-319` | WAJIB | Struct diinisialisasi dengan nama field. Test table dengan 3 field atau kurang boleh tanpa nama field. | govet (composites) |
| `GO-320` | SEBAIKNYA | Field bernilai nol tidak ditulis saat inisialisasi, kecuali nama field memberi konteks penting. | review |
| `GO-321` | SEBAIKNYA | Struct bernilai nol dideklarasikan dengan var. | review |
| `GO-322` | SEBAIKNYA | Referensi struct dibuat dengan &T{}, bukan new(T). | review |
| `GO-323` | SEBAIKNYA | Map kosong atau yang diisi lewat program dibuat dengan make (beserta perkiraan ukuran bila ada). Map berisi daftar tetap memakai literal. | review |
| `GO-324` | SEBAIKNYA | Format string Printf yang dideklarasikan di luar pemanggilan dijadikan const. | govet (printf) |
| `GO-325` | WAJIB | Fungsi bergaya Printf diberi nama berakhiran f (Wrapf, Logf). | goprintffuncname |

### GO-4xx — Pola (4 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `GO-401` | SEBAIKNYA | Logika yang diuji dengan banyak kondisi memakai table-driven test dengan subtest. Slice bernama tests, kasus bernama tt, field masukan dan harapan berprefix give dan want. | review |
| `GO-402` | WAJIB | Test table tidak berisi logika bercabang di dalam loop. Bila perlu, pecah menjadi beberapa tabel atau fungsi test. | review |
| `GO-403` | SEBAIKNYA | Konstruktor dan API publik dengan argumen opsional, terutama tiga argumen atau lebih, memakai functional options. | review |
| `GO-404` | SEBAIKNYA | Package yang menjalankan goroutine diuji kebocoran goroutine-nya dengan goleak. | review |

### GO-5xx — Linting dan tooling (4 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `GO-501` | WAJIB | Seluruh kode lulus gofmt dan goimports. | golangci-lint formatters: gofmt, goimports |
| `GO-502` | WAJIB | golangci-lint dijalankan di CI dengan .golangci.yml standar dari folder ini; temuan memblokir merge. | golangci-lint v2 |
| `GO-503` | WAJIB | Setiap //nolint menyebut nama linter dan alasan. | nolintlint |
| `GO-504` | WAJIB | Test dijalankan di CI dengan detektor race (go test -race). | go test |

### GO-6xx — Tambahan PANDAWA (13 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `GO-601` | WAJIB | Versi Go adalah salah satu dari dua rilis mayor terbaru yang didukung resmi, ditetapkan di go.mod. | review |
| `GO-602` | DILARANG | Nominal uang dan kuantitas memakai tipe desimal (mis. github.com/shopspring/decimal). float32 / float64 tidak dipakai untuk nominal. | review |
| `GO-603` | WAJIB | Nominal di JSON dikirim dan diterima sebagai string desimal. | review |
| `GO-604` | WAJIB | Query database selalu berparameter. SQL tidak disusun dari input pengguna. | review |
| `GO-605` | WAJIB | Fungsi yang melakukan I/O menerima context.Context sebagai parameter pertama dan meneruskannya sampai ke database / HTTP. Context tidak disimpan di struct. | contextcheck, containedctx, noctx |
| `GO-606` | WAJIB | Setiap panggilan keluar (HTTP, database, API SAP) punya timeout eksplisit. http.DefaultClient dan http.Client tanpa Timeout tidak dipakai. | review |
| `GO-607` | WAJIB | Log memakai log/slog format JSON dengan pesan konstan dan atribut correlationId. Kredensial, token, harga, dan data pribadi tidak pernah ditulis ke log. | sloglint (sebagian) + review |
| `GO-608` | WAJIB | Secret dibaca dari environment atau secret store saat start, tidak ada di kode atau repo. Konfigurasi divalidasi saat start dan layanan berhenti bila tidak valid. | gosec (G101), Gitleaks |
| `GO-609` | WAJIB | go.mod dan go.sum di-commit; build CI memakai -mod=readonly. Modul baru direview nama, pemelihara, dan aktivitasnya sebelum dipakai. | review |
| `GO-610` | WAJIB | govulncheck dijalankan di CI; kerentanan yang sudah punya perbaikan memblokir build. | govulncheck |
| `GO-611` | WAJIB | Error ke klien API memakai kode error domain terdaftar. Error bisnis dipisah dari error teknis; detail teknis hanya ditulis di log. | review |
| `GO-612` | WAJIB | Image container minimal, proses berjalan sebagai non-root, image dasar dikunci (digest) dan dipindai sebelum rilis. | Trivy |
| `GO-613` | DILARANG | Verifikasi token dan otorisasi tidak dapat dimatikan lewat konfigurasi. | review |

## Bukti Penegakan

Konfigurasi [`.golangci.yml`](.golangci.yml) diuji pada 1 November 2026 dengan golangci-lint 2.5.0 dan Go 1.24:

- [`examples/benar`](examples/benar/) — **0 temuan**; test (`go test -race`) lulus.
- [`examples/salah`](examples/salah/) — linter menangkap pelanggaran GO-104, GO-106, GO-113, GO-116, GO-117, GO-123, GO-125, GO-126, GO-201, GO-605, GO-606, GO-607, dan GO-608.
- Diuji terpisah dan tertangkap: GO-103 (recvcheck), GO-114 (errname), GO-122 (predeclared), GO-126 camelCase (tagliatelle).
- **Tidak tertangkap:** SQL yang disusun dari input (GO-604) tidak dideteksi gosec G201/G202 pada versi ini. GO-604 karena itu ditegakkan lewat review.

## Referensi

- Uber Go Style Guide — https://github.com/uber-go/guide/blob/master/style.md (commit 1d60a91, 15 April 2026). Lisensi Apache-2.0; aturan diparafrasekan dan contoh kode ditulis ulang.
- Effective Go — https://go.dev/doc/effective_go
- Go Code Review Comments — https://go.dev/wiki/CodeReviewComments
- golangci-lint — https://golangci-lint.run

## Isi Folder

| File | Isi |
|---|---|
| `README.md` | Dokumen ini |
| [`Standar_Golang.xlsx`](Standar_Golang.xlsx) | Daftar aturan lengkap (sumber utama) |
| [`.golangci.yml`](.golangci.yml) | Konfigurasi linter standar |
| [`checklist-review.md`](checklist-review.md) | Checklist review untuk aturan yang tidak dapat dicek linter |
| [`examples/`](examples/) | Contoh kode benar dan salah (modul Go yang dapat dikompilasi) |
| [`CHANGELOG.md`](CHANGELOG.md) | Riwayat perubahan |
