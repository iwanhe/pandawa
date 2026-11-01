// NXT-304, NXT-407, NXT-703: Cache Components dan Partial Prefetching aktif, header keamanan, output standalone.
import type { NextConfig } from 'next';

const securityHeaders = [
  { key: 'X-Content-Type-Options', value: 'nosniff' },
  { key: 'Referrer-Policy', value: 'strict-origin-when-cross-origin' },
  { key: 'X-Frame-Options', value: 'DENY' },
];

const nextConfig: NextConfig = {
  cacheComponents: true,
  partialPrefetching: true,
  typedRoutes: true,
  output: 'standalone',
  poweredByHeader: false,
  // NXT-409: isi bila aplikasi berada di belakang reverse proxy (mis. Cloudflare Tunnel)
  // dengan domain berbeda dari host server.
  // experimental: { serverActions: { allowedOrigins: ['apps.contoh.co.id'] } },
  headers() {
    return Promise.resolve([{ source: '/:path*', headers: securityHeaders }]);
  },
};

export default nextConfig;
