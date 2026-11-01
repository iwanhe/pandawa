'use client';

import { useEffect } from 'react';

// NXT-103: fallback untuk error yang tidak tertangani di seluruh aplikasi.
export default function GlobalError({
  error,
  reset,
}: {
  readonly error: Error & { digest?: string };
  readonly reset: () => void;
}) {
  useEffect(() => {
    // Kirim ke sistem log/monitoring; digest menghubungkan ke log server.
    console.error(error);
  }, [error]);

  return (
    <html lang="id">
      <body>
        <h1>Terjadi kesalahan</h1>
        <button type="button" onClick={reset}>
          Coba lagi
        </button>
      </body>
    </html>
  );
}
