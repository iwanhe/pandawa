// MELANGGAR: RCT-301 (hook di dalam kondisi), RCT-106 (komponen di dalam komponen),
// RCT-206 (&& dengan angka merender "0"), RCT-408 (index sebagai key),
// RCT-801 (dangerouslySetInnerHTML), RCT-804 (target _blank),
// RCT-702 (div dengan onClick).
import { useState } from 'react';

interface Item {
  nama: string;
  catatanHtml: string;
}

export function DaftarItem({ items, tampilkan }: { items: Item[]; tampilkan: boolean }) {
  if (tampilkan) {
    const [terpilih, setTerpilih] = useState<string[]>([]);
    terpilih.push('awal');
    setTerpilih(terpilih);
  }

  function Baris({ item }: { item: Item }) {
    return <span>{item.nama}</span>;
  }

  return (
    <div>
      {items.length && <p>Jumlah: {items.length}</p>}
      {items.map((item, index) => (
        <div key={index} onClick={() => alert(item.nama)}>
          <Baris item={item} />
          <div dangerouslySetInnerHTML={{ __html: item.catatanHtml }} />
          <a href="https://contoh.id" target="_blank">
            Detail
          </a>
        </div>
      ))}
    </div>
  );
}
