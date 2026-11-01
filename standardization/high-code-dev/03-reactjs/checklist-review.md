# Checklist Review — ReactJS

Dipakai reviewer bersama [checklist PR umum](../templates/checklist-pr-umum.md). Isi kolom hasil dengan **Ya**, **Tidak**, atau **N/A**. Setiap **Tidak** dirujuk ke ID aturan di komentar review.

## Prasyarat (otomatis, harus hijau sebelum review)

| Periksa | Hasil |
|---|---|
| `npm run typecheck` lulus | |
| `npm run lint` (`--max-warnings 0`) lulus | |
| `npm test` lulus | |
| `npm run format:check` lulus | |
| Tidak ada `eslint-disable` untuk `react-hooks/exhaustive-deps` (RCT-302) | |
| Checklist standar 02 (JS/TS) juga sudah diperiksa | |

## Aturan yang Diperiksa Manual

### Struktur dan komponen

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `RCT-101` | WAJIB | Satu komponen utama per file; nama file sama dengan nama komponen (PascalCase.tsx). Custom hook di file useNamaHook.ts. | |
| `RCT-102` | SEBAIKNYA | Kode dikelompokkan per fitur (features/<fitur>/components, hooks, api, types), bukan per jenis file di tingkat atas. | |
| `RCT-104` | WAJIB | Custom hook berawalan use dan bernama deskriptif. | |
| `RCT-202` | WAJIB | Props bertipe dengan interface TypeScript; propTypes dan defaultProps tidak dipakai; nilai default lewat default parameter. Tipe kembalian komponen boleh diinferensi. | |
| `RCT-204` | SEBAIKNYA | Props tidak disebar ke elemen DOM tanpa saring ({...props}); teruskan hanya atribut yang dikenal. | |
| `RCT-208` | SEBAIKNYA | Satu komponen satu tanggung jawab; komponen yang memuat banyak bagian dipecah. | |

### Hooks dan state

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `RCT-306` | WAJIB | Pembaruan state yang bergantung pada nilai sebelumnya memakai updater function. | |
| `RCT-307` | WAJIB | State tidak dimutasi; perbarui dengan salinan baru (spread, map, filter, toSorted). | |
| `RCT-309` | SEBAIKNYA | Logika yang dipakai bersama dibungkus custom hook yang kecil dan fokus. | |
| `RCT-401` | SEBAIKNYA | State diletakkan sedekat mungkin dengan pemakainya; dinaikkan ke induk terdekat bila dibagi beberapa komponen. | |
| `RCT-402` | WAJIB | State minimal: nilai yang dapat dihitung dari props atau state lain tidak disimpan sebagai state; props tidak disalin ke state. | |
| `RCT-403` | SEBAIKNYA | State dengan banyak transisi memakai useReducer dengan action bertipe (discriminated union). | |
| `RCT-406` | SEBAIKNYA | Data dari server dikelola pustaka data fetching (TanStack Query, SWR) atau Server Components, bukan useEffect + useState manual. | |
| `RCT-407` | SEBAIKNYA | Form memakai controlled component bila butuh validasi langsung, atau form action React 19 untuk form sederhana; validasi selalu diulang di server. | |

### Pola

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `RCT-501` | SEBAIKNYA | Compound components berbagi state lewat context; hook internalnya melempar error bila dipakai di luar provider. | |
| `RCT-503` | SEBAIKNYA | Komponen yang state-nya perlu dikendalikan dari luar mendukung controlled props (value + onChange) dengan fallback state internal. | |
| `RCT-506` | SEBAIKNYA | Render props dan higher-order component tidak dipakai untuk kode baru; gunakan custom hook. | |

### Performa

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `RCT-601` | SEBAIKNYA | React.memo, useMemo, dan useCallback hanya ditambahkan berdasarkan hasil profiling atau untuk menstabilkan nilai context/props. Bila React Compiler aktif, memo manual tidak ditambahkan. | |
| `RCT-602` | SEBAIKNYA | Halaman atau komponen besar dimuat dengan React.lazy + Suspense. Karena lazy membutuhkan default export, modul dengan named export dipetakan di pemanggil. | |
| `RCT-603` | SEBAIKNYA | List panjang (ratusan baris atau lebih) memakai virtualisasi. | |

### Aksesibilitas dan keamanan

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `RCT-703` | SEBAIKNYA | ID untuk atribut aksesibilitas (htmlFor, aria-describedby) dibuat dengan useId. | |
| `RCT-802` | WAJIB | URL dari data pengguna divalidasi skemanya (http/https) sebelum dipakai di href atau src; javascript: URL tidak dipakai. | |
| `RCT-803` | WAJIB | Token autentikasi tidak disimpan di localStorage atau sessionStorage; gunakan cookie httpOnly atau memori dengan login OIDC + PKCE. | |
| `RCT-805` | DILARANG | Kode klien hanya membaca variabel lingkungan publik (VITE_*, NEXT_PUBLIC_*); rahasia tidak pernah masuk bundle. | |

### Ketahanan

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `RCT-901` | SEBAIKNYA | Komponen diuji dengan React Testing Library dari sudut pengguna (getByRole, userEvent), bukan detail implementasi atau state internal. | |
| `RCT-902` | WAJIB | Error boundary dipasang di titik strategis (per halaman atau fitur) dengan UI fallback dan pencatatan error. | |
| `RCT-903` | WAJIB | StrictMode aktif di development. | |
| `RCT-904` | WAJIB | Komponen yang menampilkan data asinkron menangani keadaan memuat, error, dan kosong. | |
