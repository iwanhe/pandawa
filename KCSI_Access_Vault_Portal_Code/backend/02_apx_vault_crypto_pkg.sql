--------------------------------------------------------------------------------
-- Script:   02_apx_vault_crypto_pkg.sql
-- Package:  apx_vault_crypto_pkg
-- Purpose:  Enkripsi/dekripsi AES-256 untuk kolom password_enc
-- Author:   Tim PANDAWA
-- Notes:    Master key TIDAK boleh hard-code di source. Simpan di:
--             (a) Oracle Wallet (disarankan, production), atau
--             (b) tabel terpisah dengan akses dibatasi + wrap package ini, atau
--             (c) OCI Vault / environment variable yang di-inject ke DB link.
--           Contoh di bawah memakai wallet-based key retrieval sebagai referensi;
--           sesuaikan get_master_key() dengan mekanisme yang tersedia di infra Anda.
--------------------------------------------------------------------------------

create or replace package apx_vault_crypto_pkg as

    /**
     * Package version
     */
    function package_version return varchar2;

    /**
     * Enkripsi plaintext -> RAW ciphertext (AES-256-CBC + random IV, IV disisipkan di depan)
     * @param p_plaintext teks asli (password)
     * @return RAW ciphertext siap simpan ke kolom password_enc
     */
    function encrypt (
        p_plaintext in varchar2
    ) return raw;

    /**
     * Dekripsi RAW ciphertext -> plaintext
     * WAJIB dipanggil hanya dari apx_vault_access_pkg.reveal_password
     * (jangan expose function ini langsung ke REST handler)
     * @param p_ciphertext RAW hasil encrypt()
     * @return plaintext password
     */
    function decrypt (
        p_ciphertext in raw
    ) return varchar2;

end apx_vault_crypto_pkg;
/

create or replace package body apx_vault_crypto_pkg as

    k_encryption_type constant pls_integer :=
        dbms_crypto.encrypt_aes256 + dbms_crypto.chain_cbc + dbms_crypto.pad_pkcs5;

    -- --------------------------------------------------------------------
    -- INTERNAL: ambil master key dari Oracle Wallet.
    -- Ganti implementasi ini sesuai standar keamanan infra KCSI
    -- (mis. baca dari tabel apx_vault_secure_key yang hanya bisa diakses
    -- oleh package ini via definer's rights, atau dari OCI Vault).
    -- --------------------------------------------------------------------
    function get_master_key return raw
    is
        l_key raw(32);
    begin
        -- Contoh: ambil key dari wallet menggunakan dbms_crypto + wallet auto-login
        -- select key_value into l_key from apx_vault_secure_key where key_name = 'VAULT_MASTER_KEY';
        --
        -- Placeholder DEV ONLY - WAJIB diganti sebelum go-live production:
        l_key := utl_i18n.string_to_raw('REPLACE_WITH_32_BYTE_SECRET_KEY', 'AL32UTF8');
        return l_key;
    end get_master_key;

    function package_version return varchar2
    is
    begin
        -- Version History:
        -- 01.00.00 2026-09-02 Tim PANDAWA  Initial Version
        return '01.00.00';
    end package_version;

    function encrypt (
        p_plaintext in varchar2
    ) return raw
    is
        l_key    raw(32);
        l_iv     raw(16);
        l_input  raw(2000);
        l_cipher raw(2000);
    begin
        if p_plaintext is null then
            return null;
        end if;
        --
        l_key   := get_master_key();
        l_iv    := dbms_crypto.randombytes(16);
        l_input := utl_i18n.string_to_raw(p_plaintext, 'AL32UTF8');
        --
        l_cipher := dbms_crypto.encrypt(
            src => l_input
           ,typ => k_encryption_type
           ,key => l_key
           ,iv  => l_iv
        );
        --
        -- simpan IV (16 byte) di depan ciphertext supaya bisa dipakai lagi saat decrypt
        return l_iv || l_cipher;
    exception
        when others then
            raise_application_error(-20001, 'apx_vault_crypto_pkg.encrypt error: ' || sqlerrm);
    end encrypt;

    function decrypt (
        p_ciphertext in raw
    ) return varchar2
    is
        l_key      raw(32);
        l_iv       raw(16);
        l_cipher   raw(2000);
        l_plain    raw(2000);
    begin
        if p_ciphertext is null then
            return null;
        end if;
        --
        l_key    := get_master_key();
        l_iv     := utl_raw.substr(p_ciphertext, 1, 16);
        l_cipher := utl_raw.substr(p_ciphertext, 17);
        --
        l_plain := dbms_crypto.decrypt(
            src => l_cipher
           ,typ => k_encryption_type
           ,key => l_key
           ,iv  => l_iv
        );
        --
        return utl_i18n.raw_to_char(l_plain, 'AL32UTF8');
    exception
        when others then
            raise_application_error(-20002, 'apx_vault_crypto_pkg.decrypt error: ' || sqlerrm);
    end decrypt;

end apx_vault_crypto_pkg;
/
