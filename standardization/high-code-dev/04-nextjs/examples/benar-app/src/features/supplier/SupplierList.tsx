// NXT-201, NXT-301: Server Component mengambil data langsung dari DAL.
import Link from 'next/link';

import { daftarSupplier } from './supplier-dal';

export async function SupplierList() {
  const suppliers = await daftarSupplier();
  if (suppliers.length === 0) {
    return <p>Belum ada supplier.</p>;
  }
  return (
    <ul>
      {suppliers.map((s) => (
        <li key={s.supplierId}>
          <Link href={`/supplier/${String(s.supplierId)}`}>{s.namaSupplier}</Link> — {s.kota}
        </li>
      ))}
    </ul>
  );
}
