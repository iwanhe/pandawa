# Checklist Review — React Native

Dipakai reviewer bersama [checklist PR umum](../templates/checklist-pr-umum.md). Isi kolom hasil dengan **Ya**, **Tidak**, atau **N/A**. Setiap **Tidak** dirujuk ke ID aturan di komentar review.

## Prasyarat (otomatis, harus hijau sebelum review)

| Periksa | Hasil |
|---|---|
| `npm run typecheck` lulus | |
| `npm run lint` (`--max-warnings 0`) lulus | |
| `npm test` lulus | |
| `npm run format:check` lulus | |
| `npm run bundle:check` lulus (RN-105) | |
| `npm audit --omit=dev` tanpa High/Critical (RN-108) | |
| Tidak ada `eslint-disable` tanpa alasan dan ID aturan | |
| Checklist standar 02 (JS/TS) dan 03 (ReactJS) juga sudah diperiksa | |

## Aturan yang Diperiksa Manual

### Struktur dan komponen

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `RN-101` | WAJIB | Struktur folder: src/app (komponen akar dan bootstrap), src/navigation, src/features/<fitur>/{screens,components,api,store,storage,hooks}, src/shared/{api,components,config,theme,utils}. index.js mendaftarkan src/app/App; tidak ada App.tsx sisa template di root. | |
| `RN-103` | WAJIB | Versi React Native berada di jendela dukungan resmi (tiga minor terakhir) dan dinaikkan sebelum versi yang dipakai menjadi Unsupported. react, react-native, dan paket @react-native/* memakai pasangan versi dari template resmi versi tersebut; upgrade memakai React Native Upgrade Helper. | |
| `RN-106` | SEBAIKNYA | Proyek native dibuat dengan @react-native-community/cli init pada versi React Native yang sama dengan template. Nama aplikasi, nama modul (app.json "name"), dan applicationId/bundle identifier ditetapkan sebelum rilis pertama dan tidak memakai nama dari template atau boilerplate. | |
| `RN-107` | BOLEH | Template standar memakai React Native CLI (bare). Framework Expo (prebuild / EAS) boleh dipakai dengan ADR yang menjelaskan kebutuhan, biaya layanan, dan dampaknya ke pipeline. | |
| `RN-201` | WAJIB | Layar diberi nama <Nama>Screen.tsx di features/<fitur>/screens dan diekspor dengan named export. Satu komponen utama per file. | |
| `RN-202` | SEBAIKNYA | Elemen UI yang berulang (tombol, input, tampilan memuat, error) memakai komponen di shared/components; layar tidak menata ulang tombol atau input sendiri. | |
| `RN-205` | WAJIB | Form mobile: keyboard tidak menutupi input (KeyboardAvoidingView + ScrollView dengan keyboardShouldPersistTaps="handled"); setiap field memakai autoComplete/textContentType yang tepat; password memakai secureTextEntry; autoCorrect dimatikan untuk username dan password; pesan validasi tampil di dekat field. | |
| `RN-209` | WAJIB | Daftar data yang panjang atau berasal dari server memakai FlatList/SectionList dengan keyExtractor dari ID stabil. ScrollView + map hanya untuk daftar pendek yang tetap. | |

### Styling dan navigasi

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `RN-306` | SEBAIKNYA | Tata letak memakai flexbox dan satuan density-independent. Ukuran layar dibaca dengan useWindowDimensions di dalam komponen; Dimensions.get di tingkat modul tidak dipakai untuk layout. | |
| `RN-403` | WAJIB | Alur autentikasi memakai layar bersyarat di satu navigator berdasarkan status sesi. Setelah login atau logout, layar berganti karena status berubah, bukan karena navigate/reset manual. | |
| `RN-404` | WAJIB | Hanya ada satu NavigationContainer, di komponen akar aplikasi. | |
| `RN-405` | SEBAIKNYA | Nama route PascalCase dan sama dengan nama layar tanpa akhiran Screen. initialRouteName (bila dipakai) menunjuk route yang benar-benar menjadi layar awal. | |
| `RN-406` | WAJIB | Deep link (bila dipakai) tidak membawa token atau data rahasia, memvalidasi parameternya, dan tidak membuka layar terproteksi tanpa sesi. Login OAuth memakai PKCE. | |

### Data, API, dan state

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `RN-501` | WAJIB | Semua request ke backend lewat satu klien HTTP (shared/api/httpClient) yang base URL dan timeout-nya berasal dari konfigurasi. Layar dan store tidak memanggil axios atau fetch langsung. | |
| `RN-503` | WAJIB | Lapisan api/service tidak menampilkan UI (Toast, Alert) dan tidak menelan error; error diteruskan ke layar yang menerjemahkannya menjadi pesan pengguna (toUserMessage). Stack trace, pesan teknis, dan isi respons mentah tidak ditampilkan. | |
| `RN-504` | WAJIB | Respons API bertipe unknown dan divalidasi saat runtime (type guard atau skema) sebelum dipakai. Nama field API yang tidak mengikuti camelCase dipetakan di lapisan api. | |
| `RN-505` | SEBAIKNYA | Request yang hasilnya tidak lagi dibutuhkan (pencarian, layar ditutup) dibatalkan dengan AbortController/signal; hasil yang datang setelah layar ditutup tidak mengubah state. | |
| `RN-506` | SEBAIKNYA | Fitur yang wajib berjalan tanpa sinyal memakai penyimpanan lokal dan antrian kirim ulang dengan kunci unik per transaksi; status sinkron tampil di layar. Kebutuhan offline diputuskan di dokumen desain. | |
| `RN-601` | WAJIB | State global (sesi, preferensi) disimpan di store Zustand per fitur dengan tipe eksplisit. Nilai turunan tidak disimpan terpisah: status login diturunkan dari token/status, bukan flag isAuthenticated tersendiri. | |
| `RN-602` | WAJIB | Komponen membaca store dengan selector per nilai (useAuthStore((s) => s.status)), bukan mengambil seluruh store. | |
| `RN-604` | SEBAIKNYA | State lokal layar (isi form, status submit) memakai useState di layar; tidak dimasukkan ke store global. | |

### Aksesibilitas

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `RN-701` | WAJIB | Elemen interaktif punya accessibilityRole dan label yang bermakna; input punya label terlihat dan accessibilityLabel; status nonaktif/memproses disampaikan lewat accessibilityState; judul layar memakai accessibilityRole="header". | |
| `RN-702` | WAJIB | Area sentuh minimal 44×44 pt (iOS) dan 48×48 dp (Android); elemen kecil memakai hitSlop. | |
| `RN-703` | SEBAIKNYA | Teks mengikuti pengaturan ukuran huruf sistem (allowFontScaling tidak dimatikan) dan tata letak tetap terbaca pada ukuran huruf besar. Kontras warna memenuhi WCAG 2.1 AA. | |
| `RN-704` | SEBAIKNYA | Pesan error dan status yang muncul dinamis diumumkan ke pembaca layar (accessibilityLiveRegion di Android, AccessibilityInfo.announceForAccessibility bila perlu). | |

### Keamanan

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `RN-804` | WAJIB | Build rilis: tidak debuggable, minify/R8 aktif, Hermes aktif. Keystore rilis dan password-nya tidak ada di repo (hanya debug.keystore bawaan); penandatanganan memakai secret CI. | |
| `RN-805` | WAJIB | Izin perangkat (kamera, lokasi, penyimpanan) hanya yang dipakai, diminta saat fitur dibutuhkan, dan iOS Info.plist memuat teks alasan yang jelas. | |
| `RN-807` | SEBAIKNYA | Data sensitif tidak ikut backup otomatis (android:allowBackup="false" atau aturan backup yang mengecualikannya). Layar yang menampilkan data rahasia mencegah tangkapan layar bila diwajibkan klasifikasi datanya. | |
| `RN-808` | WAJIB | Keputusan otorisasi dan kalkulasi bisnis dilakukan di backend. Aplikasi mobile hanya menampilkan dan memvalidasi awal; menyembunyikan tombol bukan kontrol keamanan. | |

### Testing dan ketahanan

| ID | Level | Periksa | Hasil |
|---|---|---|---|
| `RN-902` | WAJIB | Modul native (Keychain, AsyncStorage, safe area) di-mock terpusat di jest.setup.ts memakai mock resmi pustaka bila tersedia. | |
| `RN-904` | WAJIB | ErrorBoundary dipasang di akar aplikasi (dan per fitur kritikal) dengan tampilan fallback, tombol coba lagi, dan pencatatan error. | |
| `RN-905` | WAJIB | StrictMode aktif di komponen akar. | |
| `RN-906` | WAJIB | Setiap layar data menangani keadaan memuat, error, dan kosong; aplikasi menampilkan tampilan memuat saat memulihkan sesi. | |
| `RN-907` | SEBAIKNYA | Hermes dan New Architecture (bawaan React Native) tidak dimatikan; pustaka native dipilih yang mendukung New Architecture. | |

## Konfigurasi Native (saat proyek dibuat dan sebelum rilis)

| ID | Periksa | Hasil |
|---|---|---|
| `RN-106` | applicationId / bundle identifier dan nama modul sudah final, bukan nama template | |
| `RN-803` | Android: cleartext tidak diizinkan di build rilis; iOS: tidak ada NSAllowsArbitraryLoads | |
| `RN-804` | Build rilis tidak debuggable, R8/minify dan Hermes aktif, keystore rilis dari secret CI | |
| `RN-805` | Izin di AndroidManifest/Info.plist hanya yang dipakai, dengan teks alasan | |
| `RN-807` | `android:allowBackup` ditinjau sesuai klasifikasi data | |
| `RN-907` | New Architecture tidak dimatikan | |
