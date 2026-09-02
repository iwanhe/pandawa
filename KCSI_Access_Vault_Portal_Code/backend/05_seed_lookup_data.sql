--------------------------------------------------------------------------------
-- Script:   05_seed_lookup_data.sql
-- Purpose:  Data master awal (lookup) - TIDAK berisi kredensial aktual.
--           Data akses/password sesungguhnya diinput lewat portal (role ADMIN)
--           setelah migrasi manual dari file Excel sumber, satu per satu,
--           supaya tercatat di audit log siapa yang input dan kapan.
--------------------------------------------------------------------------------

-- Companies (sesuai daftar subsidiary yang ada di file sumber)
insert into apx_vault_company (company_code, company_name) values ('NTI',      'NTI');
insert into apx_vault_company (company_code, company_name) values ('NSTI',     'NSTI');
insert into apx_vault_company (company_code, company_name) values ('NCT',      'NCT');
insert into apx_vault_company (company_code, company_name) values ('ATI',      'ATI');
insert into apx_vault_company (company_code, company_name) values ('META',     'META');
insert into apx_vault_company (company_code, company_name) values ('ORACONS',  'ORACONS');
insert into apx_vault_company (company_code, company_name) values ('PRISMA',   'PRISMA');
insert into apx_vault_company (company_code, company_name) values ('EAM',      'EAM');
insert into apx_vault_company (company_code, company_name) values ('GLT',      'GLT Apps');
insert into apx_vault_company (company_code, company_name) values ('KDK',      'KDK OOPS');
insert into apx_vault_company (company_code, company_name) values ('SKT_ATI',  'SKT ATI');

-- Environments
insert into apx_vault_environment (env_code, env_name, display_order) values ('DEV',  'Development', 1);
insert into apx_vault_environment (env_code, env_name, display_order) values ('UAT',  'UAT/Staging',  2);
insert into apx_vault_environment (env_code, env_name, display_order) values ('PROD', 'Production',   3);

-- System Types
insert into apx_vault_system_type (sys_type_code,    sys_type_name,              icon_name,        display_order) values
    ('EBS_APP',       'Oracle EBS Application Login', 'oj-ux-ico-application', 1);
insert into apx_vault_system_type (sys_type_code,    sys_type_name,              icon_name,        display_order) values
    ('APEX_WORKSPACE','Oracle APEX Workspace',        'oj-ux-ico-network',     2);
insert into apx_vault_system_type (sys_type_code,    sys_type_name,              icon_name,        display_order) values
    ('DB_TNS',        'Database TNS Connection',      'oj-ux-ico-database',    3);
insert into apx_vault_system_type (sys_type_code,    sys_type_name,              icon_name,        display_order) values
    ('SSH',           'SSH Server Access',             'oj-ux-ico-terminal',   4);
insert into apx_vault_system_type (sys_type_code,    sys_type_name,              icon_name,        display_order) values
    ('VPN',           'VPN Access (OpenVPN, dll)',     'oj-ux-ico-lock',       5);
insert into apx_vault_system_type (sys_type_code,    sys_type_name,              icon_name,        display_order) values
    ('API_KEY',       'API Key / Token',               'oj-ux-ico-key',        6);
insert into apx_vault_system_type (sys_type_code,    sys_type_name,              icon_name,        display_order) values
    ('OTHER',         'Lainnya',                       'oj-ux-ico-information', 7);

-- Role mapping contoh - sesuaikan dengan username aktual anggota Tim PANDAWA
insert into apx_vault_user_role (username, role_code) values ('iwan.herdian', 'ADMIN');
-- insert into apx_vault_user_role (username, role_code) values ('anggota.tim1', 'ADMIN');
-- insert into apx_vault_user_role (username, role_code) values ('helpdesk.user', 'VIEWER');

commit;
