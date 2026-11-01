// NXT-105: navigasi internal memakai <Link>.
import Link from 'next/link';

export default function Beranda() {
  return (
    <>
      <h1>Contoh Standar Next.js</h1>
      <Link href="/supplier">Daftar supplier</Link>
    </>
  );
}
