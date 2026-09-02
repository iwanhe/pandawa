--------------------------------------------------------------------------------
-- Script:   03_apx_vault_access_pkg.sql
-- Package:  apx_vault_access_pkg
-- Purpose:  Business logic untuk REST API portal Access Vault
--           Semua REST handler HANYA memanggil procedure di package ini
--           (pattern sesuai standar Tim PANDAWA - apex-rest-pandawa skill)
-- Author:   Tim PANDAWA
--------------------------------------------------------------------------------

create or replace package apx_vault_access_pkg as

    function package_version return varchar2;

    /**
     * Cek role user (ADMIN/VIEWER) - dipanggil saat user "login"/identify di portal
     */
    procedure whoami (
        p_username in varchar2
    );

    /**
     * List seluruh akses (password selalu masked) dengan filter opsional
     */
    procedure get_list (
        p_company   in varchar2 := null   -- company_code, mis. 'NTI'
       ,p_env       in varchar2 := null   -- env_code, mis. 'DEV'
       ,p_sys_type  in varchar2 := null   -- sys_type_code, mis. 'SSH'
       ,p_search    in varchar2 := null   -- free text search di label/host/username
    );

    /**
     * Detail satu record (password tetap masked)
     */
    procedure get_detail (
        p_access_id in number
    );

    /**
     * Reveal password asli - HANYA untuk role ADMIN, tercatat di audit log
     * @param p_username identitas user login portal (lihat catatan autentikasi di README/dokumentasi -
     *        OAuth2 client_credentials di level ORDS hanya mengautentikasi aplikasi, bukan user,
     *        sehingga identitas user dikirim eksplisit dan divalidasi terhadap apx_vault_user_role)
     */
    procedure reveal_password (
        p_access_id in number
       ,p_username  in varchar2
    );

    /**
     * Ringkasan kelengkapan data per company x environment x system type
     * (dipakai dashboard: mana yang masih kosong / belum lengkap)
     */
    procedure get_completeness_summary;

    /**
     * Simpan (insert/update) record akses - hanya role ADMIN
     */
    procedure save_access (
        p_username       in varchar2             -- identitas user login portal, divalidasi role ADMIN
       ,p_access_id      in number   := null   -- null = insert baru
       ,p_company_code   in varchar2
       ,p_env_code       in varchar2
       ,p_sys_type_code  in varchar2
       ,p_label          in varchar2
       ,p_url            in varchar2 := null
       ,p_host           in varchar2 := null
       ,p_port           in number   := null
       ,p_service_name   in varchar2 := null
       ,p_instance_name  in varchar2 := null
       ,p_workspace_name in varchar2 := null
       ,p_access_username in varchar2 := null   -- username LOGIN untuk entri akses ini (mis. username EBS/SSH), beda dari p_username (pelaku aksi)
       ,p_password       in varchar2 := null    -- plaintext, akan dienkripsi di sini
       ,p_password_hint  in varchar2 := null
       ,p_tns_entry      in clob     := null
       ,p_ssh_auth_method in varchar2 := null
       ,p_ssh_key_path   in varchar2 := null
       ,p_vpn_type       in varchar2 := null
       ,p_vpn_config_file in varchar2 := null
       ,p_extra_json     in clob     := null
       ,p_notes          in varchar2 := null
       ,p_expiry_date    in varchar2 := null    -- format 'YYYY-MM-DD'
    );

    /**
     * Soft delete (is_active = 'N') - hanya role ADMIN
     */
    procedure delete_access (
        p_access_id in number
       ,p_username  in varchar2
    );

    /**
     * Ambil audit log terakhir (default 200 baris) - hanya role ADMIN
     */
    procedure get_audit_log (
        p_username  in varchar2
       ,p_access_id in number := null
    );

end apx_vault_access_pkg;
/

create or replace package body apx_vault_access_pkg as

    -- ------------------------------------------------------------------
    -- INTERNAL HELPERS
    -- ------------------------------------------------------------------

    -- Dipakai hanya untuk audit LIST/DETAIL (aksi read-only, tidak butuh role check ketat).
    -- Untuk aksi ADMIN (reveal/save/delete), identitas diambil dari p_username yang
    -- dikirim eksplisit oleh frontend (lihat catatan autentikasi di package spec).
    function get_current_user return varchar2
    is
    begin
        return coalesce(
            sys_context('apex$session', 'app_user')
           ,'oauth-app-client'
        );
    end get_current_user;

    function is_admin (p_username in varchar2) return boolean
    is
        l_role apx_vault_user_role.role_code%type;
    begin
        select role_code
          into l_role
          from apx_vault_user_role
         where username  = p_username
           and is_active = 'Y';
        --
        return l_role = 'ADMIN';
    exception
        when no_data_found then
            return false;
    end is_admin;

    procedure write_audit (
        p_access_id   in number
       ,p_action_type in varchar2
       ,p_detail      in varchar2 := null
    )
    is
        pragma autonomous_transaction;
        l_performed_by apx_vault_audit_log.performed_by%type;
        l_client_ip    apx_vault_audit_log.client_ip%type;
    begin
        -- get_current_user() adalah private function (hanya di package body) sehingga
        -- TIDAK boleh dipanggil langsung di dalam klausa SQL (PLS-00231) - hitung dulu
        -- ke variabel PL/SQL, baru dipakai di statement INSERT.
        l_performed_by := get_current_user();
        l_client_ip    := owa_util.get_cgi_env('REMOTE_ADDR');
        --
        insert into apx_vault_audit_log (
            access_id, action_type, performed_by, client_ip, detail
        ) values (
            p_access_id
           ,p_action_type
           ,l_performed_by
           ,l_client_ip
           ,p_detail
        );
        commit;
    end write_audit;

    procedure raise_forbidden
    is
    begin
        owa_util.status_line(403, 'Forbidden', false);
        apex_json.open_object;
        apex_json.write('status', 'ERROR');
        apex_json.write('message', 'Anda tidak memiliki akses untuk operasi ini (role ADMIN diperlukan)');
        apex_json.close_object;
    end raise_forbidden;

    -- ------------------------------------------------------------------
    -- PUBLIC
    -- ------------------------------------------------------------------

    function package_version return varchar2
    is
    begin
        -- Version History:
        -- 01.00.00 2026-09-02 Tim PANDAWA  Initial Version
        return '01.00.00';
    end package_version;

    procedure whoami (
        p_username in varchar2
    )
    is
        l_role apx_vault_user_role.role_code%type;
    begin
        begin
            select role_code into l_role
              from apx_vault_user_role
             where username = p_username and is_active = 'Y';
        exception
            when no_data_found then
                l_role := null;
        end;
        --
        write_audit(null, 'LOGIN', 'identify: ' || p_username || ' role=' || l_role);
        --
        apex_json.open_object;
        if l_role is null then
            apex_json.write('status', 'ERROR');
            apex_json.write('message', 'User tidak terdaftar di portal. Hubungi admin PANDAWA.');
        else
            apex_json.write('status', 'SUCCESS');
            apex_json.write('username', p_username);
            apex_json.write('role', l_role);
        end if;
        apex_json.close_object;
    end whoami;

    procedure get_list (
        p_company   in varchar2 := null
       ,p_env       in varchar2 := null
       ,p_sys_type  in varchar2 := null
       ,p_search    in varchar2 := null
    )
    is
        l_cursor sys_refcursor;
    begin
        open l_cursor for
            select
                v.access_id
               ,v.company_code
               ,v.company_name
               ,v.env_code
               ,v.env_name
               ,v.sys_type_code
               ,v.sys_type_name
               ,v.icon_name
               ,v.label
               ,v.url
               ,v.host
               ,v.port
               ,v.username
               ,v.password_masked
               ,v.has_tns_entry
               ,v.is_active
               ,v.expiry_date
               ,v.updated_at
              from apx_vault_access_v v
             where 1 = 1
               and (v.company_code  = p_company  or p_company  is null)
               and (v.env_code      = p_env      or p_env      is null)
               and (v.sys_type_code = p_sys_type or p_sys_type is null)
               and (p_search is null
                    or upper(v.label)    like '%' || upper(p_search) || '%'
                    or upper(v.host)     like '%' || upper(p_search) || '%'
                    or upper(v.username) like '%' || upper(p_search) || '%')
               and v.is_active = 'Y'
             order by v.company_code, v.env_code, v.sys_type_code, v.label;
        --
        write_audit(null, 'LIST', 'company=' || p_company || ' env=' || p_env || ' sys_type=' || p_sys_type);
        --
        apex_json.open_object;
        apex_json.write('status', 'SUCCESS');
        apex_json.write('rowset', l_cursor);
        apex_json.close_object;
    exception
        when others then
            apex_json.open_object;
            apex_json.write('status', 'ERROR');
            apex_json.write('message', sqlerrm);
            apex_json.close_object;
    end get_list;

    procedure get_detail (
        p_access_id in number
    )
    is
        l_rec apx_vault_access_v%rowtype;
    begin
        select * into l_rec from apx_vault_access_v where access_id = p_access_id;
        --
        write_audit(p_access_id, 'LIST', 'detail view');
        --
        apex_json.open_object;
        apex_json.write('status', 'SUCCESS');
        apex_json.open_object('data');
        apex_json.write('access_id',       l_rec.access_id);
        apex_json.write('company_code',    l_rec.company_code);
        apex_json.write('company_name',    l_rec.company_name);
        apex_json.write('env_code',        l_rec.env_code);
        apex_json.write('sys_type_code',   l_rec.sys_type_code);
        apex_json.write('sys_type_name',   l_rec.sys_type_name);
        apex_json.write('label',           l_rec.label);
        apex_json.write('url',             l_rec.url);
        apex_json.write('host',            l_rec.host);
        apex_json.write('port',            l_rec.port);
        apex_json.write('service_name',    l_rec.service_name);
        apex_json.write('instance_name',   l_rec.instance_name);
        apex_json.write('workspace_name',  l_rec.workspace_name);
        apex_json.write('username',        l_rec.username);
        apex_json.write('password_masked', l_rec.password_masked);
        apex_json.write('password_hint',   l_rec.password_hint);
        apex_json.write('has_tns_entry',   l_rec.has_tns_entry);
        apex_json.write('ssh_auth_method', l_rec.ssh_auth_method);
        apex_json.write('vpn_type',        l_rec.vpn_type);
        apex_json.write('notes',           l_rec.notes);
        apex_json.write('is_active',       l_rec.is_active);
        apex_json.write('expiry_date',     l_rec.expiry_date);
        apex_json.write('updated_by',      l_rec.updated_by);
        apex_json.write('updated_at',      l_rec.updated_at);
        apex_json.close_object;
        apex_json.close_object;
    exception
        when no_data_found then
            apex_json.open_object;
            apex_json.write('status', 'NOT_FOUND');
            apex_json.write('message', 'Data akses tidak ditemukan');
            apex_json.close_object;
        when others then
            apex_json.open_object;
            apex_json.write('status', 'ERROR');
            apex_json.write('message', sqlerrm);
            apex_json.close_object;
    end get_detail;

    procedure reveal_password (
        p_access_id in number
       ,p_username  in varchar2
    )
    is
        l_username   varchar2(120) := p_username;
        l_enc        apx_vault_access.password_enc%type;
        l_tns        apx_vault_access.tns_entry%type;
        l_plain      varchar2(2000);
    begin
        if not is_admin(l_username) then
            raise_forbidden;
            return;
        end if;
        --
        select password_enc, tns_entry
          into l_enc, l_tns
          from apx_vault_access
         where access_id = p_access_id;
        --
        l_plain := apx_vault_crypto_pkg.decrypt(l_enc);
        --
        write_audit(p_access_id, 'REVEAL', 'password revealed by ' || l_username);
        --
        apex_json.open_object;
        apex_json.write('status', 'SUCCESS');
        apex_json.open_object('data');
        apex_json.write('access_id', p_access_id);
        apex_json.write('password',  l_plain);
        apex_json.write('tns_entry', l_tns);
        apex_json.close_object;
        apex_json.close_object;
    exception
        when no_data_found then
            apex_json.open_object;
            apex_json.write('status', 'NOT_FOUND');
            apex_json.write('message', 'Data akses tidak ditemukan');
            apex_json.close_object;
        when others then
            apex_json.open_object;
            apex_json.write('status', 'ERROR');
            apex_json.write('message', sqlerrm);
            apex_json.close_object;
    end reveal_password;

    procedure get_completeness_summary
    is
        l_cursor sys_refcursor;
    begin
        open l_cursor for
            select
                c.company_code
               ,e.env_code
               ,st.sys_type_code
               ,count(a.access_id)                                    as total_entry
               ,count(case when a.username is not null
                             and a.password_enc is not null
                            then 1 end)                                as complete_entry
               ,case when count(a.access_id) = 0 then 'MISSING'
                     when count(a.access_id) =
                          count(case when a.username is not null
                                       and a.password_enc is not null
                                      then 1 end)
                          then 'COMPLETE'
                     else 'PARTIAL'
                end                                                    as completeness_status
              from apx_vault_company     c
              cross join apx_vault_environment e
              cross join apx_vault_system_type  st
              left join apx_vault_access a
                     on a.company_id  = c.company_id
                    and a.env_id      = e.env_id
                    and a.sys_type_id = st.sys_type_id
                    and a.is_active   = 'Y'
             where c.is_active = 'Y'
             group by c.company_code, e.env_code, st.sys_type_code
             order by c.company_code, e.env_code, st.sys_type_code;
        --
        apex_json.open_object;
        apex_json.write('status', 'SUCCESS');
        apex_json.write('rowset', l_cursor);
        apex_json.close_object;
    exception
        when others then
            apex_json.open_object;
            apex_json.write('status', 'ERROR');
            apex_json.write('message', sqlerrm);
            apex_json.close_object;
    end get_completeness_summary;

    procedure save_access (
        p_username       in varchar2
       ,p_access_id      in number   := null
       ,p_company_code   in varchar2
       ,p_env_code       in varchar2
       ,p_sys_type_code  in varchar2
       ,p_label          in varchar2
       ,p_url            in varchar2 := null
       ,p_host           in varchar2 := null
       ,p_port           in number   := null
       ,p_service_name   in varchar2 := null
       ,p_instance_name  in varchar2 := null
       ,p_workspace_name in varchar2 := null
       ,p_access_username in varchar2 := null   -- username LOGIN untuk entri akses ini, beda dari p_username (pelaku aksi)
       ,p_password       in varchar2 := null
       ,p_password_hint  in varchar2 := null
       ,p_tns_entry      in clob     := null
       ,p_ssh_auth_method in varchar2 := null
       ,p_ssh_key_path   in varchar2 := null
       ,p_vpn_type       in varchar2 := null
       ,p_vpn_config_file in varchar2 := null
       ,p_extra_json     in clob     := null
       ,p_notes          in varchar2 := null
       ,p_expiry_date    in varchar2 := null
    )
    is
        l_username   varchar2(120) := p_username;
        l_company_id apx_vault_company.company_id%type;
        l_env_id     apx_vault_environment.env_id%type;
        l_sys_type_id apx_vault_system_type.sys_type_id%type;
        l_new_id     apx_vault_access.access_id%type;
    begin
        if not is_admin(l_username) then
            raise_forbidden;
            return;
        end if;
        --
        select company_id  into l_company_id  from apx_vault_company     where company_code  = p_company_code;
        select env_id      into l_env_id      from apx_vault_environment where env_code      = p_env_code;
        select sys_type_id into l_sys_type_id from apx_vault_system_type where sys_type_code = p_sys_type_code;
        --
        if p_access_id is null then
            insert into apx_vault_access (
                company_id, env_id, sys_type_id, label, url, host, port
               ,service_name, instance_name, workspace_name, username
               ,password_enc, password_hint, tns_entry
               ,ssh_auth_method, ssh_key_path, vpn_type, vpn_config_file
               ,extra_json, notes, expiry_date, created_by
            ) values (
                l_company_id, l_env_id, l_sys_type_id, p_label, p_url, p_host, p_port
               ,p_service_name, p_instance_name, p_workspace_name, p_access_username
               ,apx_vault_crypto_pkg.encrypt(p_password), p_password_hint, p_tns_entry
               ,p_ssh_auth_method, p_ssh_key_path, p_vpn_type, p_vpn_config_file
               ,p_extra_json, p_notes
               ,case when p_expiry_date is not null then to_date(p_expiry_date,'YYYY-MM-DD') end
               ,l_username
            )
            returning access_id into l_new_id;
            --
            write_audit(l_new_id, 'CREATE', 'created by ' || l_username);
        else
            update apx_vault_access
               set company_id      = l_company_id
                  ,env_id          = l_env_id
                  ,sys_type_id     = l_sys_type_id
                  ,label           = p_label
                  ,url             = p_url
                  ,host            = p_host
                  ,port            = p_port
                  ,service_name    = p_service_name
                  ,instance_name   = p_instance_name
                  ,workspace_name  = p_workspace_name
                  ,username        = p_access_username
                  ,password_enc    = case when p_password is not null
                                           then apx_vault_crypto_pkg.encrypt(p_password)
                                           else password_enc end
                  ,password_hint   = p_password_hint
                  ,tns_entry       = p_tns_entry
                  ,ssh_auth_method = p_ssh_auth_method
                  ,ssh_key_path    = p_ssh_key_path
                  ,vpn_type        = p_vpn_type
                  ,vpn_config_file = p_vpn_config_file
                  ,extra_json      = p_extra_json
                  ,notes           = p_notes
                  ,expiry_date     = case when p_expiry_date is not null
                                           then to_date(p_expiry_date,'YYYY-MM-DD') end
                  ,updated_by      = l_username
                  ,updated_at      = sysdate
             where access_id = p_access_id;
            --
            l_new_id := p_access_id;
            write_audit(l_new_id, 'UPDATE', 'updated by ' || l_username);
        end if;
        --
        apex_json.open_object;
        apex_json.write('status', 'SUCCESS');
        apex_json.write('access_id', l_new_id);
        apex_json.close_object;
    exception
        when no_data_found then
            apex_json.open_object;
            apex_json.write('status', 'ERROR');
            apex_json.write('message', 'Company/Environment/System Type code tidak valid');
            apex_json.close_object;
        when others then
            apex_json.open_object;
            apex_json.write('status', 'ERROR');
            apex_json.write('message', sqlerrm);
            apex_json.close_object;
    end save_access;

    procedure delete_access (
        p_access_id in number
       ,p_username  in varchar2
    )
    is
        l_username varchar2(120) := p_username;
    begin
        if not is_admin(l_username) then
            raise_forbidden;
            return;
        end if;
        --
        update apx_vault_access
           set is_active  = 'N'
              ,updated_by = l_username
              ,updated_at = sysdate
         where access_id = p_access_id;
        --
        if sql%rowcount = 0 then
            apex_json.open_object;
            apex_json.write('status', 'NOT_FOUND');
            apex_json.write('message', 'Data akses tidak ditemukan');
            apex_json.close_object;
            return;
        end if;
        --
        write_audit(p_access_id, 'DELETE', 'soft-deleted by ' || l_username);
        --
        apex_json.open_object;
        apex_json.write('status', 'SUCCESS');
        apex_json.close_object;
    exception
        when others then
            apex_json.open_object;
            apex_json.write('status', 'ERROR');
            apex_json.write('message', sqlerrm);
            apex_json.close_object;
    end delete_access;

    procedure get_audit_log (
        p_username  in varchar2
       ,p_access_id in number := null
    )
    is
        l_cursor sys_refcursor;
    begin
        if not is_admin(p_username) then
            raise_forbidden;
            return;
        end if;
        --
        open l_cursor for
            select
                l.log_id
               ,l.access_id
               ,a.label
               ,l.action_type
               ,l.performed_by
               ,l.client_ip
               ,l.detail
               ,l.log_at
              from apx_vault_audit_log l
              left join apx_vault_access a on a.access_id = l.access_id
             where (l.access_id = p_access_id or p_access_id is null)
             order by l.log_at desc
             fetch first 200 rows only;
        --
        apex_json.open_object;
        apex_json.write('status', 'SUCCESS');
        apex_json.write('rowset', l_cursor);
        apex_json.close_object;
    exception
        when others then
            apex_json.open_object;
            apex_json.write('status', 'ERROR');
            apex_json.write('message', sqlerrm);
            apex_json.close_object;
    end get_audit_log;

end apx_vault_access_pkg;
/
