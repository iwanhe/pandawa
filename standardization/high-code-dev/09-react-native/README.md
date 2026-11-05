# 09 — Standar React Native

> Bagian dari [Standar High-Code Development](../README.md) · Tim PANDAWA

| Atribut | Nilai |
|---|---|
| Prefix ID aturan | `RN` |
| Status | **Draft** |
| Versi | 0.1.0 |
| Prasyarat | [02 — JavaScript & TypeScript](../02-javascript-typescript/) dan [03 — ReactJS](../03-reactjs/) (aturannya tetap berlaku, kecuali aturan khusus DOM/web) |
| Sumber | [`dimaswahyu-official/mobile-boilerplate-reactnative`](https://github.com/dimaswahyu-official/mobile-boilerplate-reactnative) (commit `583dfbb`, 19 Okt 2026) |
| File aturan | [`Standar_ReactNative.xlsx`](Standar_ReactNative.xlsx) — sumber utama |
| Template | [`template/`](template/) — aplikasi siap pakai, turunan boilerplate yang sudah diperbaiki |
| Pembaruan terakhir | 2026-11-05 |

## Ringkasan

Standar membangun aplikasi mobile dengan React Native 0.88 + TypeScript (React Native CLI, tanpa Expo).

| Jumlah aturan | WAJIB | DILARANG | SEBAIKNYA | BOLEH | Ditegakkan alat |
|:-:|:-:|:-:|:-:|:-:|:-:|
| 58 | 42 | 1 | 14 | 1 | 24 (41%) |

## Berlaku untuk

| Mandiri | Oracle EBS | SAP |
|:-:|:-:|:-:|
| K | K | K |

`K` = kondisional: berlaku bila aplikasi mobile dibangun dengan React Native. Aplikasi mobile di jalur Oracle EBS yang memakai Oracle JET + Capacitor tidak terkena standar ini.

## Dari Boilerplate ke Standar

Boilerplate sumber adalah kerangka aplikasi, bukan dokumen gaya kode. Karena itu standar disusun dengan dua cara:

1. **Konvensi yang baik diangkat menjadi aturan** (13 praktik): React Native CLI + TypeScript, Zustand, satu instance axios dengan interceptor, React Navigation dengan navigator bersyarat, safe-area-context, pola form login, StyleSheet di akhir file, `@env` + `.env` di luar Git, keystore di luar Git.
2. **Cacat yang ditemukan saat diuji dijadikan aturan pencegahan** (21 temuan: 2 kritis, 5 tinggi, 7 sedang, 7 rendah).

Boilerplate diuji apa adanya pada 5 November 2026 (`npm ci`, `tsc`, ESLint, Jest, bundle Metro, `npm audit`). Temuan kritis dan tinggi:

| Kode | Tingkat | Temuan | Aturan |
|---|---|---|---|
| B-01 | Kritis | index.js mendaftarkan App.tsx di root (layar bawaan NewAppScreen), bukan src/App.tsx. Seluruh kode di src/ (login, navigasi, store) tidak pernah dirender. | RN-101 |
| B-02 | Kritis | Import dari '@env' tanpa react-native-dotenv di package.json maupun babel.config.js. | RN-104, RN-802 |
| B-03 | Tinggi | Import './navigation/AuthNavigation' padahal nama file authNavigation.tsx. | RN-102 |
| B-04 | Tinggi | Preset @react-native/jest-preset dipakai tetapi tidak ada di devDependencies; test memakai react-test-renderer (deprecated di React 19) dan hanya menguji App bawaan. | RN-104, RN-901, RN-903 |
| B-07 | Tinggi | Access token disimpan dan dibaca dari AsyncStorage (tidak terenkripsi). | RN-801 |
| B-08 | Tinggi | Respons login (berisi access_token) dicetak dengan console.log. | RN-806 |
| B-17 | Tinggi | Kerentanan dependency. | RN-108 |

Daftar lengkap (termasuk praktik yang diadopsi) ada di sheet **Boilerplate** pada file Excel.

## Template

[`template/`](template/) adalah boilerplate yang sudah diperbaiki dan memenuhi seluruh aturan yang dapat dicek alat. Isinya kode JavaScript/TypeScript dan konfigurasi; folder `android/` dan `ios/` dibuat per aplikasi dengan CLI (lihat [README template](template/README.md)).

| Pemeriksaan (5 Nov 2026) | Boilerplate asli | Template |
|---|---|---|
| `tsc --noEmit` | Gagal (TS2307, salah huruf path) | Lulus |
| ESLint | 4 error, 2 warning (konfigurasi bawaan) | 0 temuan (konfigurasi standar, `--max-warnings 0`) |
| Jest | Gagal: preset tidak ditemukan | 9 test lulus (3 suite) |
| Bundle Metro (Android, release) | `src/` tidak pernah di-bundle; bila dipaksa, gagal resolve `@env` | Lulus |
| `npm audit --omit=dev` | 25 temuan (1 critical, 13 high) | 0 temuan |
| Penyimpanan token | AsyncStorage (tidak terenkripsi) | Keychain / Keystore |

## Cara Memakai

**Aplikasi baru:** ikuti [README template](template/README.md): buat proyek native dengan CLI, salin isi template, lalu `npm run verify`.

**Aplikasi yang sudah berjalan (termasuk yang dibuat dari boilerplate):**

1. Salin `eslint.config.mjs`, `eslint.base.mjs`, `tsconfig.json`, `.prettierrc.json`, `jest.config.js`, `jest.setup.ts`, dan `npmrc.template` (sebagai `.npmrc`) dari `template/`. Pasang dev dependency sesuai [`template/package.json`](template/package.json).
2. Jalankan sebelum membuka pull request:
   ```bash
   npm ci && npm run verify && npm run bundle:check
   ```
3. Perbaiki temuan kritis dan tinggi di tabel di atas lebih dulu; sisanya mengikuti perubahan berikutnya.
4. Aturan yang tidak dapat dicek alat diperiksa dengan [`checklist-review.md`](checklist-review.md).

`eslint.base.mjs` adalah salinan konfigurasi standar 02 (berekstensi `.mjs` karena file konfigurasi React Native memakai CommonJS). Jangan diubah di proyek.

## Komposisi Konfigurasi ESLint

| Lapisan | Isi |
|---|---|
| `eslint.base.mjs` | Standar JS/TS (02): typescript-eslint strict-type-checked + aturan JS-/TS- |
| `@eslint-react/eslint-plugin` (strict-type-checked, preset DOM/Web API/RSC dimatikan) | Komponen dan JSX (RCT-106, 201, 206, 408) |
| `eslint-plugin-react-hooks` 7 (recommended-latest) | Rules of Hooks dan aturan React Compiler (RCT-3xx) |
| `eslint-plugin-react-native` 5 | Inline style, style tak terpakai, literal warna, teks mentah, komponen khusus platform (RN-206, 207, 301–304) |
| `@react-native/eslint-plugin` | Import internal React Native, warna platform (RN-208, RN-303) |
| `no-restricted-imports`, `no-restricted-syntax` | Touchable*, SafeAreaView bawaan, `react-navigation` lama, `react-test-renderer`, token di AsyncStorage (RN-203, 204, 401, 801, 901) |

## Daftar Aturan

Ringkasan dari [`Standar_ReactNative.xlsx`](Standar_ReactNative.xlsx). Alasan, contoh benar/salah, dan catatan lengkap ada di file Excel.

### RN-1xx — Struktur dan setup proyek (8 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `RN-101` | WAJIB | Struktur folder: src/app (komponen akar dan bootstrap), src/navigation, src/features/<fitur>/{screens,components,api,store,storage,hooks}, src/shared/{api,components,config,theme,utils}. index.js mendaftarkan src/app/App; tidak ada App.tsx sisa template di root. | review; Test render App (__tests__/App.test.tsx) |
| `RN-102` | WAJIB | tsconfig memperluas @react-native/typescript-config lalu menambahkan opsi ketat standar 02 dan forceConsistentCasingInFileNames: true. Path impor sama persis huruf besar-kecilnya dengan nama file. | tsc --noEmit (CI Linux) |
| `RN-103` | WAJIB | Versi React Native berada di jendela dukungan resmi (tiga minor terakhir) dan dinaikkan sebelum versi yang dipakai menjadi Unsupported. react, react-native, dan paket @react-native/* memakai pasangan versi dari template resmi versi tersebut; upgrade memakai React Native Upgrade Helper. | review; Review saat upgrade; Renovate/Dependabot |
| `RN-104` | WAJIB | Setiap paket yang di-import atau dipakai konfigurasi (Babel, Jest, Metro) dideklarasikan langsung di package.json. Tidak bergantung pada dependency transitif yang kebetulan ter-hoist. | npm test, npm run bundle:check di CI |
| `RN-105` | WAJIB | CI menjalankan npm ci, typecheck, lint (--max-warnings 0), test, format check, dan bundle Metro (npm run verify && npm run bundle:check) di runner Linux. Pull request tidak di-merge bila salah satunya gagal. | GitHub Actions / GitLab CI |
| `RN-106` | SEBAIKNYA | Proyek native dibuat dengan @react-native-community/cli init pada versi React Native yang sama dengan template. Nama aplikasi, nama modul (app.json "name"), dan applicationId/bundle identifier ditetapkan sebelum rilis pertama dan tidak memakai nama dari template atau boilerplate. | review |
| `RN-107` | BOLEH | Template standar memakai React Native CLI (bare). Framework Expo (prebuild / EAS) boleh dipakai dengan ADR yang menjelaskan kebutuhan, biaya layanan, dan dampaknya ke pipeline. | review |
| `RN-108` | WAJIB | Supply chain npm: package-lock.json di-commit; CI memakai npm ci; .npmrc berisi ignore-scripts=true dan save-exact=true; versi tanpa ^ atau ~; versi baru dipakai minimal 7 hari setelah rilis; npm audit --omit=dev tanpa temuan High/Critical. Pustaka native tanpa rilis lebih dari 18 bulan dicatat dan punya rencana pengganti. | npm ci, npm audit, OSV-Scanner |

### RN-2xx — Komponen dan UI (9 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `RN-201` | WAJIB | Layar diberi nama <Nama>Screen.tsx di features/<fitur>/screens dan diekspor dengan named export. Satu komponen utama per file. | review; no-restricted-exports (default export) |
| `RN-202` | SEBAIKNYA | Elemen UI yang berulang (tombol, input, tampilan memuat, error) memakai komponen di shared/components; layar tidak menata ulang tombol atau input sendiri. | review |
| `RN-203` | SEBAIKNYA | Interaksi sentuh memakai Pressable atau komponen shared. TouchableOpacity, TouchableHighlight, dan TouchableWithoutFeedback tidak dipakai di kode baru. | no-restricted-imports |
| `RN-204` | WAJIB | Safe area memakai react-native-safe-area-context: SafeAreaProvider sekali di akar, SafeAreaView atau useSafeAreaInsets per layar. SafeAreaView dari react-native tidak dipakai. | no-restricted-imports, @typescript-eslint/no-deprecated |
| `RN-205` | WAJIB | Form mobile: keyboard tidak menutupi input (KeyboardAvoidingView + ScrollView dengan keyboardShouldPersistTaps="handled"); setiap field memakai autoComplete/textContentType yang tepat; password memakai secureTextEntry; autoCorrect dimatikan untuk username dan password; pesan validasi tampil di dekat field. | review |
| `RN-206` | WAJIB | Semua teks berada di dalam <Text>. Render bersyarat tidak boleh menghasilkan string atau angka mentah: gunakan ternary dengan null atau && dengan sisi kiri boolean. | react-native/no-raw-text, @eslint-react/no-leaked-conditional-rendering |
| `RN-207` | WAJIB | Perbedaan platform ditangani dengan Platform.OS / Platform.select atau file .ios.tsx / .android.tsx. Komponen khusus satu platform tidak dipakai di file lintas platform. | react-native/split-platform-components |
| `RN-208` | WAJIB | Hanya API publik react-native yang di-import. Modul internal (react-native/Libraries/…) tidak dipakai. | @react-native/no-deep-imports |
| `RN-209` | WAJIB | Daftar data yang panjang atau berasal dari server memakai FlatList/SectionList dengan keyExtractor dari ID stabil. ScrollView + map hanya untuk daftar pendek yang tetap. | review |

### RN-3xx — Styling (6 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `RN-301` | WAJIB | Style ditulis dengan StyleSheet.create. Objek style inline tidak dipakai, kecuali nilai yang dihitung saat render (mis. lebar dari useWindowDimensions). | react-native/no-inline-styles |
| `RN-302` | WAJIB | Tidak ada entri StyleSheet yang tidak dipakai. | react-native/no-unused-styles |
| `RN-303` | WAJIB | Warna, jarak, ukuran huruf, dan radius diambil dari design token di shared/theme. Literal warna tidak ditulis di StyleSheet atau props warna. | react-native/no-color-literals, @react-native/platform-colors |
| `RN-304` | SEBAIKNYA | Array style hanya untuk menggabungkan beberapa style atau style bersyarat; array berisi satu elemen tidak dipakai. | react-native/no-single-element-style-arrays |
| `RN-305` | SEBAIKNYA | Satu objek styles per file komponen, dibuat dengan StyleSheet.create dan diletakkan di akhir file. | @typescript-eslint/no-use-before-define (variables: false) |
| `RN-306` | SEBAIKNYA | Tata letak memakai flexbox dan satuan density-independent. Ukuran layar dibaca dengan useWindowDimensions di dalam komponen; Dimensions.get di tingkat modul tidak dipakai untuk layout. | review |

### RN-4xx — Navigasi (6 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `RN-401` | WAJIB | Navigasi memakai React Navigation 7 (@react-navigation/native + native-stack). Paket lama react-navigation tidak dipakai. Stack JS (@react-navigation/stack) hanya dengan alasan tertulis (mis. animasi khusus) dan dependency gesture handler dideklarasikan. Satu jenis stack per aplikasi. | no-restricted-imports (react-navigation) |
| `RN-402` | WAJIB | Setiap navigator memakai param list bertipe yang didefinisikan di src/navigation/types.ts. createXNavigator<any> tidak dipakai; layar yang memakai props navigasi memakai tipe NativeStackScreenProps. | @typescript-eslint/no-explicit-any, tsc |
| `RN-403` | WAJIB | Alur autentikasi memakai layar bersyarat di satu navigator berdasarkan status sesi. Setelah login atau logout, layar berganti karena status berubah, bukan karena navigate/reset manual. | review; Test alur login/logout |
| `RN-404` | WAJIB | Hanya ada satu NavigationContainer, di komponen akar aplikasi. | review |
| `RN-405` | SEBAIKNYA | Nama route PascalCase dan sama dengan nama layar tanpa akhiran Screen. initialRouteName (bila dipakai) menunjuk route yang benar-benar menjadi layar awal. | review |
| `RN-406` | WAJIB | Deep link (bila dipakai) tidak membawa token atau data rahasia, memvalidasi parameternya, dan tidak membuka layar terproteksi tanpa sesi. Login OAuth memakai PKCE. | review |

### RN-5xx — Data dan API (6 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `RN-501` | WAJIB | Semua request ke backend lewat satu klien HTTP (shared/api/httpClient) yang base URL dan timeout-nya berasal dari konfigurasi. Layar dan store tidak memanggil axios atau fetch langsung. | review |
| `RN-502` | WAJIB | Token ditambahkan oleh interceptor dari state di memori (bukan dibaca dari storage setiap request). Respons 401 mengakhiri sesi lewat aksi store. Klien HTTP tidak meng-import store; keduanya disambungkan saat bootstrap. | Test httpClient.test.ts, App.test.tsx |
| `RN-503` | WAJIB | Lapisan api/service tidak menampilkan UI (Toast, Alert) dan tidak menelan error; error diteruskan ke layar yang menerjemahkannya menjadi pesan pengguna (toUserMessage). Stack trace, pesan teknis, dan isi respons mentah tidak ditampilkan. | review |
| `RN-504` | WAJIB | Respons API bertipe unknown dan divalidasi saat runtime (type guard atau skema) sebelum dipakai. Nama field API yang tidak mengikuti camelCase dipetakan di lapisan api. | review |
| `RN-505` | SEBAIKNYA | Request yang hasilnya tidak lagi dibutuhkan (pencarian, layar ditutup) dibatalkan dengan AbortController/signal; hasil yang datang setelah layar ditutup tidak mengubah state. | review |
| `RN-506` | SEBAIKNYA | Fitur yang wajib berjalan tanpa sinyal memakai penyimpanan lokal dan antrian kirim ulang dengan kunci unik per transaksi; status sinkron tampil di layar. Kebutuhan offline diputuskan di dokumen desain. | review |

### RN-6xx — State (4 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `RN-601` | WAJIB | State global (sesi, preferensi) disimpan di store Zustand per fitur dengan tipe eksplisit. Nilai turunan tidak disimpan terpisah: status login diturunkan dari token/status, bukan flag isAuthenticated tersendiri. | review |
| `RN-602` | WAJIB | Komponen membaca store dengan selector per nilai (useAuthStore((s) => s.status)), bukan mengambil seluruh store. | review |
| `RN-603` | WAJIB | Aksi store yang asinkron bertipe () => Promise<void> dan dipanggil dengan await, atau void + penanganan error. Tipe aksi async tidak dideklarasikan sebagai () => void. | @typescript-eslint/no-misused-promises, no-floating-promises |
| `RN-604` | SEBAIKNYA | State lokal layar (isi form, status submit) memakai useState di layar; tidak dimasukkan ke store global. | review |

### RN-7xx — Aksesibilitas (4 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `RN-701` | WAJIB | Elemen interaktif punya accessibilityRole dan label yang bermakna; input punya label terlihat dan accessibilityLabel; status nonaktif/memproses disampaikan lewat accessibilityState; judul layar memakai accessibilityRole="header". | review; Test getByRole |
| `RN-702` | WAJIB | Area sentuh minimal 44×44 pt (iOS) dan 48×48 dp (Android); elemen kecil memakai hitSlop. | review |
| `RN-703` | SEBAIKNYA | Teks mengikuti pengaturan ukuran huruf sistem (allowFontScaling tidak dimatikan) dan tata letak tetap terbaca pada ukuran huruf besar. Kontras warna memenuhi WCAG 2.1 AA. | review |
| `RN-704` | SEBAIKNYA | Pesan error dan status yang muncul dinamis diumumkan ke pembaca layar (accessibilityLiveRegion di Android, AccessibilityInfo.announceForAccessibility bila perlu). | review |

### RN-8xx — Keamanan (8 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `RN-801` | WAJIB | Token dan kredensial disimpan di Keychain (iOS) / Keystore (Android) lewat modul tokenStorage (react-native-keychain). AsyncStorage hanya untuk data non-rahasia. Password tidak pernah disimpan. | no-restricted-syntax (heuristik nama kunci) + review |
| `RN-802` | DILARANG | Secret tidak pernah masuk ke .env, kode, atau bundle aplikasi. Variabel @env dibatasi allowlist di babel.config.js dan semua nilainya dianggap publik. File .env tidak di-commit; yang di-commit hanya .env.example dan .env.test. | react-native-dotenv allowlist, Gitleaks |
| `RN-803` | WAJIB | Komunikasi ke backend hanya HTTPS di lingkungan UAT dan PROD. Konfigurasi divalidasi saat aplikasi mulai; Android tidak mengizinkan cleartext di build rilis dan iOS tidak memakai pengecualian ATS global. | Test env.test.ts + review konfigurasi native |
| `RN-804` | WAJIB | Build rilis: tidak debuggable, minify/R8 aktif, Hermes aktif. Keystore rilis dan password-nya tidak ada di repo (hanya debug.keystore bawaan); penandatanganan memakai secret CI. | review; Gitleaks + review |
| `RN-805` | WAJIB | Izin perangkat (kamera, lokasi, penyimpanan) hanya yang dipakai, diminta saat fitur dibutuhkan, dan iOS Info.plist memuat teks alasan yang jelas. | review |
| `RN-806` | WAJIB | Log tidak memuat token, password, atau isi respons API. console.log tidak ada di kode; pencatatan lewat logger yang hanya menulis ke konsol di __DEV__ dan meneruskan error ke crash reporting di build rilis. | no-console + review |
| `RN-807` | SEBAIKNYA | Data sensitif tidak ikut backup otomatis (android:allowBackup="false" atau aturan backup yang mengecualikannya). Layar yang menampilkan data rahasia mencegah tangkapan layar bila diwajibkan klasifikasi datanya. | review |
| `RN-808` | WAJIB | Keputusan otorisasi dan kalkulasi bisnis dilakukan di backend. Aplikasi mobile hanya menampilkan dan memvalidasi awal; menyembunyikan tombol bukan kontrol keamanan. | review |

### RN-9xx — Testing dan ketahanan (7 aturan)

| ID | Level | Aturan | Penegakan |
|---|---|---|---|
| `RN-901` | WAJIB | Test memakai Jest dengan preset @react-native/jest-preset dan React Native Testing Library (getByRole, userEvent) dari sudut pengguna. react-test-renderer tidak dipakai. | jest, no-restricted-imports (react-test-renderer) |
| `RN-902` | WAJIB | Modul native (Keychain, AsyncStorage, safe area) di-mock terpusat di jest.setup.ts memakai mock resmi pustaka bila tersedia. | review |
| `RN-903` | WAJIB | Alur utama diuji end-to-end di tingkat komponen: login berhasil, validasi gagal, logout, dan sesi berakhir (401). Server diganti adapter tiruan, bukan memanggil jaringan. | jest |
| `RN-904` | WAJIB | ErrorBoundary dipasang di akar aplikasi (dan per fitur kritikal) dengan tampilan fallback, tombol coba lagi, dan pencatatan error. | review |
| `RN-905` | WAJIB | StrictMode aktif di komponen akar. | review |
| `RN-906` | WAJIB | Setiap layar data menangani keadaan memuat, error, dan kosong; aplikasi menampilkan tampilan memuat saat memulihkan sesi. | review |
| `RN-907` | SEBAIKNYA | Hermes dan New Architecture (bawaan React Native) tidak dimatikan; pustaka native dipilih yang mendukung New Architecture. | review |

## Bukti Penegakan

Diuji pada 5 November 2026 dengan React Native 0.88.1, React 19.3.0, TypeScript 6.0.3, ESLint 10.13.0, typescript-eslint 8.72.1, @eslint-react/eslint-plugin 5.28.8, eslint-plugin-react-hooks 7.1.1, eslint-plugin-react-native 5.0.0, Jest 29.7.0, dan React Native Testing Library 14.1.0:

- [`template/`](template/): `tsc` lulus, ESLint **0 temuan** (`--max-warnings 0`), Prettier bersih, 9 test Jest lulus, bundle Metro Android (release) berhasil.
- [`examples/salah`](examples/salah/) (diadaptasi dari kode boilerplate): ESLint menemukan **30 pelanggaran**, mencakup RN-203, RN-204, RN-206, RN-301, RN-302, RN-303, RN-304, RN-401, RN-402, RN-603, RN-801, RN-806, JS-505, JS-610, JS-702, dan TS-201.
- **Tidak tertangkap alat:** service yang menampilkan Toast (RN-503) dan penanganan error ganda. Diperiksa saat review.
- **Belum diuji:** build native (Gradle dan Xcode) dan jalan di perangkat. Lingkungan uji tidak memiliki Android SDK dan Xcode. Keduanya wajib dicoba pada pilot.
- `eslint-plugin-react-native` 5.0 dan `@react-native/eslint-plugin` masih memakai API ESLint lama; konfigurasi membungkusnya dengan `fixupPluginRules` dari `@eslint/compat` dan `npmrc.template` memakai `legacy-peer-deps=true`.
- Jest menampilkan peringatan `findNodeHandle is deprecated in StrictMode` dari Animated dan react-native-screens (kode pustaka, bukan kode aplikasi). Peringatan ini tidak menggagalkan test.
- `react-native-keychain` 10.0.0 dirilis Maret 2025 (±19 bulan tanpa rilis baru). Masih berfungsi dan dipakai luas, tetapi masuk daftar pantau RN-108; alternatif: `react-native-sensitive-info`.

## Referensi

- mobile-boilerplate-reactnative — https://github.com/dimaswahyu-official/mobile-boilerplate-reactnative
- Dokumentasi resmi React Native — https://reactnative.dev/docs (Security, Releases Overview)
- React Navigation 7 — https://reactnavigation.org/docs
- React Native Testing Library — https://callstack.github.io/react-native-testing-library
- Standar 02 JavaScript & TypeScript dan 03 ReactJS PANDAWA

## Isi Folder

| File | Isi |
|---|---|
| `README.md` | Dokumen ini |
| [`Standar_ReactNative.xlsx`](Standar_ReactNative.xlsx) | Daftar aturan lengkap (sumber utama) dan sheet temuan boilerplate |
| [`template/`](template/) | Aplikasi template beserta seluruh konfigurasi alat |
| [`checklist-review.md`](checklist-review.md) | Checklist review |
| [`examples/`](examples/) | Contoh kode salah dari boilerplate dan skrip uji linternya |
| [`CHANGELOG.md`](CHANGELOG.md) | Riwayat perubahan |
