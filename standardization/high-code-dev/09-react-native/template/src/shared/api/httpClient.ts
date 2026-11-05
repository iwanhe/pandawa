import axios, { isAxiosError } from 'axios';
import type { AxiosInstance } from 'axios';

import { env } from '../config/env';

/**
 * Klien HTTP tunggal aplikasi (RN-501). Semua request ke backend lewat instance ini,
 * sehingga base URL, timeout, header, dan penanganan 401 diatur di satu tempat.
 */
export const httpClient: AxiosInstance = axios.create({
  baseURL: env.apiBaseUrl,
  timeout: env.apiTimeoutMs,
  headers: { Accept: 'application/json' },
});

/** Penghubung antara klien HTTP dan state autentikasi, tanpa import silang (JS-706). */
export interface AuthHandlers {
  readonly getAccessToken: () => string | null;
  readonly onUnauthorized: () => void;
}

/**
 * Memasang interceptor autentikasi (RN-502). Token dibaca dari memori, bukan dari
 * storage di setiap request. Mengembalikan fungsi untuk melepas interceptor.
 */
export function installAuthInterceptors(client: AxiosInstance, handlers: AuthHandlers): () => void {
  const requestId = client.interceptors.request.use((config) => {
    const token = handlers.getAccessToken();
    if (token !== null) {
      config.headers.set('Authorization', `Bearer ${token}`);
    }
    return config;
  });

  const responseId = client.interceptors.response.use(undefined, (error: unknown) => {
    if (isAxiosError(error) && error.response?.status === 401) {
      handlers.onUnauthorized();
    }
    if (error instanceof Error) {
      return Promise.reject(error);
    }
    return Promise.reject(new Error('Kesalahan HTTP tidak dikenal.', { cause: error }));
  });

  return () => {
    client.interceptors.request.eject(requestId);
    client.interceptors.response.eject(responseId);
  };
}

/**
 * Menerjemahkan error teknis menjadi pesan yang aman ditampilkan ke pengguna (RN-503).
 * Detail teknis tidak ditampilkan; pesan server hanya dipakai bila berupa string.
 */
export function toUserMessage(error: unknown): string {
  if (!isAxiosError(error)) {
    return 'Terjadi kesalahan. Silakan coba lagi.';
  }
  if (error.code === 'ECONNABORTED') {
    return 'Server terlalu lama merespons. Periksa koneksi lalu coba lagi.';
  }
  if (error.response === undefined) {
    return 'Tidak dapat terhubung ke server. Periksa koneksi internet.';
  }
  const data: unknown = error.response.data;
  if (typeof data === 'object' && data !== null && 'message' in data) {
    const { message } = data;
    if (typeof message === 'string' && message.length > 0) {
      return message;
    }
  }
  return `Permintaan gagal (kode ${String(error.response.status)}).`;
}
