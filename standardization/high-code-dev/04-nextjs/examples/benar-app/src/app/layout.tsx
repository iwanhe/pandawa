// NXT-503: metadata lewat Metadata API.
import type { Metadata } from 'next';
import type { ReactNode } from 'react';

export const metadata: Metadata = {
  title: { default: 'Contoh Standar Next.js', template: '%s | PANDAWA' },
  description: 'Aplikasi contoh Standar Next.js Tim PANDAWA',
};

export default function RootLayout({ children }: { readonly children: ReactNode }) {
  return (
    <html lang="id">
      <body>
        <main>{children}</main>
      </body>
    </html>
  );
}
