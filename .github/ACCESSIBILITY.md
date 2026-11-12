# Pernyataan Aksesibilitas (Accessibility Statement)

> 🇬🇧 *In short:* we aim for **WCAG 2.1 level AA** on the PANDAWA site and on the APEX apps we publish. Known gaps are listed below. Report barriers with the *Accessibility* issue form.

## Komitmen

Tim PANDAWA ingin dokumentasi, situs, dan aplikasi yang kami bagikan dapat dipakai semua orang, termasuk pengguna pembaca layar, pengguna keyboard saja, dan pengguna dengan gangguan penglihatan. Target kami adalah **[WCAG 2.1](https://www.w3.org/TR/WCAG21/) level AA**.

## Cakupan

| Komponen | Status |
|----------|--------|
| Situs [iwanhe.github.io/pandawa](https://iwanhe.github.io/pandawa/) (`docs/`) | Diuji otomatis dengan axe-core — 0 pelanggaran WCAG 2.1 A/AA (Nov 2026) |
| README, Wiki, dokumen Markdown | Mengikuti aksesibilitas bawaan GitHub |
| Aplikasi APEX (FRITS, P-Track, Incident Tracking) | Dibangun dengan Universal Theme APEX; belum diaudit formal |
| Access Vault Portal | Belum diaudit formal |
| Dokumen `.docx` / `.pdf` di repo | Belum diperiksa aksesibilitasnya |

## Yang sudah diterapkan di situs

- Tautan *Lewati ke konten* untuk pengguna keyboard dan pembaca layar.
- Struktur heading berurutan dan landmark (`header`, `nav`, `main`, `footer`).
- Indikator fokus yang jelas (`:focus-visible`).
- Kontras teks memenuhi AA: teks utama 16:1, teks sekunder ≥ 7:1, tombol utama 5,2:1.
- Tautan di dalam paragraf bergaris bawah, tidak hanya dibedakan lewat warna.
- Animasi dimatikan bila sistem meminta *reduced motion*.
- Tata letak responsif hingga lebar 320 px dan dapat diperbesar hingga 200%.
- Konten aplikasi dimuat dinamis dengan `aria-live`, dan tetap tampil (fallback) bila data gagal dimuat.

## Lingkungan yang didukung

- Browser: versi terbaru Chrome, Edge, Firefox, dan Safari.
- Pembaca layar: NVDA (Windows) dan VoiceOver (macOS/iOS).
- Navigasi penuh dengan keyboard.

## Keterbatasan yang diketahui

- **Diagram Mermaid** di README (arsitektur, alur deployment, change management) belum semuanya punya padanan teks lengkap. Isi intinya dijelaskan juga dalam tabel di README dan Wiki.
- **Situs hanya punya tema gelap**; belum ada pilihan tema terang.
- **Dokumen Word/PDF** (mis. setup aplikasi, materi training, lisensi Oracle) belum diperiksa tag, urutan baca, maupun teks alternatif gambarnya.
- **Aplikasi APEX** mengandalkan aksesibilitas bawaan Universal Theme dan belum diaudit per halaman. Komponen kustom (chart, map, plug-in) mungkin belum sepenuhnya ramah pembaca layar.

## Melaporkan hambatan

Temukan bagian yang sulit diakses? Buka issue dengan form **♿ Accessibility** di [GitHub Issues](https://github.com/iwanhe/pandawa/issues/new/choose). Sebutkan halaman atau aplikasinya, apa yang Anda coba lakukan, serta browser dan alat bantu yang dipakai.

Kami berupaya menanggapi dalam **5 hari kerja**. Hambatan yang menghalangi penggunaan utama diprioritaskan.

---

<sub>Terakhir ditinjau: November 2026</sub>
