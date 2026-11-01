# 04 — Standar Next.js

> Bagian dari [Standar High-Code Development](../README.md) · Tim PANDAWA

| Atribut | Nilai |
|---|---|
| Prefix ID aturan | `NXT` |
| Status | **Draft** |
| Versi | 0.2.0 |
| Versi yang diacu | Next.js 16.4 (App Router, Cache Components), React 19.3 |
| Prasyarat | [02 — JavaScript & TypeScript](../02-javascript-typescript/) dan [03 — ReactJS](../03-reactjs/) (semua aturannya tetap berlaku) |
| File aturan | [`Standar_NextJS.xlsx`](Standar_NextJS.xlsx) — sumber utama |
| Konfigurasi | [`eslint.config.js`](eslint.config.js) + [`eslint.base.js`](eslint.base.js), [`examples/benar-app/next.config.ts`](examples/benar-app/next.config.ts), [`tsconfig.json`](tsconfig.json), [`npmrc.template`](npmrc.template) |
| Modul belajar | [`learning/`](learning/) — 10 modul untuk developer junior |
| Pembaruan terakhir | 2026-11-02 |

## Ringkasan

Best practice Next.js App Router untuk Tim PANDAWA, ditambah aplikasi contoh yang lulus `next build` dan modul belajar bertahap.

| Jumlah aturan | WAJIB | DILARANG | SEBAIKNYA | BOLEH | Ditegakkan alat |
|:-:|:-:|:-:|:-:|:-:|:-:|
| 47 | 26 | 0 | 20 | 1 | 16 (34%) |

## Berlaku untuk

| Mandiri | Oracle EBS | SAP |
|:-:|:-:|:-:|
| K | K | K |

`K` = kondisional: berlaku bila aplikasi memakai Next.js.

## Cara Memakai

1. Buat proyek dengan `create-next-app` (lihat [modul 02](learning/02-membuat-proyek-dan-struktur.md)).
2. Salin `eslint.config.js`, `eslint.base.js`, `.prettierrc.json`, dan `npmrc.template` (sebagai `.npmrc`). Ambil pengaturan `next.config.ts` dari [`examples/benar-app/next.config.ts`](examples/benar-app/next.config.ts). Sesuaikan `settings.next.rootDir` di `eslint.config.js` dengan lokasi aplikasi.
3. Jalankan sebelum membuka pull request:
   ```bash
   npm ci && npm run typecheck && npm run lint && npm run build
   ```
4. Aturan yang tidak dapat dicek alat diperiksa dengan [`checklist-review.md`](checklist-review.md).

## Hal Khusus Next.js 16

| Perubahan | Dampak pada standar |
|---|---|
| `next lint` dihapus | ESLint dijalankan langsung (NXT-701) |
| `middleware.ts` berganti nama menjadi `proxy.ts` | Proxy hanya untuk pemeriksaan ringan (NXT-408) |
| `params` dan `searchParams` berupa Promise | Wajib `await` dan validasi (NXT-504) |
| `revalidateTag(tag)` tanpa profil deprecated | `updateTag` di Server Action, `revalidateTag(tag, 'max')` di tempat lain (NXT-306) |
| Cache Components + Partial Prefetching | Diaktifkan bersama; caching eksplisit dengan `'use cache'` + `cacheLife` + `cacheTag` (NXT-304, NXT-706) |

## Hal yang Masih Perlu Diputuskan

1. Kapan memakai Next.js dan kapan cukup React SPA (Vite) untuk aplikasi satelit.
2. Target hosting: container sendiri (`output: 'standalone'`, NXT-703) atau platform terkelola.
3. IdP dan pustaka autentikasi untuk login OIDC.

## Daftar Aturan

Ringkasan dari [`Standar_NextJS.xlsx`](Standar_NextJS.xlsx). Alasan, contoh benar/salah, dan catatan lengkap ada di file Excel.

### NXT-1xx — Struktur (6 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `NXT-101` | WAJIB | Aplikasi baru memakai App Router. Pages Router tidak dipakai untuk kode baru. | review |
| `NXT-102` | SEBAIKNYA | Routing di src/app; kode non-route di src/features/<fitur> dan src/lib. Route group (nama) mengelompokkan route tanpa mengubah URL; folder _nama untuk berkas privat di dalam app. | review |
| `NXT-103` | WAJIB | File konvensi dipakai sesuai perannya: page, layout, loading, error, not-found, route. app/global-error.tsx dan app/not-found.tsx selalu ada. | review |
| `NXT-104` | WAJIB | Default export hanya di file konvensi Next.js (page, layout, template, loading, error, not-found, default) dan next.config. Komponen dan modul lain memakai named export. | no-restricted-exports (dengan daftar file konvensi) |
| `NXT-105` | WAJIB | Navigasi internal memakai <Link> dari next/link. | @next/next/no-html-link-for-pages |
| `NXT-106` | SEBAIKNYA | TypeScript dengan plugin Next.js dan typedRoutes aktif. | tsc (typedRoutes) |

### NXT-2xx — Server dan Client Components (6 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `NXT-201` | WAJIB | Komponen adalah Server Component secara default. 'use client' hanya di komponen daun yang butuh state, efek, event handler, atau API browser. Client Component tidak async. | @next/next/no-async-client-component (sebagian) |
| `NXT-202` | WAJIB | Akses database, secret, dan process.env rahasia hanya di modul server yang diawali import 'server-only'. | server-only (build gagal) |
| `NXT-203` | WAJIB | Data yang dikirim dari Server ke Client Component disaring menjadi DTO; objek database utuh tidak dikirim. | review |
| `NXT-204` | WAJIB | Props dari Server ke Client Component bisa diserialisasi: tanpa fungsi (kecuali Server Action), class instance, atau Symbol. | next build |
| `NXT-205` | SEBAIKNYA | Server Component dimasukkan ke Client Component lewat children atau props, bukan diimpor dari dalam Client Component. | review |
| `NXT-206` | SEBAIKNYA | Kode yang hanya dapat berjalan di browser dipanggil di event handler atau effect, atau dimuat dengan next/dynamic di Client Component. | review |

### NXT-3xx — Data dan caching (8 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `NXT-301` | WAJIB | Data diambil di Server Component dekat dengan pemakainya. Route Handler tidak dipanggil dari Server Component. | review |
| `NXT-302` | SEBAIKNYA | Request yang tidak saling bergantung dijalankan paralel. | no-await-in-loop (sebagian) |
| `NXT-303` | WAJIB | Satu pendekatan akses data per proyek. Proyek baru memakai Data Access Layer (DAL) server-only; integrasi API lama memakai model zero trust. | review |
| `NXT-304` | WAJIB | Caching dinyatakan eksplisit: 'use cache' bersama cacheLife dan cacheTag di fungsi yang sama. Data yang harus selalu segar tidak di-cache. | review |
| `NXT-305` | WAJIB | Komponen yang membaca request-time API (cookies, headers, searchParams, connection) dibungkus <Suspense>. | next build (Cache Components) |
| `NXT-306` | WAJIB | Setelah mutasi, cache diperbarui: updateTag di Server Action untuk read-your-own-writes, revalidateTag(tag, 'max') atau revalidatePath di tempat lain. | review |
| `NXT-307` | SEBAIKNYA | Bagian yang lambat dialirkan (streaming) dengan loading.tsx atau Suspense. | review |
| `NXT-308` | SEBAIKNYA | Data di sisi klien (interaktif, polling) memakai SWR atau TanStack Query terhadap Route Handler, bukan fetch manual di useEffect. | review |

### NXT-4xx — Mutasi dan keamanan (10 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `NXT-401` | WAJIB | Mutasi memakai Server Action (form action) atau Route Handler. Server Action diperlakukan sebagai endpoint publik. | review |
| `NXT-402` | WAJIB | Setiap Server Action dan Route Handler memeriksa autentikasi dan otorisasi sendiri; tidak mengandalkan proxy, layout, atau page. | review |
| `NXT-403` | WAJIB | Input Server Action, Route Handler, params, dan searchParams divalidasi skema (mis. Zod) di server. | review |
| `NXT-404` | WAJIB | Server Action mengembalikan data minimal; objek internal dan pesan error mentah tidak dikembalikan. | review |
| `NXT-405` | SEBAIKNYA | Operasi yang mahal diberi rate limiting. | review |
| `NXT-406` | WAJIB | File .env* tidak di-commit. Hanya variabel publik berprefix NEXT_PUBLIC_. Hanya DAL yang membaca process.env rahasia. | review |
| `NXT-407` | SEBAIKNYA | Header keamanan dan Content Security Policy dipasang (next.config headers atau proxy). | review |
| `NXT-408` | WAJIB | Proxy (proxy.ts, dahulu middleware.ts) hanya untuk pengalihan dan pemeriksaan ringan, bukan satu-satunya lapisan otorisasi. | review |
| `NXT-409` | SEBAIKNYA | Bila aplikasi berada di belakang reverse proxy dengan host berbeda (mis. Cloudflare Tunnel), experimental.serverActions.allowedOrigins diisi host yang sah. | review |
| `NXT-410` | BOLEH | Taint API boleh dipakai sebagai lapisan tambahan untuk mencegah objek rahasia terkirim ke klien. | review |

### NXT-5xx — Routing, error, metadata (4 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `NXT-501` | WAJIB | Segmen fitur penting punya error.tsx (Client Component) yang mencatat error dan menampilkan pesan tanpa detail teknis. | review |
| `NXT-502` | SEBAIKNYA | notFound() dan redirect() dipakai untuk 404 dan pengalihan, bukan render kosong. | review |
| `NXT-503` | WAJIB | Metadata halaman memakai Metadata API (metadata atau generateMetadata), bukan <head> manual. | @next/next/no-head-element |
| `NXT-504` | WAJIB | params dan searchParams berupa Promise dan di-await; nilainya divalidasi sebelum dipakai. | tsc / next build |

### NXT-6xx — Performa dan aset (5 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `NXT-601` | WAJIB | Gambar memakai next/image dengan width/height atau fill, dan alt. | @next/next/no-img-element |
| `NXT-602` | WAJIB | Font memakai next/font. Bila server build tidak dapat mengakses internet, gunakan next/font/local. | @next/next/no-page-custom-font, google-font-display (sebagian) |
| `NXT-603` | SEBAIKNYA | Skrip pihak ketiga memakai next/script dengan strategi yang sesuai. | @next/next/no-sync-scripts |
| `NXT-604` | SEBAIKNYA | Batas 'use client' sekecil mungkin; pustaka berat di klien dimuat dengan next/dynamic. | review |
| `NXT-605` | SEBAIKNYA | Ukuran bundle dan Core Web Vitals diperiksa sebelum rilis (bundle analyzer, Lighthouse). | review |

### NXT-7xx — Konfigurasi dan deployment (6 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `NXT-701` | WAJIB | ESLint memakai konfigurasi standar folder ini (standar 02 + 03 + @next/next core-web-vitals). Next.js 16 tidak lagi menyediakan next lint; ESLint dijalankan langsung. | ESLint |
| `NXT-702` | WAJIB | next build lulus di CI sebelum merge; next start dipakai untuk uji yang menyerupai produksi. | next build |
| `NXT-703` | SEBAIKNYA | Deploy self-hosted memakai output: 'standalone' di container non-root. | review |
| `NXT-704` | SEBAIKNYA | Versi Next.js dan React dikunci; upgrade mayor direncanakan dengan codemod resmi. | review |
| `NXT-705` | SEBAIKNYA | Telemetri Next.js dimatikan di CI dan server perusahaan (NEXT_TELEMETRY_DISABLED=1). | review |
| `NXT-706` | SEBAIKNYA | Cache Components dan Partial Prefetching diaktifkan bersama untuk proyek baru. | next build (peringatan) |

### NXT-8xx — Testing (2 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `NXT-801` | SEBAIKNYA | Komponen sinkron dan Client Component diuji dengan Vitest + React Testing Library; async Server Component diuji lewat E2E. | review |
| `NXT-802` | SEBAIKNYA | Alur kritikal diuji end-to-end dengan Playwright terhadap hasil next build + next start. | review |

## Bukti Penegakan

Diuji pada 2 November 2026 dengan Next.js 16.4.3, React 19.3.1, ESLint 10.14.0, @next/eslint-plugin-next 16.4.3, TypeScript 6.0.3, dan Zod 4.6.7:

- [`examples/benar-app`](examples/benar-app/) adalah aplikasi Next.js lengkap: DAL `server-only` dengan DTO, Server Action dengan cek sesi + validasi Zod + `updateTag`, `'use cache'` + `cacheLife` + `cacheTag`, `error.tsx`, `global-error.tsx`, `not-found.tsx`, metadata, dan route dinamis.
  - `next build` **lulus tanpa peringatan**, dengan route statis dan Partial Prerender.
  - `tsc` lulus; ESLint **0 temuan** (`--max-warnings 0`).
  - Saat uji, ESLint sempat menemukan pemakaian API Zod yang deprecated (`error.flatten()`) dan prop `error` yang tidak dipakai di error boundary; keduanya sudah diperbaiki di contoh.
- [`examples/salah`](examples/salah/): ESLint menangkap async Client Component (NXT-201), default export di komponen biasa (NXT-104), `<img>` (NXT-601), `<a>` untuk navigasi internal (NXT-105), dan error tanpa `cause` (JS-503).
- **Tidak tertangkap alat:** Server Action tanpa cek sesi, tanpa validasi, dan mengembalikan objek internal (NXT-402, NXT-403, NXT-404). Aturan ini wajib diperiksa saat review.
- `npm audit` pada dependency runtime: 0 kerentanan.

## Referensi

- Dokumentasi resmi Next.js — https://nextjs.org/docs
- Dokumentasi di repo vercel/next.js — https://github.com/vercel/next.js/tree/canary/docs

## Isi Folder

| File | Isi |
|---|---|
| `README.md` | Dokumen ini |
| [`Standar_NextJS.xlsx`](Standar_NextJS.xlsx) | Daftar aturan lengkap (sumber utama) |
| [`eslint.config.js`](eslint.config.js), [`eslint.base.js`](eslint.base.js) | ESLint: standar 02 + blok React dari 03 + @next/next |
| [`tsconfig.json`](tsconfig.json), [`.prettierrc.json`](.prettierrc.json), [`npmrc.template`](npmrc.template) | Konfigurasi TypeScript, format, dan npm |
| [`package.json`](package.json), `package-lock.json` | Versi yang diuji |
| [`checklist-review.md`](checklist-review.md) | Checklist review |
| [`examples/benar-app/`](examples/benar-app/) | Aplikasi contoh yang lulus `next build` |
| [`examples/salah/`](examples/salah/) | Contoh pelanggaran |
| [`learning/`](learning/) | 10 modul belajar untuk developer junior |
| [`CHANGELOG.md`](CHANGELOG.md) | Riwayat perubahan |
