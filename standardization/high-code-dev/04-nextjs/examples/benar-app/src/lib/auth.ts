// NXT-402: pemeriksaan sesi dipanggil di setiap Server Action dan halaman yang dilindungi.
// Contoh ini membaca cookie sesi tiruan; di proyek nyata, verifikasi token OIDC dari IdP.
import 'server-only';

import { cookies } from 'next/headers';

export interface Pengguna {
  readonly userId: string;
  readonly peran: 'admin' | 'staf';
}

export async function penggunaSaatIni(): Promise<Pengguna | null> {
  const sesi = (await cookies()).get('sesi')?.value;
  if (sesi === undefined || sesi === '') {
    return null;
  }
  return { userId: sesi, peran: 'staf' };
}
