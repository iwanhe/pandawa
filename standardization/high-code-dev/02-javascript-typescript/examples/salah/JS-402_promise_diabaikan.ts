// MELANGGAR: JS-402 (promise tidak ditangani), JS-403 (await di dalam loop),
// JS-501 (throw string), JS-502 (catch kosong), JS-505 (console.log).
export async function simpan(id: string): Promise<void> {
  if (id === '') {
    throw 'id kosong';
  }
  await Promise.resolve();
}

export async function simpanSemua(ids: string[]): Promise<void> {
  for (const id of ids) {
    await simpan(id);
  }
  simpan('terakhir');
  try {
    await simpan('x');
  } catch (e) {}
  console.log('selesai');
}
