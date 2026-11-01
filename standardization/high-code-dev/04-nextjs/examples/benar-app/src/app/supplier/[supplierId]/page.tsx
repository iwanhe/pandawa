// NXT-504, NXT-502, NXT-403: params adalah Promise; ID divalidasi; notFound untuk data kosong.
import type { Metadata } from 'next';
import { notFound } from 'next/navigation';

import { supplierById } from '@/features/supplier/supplier-dal';

interface Props {
  readonly params: Promise<{ supplierId: string }>;
}

async function ambilSupplier(params: Props['params']) {
  const { supplierId } = await params;
  const id = Number.parseInt(supplierId, 10);
  if (!Number.isInteger(id) || id <= 0) {
    notFound();
  }
  const supplier = await supplierById(id);
  if (supplier === null) {
    notFound();
  }
  return supplier;
}

export async function generateMetadata({ params }: Props): Promise<Metadata> {
  const supplier = await ambilSupplier(params);
  return { title: supplier.namaSupplier };
}

export function generateStaticParams() {
  return [{ supplierId: '1' }, { supplierId: '2' }];
}

export default async function DetailSupplier({ params }: Props) {
  const supplier = await ambilSupplier(params);
  return (
    <>
      <h1>{supplier.namaSupplier}</h1>
      <p>Kota: {supplier.kota}</p>
    </>
  );
}
