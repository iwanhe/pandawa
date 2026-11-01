# Modul 02 — Membuat Proyek dan Struktur App Router

**Durasi:** ± 2 jam · **Prasyarat:** Modul 01, Node.js 22 atau lebih baru

## Tujuan
- Membuat proyek Next.js 16 dengan App Router.
- Memahami struktur folder standar PANDAWA.
- Memasang konfigurasi lint, format, dan TypeScript standar.

## Langkah
1. Buat proyek:
   ```bash
   npx create-next-app@latest supplier-app --ts --app --src-dir --eslint
   ```
2. Salin dari folder standar `04-nextjs`: `eslint.config.js`, `eslint.base.js`, `.prettierrc.json`, dan `npmrc.template` (simpan sebagai `.npmrc`).
3. Pastikan `next.config.ts` memuat:
   ```ts
   const nextConfig: NextConfig = {
     cacheComponents: true,
     partialPrefetching: true,
     typedRoutes: true,
     output: 'standalone',
     poweredByHeader: false,
   };
   ```

## Struktur folder
```
src/
├── app/                      hanya struktur URL
│   ├── layout.tsx
│   ├── page.tsx
│   ├── not-found.tsx
│   ├── global-error.tsx
│   └── supplier/
│       ├── page.tsx
│       ├── loading.tsx
│       └── error.tsx
├── features/
│   └── supplier/             semua kode fitur supplier
│       ├── supplier-dal.ts       akses data (server-only)
│       ├── supplier-actions.ts   Server Actions
│       ├── supplier-schema.ts    validasi Zod
│       └── SupplierForm.tsx      Client Component
└── lib/                      utilitas bersama (auth, format)
```

- Folder dalam `app/` menjadi segmen URL. File `page.tsx` membuat segmen itu dapat diakses.
- `(nama)` adalah **route group**: mengelompokkan route tanpa menambah segmen URL.
- `_nama` adalah folder **privat**: tidak menjadi route.

## Latihan
1. Buat route `/supplier` dan `/supplier/[supplierId]`.
2. Tambahkan route group `(admin)` berisi `/pengaturan`, lalu buktikan URL-nya tetap `/pengaturan`.
3. Jalankan `npm run build`. Catat route mana yang statis (○) dan mana yang Partial Prerender (◐).

## Cek pemahaman
- Mengapa query database tidak ditaruh di `src/app/supplier/utils/`?
- Apa bedanya `(admin)` dan `_admin`?

## Kaitan standar
NXT-101, NXT-102, NXT-103, NXT-701, NXT-706
