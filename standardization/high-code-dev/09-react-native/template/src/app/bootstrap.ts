import { useAuthStore } from '../features/auth/store/authStore';
import { httpClient, installAuthInterceptors } from '../shared/api/httpClient';

let isBootstrapped = false;

/**
 * Menyambungkan modul-modul aplikasi sekali saat start (dipanggil dari index.js).
 * Klien HTTP tidak mengimpor store autentikasi secara langsung (JS-706).
 */
export function bootstrapApp(): void {
  if (isBootstrapped) {
    return;
  }
  installAuthInterceptors(httpClient, {
    getAccessToken: () => useAuthStore.getState().accessToken,
    onUnauthorized: () => {
      useAuthStore.getState().expireSession();
    },
  });
  isBootstrapped = true;
}
