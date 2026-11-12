## Ringkasan

<!-- Apa yang diubah dan kenapa? Tautkan issue: "Closes #123" -->

**Task / CR ID:**
**Kategori perubahan:** <!-- Emergency / Standard / Normal / Major -->

## Jenis perubahan

- [ ] 🐛 Bug fix
- [ ] ✨ Fitur baru
- [ ] ♻️ Refactor / perbaikan performa
- [ ] 📝 Dokumentasi
- [ ] 🔧 Konfigurasi / CI/CD

## Komponen terdampak

- [ ] Oracle EBS (modul: ____ )
- [ ] Oracle APEX (App ID: ____ )
- [ ] ORDS / REST
- [ ] Access Vault Portal
- [ ] Skills / dokumentasi / situs (`docs/`)

## Objek yang berubah

<!-- Daftar package, view, table, halaman APEX, dll. -->

## Cara test

<!-- Langkah test di DEV dan hasilnya. Lampirkan screenshot bila ada perubahan UI. -->

## Rollback

<!-- Langkah/script rollback bila deploy gagal. -->

## Checklist

- [ ] Mengikuti [Naming Convention](https://github.com/iwanhe/pandawa/blob/main/naming-convention-oracle.md) (`XTD_` / `APX_`) dan [Oracle Dev Standards v1.1](https://github.com/iwanhe/pandawa/blob/main/oracle-dev-standards-v1.1.md)
- [ ] Commit memakai prefix Task ID
- [ ] Sudah di-export dengan ADT (`adt export_db` / `adt export_apex`)
- [ ] Sudah dites di DEV
- [ ] Script rollback tersedia
- [ ] Tidak ada password, wallet, token, atau data produksi
- [ ] Lolos APEX SERT (untuk perubahan APEX)
- [ ] Dokumentasi / README diperbarui bila perlu
