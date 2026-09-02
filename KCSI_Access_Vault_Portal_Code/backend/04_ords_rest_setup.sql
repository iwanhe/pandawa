--------------------------------------------------------------------------------
-- Script:   04_ords_rest_setup.sql
-- Purpose:  Definisi ORDS Module/Template/Handler untuk apx_vault_access_pkg
--           + OAuth2 client + privilege, mengikuti standar apex-rest-pandawa
-- Base URL: https://<host>/ords/<schema_alias>/api/vault/
-- Author:   Tim PANDAWA
--------------------------------------------------------------------------------

begin
    ords.define_module(
        p_module_name    => 'apx_vault_api'
       ,p_base_path      => '/api/vault/'
       ,p_items_per_page => 50
       ,p_status         => 'PUBLISHED'
       ,p_comments       => 'REST API - KCSI Access & Connection Vault Portal'
    );
    commit;
end;
/

-- ============================================================================
-- TEMPLATE: whoami  ->  POST /api/vault/auth/whoami  (dipanggil saat identify/login)
-- ============================================================================
begin
    ords.define_template(
        p_module_name  => 'apx_vault_api'
       ,p_pattern      => 'auth/whoami'
    );
    --
    ords.define_handler(
        p_module_name  => 'apx_vault_api'
       ,p_pattern      => 'auth/whoami'
       ,p_method       => 'POST'
       ,p_source_type  => ords.source_type_plsql
       ,p_source       => q'[
apx_vault_access_pkg.whoami(
    p_username => :username
);]'
    );
    commit;
end;
/

-- ============================================================================
-- TEMPLATE: list  ->  GET  /api/vault/access/list
-- ============================================================================
begin
    ords.define_template(
        p_module_name  => 'apx_vault_api'
       ,p_pattern      => 'access/list'
       ,p_comments     => 'List akses (password masked), filter: company, env, sys_type, search'
    );
    --
    ords.define_handler(
        p_module_name    => 'apx_vault_api'
       ,p_pattern        => 'access/list'
       ,p_method         => 'GET'
       ,p_source_type    => ords.source_type_plsql
       ,p_source         => q'[
apx_vault_access_pkg.get_list(
    p_company  => :company
   ,p_env      => :env
   ,p_sys_type => :sys_type
   ,p_search   => :search
);]'
       ,p_comments       => 'Handler thin dispatcher - logic ada di apx_vault_access_pkg.get_list'
    );
    commit;
end;
/

-- ============================================================================
-- TEMPLATE: detail  ->  GET /api/vault/access/detail/:access_id
-- ============================================================================
begin
    ords.define_template(
        p_module_name  => 'apx_vault_api'
       ,p_pattern      => 'access/detail/:access_id'
    );
    --
    ords.define_handler(
        p_module_name  => 'apx_vault_api'
       ,p_pattern      => 'access/detail/:access_id'
       ,p_method       => 'GET'
       ,p_source_type  => ords.source_type_plsql
       ,p_source       => q'[
apx_vault_access_pkg.get_detail(
    p_access_id => :access_id
);]'
    );
    commit;
end;
/

-- ============================================================================
-- TEMPLATE: reveal  ->  POST /api/vault/access/reveal/:access_id  (ADMIN only)
-- ============================================================================
begin
    ords.define_template(
        p_module_name  => 'apx_vault_api'
       ,p_pattern      => 'access/reveal/:access_id'
    );
    --
    ords.define_handler(
        p_module_name  => 'apx_vault_api'
       ,p_pattern      => 'access/reveal/:access_id'
       ,p_method       => 'POST'
       ,p_source_type  => ords.source_type_plsql
       ,p_source       => q'[
apx_vault_access_pkg.reveal_password(
    p_access_id => :access_id
   ,p_username  => :username
);]'
    );
    commit;
end;
/

-- ============================================================================
-- TEMPLATE: summary  ->  GET /api/vault/access/summary  (dashboard kelengkapan)
-- ============================================================================
begin
    ords.define_template(
        p_module_name  => 'apx_vault_api'
       ,p_pattern      => 'access/summary'
    );
    --
    ords.define_handler(
        p_module_name  => 'apx_vault_api'
       ,p_pattern      => 'access/summary'
       ,p_method       => 'GET'
       ,p_source_type  => ords.source_type_plsql
       ,p_source       => q'[
apx_vault_access_pkg.get_completeness_summary;]'
    );
    commit;
end;
/

-- ============================================================================
-- TEMPLATE: save  ->  POST /api/vault/access/save  (ADMIN only, insert/update)
--   body JSON di-bind otomatis ke bind variable dengan nama sama oleh ORDS
-- ============================================================================
begin
    ords.define_template(
        p_module_name  => 'apx_vault_api'
       ,p_pattern      => 'access/save'
    );
    --
    ords.define_handler(
        p_module_name  => 'apx_vault_api'
       ,p_pattern      => 'access/save'
       ,p_method       => 'POST'
       ,p_source_type  => ords.source_type_plsql
       ,p_source       => q'[
apx_vault_access_pkg.save_access(
    p_username        => :username
   ,p_access_id       => :access_id
   ,p_company_code    => :company_code
   ,p_env_code        => :env_code
   ,p_sys_type_code   => :sys_type_code
   ,p_label           => :label
   ,p_url             => :url
   ,p_host            => :host
   ,p_port            => :port
   ,p_service_name    => :service_name
   ,p_instance_name   => :instance_name
   ,p_workspace_name  => :workspace_name
   ,p_access_username => :access_username
   ,p_password        => :password
   ,p_password_hint   => :password_hint
   ,p_tns_entry       => :tns_entry
   ,p_ssh_auth_method => :ssh_auth_method
   ,p_ssh_key_path    => :ssh_key_path
   ,p_vpn_type        => :vpn_type
   ,p_vpn_config_file => :vpn_config_file
   ,p_extra_json      => :extra_json
   ,p_notes           => :notes
   ,p_expiry_date     => :expiry_date
);]'
    );
    commit;
end;
/

-- ============================================================================
-- TEMPLATE: delete  ->  DELETE /api/vault/access/:access_id  (ADMIN only)
-- ============================================================================
begin
    ords.define_template(
        p_module_name  => 'apx_vault_api'
       ,p_pattern      => 'access/:access_id'
    );
    --
    ords.define_handler(
        p_module_name  => 'apx_vault_api'
       ,p_pattern      => 'access/:access_id'
       ,p_method       => 'DELETE'
       ,p_source_type  => ords.source_type_plsql
       ,p_source       => q'[
apx_vault_access_pkg.delete_access(
    p_access_id => :access_id
   ,p_username  => :username
);]'
    );
    commit;
end;
/

-- ============================================================================
-- TEMPLATE: audit  ->  GET /api/vault/audit?username=...&access_id=...  (ADMIN only)
-- ============================================================================
begin
    ords.define_template(
        p_module_name  => 'apx_vault_api'
       ,p_pattern      => 'audit'
    );
    --
    ords.define_handler(
        p_module_name  => 'apx_vault_api'
       ,p_pattern      => 'audit'
       ,p_method       => 'GET'
       ,p_source_type  => ords.source_type_plsql
       ,p_source       => q'[
apx_vault_access_pkg.get_audit_log(
    p_username  => :username
   ,p_access_id => :access_id
);]'
    );
    commit;
end;
/

-- ============================================================================
-- OAUTH2 CLIENT CREDENTIALS (dipakai frontend React/Netlify)
-- ============================================================================
-- Blok ini idempotent (aman di-rerun): jika client dengan nama sama sudah ada
-- dari percobaan sebelumnya, di-drop dulu supaya tidak kena ORA-00001 unique
-- constraint (ORDS_METADATA.OAUTH_CLIENTS_UNIQUE1) saat create_client.
begin
    oauth.drop_client(p_name => 'VAULT_PORTAL_FRONTEND');
    commit;
exception
    when others then
        -- abaikan jika memang belum pernah ada (client belum terdaftar)
        null;
end;
/

begin
    oauth.create_client(
        p_name            => 'VAULT_PORTAL_FRONTEND'
       ,p_grant_type      => 'client_credentials'
       ,p_owner           => 'APX'
       ,p_description     => 'React/Vite frontend (Netlify) - KCSI Access Vault Portal'
       ,p_support_email   => 'it@kcsi.co.id'
       ,p_privilege_names => 'apx_vault_privilege'
    );
    commit;
end;
/

begin
    oauth.grant_client_role(
        p_client_name => 'VAULT_PORTAL_FRONTEND'
       ,p_role_name   => 'SQL Developer'
    );
    commit;
end;
/

-- ============================================================================
-- PRIVILEGE - proteksi seluruh module /api/vault/*
-- ============================================================================
-- Signature ORDS.DEFINE_PRIVILEGE terkonfirmasi (hasil query all_arguments di
-- environment KCSI) - overload yang dipakai di bawah:
--   define_privilege(p_privilege_name, p_roles, p_patterns, p_label, p_description, p_comments)
-- p_roles dan p_patterns bertipe PL/SQL TABLE (associative array, cocok dengan OWA.VC_ARR)
-- dan TIDAK diisi lewat constructor seperti APEX_T_VARCHAR2('x') - harus
-- dideklarasikan lalu diisi per-index.
declare
    l_roles    owa.vc_arr;
    l_patterns owa.vc_arr;
begin
    l_roles(1)    := 'SQL Developer';
    l_patterns(1) := '/api/vault/*';
    --
    ords.define_privilege(
        p_privilege_name   => 'apx_vault_privilege'
       ,p_roles            => l_roles
       ,p_patterns         => l_patterns
       ,p_label            => 'Vault Portal API Access'
       ,p_description      => 'OAuth2 protected access to Access Vault Portal API'
       ,p_comments         => null
    );
    commit;
end;
/

-- ============================================================================
-- CORS - izinkan domain Netlify frontend memanggil ORDS
--   (Set di ORDS config, bukan SQL - contoh lewat REST Admin/ords.war config)
--   ords.set_module_privilege / atau via ords config CORS:
--     ords config set restEnabledSql.active true            (jika perlu)
--     ords --config <ords-config-dir> config set cors.allowedOrigins.<n> https://<netlify-app>.netlify.app
--   Alternatif: definisikan lewat SQL Workshop > RESTful Services > CORS di APEX,
--   atau tambahkan header via ORDS Global/Pool settings.
-- ============================================================================
