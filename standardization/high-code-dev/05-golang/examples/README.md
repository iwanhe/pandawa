# Contoh Kode — Golang

Modul Go kecil yang menunjukkan aturan Standar Golang. Setiap file diawali ID aturan yang dicontohkan.

```
examples/
├── go.mod, go.sum
├── benar/                      mematuhi standar  → golangci-lint: 0 temuan
│   ├── GO-104_mutex_sebagai_field.go
│   ├── ...
│   └── cmd/GO-125_exit_sekali/main.go
└── salah/                      sengaja melanggar → linter harus menemukan pelanggaran
    ├── GO-104_mutex_di_embed.go
    ├── ...
    └── cmd/GO-125_exit_di_banyak_tempat/main.go
```

## Menjalankan

Dari folder `examples` (konfigurasi `../.golangci.yml` ditemukan otomatis):

```bash
go build ./... && go test -race ./...
golangci-lint run ./benar/...   # harus 0 temuan
golangci-lint run ./salah/...   # harus menampilkan pelanggaran
```

Paket `salah` dikompilasi normal; pelanggarannya ada di gaya dan keamanan, bukan di sintaks. Folder ini juga berfungsi sebagai uji regresi: bila `.golangci.yml` diubah, jalankan dua perintah lint di atas dan pastikan hasilnya tetap sama.

## Aturan menulis contoh

- Contoh sesingkat mungkin, hanya cukup untuk menunjukkan aturannya.
- Tidak berisi data, nama server, atau kredensial asli (kredensial di `GO-608_secret_di_kode.go` adalah nilai acak untuk memicu gosec).
- Komentar di contoh `salah` menyebut aturan yang dilanggar.
