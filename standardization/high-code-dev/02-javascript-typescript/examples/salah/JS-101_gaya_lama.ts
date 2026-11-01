// MELANGGAR: JS-101 (var), JS-102 (deklarasi berantai), JS-609 (==),
// JS-602 (if tanpa kurung kurawal), JS-308 (parseInt tanpa radix, isNaN global),
// JS-307 (gabung string dengan +), TS-201 (any).
export function hitung(input: any): string {
  var a = (b = 1);
  var b;
  if (input == null) return 'kosong';
  var n = parseInt(input);
  if (isNaN(n)) return 'bukan angka';
  return 'nilai: ' + (n + a + b);
}
