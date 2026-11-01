// NXT-305, NXT-307: bagian yang memuat data dibungkus Suspense agar sisa halaman tetap prerender.
import type { Metadata } from 'next';
import { Suspense } from 'react';

import { SupplierForm } from '@/features/supplier/SupplierForm';
import { SupplierList } from '@/features/supplier/SupplierList';

export const metadata: Metadata = { title: 'Supplier' };

export default function HalamanSupplier() {
  return (
    <>
      <h1>Supplier</h1>
      <Suspense fallback={<p role="status">Memuat supplier…</p>}>
        <SupplierList />
      </Suspense>
      <h2>Tambah supplier</h2>
      <SupplierForm />
    </>
  );
}
