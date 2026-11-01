# Contoh Kode — Next.js

```
examples/
├── benar-app/                  aplikasi Next.js 16 lengkap; next build lulus, ESLint 0 temuan
│   ├── next.config.ts              Cache Components, Partial Prefetching, standalone, header keamanan
│   └── src/
│       ├── app/                    layout, page, not-found, global-error, supplier/{page,loading,error}, supplier/[supplierId]
│       ├── features/supplier/      DAL server-only, Server Action, skema Zod, Client Component form
│       └── lib/auth.ts             pemeriksaan sesi
└── salah/
    ├── NXT-201_client_component_berlebihan.tsx
    └── NXT-402_server_action_tanpa_cek.ts
```

## Menjalankan

Dari folder `04-nextjs`:

```bash
npm ci
npm run build          # next build examples/benar-app
npm run typecheck      # setelah build (memakai tipe di .next/types)
npm run lint:benar     # harus 0 temuan
npm run lint:salah     # harus menampilkan pelanggaran
npm run dev            # jalankan aplikasi contoh di http://localhost:3000
```

Untuk mencoba form supplier, buat cookie `sesi` bernilai apa saja di browser (simulasi login).
