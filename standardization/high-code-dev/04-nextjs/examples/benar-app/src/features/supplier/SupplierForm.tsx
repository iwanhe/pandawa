'use client';

// NXT-201: Client Component hanya untuk bagian interaktif (form dengan status).
import { useActionState, useId } from 'react';

import { tambahSupplier } from './supplier-actions';
import type { HasilSimpan } from './supplier-actions';

const awal: HasilSimpan = { status: 'awal', pesan: '' };

export function SupplierForm() {
  const [hasil, aksi, isPending] = useActionState(tambahSupplier, awal);
  const namaId = useId();
  const kotaId = useId();

  return (
    <form action={aksi}>
      <label htmlFor={namaId}>Nama supplier</label>
      <input id={namaId} name="namaSupplier" required />
      {hasil.galatField?.namaSupplier?.map((g) => (
        <p key={g}>{g}</p>
      ))}

      <label htmlFor={kotaId}>Kota</label>
      <input id={kotaId} name="kota" required />
      {hasil.galatField?.kota?.map((g) => (
        <p key={g}>{g}</p>
      ))}

      <button type="submit" disabled={isPending}>
        {isPending ? 'Menyimpan…' : 'Simpan'}
      </button>
      {hasil.pesan !== '' && <p role="status">{hasil.pesan}</p>}
    </form>
  );
}
