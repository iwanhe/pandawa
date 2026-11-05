# Template Aplikasi React Native — PANDAWA

Template aplikasi mobile sesuai [Standar React Native](../README.md) (prefix `RN`). Diturunkan dari [`mobile-boilerplate-reactnative`](https://github.com/dimaswahyu-official/mobile-boilerplate-reactnative) dan diperbaiki agar lulus typecheck, lint, test, dan bundle.

| Komponen | Versi |
|---|---|
| React Native (CLI, New Architecture, Hermes) | 0.88.1 |
| React | 19.3.0 |
| TypeScript | 6.0.3 |
| Navigasi | @react-navigation/native 7.5.1 + native-stack 7.21.0 |
| State | Zustand 5.0.16 |
| HTTP | axios 1.21.0 |
| Penyimpanan token | react-native-keychain 10.0.0 (Keychain / Keystore) |
| Test | Jest 29.7.0 + React Native Testing Library 14.1.0 |
| Node.js | ≥ 22.11 |

## Isi

```
template/
├── index.js                     Titik masuk: bootstrapApp() lalu daftarkan src/app/App
├── app.json                     Nama modul — wajib sama dengan proyek native
├── babel.config.js              react-native-dotenv dengan allowlist (RN-802)
├── .env.example, .env.test      Contoh konfigurasi publik; .env asli tidak di-commit
├── eslint.config.mjs            Aturan RN + salinan standar 02 (eslint.base.mjs)
├── tsconfig.json                Strict + forceConsistentCasingInFileNames (RN-102)
├── jest.config.js, jest.setup.ts
├── __tests__/App.test.tsx       Alur login, validasi, logout, sesi berakhir (401)
└── src/
    ├── app/                     App.tsx (provider), bootstrap.ts
    ├── navigation/              RootNavigator.tsx, types.ts
    ├── features/
    │   ├── auth/                api/, screens/LoginScreen, store/authStore, storage/tokenStorage
    │   └── home/                screens/HomeScreen
    └── shared/
        ├── api/                 httpClient (+ test)
        ├── components/          AppButton, AppTextInput, LoadingView, ErrorBoundary
        ├── config/              env (+ test)
        ├── theme/               Design token
        └── utils/               logger
```

## Membuat Aplikasi Baru

Template tidak membawa folder `android/` dan `ios/`. Folder native dibuat per aplikasi agar nama dan identifier-nya benar sejak awal (RN-106).

```bash
# 1. Buat proyek native dengan versi React Native yang sama
npx @react-native-community/cli@20.2.0 init NamaAplikasi --version 0.88.1 --skip-git-init
cd NamaAplikasi

# 2. Hapus file contoh bawaan CLI yang digantikan template
rm App.tsx __tests__/App.test.tsx .eslintrc.js .prettierrc.js

# 3. Salin isi template (kecuali node_modules) ke root proyek, timpa file yang sama
#    lalu salin npmrc.template menjadi .npmrc
cp <path>/template/npmrc.template .npmrc

# 4. Samakan nama modul: app.json "name" = nama yang dipakai proyek native (mis. NamaAplikasi)

# 5. Pasang dependency dan periksa
npm install
cp .env.example .env            # isi API_BASE_URL untuk development
npm run verify                  # typecheck + lint + test + format
npm run bundle:check

# 6. iOS
bundle install && cd ios && bundle exec pod install && cd ..
```

Setelah itu periksa konfigurasi native dengan bagian **Konfigurasi Native** di [`checklist-review.md`](../checklist-review.md): cleartext HTTP, ATS, `allowBackup`, izin perangkat, dan penandatanganan rilis.

## Lingkungan (`@env`)

| Variabel | Contoh | Keterangan |
|---|---|---|
| `APP_ENV_NAME` | `dev` / `uat` / `prod` | Selain `dev`, `API_BASE_URL` wajib `https://` |
| `API_BASE_URL` | `https://api-uat.example.co.id` | Base URL backend (mis. ORDS atau API Gateway) |
| `API_TIMEOUT_MS` | `15000` | Timeout request dalam milidetik |

File yang dibaca: `.env`, lalu `.env.<APP_ENV>` bila variabel `APP_ENV` diset saat build (mis. `APP_ENV=uat` → `.env.uat`). Jest memakai `.env.test`. Nilai di-validasi saat aplikasi mulai oleh `src/shared/config/env.ts`.

**Semua nilai ini masuk ke bundle dan dapat dibaca dari APK/IPA.** Jangan menaruh secret di sini (RN-802). Menambah variabel baru berarti menambah ke `allowlist` di `babel.config.js`, ke `env.d.ts`, dan ke `parseEnv`.

## Menyesuaikan dengan Backend

`src/features/auth/api/authApi.ts` mengasumsikan endpoint `POST /auth/login` yang membalas `{ "access_token": "..." }` (sama dengan boilerplate). Sesuaikan path dan validasi respons dengan backend aplikasi. Bila backend memakai login OIDC/OAuth2, ganti layar login dengan alur Authorization Code + PKCE (RN-406).

Yang belum ada di template dan perlu diputuskan per aplikasi: refresh token, pemeriksaan masa berlaku token saat `restoreSession`, crash reporting di `logger.ts`, dan dukungan offline (RN-506).

## Skrip

| Skrip | Fungsi |
|---|---|
| `npm start` | Metro dev server |
| `npm run android` / `npm run ios` | Build dan jalankan di emulator/perangkat |
| `npm run verify` | `typecheck` + `lint` + `test` + `format:check` (wajib hijau sebelum PR) |
| `npm run bundle:check` | Bundle Android release ke `/tmp`; memastikan semua import dan `@env` ter-resolve (butuh `.env`) |
