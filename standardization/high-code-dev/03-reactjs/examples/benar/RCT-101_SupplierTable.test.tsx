// RCT-901: diuji dari sudut pengguna dengan React Testing Library.
import { cleanup, render, screen } from '@testing-library/react';
import userEvent from '@testing-library/user-event';
import { afterEach, describe, expect, it, vi } from 'vitest';

import { SupplierTable } from './RCT-101_SupplierTable';

const suppliers = [
  { supplierId: 1, namaSupplier: 'PT Sumber Makmur', kota: 'Kudus' },
  { supplierId: 2, namaSupplier: 'CV Tembakau Jaya', kota: 'Temanggung' },
];

afterEach(() => {
  cleanup();
});

describe('SupplierTable', () => {
  it('memanggil onSelect dengan ID supplier yang dipilih', async () => {
    const onSelect = vi.fn();
    render(<SupplierTable suppliers={suppliers} onSelect={onSelect} />);

    const [, tombolKedua] = screen.getAllByRole('button', { name: 'Pilih' });
    if (tombolKedua === undefined) {
      throw new Error('tombol kedua tidak ditemukan');
    }
    await userEvent.click(tombolKedua);

    expect(onSelect).toHaveBeenCalledWith(2);
  });

  it('menampilkan pesan bila daftar kosong', () => {
    render(<SupplierTable suppliers={[]} onSelect={vi.fn()} />);
    expect(screen.getByText('Belum ada supplier.')).toBeDefined();
  });

  it('menampilkan pesan error sebagai alert', () => {
    render(<SupplierTable suppliers={[]} errorMessage="Gagal memuat" onSelect={vi.fn()} />);
    expect(screen.getByRole('alert').textContent).toBe('Gagal memuat');
  });
});
