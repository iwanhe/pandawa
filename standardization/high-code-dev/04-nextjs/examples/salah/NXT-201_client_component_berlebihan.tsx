'use client';

// MELANGGAR: NXT-201 ('use client' di seluruh halaman, async Client Component),
// NXT-308 (fetch manual di klien), NXT-601 (<img> biasa), NXT-105 (<a> untuk navigasi internal),
// NXT-104 / JS-702 (default export pada komponen biasa).
export default async function DaftarSupplier() {
  const res = await fetch('/api/supplier');
  const data = (await res.json()) as { nama: string; logo: string }[];
  return (
    <div>
      {data.map((s) => (
        <div key={s.nama}>
          <img src={s.logo} alt={s.nama} />
          <a href="/supplier/detail">{s.nama}</a>
        </div>
      ))}
    </div>
  );
}
