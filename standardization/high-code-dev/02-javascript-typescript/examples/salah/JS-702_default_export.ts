// MELANGGAR: JS-702 (default export), JS-204 (parameter diubah),
// JS-311 (for...in), TS-202 (non-null assertion), JS-604 (ternary bersarang).
interface Item {
  harga: number;
  diskon?: number;
}

export default function normalisasi(items: Item[], map: Map<string, Item>): number {
  let total = 0;
  for (const i in items) {
    items[i]!.harga = items[i]!.harga * 1.1;
  }
  const pertama = map.get('a')!;
  total = pertama.diskon ? (pertama.diskon > 10 ? 10 : pertama.diskon) : 0;
  return total;
}
