# Modul 08 — Autentikasi dan Otorisasi

**Durasi:** ± 3 jam · **Prasyarat:** Modul 07

## Tujuan
- Memahami lapisan pemeriksaan akses di Next.js.
- Menempatkan otorisasi di DAL dan Server Action.
- Memakai proxy hanya untuk pemeriksaan ringan.

## Konsep
Ada tiga tempat pemeriksaan, dan **ketiganya punya peran berbeda**:

| Lapisan | Tugas | Cukup sendirian? |
|---|---|---|
| `proxy.ts` (dahulu `middleware.ts`) | Redirect cepat bila cookie sesi tidak ada | Tidak |
| `page.tsx` / `layout.tsx` | Menentukan UI yang ditampilkan | Tidak |
| DAL dan Server Action | Memeriksa hak atas **data** sebelum membaca atau mengubahnya | **Ya, wajib** |

Login pengguna internal PANDAWA memakai IdP perusahaan (OIDC). Token disimpan di cookie `httpOnly`, bukan di `localStorage`.

## Contoh
```ts
// src/lib/auth.ts
import 'server-only';

import { cookies } from 'next/headers';

export async function penggunaSaatIni(): Promise<Pengguna | null> {
  const sesi = (await cookies()).get('sesi')?.value;
  if (sesi === undefined || sesi === '') {
    return null;
  }
  return verifikasiSesi(sesi); // verifikasi token OIDC ke IdP
}
```

```ts
// di DAL: otorisasi dekat dengan data
export async function hapusSupplier(id: number): Promise<void> {
  const pengguna = await penggunaSaatIni();
  if (pengguna?.peran !== 'admin') {
    throw new Error('Tidak berhak menghapus supplier');
  }
  await db.execute('delete from supplier where supplier_id = $1', [id]);
}
```

## Latihan
1. Buat `proxy.ts` yang mengalihkan ke `/login` bila cookie `sesi` tidak ada, khusus untuk path `/supplier`.
2. Tambahkan peran `admin` dan buat tombol hapus yang hanya tampil untuk admin. Lalu pastikan **action**-nya juga menolak pengguna non-admin.
3. Jelaskan dalam dua kalimat mengapa langkah 2 bagian kedua wajib walaupun tombolnya sudah disembunyikan.

## Cek pemahaman
- Mengapa otorisasi tidak boleh hanya di proxy?
- Mengapa token tidak disimpan di `localStorage`?

## Kaitan standar
NXT-402, NXT-406, NXT-408, RCT-803
