// MELANGGAR: JS-804 (innerHTML dari data luar), JS-801 (eval),
// JS-802 (nominal dengan number), TS-103 (@ts-ignore).
export function tampilkan(el: HTMLElement, namaVendor: string, rumus: string): void {
  el.innerHTML = `<b>${namaVendor}</b>`;
  // @ts-ignore
  const hasil: number = eval(rumus);
  const total = 0.1 + 0.2 + hasil; // 0.30000000000000004
  el.dataset['total'] = String(total);
}
