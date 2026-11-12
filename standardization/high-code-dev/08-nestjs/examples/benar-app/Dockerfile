# syntax=docker/dockerfile:1
# NST-904: image multi-stage, berjalan sebagai user non-root, base image dikunci.
# Saat dipakai di proyek, ganti tag dengan tag + digest (node:24.x-bookworm-slim@sha256:...)
# dan jalankan Trivy di CI: build gagal bila ada temuan CRITICAL/HIGH yang sudah ada perbaikannya.
#
# Asumsi struktur proyek: package.json, package-lock.json, .npmrc, tsconfig*.json, dan src/
# berada di root aplikasi (di folder standar ini, package.json ada satu tingkat di atas).
ARG NODE_IMAGE=node:24.22.3-bookworm-slim

FROM ${NODE_IMAGE} AS bangun
WORKDIR /app
COPY package.json package-lock.json .npmrc ./
RUN npm ci
COPY tsconfig.json tsconfig.build.json ./
COPY src ./src
RUN npm run build && npm prune --omit=dev

FROM ${NODE_IMAGE}
ENV NODE_ENV=production
WORKDIR /app
COPY --from=bangun --chown=node:node /app/package.json ./
COPY --from=bangun --chown=node:node /app/node_modules ./node_modules
COPY --from=bangun --chown=node:node /app/dist ./dist
USER node
EXPOSE 3000
HEALTHCHECK --interval=30s --timeout=3s --retries=3 \
  CMD ["node", "-e", "fetch('http://127.0.0.1:3000/api/sehat/hidup').then((r) => process.exit(r.ok ? 0 : 1)).catch(() => process.exit(1))"]
CMD ["node", "dist/main.js"]
