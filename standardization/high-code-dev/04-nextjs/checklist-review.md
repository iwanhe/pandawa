# Checklist Review — Next.js

Dipakai reviewer bersama [checklist PR umum](../templates/checklist-pr-umum.md). Isi kolom hasil dengan **Ya**, **Tidak**, atau **N/A**. Setiap **Tidak** dirujuk ke ID aturan di komentar review.

## Prasyarat (otomatis, harus hijau sebelum review)

| Periksa | Hasil |
|---|---|
| `npm run typecheck` lulus | |
| `npm run lint` (`--max-warnings 0`) lulus | |
| `npm run build` (next build) lulus tanpa peringatan | |
| Checklist standar 02 (JS/TS) dan 03 (React) juga sudah diperiksa | |

## Aturan yang Diperiksa Manual

### Struktur dan komponen

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `NXT-101` | WAJIB | Aplikasi baru memakai App Router. Pages Router tidak dipakai untuk kode baru. | |
| `NXT-102` | SEBAIKNYA | Routing di src/app; kode non-route di src/features/<fitur> dan src/lib. Route group (nama) mengelompokkan route tanpa mengubah URL; folder _nama untuk berkas privat di dalam app. | |
| `NXT-103` | WAJIB | File konvensi dipakai sesuai perannya: page, layout, loading, error, not-found, route. app/global-error.tsx dan app/not-found.tsx selalu ada. | |
| `NXT-201` | WAJIB | Komponen adalah Server Component secara default. 'use client' hanya di komponen daun yang butuh state, efek, event handler, atau API browser. Client Component tidak async. | |
| `NXT-203` | WAJIB | Data yang dikirim dari Server ke Client Component disaring menjadi DTO; objek database utuh tidak dikirim. | |
| `NXT-205` | SEBAIKNYA | Server Component dimasukkan ke Client Component lewat children atau props, bukan diimpor dari dalam Client Component. | |
| `NXT-206` | SEBAIKNYA | Kode yang hanya dapat berjalan di browser dipanggil di event handler atau effect, atau dimuat dengan next/dynamic di Client Component. | |

### Data dan caching

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `NXT-301` | WAJIB | Data diambil di Server Component dekat dengan pemakainya. Route Handler tidak dipanggil dari Server Component. | |
| `NXT-303` | WAJIB | Satu pendekatan akses data per proyek. Proyek baru memakai Data Access Layer (DAL) server-only; integrasi API lama memakai model zero trust. | |
| `NXT-304` | WAJIB | Caching dinyatakan eksplisit: 'use cache' bersama cacheLife dan cacheTag di fungsi yang sama. Data yang harus selalu segar tidak di-cache. | |
| `NXT-306` | WAJIB | Setelah mutasi, cache diperbarui: updateTag di Server Action untuk read-your-own-writes, revalidateTag(tag, 'max') atau revalidatePath di tempat lain. | |
| `NXT-307` | SEBAIKNYA | Bagian yang lambat dialirkan (streaming) dengan loading.tsx atau Suspense. | |
| `NXT-308` | SEBAIKNYA | Data di sisi klien (interaktif, polling) memakai SWR atau TanStack Query terhadap Route Handler, bukan fetch manual di useEffect. | |

### Server Action, Route Handler, dan keamanan

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `NXT-401` | WAJIB | Mutasi memakai Server Action (form action) atau Route Handler. Server Action diperlakukan sebagai endpoint publik. | |
| `NXT-402` | WAJIB | Setiap Server Action dan Route Handler memeriksa autentikasi dan otorisasi sendiri; tidak mengandalkan proxy, layout, atau page. | |
| `NXT-403` | WAJIB | Input Server Action, Route Handler, params, dan searchParams divalidasi skema (mis. Zod) di server. | |
| `NXT-404` | WAJIB | Server Action mengembalikan data minimal; objek internal dan pesan error mentah tidak dikembalikan. | |
| `NXT-405` | SEBAIKNYA | Operasi yang mahal diberi rate limiting. | |
| `NXT-406` | WAJIB | File .env* tidak di-commit. Hanya variabel publik berprefix NEXT_PUBLIC_. Hanya DAL yang membaca process.env rahasia. | |
| `NXT-407` | SEBAIKNYA | Header keamanan dan Content Security Policy dipasang (next.config headers atau proxy). | |
| `NXT-408` | WAJIB | Proxy (proxy.ts, dahulu middleware.ts) hanya untuk pengalihan dan pemeriksaan ringan, bukan satu-satunya lapisan otorisasi. | |
| `NXT-409` | SEBAIKNYA | Bila aplikasi berada di belakang reverse proxy dengan host berbeda (mis. Cloudflare Tunnel), experimental.serverActions.allowedOrigins diisi host yang sah. | |

### Error dan routing

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `NXT-501` | WAJIB | Segmen fitur penting punya error.tsx (Client Component) yang mencatat error dan menampilkan pesan tanpa detail teknis. | |
| `NXT-502` | SEBAIKNYA | notFound() dan redirect() dipakai untuk 404 dan pengalihan, bukan render kosong. | |

### Performa dan deployment

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `NXT-604` | SEBAIKNYA | Batas 'use client' sekecil mungkin; pustaka berat di klien dimuat dengan next/dynamic. | |
| `NXT-605` | SEBAIKNYA | Ukuran bundle dan Core Web Vitals diperiksa sebelum rilis (bundle analyzer, Lighthouse). | |
| `NXT-703` | SEBAIKNYA | Deploy self-hosted memakai output: 'standalone' di container non-root. | |
| `NXT-704` | SEBAIKNYA | Versi Next.js dan React dikunci; upgrade mayor direncanakan dengan codemod resmi. | |
| `NXT-705` | SEBAIKNYA | Telemetri Next.js dimatikan di CI dan server perusahaan (NEXT_TELEMETRY_DISABLED=1). | |

### Testing

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `NXT-801` | SEBAIKNYA | Komponen sinkron dan Client Component diuji dengan Vitest + React Testing Library; async Server Component diuji lewat E2E. | |
| `NXT-802` | SEBAIKNYA | Alur kritikal diuji end-to-end dengan Playwright terhadap hasil next build + next start. | |
