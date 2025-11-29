# Panduan Konfigurasi APEX Mail Package

## Daftar Isi
- [Prerequisites](#prerequisites)
- [Langkah-Langkah Konfigurasi](#langkah-langkah-konfigurasi)
- [Konsep Dasar](#konsep-dasar)
- [Contoh Implementasi](#contoh-implementasi)
- [Troubleshooting](#troubleshooting)

---

## Prerequisites

Sebelum memulai konfigurasi, pastikan hal-hal berikut telah terpenuhi:

1. Certificate mail sudah tersedia
2. User APEX_240200 tidak dalam status locked atau expired
3. User Schema sudah di-ACL-kan
4. URL Wallet di OS didaftarkan di workspace internal dengan autologin
5. SMTP Server sudah ditentukan (contoh: mail.nusamail.net) dan dapat di-ping dari server

---

## Langkah-Langkah Konfigurasi

### 1. Cek Status User APEX_240200

```sql
SELECT *
FROM DBA_USERS
WHERE USERNAME LIKE '%APEX%';
```

### 2. Unlock User Jika Terkunci

Jika user dalam status locked, jalankan:

```sql
ALTER USER APEX_240200 ACCOUNT UNLOCK;
```

### 3. Buat ACL (Access Control List)

#### Grant Privilege untuk APEX_240200

```sql
BEGIN
  DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE(
    host => '*',
    ace => xs$ace_type(
      privilege_list => xs$name_list('connect'),
      principal_name => 'APEX_240200',  -- diperlukan agar apex_mail berfungsi
      principal_type => xs_acl.ptype_db
    )
  );
END;
/
```

#### Grant Privilege untuk Schema Aplikasi

```sql
BEGIN
  DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE(
    host => '*',
    ace => xs$ace_type(
      privilege_list => xs$name_list('connect'),
      principal_name => 'GLT',  -- ganti dengan nama schema aplikasi Anda
      principal_type => xs_acl.ptype_db
    )
  );
END;
/
```

**Catatan:** Setelah eksekusi, privilege connect akan bertambah 2.

### 4. Testing SMTP Server & Port

Buat function untuk testing koneksi SMTP:

#### Buat Type TStrings

```sql
CREATE OR REPLACE TYPE TStrings AS TABLE OF VARCHAR2(4000);
/
```

#### Buat Function SmtpTest

```sql
CREATE OR REPLACE FUNCTION SmtpTest (
  server VARCHAR2,
  port INTEGER DEFAULT 25
)
RETURN TStrings
PIPELINED
IS
  smtp UTL_SMTP.connection;
  reply UTL_SMTP.reply;
BEGIN
  -- Attempt to connect to mail server
  PIPE ROW ('connecting to server ' || server || ' on ' || port || '/tcp');
  reply := UTL_SMTP.open_connection (HOST => server, port => port, c => smtp);
  PIPE ROW (reply.Code || '. ' || reply.Text);
  
  -- If a successful connect, gracefully disconnect
  IF reply.Code < 400 THEN
    reply := UTL_SMTP.quit (smtp);
    PIPE ROW (reply.Code || '. ' || reply.Text);
  END IF;
END;
/
```

#### Cara Penggunaan

```sql
-- Test port 25
SELECT * FROM TABLE(SmtpTest('mail.nusamail.net', 25));

-- Test port 587
SELECT * FROM TABLE(SmtpTest('mail.nusamail.net', 587));
```

**Catatan:** 
- Port 25 mungkin menghasilkan error 421
- Port 587 biasanya digunakan untuk koneksi tanpa SSL/TLS

### 5. Setting Parameter SMTP di APEX

```sql
BEGIN
  apex_instance_admin.set_parameter('SMTP_HOST_ADDRESS', 'mail.nusamail.net');
  apex_instance_admin.set_parameter('SMTP_HOST_PORT', '587');
  apex_instance_admin.set_parameter('SMTP_FROM', 'notifications.meta@nusamail.net');
  apex_instance_admin.set_parameter('SMTP_USERNAME', 'username');
  apex_instance_admin.set_parameter('SMTP_PASSWORD', 'password');
  apex_instance_admin.set_parameter('SMTP_TLS_MODE', 'N');
  COMMIT;
  
  apex_instance_admin.validate_email_config;
END;
/
```

### 6. Testing Pengiriman Email

```sql
BEGIN
  apex_mail.send(
    p_to => 'iwan.herdian@limamail.net',  -- ganti dengan alamat email penerima
    p_from => 'iwan.herdian@danangwisnu.my.id',  -- ganti dengan alamat pengirim
    p_body => 'test',
    p_body_html => '<html><body>test</body></html>',
    p_subj => 'test email'
  );
  
  apex_mail.push_queue;
END;
/
```

#### Verifikasi Pengiriman

Cek apakah queue kosong (email sudah terkirim):

```sql
SELECT *
FROM apex_mail_queue;
```

Jika berhasil, tabel harus kosong.

### 7. Konfigurasi Wallet (Opsional untuk SSL/TLS)

Jika memerlukan koneksi SSL/TLS, buat dan konfigurasi wallet:

#### Buat Wallet (via Console/Command Prompt)

```bash
# Buat wallet baru
orapki wallet create -wallet "/u01/PROD/wallet2" -auto_login -pwd wallet123

# Tambahkan trusted certificate
orapki wallet add -wallet "/u01/PROD/wallet2" -trusted_cert -cert "/u01/PROD/wallet2/DigiCertGlobalRootCA.crt" -pwd wallet123

# Tampilkan isi wallet
orapki wallet display -wallet "/u01/PROD/wallet2"
```

**Catatan:** Sesuaikan path dengan struktur OS Anda (contoh di atas untuk Linux).

---

## Konsep Dasar

### Penggunaan DBMS_NETWORK_ACL_ADMIN

Package `DBMS_NETWORK_ACL_ADMIN` digunakan untuk memberikan privilege koneksi ke APEX schema (database user). Hal ini dijelaskan dalam dokumentasi APEX Installation Guide bagian "Enabling Network Services in Oracle Database".

### Informasi yang Diperlukan untuk ACL

#### a) APEX Schema
Bergantung pada versi APEX yang digunakan:
- APEX 23.1: `APEX_230100`
- APEX 21.2: `APEX_210200`
- APEX 19.2: `APEX_190200`
- APEX 24.2: `APEX_240200`

#### b) Hostname
URL tujuan koneksi APEX:
- Untuk URL spesifik: `"example.com"`
- Untuk semua host: `"*"`

#### c) Privilege
Jenis privilege koneksi yang diberikan:
- `'connect'`: untuk UTL_TCP, UTL_SMTP, UTL_MAIL, dan UTL_HTTP
- `'resolve'`: untuk resolusi name/IP UTL_INADDR

### Catatan Multitenant Database

Jika menggunakan multitenant database, pastikan ACL dibuat di database yang sama dengan instalasi APEX:
- Jika APEX di PDB, ACL harus dibuat di PDB tersebut
- Jika APEX di CDB dan digunakan di PDB, ACL harus dibuat di CDB

---

## Contoh Implementasi

### Contoh 1: Grant Connect untuk APEX 23.1 ke Domain Spesifik

```sql
BEGIN
  DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE(
    host => 'example.com',
    ace => xs$ace_type(
      privilege_list => xs$name_list('connect'),
      principal_name => 'APEX_230100',
      principal_type => xs_acl.ptype_db
    )
  );
END;
/
```

### Contoh 2: Grant Connect dan Resolve untuk APEX 21.2 ke Semua Host

```sql
BEGIN
  DBMS_NETWORK_ACL_ADMIN.APPEND_HOST_ACE(
    host => '*',
    ace => xs$ace_type(
      privilege_list => xs$name_list('connect', 'resolve'),
      principal_name => 'APEX_210200',
      principal_type => xs_acl.ptype_db
    )
  );
END;
/
```

---

## Troubleshooting

### 1. Referensi Dokumentasi

Jika mengalami masalah:
- Lihat bagian "Troubleshooting an Invalid ACL Error" di dokumentasi APEX
- Rujuk dokumentasi `DBMS_NETWORK_ACL_ADMIN` untuk detail function call

### 2. Testing Koneksi Database ke Endpoint URL

Untuk testing di luar APEX, connect sebagai SYS dan jalankan:

#### Untuk URL dengan HTTPS (menggunakan wallet)

```sql
SELECT utl_http.request(
  'https://example.com', 
  NULL, 
  'file:/u01/wallet', 
  'wallet_password'
) 
FROM dual;
```

#### Untuk URL tanpa HTTPS

```sql
SELECT utl_http.request('http://example.com') 
FROM dual;
```

Test ini membantu menentukan apakah ada masalah lain yang memblokir koneksi di level database.

### 3. Common Issues

- **User Locked**: Jalankan `ALTER USER APEX_240200 ACCOUNT UNLOCK;`
- **ACL Not Set**: Pastikan privilege 'connect' sudah diberikan
- **SMTP Port Error**: Test dengan berbagai port (25, 465, 587)
- **Wallet Issues**: Pastikan path wallet benar dan certificate valid
- **Queue Tidak Kosong**: Periksa log error di `apex_mail_log`

---

## Referensi

- Oracle APEX Installation Guide
- DBMS_NETWORK_ACL_ADMIN Documentation
- Doc ID 2582658.1 (Multitenant Database ACL)
- Doc ID 265616.1 (UTL_HTTP Secure Web Page Access)

---

**Versi Dokumen:** 1.0  
**Terakhir Diperbarui:** 2025