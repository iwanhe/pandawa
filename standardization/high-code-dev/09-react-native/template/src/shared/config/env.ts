import { API_BASE_URL, API_TIMEOUT_MS, APP_ENV_NAME } from '@env';

/** Nama lingkungan aplikasi. */
export type AppEnvName = 'dev' | 'uat' | 'prod';

/** Konfigurasi publik aplikasi yang sudah divalidasi (RN-802, TS-207). */
export interface AppEnv {
  readonly name: AppEnvName;
  readonly apiBaseUrl: string;
  readonly apiTimeoutMs: number;
}

/** Nilai mentah dari @env; selalu string karena disuntikkan saat build. */
export interface RawEnv {
  readonly name: string;
  readonly apiBaseUrl: string;
  readonly apiTimeoutMs: string;
}

const appEnvNames: readonly AppEnvName[] = ['dev', 'uat', 'prod'];

function isAppEnvName(value: string): value is AppEnvName {
  return appEnvNames.some((name) => name === value);
}

/**
 * Memvalidasi konfigurasi saat aplikasi mulai. Konfigurasi yang salah
 * menghentikan aplikasi lebih awal daripada gagal diam-diam saat request.
 * RN-803: selain lingkungan dev, API wajib HTTPS.
 */
export function parseEnv(raw: RawEnv): AppEnv {
  if (!isAppEnvName(raw.name)) {
    throw new Error(
      `APP_ENV_NAME tidak dikenal: "${raw.name}". Pilihan: ${appEnvNames.join(', ')}.`,
    );
  }

  if (!raw.apiBaseUrl.startsWith('https://') && raw.name !== 'dev') {
    throw new Error(`API_BASE_URL wajib memakai https:// untuk lingkungan ${raw.name}.`);
  }

  const apiTimeoutMs = Number(raw.apiTimeoutMs);
  if (!Number.isInteger(apiTimeoutMs) || apiTimeoutMs <= 0) {
    throw new Error(`API_TIMEOUT_MS harus bilangan bulat positif, bukan "${raw.apiTimeoutMs}".`);
  }

  return { name: raw.name, apiBaseUrl: raw.apiBaseUrl, apiTimeoutMs };
}

/** Konfigurasi aktif aplikasi. */
export const env: AppEnv = parseEnv({
  name: APP_ENV_NAME,
  apiBaseUrl: API_BASE_URL,
  apiTimeoutMs: API_TIMEOUT_MS,
});
