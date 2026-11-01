// JS-802, TS-201, TS-203, JS-305: nominal memakai decimal.js, tanpa any,
// tipe kembalian eksplisit, destructuring parameter objek.
import Decimal from 'decimal.js';

export interface BarisTagihan {
  readonly kodeItem: string;
  readonly qty: string; // nominal dari API dikirim sebagai string desimal
  readonly harga: string;
}

export function totalTagihan(baris: readonly BarisTagihan[]): string {
  const total = baris.reduce(
    (jumlah, { qty, harga }) => jumlah.plus(new Decimal(qty).times(harga)),
    new Decimal(0),
  );
  return total.toFixed(2);
}
