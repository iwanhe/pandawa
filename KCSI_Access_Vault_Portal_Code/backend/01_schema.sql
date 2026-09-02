--------------------------------------------------------------------------------
-- Script:   01_schema.sql
-- App:      VAULT (KCSI Access & Connection Vault)
-- Author:   Tim PANDAWA - IT Upstream Development
-- Purpose:  DDL tabel master untuk portal rekap kelengkapan data akses/koneksi
--           (Oracle EBS, Oracle APEX, Database TNS, SSH, VPN, dll)
-- Schema:   APX
-- Tablespace: APPS_TS_TX_DATA (main), APPS_TS_TX_IDX (index)
--------------------------------------------------------------------------------

-- ============================================================================
-- 1. MASTER: COMPANY / SUBSIDIARY
-- ============================================================================
create table apx_vault_company
(
    company_id      number         generated always as identity
                                    (start with 1 increment by 1)
   ,company_code    varchar2(30)   not null            -- NTI, NSTI, NCT, ATI, META, ORACONS, PRISMA, EAM, GLT, KDK, SKT ATI
   ,company_name    varchar2(150)
   ,is_active       varchar2(1)    default 'Y'  not null
   ,created_by      varchar2(60)   default sys_context('apex$session','app_user') not null
   ,created_at      date           default sysdate      not null
   ,updated_by      varchar2(60)
   ,updated_at      date
   ,constraint apx_vault_company_pk primary key (company_id)
   ,constraint apx_vault_company_u1 unique (company_code)
   ,constraint apx_vault_company_ck1 check (is_active in ('Y','N'))
);

comment on table apx_vault_company is 'Master subsidiary/company (NTI, NSTI, NCT, ATI, META, ORACONS, PRISMA, EAM, GLT, KDK, SKT ATI, dll)';

-- ============================================================================
-- 2. MASTER: ENVIRONMENT (DEV / UAT / PROD)
-- ============================================================================
create table apx_vault_environment
(
    env_id          number         generated always as identity
   ,env_code        varchar2(20)   not null             -- DEV, UAT, PROD
   ,env_name        varchar2(60)
   ,display_order   number         default 1
   ,constraint apx_vault_environment_pk primary key (env_id)
   ,constraint apx_vault_environment_u1 unique (env_code)
);

comment on table apx_vault_environment is 'Master environment: DEV, UAT, PROD';

-- ============================================================================
-- 3. MASTER: SYSTEM / ACCESS TYPE
-- ============================================================================
create table apx_vault_system_type
(
    sys_type_id     number         generated always as identity
   ,sys_type_code   varchar2(30)   not null             -- EBS_APP, APEX_WORKSPACE, DB_TNS, SSH, VPN, API_KEY, OTHER
   ,sys_type_name   varchar2(100)
   ,icon_name       varchar2(60)                        -- untuk UI (nama icon oj-ux-ico-*)
   ,display_order   number         default 1
   ,constraint apx_vault_system_type_pk primary key (sys_type_id)
   ,constraint apx_vault_system_type_u1 unique (sys_type_code)
);

comment on table apx_vault_system_type is 'Master jenis akses: EBS Application, APEX Workspace, Database TNS, SSH, OpenVPN, API Key, Other';

-- ============================================================================
-- 4. UTAMA: ACCESS / CONNECTION RECORD
--    Satu baris = satu entri akses (mis. login EBS NTI DEV, workspace APEX NTI DEV,
--    TNS database NTI DEV, SSH server GLT, OpenVPN KDK, dst)
-- ============================================================================
create table apx_vault_access
(
    access_id       number         generated always as identity
   ,company_id      number         not null
   ,env_id          number         not null
   ,sys_type_id     number         not null
   ,label           varchar2(200)  not null             -- nama bebas, mis. "EBS Login NTI DEV"
   ,url             varchar2(500)                        -- URL login EBS / APEX / portal
   ,host            varchar2(300)                        -- hostname / IP (DB, SSH, VPN server)
   ,port            number
   ,service_name    varchar2(100)                        -- service_name / SID Oracle
   ,instance_name   varchar2(100)
   ,workspace_name  varchar2(100)                        -- khusus APEX workspace
   ,username         varchar2(200)
   ,password_enc     raw(2000)                            -- ciphertext (AES-256), lihat 02_crypto_pkg.sql
   ,password_hint    varchar2(200)                        -- petunjuk non-sensitif, bukan password asli
   ,tns_entry        clob                                 -- isi TNS entry lengkap (host/port dienkripsi bersama string ini opsional)
   ,ssh_auth_method  varchar2(20)                          -- PASSWORD / PRIVATE_KEY
   ,ssh_key_path     varchar2(500)                        -- lokasi private key (bukan isi key-nya)
   ,vpn_type         varchar2(40)                          -- OpenVPN / GlobalProtect / WireGuard
   ,vpn_config_file  varchar2(200)                         -- nama file .ovpn yang relevan (file fisik disimpan terpisah, bukan di DB)
   ,extra_json       clob                                  -- atribut tambahan fleksibel (json) untuk field spesifik jenis akses
   ,notes            varchar2(1000)
   ,is_active        varchar2(1)   default 'Y'  not null
   ,expiry_date      date                                  -- untuk password/akses yang punya masa berlaku
   ,last_rotated_at  date
   ,created_by       varchar2(60)  default sys_context('apex$session','app_user') not null
   ,created_at       date          default sysdate  not null
   ,updated_by       varchar2(60)
   ,updated_at       date
   ,constraint apx_vault_access_pk primary key (access_id)
   ,constraint apx_vault_access_fk1 foreign key (company_id)  references apx_vault_company (company_id)
   ,constraint apx_vault_access_fk2 foreign key (env_id)      references apx_vault_environment (env_id)
   ,constraint apx_vault_access_fk3 foreign key (sys_type_id) references apx_vault_system_type (sys_type_id)
   ,constraint apx_vault_access_ck1 check (is_active in ('Y','N'))
   ,constraint apx_vault_access_ck2 check (extra_json is json)
   ,constraint apx_vault_access_ck3 check (ssh_auth_method in ('PASSWORD','PRIVATE_KEY') or ssh_auth_method is null)
);

comment on table apx_vault_access is 'Baris utama data akses/koneksi: EBS login, APEX workspace, DB TNS, SSH, VPN, dsb - password disimpan terenkripsi (password_enc)';
comment on column apx_vault_access.password_enc is 'Ciphertext AES-256-GCM, di-generate/di-baca lewat apx_vault_crypto_pkg - JANGAN pernah query langsung tanpa lewat package';
comment on column apx_vault_access.extra_json is 'Field tambahan spesifik jenis akses, contoh: {"api_key_scope":"read-only","cert_expiry":"2027-01-01"}';

create index apx_vault_access_n1 on apx_vault_access (company_id, env_id, sys_type_id);
create index apx_vault_access_n2 on apx_vault_access (is_active);

-- ============================================================================
-- 5. AUDIT LOG - setiap view-list (masked), reveal password, dan perubahan data
-- ============================================================================
create table apx_vault_audit_log
(
    log_id          number         generated always as identity
   ,access_id       number
   ,action_type     varchar2(20)   not null             -- LIST, REVEAL, CREATE, UPDATE, DELETE, LOGIN
   ,performed_by    varchar2(60)   not null
   ,client_ip       varchar2(60)
   ,detail          varchar2(1000)
   ,log_at          timestamp      default systimestamp not null
   ,constraint apx_vault_audit_log_pk primary key (log_id)
   ,constraint apx_vault_audit_log_fk1 foreign key (access_id) references apx_vault_access (access_id)
   ,constraint apx_vault_audit_log_ck1 check (action_type in
        ('LIST','REVEAL','CREATE','UPDATE','DELETE','LOGIN','LOGIN_FAILED'))
);

comment on table apx_vault_audit_log is 'Audit trail: siapa reveal/ubah/hapus data akses kapan - wajib untuk data sensitif seperti ini';

create index apx_vault_audit_log_n1 on apx_vault_audit_log (access_id, log_at);
create index apx_vault_audit_log_n2 on apx_vault_audit_log (performed_by, log_at);

-- ============================================================================
-- 6. ROLE MAPPING (opsional, jika tidak pakai APEX auth / ORDS role langsung)
--    Digunakan untuk mapping username -> role ADMIN/VIEWER di dalam package
-- ============================================================================
create table apx_vault_user_role
(
    user_role_id    number         generated always as identity
   ,username        varchar2(120)  not null
   ,role_code       varchar2(20)   not null             -- ADMIN, VIEWER
   ,is_active       varchar2(1)    default 'Y'  not null
   ,created_at      date           default sysdate not null
   ,constraint apx_vault_user_role_pk primary key (user_role_id)
   ,constraint apx_vault_user_role_u1 unique (username)
   ,constraint apx_vault_user_role_ck1 check (role_code in ('ADMIN','VIEWER'))
   ,constraint apx_vault_user_role_ck2 check (is_active in ('Y','N'))
);

comment on table apx_vault_user_role is 'Mapping user -> role ADMIN (bisa reveal & CRUD) / VIEWER (list masked only)';

-- ============================================================================
-- VIEW: daftar akses dengan password selalu ter-mask ('********')
--       digunakan oleh handler GET list agar handler tidak pernah menyentuh
--       kolom password_enc langsung
-- ============================================================================
create or replace view apx_vault_access_v as
select
    a.access_id
   ,c.company_code
   ,c.company_name
   ,e.env_code
   ,e.env_name
   ,st.sys_type_code
   ,st.sys_type_name
   ,st.icon_name
   ,a.label
   ,a.url
   ,a.host
   ,a.port
   ,a.service_name
   ,a.instance_name
   ,a.workspace_name
   ,a.username
   ,case when a.password_enc is not null then '********' else null end as password_masked
   ,a.password_hint
   ,case when a.tns_entry is not null then 'Y' else 'N' end as has_tns_entry
   ,a.ssh_auth_method
   ,a.vpn_type
   ,a.notes
   ,a.is_active
   ,a.expiry_date
   ,a.last_rotated_at
   ,a.created_by
   ,a.created_at
   ,a.updated_by
   ,a.updated_at
from apx_vault_access a
join apx_vault_company     c  on c.company_id  = a.company_id
join apx_vault_environment e  on e.env_id      = a.env_id
join apx_vault_system_type st on st.sys_type_id = a.sys_type_id;

comment on table apx_vault_access_v is 'View list aman (password selalu masked) - dipakai untuk endpoint GET list/detail non-reveal';
