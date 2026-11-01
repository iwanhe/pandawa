// MELANGGAR: RCT-303 (state turunan dihitung lewat effect), RCT-302 (dependency kurang),
// RCT-304 (interval tanpa cleanup), RCT-201 (class component), RCT-311 (render tidak murni).
import { Component, useEffect, useState } from 'react';

export function Ringkasan({ harga, qty }: { harga: number; qty: number }) {
  const [total, setTotal] = useState(0);

  useEffect(() => {
    setTotal(harga * qty);
  }, [harga]);

  useEffect(() => {
    setInterval(() => {
      console.warn('cek');
    }, 1000);
  }, []);

  const nomor = Math.random();
  return (
    <p>
      {nomor} {total}
    </p>
  );
}

export class Judul extends Component<{ teks: string }> {
  override render() {
    return <h1>{this.props.teks}</h1>;
  }
}
