# 03 — Standar ReactJS

> Bagian dari [Standar High-Code Development](../README.md) · Tim PANDAWA

| Atribut | Nilai |
|---|---|
| Prefix ID aturan | `RCT` |
| Status | **Draft** |
| Versi | 0.2.0 |
| Prasyarat | [02 — Standar JavaScript & TypeScript](../02-javascript-typescript/) (semua aturannya tetap berlaku) |
| File aturan | [`Standar_ReactJS.xlsx`](Standar_ReactJS.xlsx) — sumber utama |
| Konfigurasi | [`eslint.config.js`](eslint.config.js) + [`eslint.base.js`](eslint.base.js), [`tsconfig.json`](tsconfig.json), [`vitest.config.ts`](vitest.config.ts), [`.prettierrc.json`](.prettierrc.json), [`npmrc.template`](npmrc.template) |
| Pembaruan terakhir | 2026-11-02 |

## Ringkasan

Standar membangun UI dengan React 19 + TypeScript.

| Jumlah aturan | WAJIB | DILARANG | SEBAIKNYA | BOLEH | Ditegakkan alat |
|:-:|:-:|:-:|:-:|:-:|:-:|
| 55 | 27 | 2 | 22 | 4 | 20 (36%) |

## Berlaku untuk

| Mandiri | Oracle EBS | SAP |
|:-:|:-:|:-:|
| W | K | K |

`W` = wajib · `K` = kondisional (bila satelit memakai React) · `—` = tidak berlaku

## Cara Memakai

1. Salin `eslint.config.js`, `eslint.base.js`, `tsconfig.json`, `vitest.config.ts`, dan `.prettierrc.json` ke root proyek, lalu salin `npmrc.template` menjadi `.npmrc`. Pasang dev dependency sesuai [`package.json`](package.json).
2. Jalankan sebelum membuka pull request:
   ```bash
   npm ci && npm run typecheck && npm run lint && npm test && npm run format:check
   ```
3. Aturan yang tidak dapat dicek alat diperiksa dengan [`checklist-review.md`](checklist-review.md).

`eslint.base.js` adalah salinan konfigurasi standar 02. Jangan diubah di proyek; perubahan diajukan ke folder 02 lalu disalin ulang.

## Komposisi Konfigurasi ESLint

| Lapisan | Isi |
|---|---|
| `eslint.base.js` | Standar JS/TS (02): typescript-eslint strict-type-checked + aturan JS-/TS- |
| `@eslint-react/eslint-plugin` (strict-type-checked) | Komponen, JSX, DOM, keamanan (RCT-106, 201, 206, 408, 801, 802, 804) |
| `eslint-plugin-react-hooks` 7 (recommended-latest) | Rules of Hooks dan aturan React Compiler (RCT-301 s.d. 311). Duplikat di `@eslint-react` dimatikan. |
| `eslint-plugin-jsx-a11y` (recommended) | Aksesibilitas (RCT-701, 702) |
| `--max-warnings 0` | Peringatan bawaan plugin ikut memblokir CI |

## Daftar Aturan

Ringkasan dari [`Standar_ReactJS.xlsx`](Standar_ReactJS.xlsx). Alasan, contoh benar/salah, dan catatan lengkap ada di file Excel.

### RCT-1xx — Struktur dan penamaan (6 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `RCT-101` | WAJIB | Satu komponen utama per file; nama file sama dengan nama komponen (PascalCase.tsx). Custom hook di file useNamaHook.ts. | review |
| `RCT-102` | SEBAIKNYA | Kode dikelompokkan per fitur (features/<fitur>/components, hooks, api, types), bukan per jenis file di tingkat atas. | review |
| `RCT-103` | WAJIB | Nama komponen memakai PascalCase. | tsc (tag huruf kecil dianggap elemen HTML) |
| `RCT-104` | WAJIB | Custom hook berawalan use dan bernama deskriptif. | review |
| `RCT-105` | SEBAIKNYA | Prop event bernama onNamaPeristiwa; fungsi penanganan di komponen bernama handleNamaPeristiwa. | review |
| `RCT-106` | WAJIB | Komponen tidak didefinisikan di dalam komponen lain. | react-hooks/static-components, @eslint-react/no-nested-component-definitions |

### RCT-2xx — Komponen dan props (8 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `RCT-201` | WAJIB | Hanya function component. Class component tidak dipakai, kecuali error boundary (atau pakai pustaka react-error-boundary). | @eslint-react/no-class-component |
| `RCT-202` | WAJIB | Props bertipe dengan interface TypeScript; propTypes dan defaultProps tidak dipakai; nilai default lewat default parameter. Tipe kembalian komponen boleh diinferensi. | review |
| `RCT-203` | WAJIB | Props bersifat read-only; komponen tidak mengubah props atau objek di dalamnya. | no-param-reassign, react-hooks/immutability (sebagian) |
| `RCT-204` | SEBAIKNYA | Props tidak disebar ke elemen DOM tanpa saring ({...props}); teruskan hanya atribut yang dikenal. | review |
| `RCT-205` | SEBAIKNYA | Gunakan Fragment (<>…</>) sebagai pengganti elemen pembungkus yang tidak diperlukan. | review |
| `RCT-206` | WAJIB | Render bersyarat memakai ternary atau && dengan sisi kiri bernilai boolean. | @eslint-react/no-leaked-conditional-rendering |
| `RCT-207` | SEBAIKNYA | Prop boolean bernilai true ditulis singkat. | review |
| `RCT-208` | SEBAIKNYA | Satu komponen satu tanggung jawab; komponen yang memuat banyak bagian dipecah. | review |

### RCT-3xx — Hooks dan efek (11 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `RCT-301` | WAJIB | Hooks hanya dipanggil di tingkat atas function component atau custom hook; tidak di dalam kondisi, loop, atau fungsi bersarang. | react-hooks/rules-of-hooks |
| `RCT-302` | WAJIB | Dependency array useEffect, useMemo, dan useCallback lengkap. Peringatan exhaustive-deps tidak dimatikan. | react-hooks/exhaustive-deps |
| `RCT-303` | WAJIB | Effect tidak dipakai untuk menghitung nilai turunan atau menangani event; nilai turunan dihitung saat render, aksi pengguna ditangani di event handler. | react-hooks/set-state-in-effect |
| `RCT-304` | WAJIB | Effect yang membuat langganan, timer, listener, atau request membersihkannya (fungsi cleanup, AbortController). | @eslint-react/web-api-no-leaked-* (timer, interval, listener) |
| `RCT-305` | WAJIB | Callback useEffect tidak async; fungsi async didefinisikan di dalam effect lalu dipanggil. | tsc (tipe EffectCallback) |
| `RCT-306` | WAJIB | Pembaruan state yang bergantung pada nilai sebelumnya memakai updater function. | review |
| `RCT-307` | WAJIB | State tidak dimutasi; perbarui dengan salinan baru (spread, map, filter, toSorted). | review |
| `RCT-308` | WAJIB | useRef dipakai untuk nilai yang tidak memicu render dan akses DOM; ref tidak dibaca atau ditulis saat render. | react-hooks/refs |
| `RCT-309` | SEBAIKNYA | Logika yang dipakai bersama dibungkus custom hook yang kecil dan fokus. | review |
| `RCT-310` | SEBAIKNYA | useLayoutEffect hanya untuk mengukur atau mengatur tata letak sebelum browser menggambar. | review |
| `RCT-311` | WAJIB | Fungsi render murni: tidak memanggil Math.random, Date.now, atau mengubah variabel luar saat render. | react-hooks/purity |

### RCT-4xx — State dan data (8 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `RCT-401` | SEBAIKNYA | State diletakkan sedekat mungkin dengan pemakainya; dinaikkan ke induk terdekat bila dibagi beberapa komponen. | review |
| `RCT-402` | WAJIB | State minimal: nilai yang dapat dihitung dari props atau state lain tidak disimpan sebagai state; props tidak disalin ke state. | review |
| `RCT-403` | SEBAIKNYA | State dengan banyak transisi memakai useReducer dengan action bertipe (discriminated union). | review |
| `RCT-404` | SEBAIKNYA | Context dipakai untuk data yang jarang berubah dan dipakai luas; nilai context distabilkan (useMemo) dan hook context memvalidasi keberadaan provider. | @eslint-react/no-unstable-context-value |
| `RCT-405` | SEBAIKNYA | Hindari prop drilling yang dalam; gunakan komposisi (children) atau context. | review |
| `RCT-406` | SEBAIKNYA | Data dari server dikelola pustaka data fetching (TanStack Query, SWR) atau Server Components, bukan useEffect + useState manual. | review |
| `RCT-407` | SEBAIKNYA | Form memakai controlled component bila butuh validasi langsung, atau form action React 19 untuk form sederhana; validasi selalu diulang di server. | review |
| `RCT-408` | WAJIB | key pada list memakai ID stabil dan unik antar sibling. Index hanya untuk list statis yang tidak diurutkan ulang. | @eslint-react/no-missing-key, @eslint-react/no-array-index-key |

### RCT-5xx — Pola lanjutan (6 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `RCT-501` | SEBAIKNYA | Compound components berbagi state lewat context; hook internalnya melempar error bila dipakai di luar provider. | review |
| `RCT-502` | BOLEH | Komponen yang dapat dipakai ulang boleh menyediakan prop getters (getXProps) yang menggabungkan handler pemakai dengan handler internal. | review |
| `RCT-503` | SEBAIKNYA | Komponen yang state-nya perlu dikendalikan dari luar mendukung controlled props (value + onChange) dengan fallback state internal. | review |
| `RCT-504` | BOLEH | Komponen kompleks boleh menerima state reducer agar pemakai dapat mengubah transisi state; jenis action berupa konstanta atau union literal. | review |
| `RCT-505` | BOLEH | Nilai awal dan reset disediakan lewat prop initialNamaState dan fungsi reset. | review |
| `RCT-506` | SEBAIKNYA | Render props dan higher-order component tidak dipakai untuk kode baru; gunakan custom hook. | review |

### RCT-6xx — Performa (4 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `RCT-601` | SEBAIKNYA | React.memo, useMemo, dan useCallback hanya ditambahkan berdasarkan hasil profiling atau untuk menstabilkan nilai context/props. Bila React Compiler aktif, memo manual tidak ditambahkan. | review |
| `RCT-602` | SEBAIKNYA | Halaman atau komponen besar dimuat dengan React.lazy + Suspense. Karena lazy membutuhkan default export, modul dengan named export dipetakan di pemanggil. | review |
| `RCT-603` | SEBAIKNYA | List panjang (ratusan baris atau lebih) memakai virtualisasi. | review |
| `RCT-604` | BOLEH | Pembaruan yang tidak mendesak memakai useTransition atau useDeferredValue. | review |

### RCT-7xx — Aksesibilitas (3 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `RCT-701` | WAJIB | Aturan jsx-a11y recommended lulus: gambar punya alt, kontrol form punya label, atribut ARIA valid. | eslint-plugin-jsx-a11y (recommended) |
| `RCT-702` | WAJIB | Gunakan elemen semantik (button, a, nav, main); div atau span dengan onClick tidak dipakai. | jsx-a11y/click-events-have-key-events, no-static-element-interactions |
| `RCT-703` | SEBAIKNYA | ID untuk atribut aksesibilitas (htmlFor, aria-describedby) dibuat dengan useId. | review |

### RCT-8xx — Keamanan (5 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `RCT-801` | DILARANG | dangerouslySetInnerHTML tidak dipakai. Bila tak terhindarkan, konten disanitasi (DOMPurify) dan pengecualiannya dicatat. | @eslint-react/dom-no-dangerously-set-innerhtml |
| `RCT-802` | WAJIB | URL dari data pengguna divalidasi skemanya (http/https) sebelum dipakai di href atau src; javascript: URL tidak dipakai. | @eslint-react/dom-no-script-url (literal) |
| `RCT-803` | WAJIB | Token autentikasi tidak disimpan di localStorage atau sessionStorage; gunakan cookie httpOnly atau memori dengan login OIDC + PKCE. | review |
| `RCT-804` | WAJIB | Link dengan target="_blank" memakai rel="noreferrer". | @eslint-react/dom-no-unsafe-target-blank |
| `RCT-805` | DILARANG | Kode klien hanya membaca variabel lingkungan publik (VITE_*, NEXT_PUBLIC_*); rahasia tidak pernah masuk bundle. | review |

### RCT-9xx — Testing dan ketahanan (4 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `RCT-901` | SEBAIKNYA | Komponen diuji dengan React Testing Library dari sudut pengguna (getByRole, userEvent), bukan detail implementasi atau state internal. | Vitest + React Testing Library |
| `RCT-902` | WAJIB | Error boundary dipasang di titik strategis (per halaman atau fitur) dengan UI fallback dan pencatatan error. | review |
| `RCT-903` | WAJIB | StrictMode aktif di development. | review |
| `RCT-904` | WAJIB | Komponen yang menampilkan data asinkron menangani keadaan memuat, error, dan kosong. | review |

## Bukti Penegakan

Diuji pada 1–2 November 2026 dengan React 19.3.1, ESLint 10.14.0, eslint-plugin-react-hooks 7.1.1, @eslint-react/eslint-plugin 5.28.8, eslint-plugin-jsx-a11y 6.10.2, TypeScript 6.0.3, dan Vitest 5.0.5:

- [`examples/benar`](examples/benar/): `tsc` lulus, ESLint **0 temuan** (dengan `--max-warnings 0`), 3 test Vitest + React Testing Library lulus.
- [`examples/salah`](examples/salah/): ESLint menemukan 15 pelanggaran, mencakup RCT-106, RCT-201, RCT-206, RCT-301, RCT-302, RCT-303, RCT-304, RCT-311, RCT-408, RCT-702, RCT-801, dan RCT-804.
- **Tidak tertangkap:** mutasi state di dalam event handler (`list.push(x); setList(list)`). `react-hooks/immutability` hanya memeriksa mutasi saat render, jadi RCT-307 diperiksa saat review.
- `eslint-plugin-jsx-a11y` 6.10 belum mencantumkan ESLint 10 di peerDependencies, sehingga instalasi memerlukan `legacy-peer-deps=true` (sudah ada di `npmrc.template`). Dengan opsi itu, `vite` perlu dipasang eksplisit untuk Vitest.

## Referensi

- reactjs-interview-questions — https://github.com/sudheerj/reactjs-interview-questions
- advanced-react-patterns-v2 — https://github.com/kentcdodds/advanced-react-patterns-v2
- Dokumentasi resmi React — https://react.dev

## Isi Folder

| File | Isi |
|---|---|
| `README.md` | Dokumen ini |
| [`Standar_ReactJS.xlsx`](Standar_ReactJS.xlsx) | Daftar aturan lengkap (sumber utama) |
| [`eslint.config.js`](eslint.config.js), [`eslint.base.js`](eslint.base.js) | Konfigurasi ESLint React + salinan standar 02 |
| [`tsconfig.json`](tsconfig.json), [`vitest.config.ts`](vitest.config.ts), [`.prettierrc.json`](.prettierrc.json) | Konfigurasi TypeScript, test, dan format |
| [`npmrc.template`](npmrc.template) | Salin sebagai `.npmrc` |
| [`package.json`](package.json), `package-lock.json` | Versi alat yang diuji |
| [`checklist-review.md`](checklist-review.md) | Checklist review |
| [`examples/`](examples/) | Contoh kode benar (dengan test) dan salah |
| [`CHANGELOG.md`](CHANGELOG.md) | Riwayat perubahan |
