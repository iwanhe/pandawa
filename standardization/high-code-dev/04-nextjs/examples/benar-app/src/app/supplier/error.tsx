'use client';

import { useEffect } from 'react';

// NXT-501: error boundary per segmen; pesan teknis tidak ditampilkan ke pengguna.
export default function GalatSupplier({
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
    <div role="alert">
      <p>Data supplier gagal dimuat.</p>
      <button type="button" onClick={reset}>
        Coba lagi
      </button>
    </div>
  );
}
