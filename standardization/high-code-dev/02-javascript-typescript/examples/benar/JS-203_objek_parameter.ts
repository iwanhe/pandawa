// JS-203, JS-205, JS-207, JS-109: parameter lebih dari tiga digabung dalam satu objek,
// default di destructuring, tanpa flag boolean pemilih perilaku.

export interface OpsiLaporan {
  readonly periode: string;
  readonly kodePerusahaan: string;
  readonly formatKeluaran?: 'pdf' | 'xlsx';
  readonly sertakanDetail?: boolean;
}

export function namaFileLaporan({
  periode,
  kodePerusahaan,
  formatKeluaran = 'pdf',
  sertakanDetail = false,
}: OpsiLaporan): string {
  const akhiran = sertakanDetail ? '-detail' : '';
  return `laporan-${kodePerusahaan}-${periode}${akhiran}.${formatKeluaran}`;
}
