# KCSI Access Vault Portal

Portal internal Tim PANDAWA untuk merekap kelengkapan data akses/koneksi
(Oracle EBS, Oracle APEX, Database TNS, SSH, VPN, API Key) di seluruh
subsidiary KCSI - dengan akses **view only** dan **admin** (create/update/reveal).

Dokumentasi lengkap (arsitektur, ERD, langkah setup ORDS, deploy Netlify,
catatan keamanan): lihat `KCSI_Access_Vault_Portal_Dokumentasi.docx` di root
folder ini.

## Struktur

```
vault-project/
├── backend/                       # SQL/PLSQL - dijalankan di DB Oracle (schema APX)
│   ├── 01_schema.sql               # DDL tabel + view
│   ├── 02_apx_vault_crypto_pkg.sql # Package enkripsi AES-256
│   ├── 03_apx_vault_access_pkg.sql # Package API utama (business logic)
│   ├── 04_ords_rest_setup.sql      # Module/template/handler ORDS + OAuth2
│   └── 05_seed_lookup_data.sql     # Data master awal (bukan kredensial)
│
└── frontend/                      # React + Vite, deploy ke Netlify
    ├── netlify/functions/token.js  # Proxy OAuth2 (client_secret server-side)
    ├── netlify.toml
    ├── src/
    │   ├── api/                    # client.js, AuthContext.jsx
    │   ├── components/             # Layout, StatusBadge, RevealPassword, DetailModal
    │   ├── pages/                  # Login, Dashboard, AdminForm, AuditLog
    │   └── styles/app.css
    └── .env.example
```

## Quick start (development)

Backend:
```
sqlplus apx/<password>@<db> @backend/01_schema.sql
sqlplus apx/<password>@<db> @backend/02_apx_vault_crypto_pkg.sql
sqlplus apx/<password>@<db> @backend/03_apx_vault_access_pkg.sql
sqlplus apx/<password>@<db> @backend/04_ords_rest_setup.sql
sqlplus apx/<password>@<db> @backend/05_seed_lookup_data.sql
```

Frontend:
```
cd frontend
npm install
cp .env.example .env      # isi VITE_ORDS_BASE_URL
npm run dev
```

Untuk variable server-side Netlify Function (`ORDS_BASE_URL`, `OAUTH_CLIENT_ID`,
`OAUTH_CLIENT_SECRET`), jalankan `netlify dev` (Netlify CLI) atau set lewat
Netlify Dashboard saat deploy.

## Keamanan (ringkas)

- Password disimpan **terenkripsi** (AES-256) di kolom `password_enc`, tidak pernah
  disimpan plaintext.
- List/detail selalu mengembalikan password **masked** (`********`); hanya endpoint
  `reveal` yang mendekripsi, dan **hanya untuk role ADMIN**.
- Setiap `LIST`, `REVEAL`, `CREATE`, `UPDATE`, `DELETE` tercatat di `apx_vault_audit_log`.
- OAuth2 `client_credentials` mengautentikasi **aplikasi** (frontend Netlify), bukan
  user individual - identitas user dikirim eksplisit dari layar login sederhana dan
  divalidasi terhadap tabel `apx_vault_user_role`. Untuk keamanan lebih tinggi,
  integrasikan dengan SSO/Active Directory perusahaan (lihat dokumentasi bagian
  "Pengembangan Lanjutan").
- `client_secret` OAuth2 **tidak pernah** dikirim ke browser - ditukar lewat
  Netlify Function server-side (`netlify/functions/token.js`).

Detail lengkap: lihat dokumentasi Word.
