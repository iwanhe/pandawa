// RCT-602: halaman berat dimuat lazy. React.lazy membutuhkan default export,
// sedangkan standar memakai named export (JS-702), jadi modul dipetakan di sini.
import { lazy, Suspense } from 'react';

const SupplierTable = lazy(() =>
  import('./RCT-101_SupplierTable').then((modul) => ({ default: modul.SupplierTable })),
);

export function LaporanSupplier() {
  return (
    <Suspense fallback={<p role="status">Memuat laporan…</p>}>
      <SupplierTable suppliers={[]} onSelect={() => undefined} />
    </Suspense>
  );
}
