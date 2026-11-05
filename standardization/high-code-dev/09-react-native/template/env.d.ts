// Tipe untuk modul virtual @env yang disuntikkan react-native-dotenv saat build (RN-802).
// Pengecualian TS-504: ini deklarasi modul milik alat build, bukan kode aplikasi.
// Nilainya selalu string; konversi dan validasi dilakukan di src/shared/config/env.ts.
declare module '@env' {
  export const APP_ENV_NAME: string;
  export const API_BASE_URL: string;
  export const API_TIMEOUT_MS: string;
}
