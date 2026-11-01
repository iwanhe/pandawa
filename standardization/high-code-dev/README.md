# Standar High-Code Development — Tim PANDAWA

> **IT Upstream Development · Karya Cipta Solusi Internasional (KCSI)**
> Standar rekayasa perangkat lunak untuk aplikasi high-code di lingkungan Nojorono Group.

| Atribut | Nilai |
|---|---|
| Lokasi | `pandawa/standardization/high-code-dev` |
| Status | **DRAFT**: kerangka disiapkan, isi tiap standar menyusul |
| Pemilik | Development Manager, IT Upstream Development |
| Pembaruan terakhir | 1 November 2026 |

---

## 1. Tujuan

Folder ini adalah **pintu masuk tunggal** untuk seluruh standar coding dan arsitektur high-code Tim PANDAWA. Tujuannya:

1. **Satu kerangka untuk semua kondisi.** Aturan yang sama berlaku untuk aplikasi mandiri, aplikasi yang memperpanjang Oracle EBS, dan aplikasi yang memperpanjang SAP S/4HANA. Yang berbeda hanya profil implementasinya.
2. **Kode yang dapat dipelihara siapa pun di tim.** Penamaan, struktur, dan pola yang seragam membuat developer bisa berpindah aplikasi tanpa harus belajar ulang.
3. **Kualitas dan keamanan yang dapat diperiksa otomatis.** Sebanyak mungkin aturan ditegakkan lewat linter, scanner, dan pipeline CI, bukan hanya lewat review manual.
4. **Onboarding lebih cepat.** Developer baru (termasuk junior) punya rujukan yang jelas: apa yang wajib, apa yang dilarang, dan contohnya.

---

## 2. Ruang Lingkup: Tiga Kondisi Aplikasi

| Profil | Kondisi | Contoh |
|---|---|---|
| **Mandiri** | Aplikasi satelit tanpa integrasi ERP (saat ini) | Tool internal, aplikasi operasional baru |
| **Oracle EBS** | Aplikasi satelit, tool operasional, atau middleware yang memperpanjang Oracle EBS 12.2 | Aplikasi Oracle APEX + ORDS + PL/SQL di atas EBS |
| **SAP** | Aplikasi satelit, tool operasional, atau middleware yang memperpanjang SAP S/4HANA Cloud (GROW) | Middleware integrasi, satelit yang bertransaksi ke SAP |

Aplikasi mandiri **wajib dibangun siap menjadi satelit**, sehingga kelak bisa dihubungkan ke EBS atau SAP tanpa ditulis ulang.

**Di luar ruang lingkup:** konfigurasi fungsional ERP, serta extension di dalam SAP (key-user / ABAP Cloud) yang mengikuti standar tim SAP.

---

## 3. Prinsip Dasar (berlaku untuk semua standar)

| # | Prinsip | Makna singkat |
|---|---|---|
| 1 | **Extension, bukan modification** | Objek standar ERP (Oracle maupun core SAP) tidak pernah diubah. |
| 2 | **ERP hanya lewat jalur resmi** | EBS: public API / open interface yang dibungkus package custom. SAP: released API dan event. Tidak ada DML langsung ke database ERP. |
| 3 | **Keamanan di server** | Otorisasi dan kalkulasi bisnis diputuskan di backend atau database, bukan di UI. |
| 4 | **Tidak ada secret di kode** | Password, token, dan kunci disimpan di secret store, bukan di repo atau tabel tanpa enkripsi. |
| 5 | **Integrasi aman diulang** | Setiap transaksi integrasi idempoten, punya ID korelasi, status per record, dan dapat direkonsiliasi. |
| 6 | **Uang dengan tipe desimal eksak** | Floating point dilarang untuk nominal keuangan. |
| 7 | **Query berparameter** | SQL tidak pernah disusun dari input pengguna tanpa bind variable atau placeholder. |
| 8 | **Otomatis lebih dulu** | Aturan yang bisa dicek alat (format, lint, scan, test) wajib masuk pipeline CI. |
| 9 | **Guardrail, bukan rel** | Mulai dari kebutuhan bisnis. Bila standar membuat solusi lebih rumit dari masalahnya, ajukan pengecualian (ADR / waiver). |

---

## 4. Kerangka Arsitektur

Semua profil memakai **tujuh lapisan** dengan ID slot yang sama. Profil hanya mengisi komponennya.

```
┌──────────────────────────────────────────────────────────────┐
│ 7  Lintas Lapisan   identitas · secret · CI/CD · observability│
│                     · container · pemindaian keamanan · backup│
├──────────────────────────────────────────────────────────────┤
│ 1  Edge & API       reverse proxy · API gateway               │
│ 2  Experience       portal web · approval inbox · design sys. │
│ 3  Core Services    backend · modul domain · workflow · batch │
│ 4  Data             database · audit · file · cache · migrasi │
│ 5  Integrasi        antrian · outbox · orkestrasi · analitik  │
│ 6  Enterprise Sys.  Oracle EBS · SAP S/4HANA · sistem grup    │
└──────────────────────────────────────────────────────────────┘
```

Rincian template arsitektur referensi, katalog komponen per profil, dan mekanisme sizing ada di [`00-architecture/`](00-architecture/).

---

## 5. Peta Standar

| # | Standar | Folder | Cakupan utama | Referensi dasar | Status |
|---|---|---|---|---|---|
| 00 | **Arsitektur High-Code** | [`00-architecture/`](00-architecture/) | Tujuh lapisan, katalog komponen per profil (Mandiri / EBS / SAP), arsitektur data, asumsi beban, kalkulasi sizing, keputusan terbuka | Template Arsitektur Referensi (Excel) | Draft: profil Mandiri v0.6; profil EBS dan SAP sedang dipetakan |
| 01 | **PL/SQL & Oracle APEX** | [`01-plsql/`](01-plsql/) | Penamaan objek (XTD_ / APX_), prefix variabel, format kode, exception handling, logging, bulk processing, keamanan SQL, komponen APEX / APEXlang | `oracle-dev-standards-v1.1.md`, `naming-convention-oracle.md` (iwanhe/pandawa); folder `apex` (iwanhe/oracle-db-skills) | Draft v0.2.0: 121 aturan; contoh belum dikompilasi |
| 02 | **JavaScript & TypeScript** | [`02-javascript-typescript/`](02-javascript-typescript/) | Sintaks modern, penamaan, modul, async, error handling, tipe ketat, pola TS | Airbnb, Google JS Guide, MDN, W3C, clean-code-javascript, JS The Right Way, es6-cheatsheet, dan lainnya; ezbackend TypeScript best practices | Draft v0.2.0: 93 aturan, konfigurasi ESLint/tsconfig teruji |
| 03 | **ReactJS** | [`03-reactjs/`](03-reactjs/) | Struktur komponen, hooks, state, pola lanjutan (compound, control props), performa, aksesibilitas, testing | sudheerj/reactjs-interview-questions, kentcdodds/advanced-react-patterns-v2 | Draft v0.2.0: 55 aturan, ESLint + test teruji |
| 04 | **Next.js** | [`04-nextjs/`](04-nextjs/) | App Router, Server / Client Components, data fetching, caching, routing, keamanan; **modul belajar untuk developer junior** | nextjs.org/docs, dokumentasi repo vercel/next.js | Draft v0.2.0: 47 aturan, aplikasi contoh lulus `next build`, 10 modul belajar |
| 05 | **Golang** | [`05-golang/`](05-golang/) | Gaya kode, penamaan, error handling, konkurensi, struktur package, testing | Uber Go Style Guide | Draft v0.2.0: 77 aturan, konfigurasi linter teruji |
| 06 | **CI/CD Oracle APEX** | [`06-cicd-oracle-apex/`](06-cicd-oracle-apex/) | Pipeline ADT, runner per environment, gerbang kualitas dan keamanan, promosi DEV → UAT → PROD, backup, rollback | ADT (APEX Deployment Tool), Deployment Process PANDAWA | Siap pilot: template repo belum di-commit |
| 07 | **Java Spring Boot** | [`07-java-spring-boot/`](07-java-spring-boot/) | Struktur modul, layering, transaksi, persistence PostgreSQL, keamanan, testing, supply chain Maven | Dokumentasi resmi Spring Boot; hasil spike | Evaluasi: spike NestJS vs Spring Boot berjalan |
| 08 | **NestJS** | [`08-nestjs/`](08-nestjs/) | Modul dan DI, controller / service / repository, validasi, persistence PostgreSQL, keamanan, testing, supply chain npm | Dokumentasi resmi NestJS; hasil spike | Evaluasi: spike NestJS vs Spring Boot berjalan |

**Keterangan status:** `Direncanakan` → `Draft` → `Review` → `Pilot` → `Resmi`.

> **Catatan backend:** keputusan stack saat ini adalah frontend **ReactJS + TypeScript**, backend **NestJS atau Java Spring Boot**, dan database **PostgreSQL**. Pilihan backend per aplikasi ditetapkan setelah spike selesai (lihat [`github.com/iwanhe/spike-nest-vs-spring`](https://github.com/iwanhe/spike-nest-vs-spring)).

---

## 6. Standar Mana yang Berlaku?

`W` = wajib · `K` = kondisional (bila teknologi itu dipakai) · `—` = tidak berlaku

| Standar | Mandiri | Oracle EBS | SAP |
|---|:-:|:-:|:-:|
| 00 Arsitektur High-Code | W | W | W |
| 01 PL/SQL & Oracle APEX | K | W | — |
| 02 JavaScript & TypeScript | W | K | W |
| 03 ReactJS | W | K | K |
| 04 Next.js | K | K | K |
| 05 Golang | K | — | W (middleware) |
| 06 CI/CD Oracle APEX | K | W | — |
| 07 Java Spring Boot | K | K | K |
| 08 NestJS | K | K | K |

Standar 02 (JS/TS) adalah fondasi untuk 03, 04, dan 08. Membaca 02 lebih dulu adalah prasyarat.

---

## 7. Struktur Folder

```
high-code-dev/
├── README.md                      ← dokumen ini
├── 00-architecture/               Arsitektur referensi + sizing
├── 01-plsql/                      PL/SQL & Oracle APEX
├── 02-javascript-typescript/      JavaScript & TypeScript
├── 03-reactjs/                    ReactJS
├── 04-nextjs/                     Next.js + modul belajar junior
├── 05-golang/                     Golang
├── 06-cicd-oracle-apex/           CI/CD Oracle APEX (ADT)
├── 07-java-spring-boot/           Java Spring Boot
├── 08-nestjs/                     NestJS
├── adr/                           Architecture Decision Record (ADR-NNN-*.md)
├── waiver/                        Pengecualian berbatas waktu
└── templates/                     Template aturan, ADR, waiver, checklist PR
```

Setiap folder standar berisi isi minimum berikut:

| File | Isi |
|---|---|
| `README.md` | Ringkasan, ruang lingkup, cara pakai, daftar aturan kunci |
| `*.xlsx` | Daftar aturan lengkap (sumber utama standar) |
| `checklist-review.md` | Checklist review pull request untuk teknologi tersebut |
| `examples/` | Contoh kode benar dan salah |
| Konfigurasi alat | Mis. `.eslintrc`, `.golangci.yml`, `checkstyle.xml`, yang siap disalin ke proyek |

---

## 8. Format Aturan

Setiap aturan di semua standar memakai format yang sama agar bisa dirujuk dari review, ADR, dan audit.

| Kolom | Isi |
|---|---|
| **ID** | Prefix standar + nomor, mis. `GO-012` |
| **Kategori** | Penamaan, struktur, error handling, keamanan, performa, testing, dsb. |
| **Aturan** | Satu kalimat yang jelas dan dapat diperiksa |
| **Level** | WAJIB / SEBAIKNYA / BOLEH / DILARANG |
| **Alasan** | Mengapa aturan ini ada |
| **Contoh** | Kode benar dan kode salah |
| **Penegakan** | Alat otomatis (linter, scanner, test) atau review manual |
| **Referensi** | Sumber asal aturan |

**Prefix ID:** `ARC` Arsitektur · `PLS` PL/SQL · `APX` Oracle APEX · `JS` JavaScript · `TS` TypeScript · `RCT` ReactJS · `NXT` Next.js · `GO` Golang · `CIA` CI/CD APEX · `JSB` Spring Boot · `NST` NestJS

**Bahasa normatif:**

| Istilah | Makna |
|---|---|
| **WAJIB** | Harus dipenuhi. Penyimpangan hanya lewat waiver. |
| **DILARANG** | Tidak boleh dilakukan. Penyimpangan hanya lewat waiver. |
| **SEBAIKNYA** | Sangat dianjurkan. Penyimpangan dijelaskan di dokumen desain. |
| **BOLEH** | Opsi sesuai pertimbangan tim. |

---

## 9. Penegakan Otomatis (target)

| Stack | Format & lint | Test | Keamanan |
|---|---|---|---|
| PL/SQL & APEX | Code review, APEX Advisor | utPLSQL | APEX SERT |
| JavaScript / TypeScript | ESLint, Prettier, `tsc --strict` | Vitest / Jest | npm audit, OSV-Scanner |
| ReactJS / Next.js | ESLint (react, react-hooks, next) | Vitest, React Testing Library, Playwright | npm audit, OSV-Scanner |
| Golang | gofmt, go vet, golangci-lint | go test | govulncheck |
| Java Spring Boot | Checkstyle / Spotless | JUnit | OWASP Dependency-Check, Trivy |
| NestJS | ESLint, Prettier | Jest / Vitest | npm audit, Trivy |
| CI/CD (semua) | — | — | Gitleaks, Trivy, action dikunci ke commit SHA |

Temuan keamanan **High / Critical** memblokir merge dan rilis.

---

## 10. Cara Memakai

**Developer**
1. Tentukan profil aplikasi (Mandiri / Oracle EBS / SAP) dengan bagian 2.
2. Baca standar yang berlaku untuk profil itu (bagian 6).
3. Salin konfigurasi alat dari folder standar ke proyek.
4. Pastikan pipeline CI lulus sebelum membuka pull request.

**Reviewer**
1. Gunakan `checklist-review.md` dari standar terkait.
2. Rujuk ID aturan saat memberi komentar (mis. "melanggar `PLS-021`").

**Lead / Arsitek**
1. Keputusan di luar standar dicatat sebagai ADR di [`adr/`](adr/).
2. Penyimpangan sementara dicatat sebagai waiver di [`waiver/`](waiver/) beserta tanggal remediasi.

---

## 11. Siklus Hidup dan Versi

- Versi mengikuti **MAJOR.MINOR.PATCH** per standar:
  - **MAJOR**: aturan WAJIB/DILARANG ditambah, dihapus, atau diubah maknanya
  - **MINOR**: aturan SEBAIKNYA/BOLEH atau contoh baru
  - **PATCH**: koreksi teks
- Setiap folder standar mencatat riwayat di `CHANGELOG.md`.
- Standar berstatus **Resmi** setelah dipakai pada minimal satu pilot dan disetujui pemilik dokumen.
- Standar ditinjau ulang minimal **sekali setahun** atau saat teknologi naik versi mayor.

---

## 12. Kontribusi

1. Buat branch `std/<folder>-<ringkasan>` dari `main`.
2. Ubah aturan di file Excel dan perbarui `README.md` serta `CHANGELOG.md` folder terkait.
3. Buka pull request dengan alasan perubahan dan dampaknya ke aplikasi yang sudah berjalan.
4. Minimal satu reviewer selain penulis, dan persetujuan Development Manager untuk perubahan MAJOR.

---

## 13. Roadmap Ringkas

| Tahap | Kegiatan |
|---|---|
| 1 | Finalisasi `00-architecture`: profil Mandiri, Oracle EBS, dan SAP digabung dalam satu kerangka |
| 2 | Susun standar bahasa: `01-plsql`, `02-javascript-typescript`, `05-golang` |
| 3 | Susun standar framework: `03-reactjs`, `04-nextjs`, dan backend terpilih (`07` / `08`) setelah spike selesai |
| 4 | Pilot `06-cicd-oracle-apex` ke database sungguhan; commit template repo |
| 5 | Pilot satu aplikasi per profil, kalibrasi aturan, lalu tetapkan status Resmi |

---

*Tim PANDAWA · IT Upstream Development · KCSI · Internal*
