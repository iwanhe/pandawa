#!/usr/bin/env bash
# Menjalankan ESLint template terhadap contoh salah. Hasil yang diharapkan: banyak pelanggaran.
# Contoh disalin sementara ke template/.lint-salah agar memakai node_modules dan konfigurasi template.
set -u
cd "$(dirname "$0")/../template" || exit 1
rm -rf .lint-salah
mkdir .lint-salah
cp ../examples/salah/* .lint-salah/
cat > .lint-salah/tsconfig.json <<'JSON'
{ "extends": "../tsconfig.json", "include": ["./*.ts", "./*.tsx", "../env.d.ts"] }
JSON
npx eslint .lint-salah
status=$?
rm -rf .lint-salah
exit "$status"
