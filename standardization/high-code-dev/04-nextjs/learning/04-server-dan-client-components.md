# Modul 04 — Server Components dan Client Components

**Durasi:** ± 3 jam · **Prasyarat:** Modul 03

## Tujuan
- Membedakan Server Component dan Client Component.
- Menempatkan `'use client'` sekecil mungkin.
- Menjaga kode rahasia tetap di server.

## Konsep
| | Server Component (default) | Client Component (`'use client'`) |
|---|---|---|
| Berjalan di | Server | Server (render awal) dan browser |
| Boleh | `async/await`, akses database lewat DAL, membaca secret | `useState`, `useEffect`, event handler, API browser |
| Tidak boleh | hooks state/efek, event handler | `async` component, akses secret |
| JavaScript ke browser | Tidak | Ya |

**Aturan praktis:** mulai dari Server Component. Pindahkan **hanya bagian interaktif** (tombol, form, filter) ke file `'use client'` tersendiri.

**Menjaga rahasia:**
- Modul yang mengakses database diawali `import 'server-only';`. Build akan gagal bila modul itu terimpor ke Client Component.
- Kirim ke Client Component hanya data yang dibutuhkan (DTO), bukan baris database utuh.

## Contoh
```tsx
// Server Component: mengambil data
import { daftarSupplier } from './supplier-dal';

export async function SupplierList() {
  const suppliers = await daftarSupplier(); // DTO tanpa nomor rekening
  return <ul>{suppliers.map((s) => <li key={s.supplierId}>{s.namaSupplier}</li>)}</ul>;
}
```

```tsx
// Client Component: hanya bagian interaktif
'use client';

import { useState } from 'react';

export function FilterKota({ onUbah }: { readonly onUbah: (kota: string) => void }) {
  const [kota, setKota] = useState('');
  return (
    <input
      aria-label="Filter kota"
      value={kota}
      onChange={(e) => {
        setKota(e.target.value);
        onUbah(e.target.value);
      }}
    />
  );
}
```

## Latihan
1. Tambahkan `'use client'` di bagian atas `src/app/supplier/page.tsx`, lalu jalankan build. Perhatikan apa yang berubah dan mengapa itu buruk. Kembalikan seperti semula.
2. Impor `supplier-dal.ts` dari Client Component dan jalankan build. Baca pesan error dari `server-only`.
3. Ubah `daftarSupplier` agar mengembalikan objek lengkap berisi `nomorRekening`, lalu cari di DevTools (tab Network/RSC payload) apakah nilainya terkirim. Kembalikan ke DTO.

## Cek pemahaman
- Mengapa Client Component tidak boleh `async`?
- Apa fungsi `import 'server-only'`?

## Kaitan standar
NXT-201, NXT-202, NXT-203, NXT-204, NXT-205
