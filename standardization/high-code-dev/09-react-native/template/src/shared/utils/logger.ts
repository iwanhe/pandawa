/**
 * Logger aplikasi (JS-505, RN-806).
 *
 * - Hanya menulis ke konsol di build development (__DEV__).
 * - Tidak pernah menerima token, password, atau isi respons API sebagai argumen.
 * - Di build rilis, sambungkan ke layanan crash reporting yang disetujui.
 */
export function logError(message: string, error?: unknown): void {
  if (__DEV__) {
    console.error(`[PANDAWA] ${message}`, error);
  }
}

/** Mencatat peringatan non-fatal. Aturan yang sama dengan logError. */
export function logWarning(message: string): void {
  if (__DEV__) {
    console.warn(`[PANDAWA] ${message}`);
  }
}
