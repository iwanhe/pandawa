// RCT-101, RCT-202, RCT-206, RCT-408, RCT-701, RCT-904:
// satu komponen per file, props bertipe, render bersyarat aman, key stabil,
// tabel dapat diakses, dan tiga keadaan data (memuat, error, kosong).

export interface Supplier {
  readonly supplierId: number;
  readonly namaSupplier: string;
  readonly kota: string;
}

export interface SupplierTableProps {
  readonly suppliers: readonly Supplier[];
  readonly isLoading?: boolean;
  readonly errorMessage?: string;
  readonly onSelect: (supplierId: number) => void;
}

export function SupplierTable({
  suppliers,
  isLoading = false,
  errorMessage,
  onSelect,
}: SupplierTableProps) {
  if (isLoading) {
    return <p role="status">Memuat data supplier…</p>;
  }
  if (errorMessage !== undefined) {
    return <p role="alert">{errorMessage}</p>;
  }
  if (suppliers.length === 0) {
    return <p>Belum ada supplier.</p>;
  }

  return (
    <table>
      <caption>Daftar supplier</caption>
      <thead>
        <tr>
          <th scope="col">Nama</th>
          <th scope="col">Kota</th>
          <th scope="col">Aksi</th>
        </tr>
      </thead>
      <tbody>
        {suppliers.map((supplier) => (
          <tr key={supplier.supplierId}>
            <td>{supplier.namaSupplier}</td>
            <td>{supplier.kota}</td>
            <td>
              <button
                type="button"
                onClick={() => {
                  onSelect(supplier.supplierId);
                }}
              >
                Pilih
              </button>
            </td>
          </tr>
        ))}
      </tbody>
    </table>
  );
}
