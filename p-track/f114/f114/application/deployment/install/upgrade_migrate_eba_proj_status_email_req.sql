prompt --application/deployment/install/upgrade_migrate_eba_proj_status_email_req
begin
--   Manifest
--     INSTALL: UPGRADE-migrate eba_proj_status_email_req
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(6071022600051549684)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'migrate eba_proj_status_email_req'
,p_sequence=>170
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tables',
'where table_name in (''EBA_PROJ_STATUS_EMAIL_REQ'',''EBA_PROJ_STATUS_EMAIL_REQ$'')'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table  eba_proj_status_email_log (',
'    id number,',
'    row_version_number number,',
'    email_first_to varchar2(255),',
'    email_to varchar2(4000),',
'    email_from varchar2(255),',
'    body_size number,',
'    --',
'    created timestamp (6) with local time zone,',
'    created_by varchar2(255),',
'    updated timestamp (6) with local time zone,',
'    updated_by varchar2(255),',
'    primary key (id) using index enable',
')',
'/',
'',
'create index  eba_proj_status_email_log_n1 on eba_proj_status_email_log (email_first_to)',
'/',
'',
'create index  eba_proj_status_email_log_n2 on eba_proj_status_email_log (email_from)',
'/',
'',
'create or replace trigger  biu_eba_proj_status_email_log',
'    before insert or update on eba_proj_status_email_log',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if inserting then',
'--        :new.created := localtimestamp;',
'--        :new.created_by := nvl(wwv_flow.g_user,user);',
'        :new.row_version_number := 1;',
'    elsif updating then',
'        :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'    end if;',
'',
'--    :new.updated := localtimestamp;',
'--    :new.updated_by := nvl(wwv_flow.g_user,user);',
'    :new.email_first_to := lower(:new.email_first_to);',
'    :new.email_from := lower(:new.email_from);',
'end;',
'/',
'alter trigger  biu_eba_proj_status_email_log enable',
'/',
'',
'begin',
'    -- Migrate data to new table.',
'    for c1 in ( select table_name t',
'                from user_tables',
'                where table_name in ( ''EBA_PROJ_STATUS_EMAIL_REQ'',',
'                                      ''EBA_PROJ_STATUS_EMAIL_REQ$'' )) loop',
'        execute immediate ''insert into eba_proj_status_email_log (',
'                               email_first_to, email_to, email_from, body_size, created, created_by, updated, updated_by',
'                           )',
'                           select email_first_to, email_to, email_from,',
'                               length(email_text_body),',
'                               created, created_by, updated, updated_by',
'                           from ''||c1.t;',
'    end loop;',
'',
'    for c1 in ( select view_name vw',
'                from user_views',
'                where view_name = ''EBA_PROJ_STATUS_EMAIL_REQ'' ) loop',
'        execute immediate ''drop view ''||c1.vw;',
'    end loop;',
'    for c1 in ( select table_name t',
'                from user_tables',
'                where table_name in ( ''EBA_PROJ_STATUS_EMAIL_REQ'',',
'                                      ''EBA_PROJ_STATUS_EMAIL_REQ$'' )) loop',
'        execute immediate ''drop table ''||c1.t;',
'    end loop;',
'end;',
'/',
'',
'-- Restore the creation/update dates in the trigger.',
'create or replace trigger  biu_eba_proj_status_email_log',
'    before insert or update on eba_proj_status_email_log',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if inserting then',
'        :new.created := localtimestamp;',
'        :new.created_by := nvl(wwv_flow.g_user,user);',
'        :new.row_version_number := 1;',
'    elsif updating then',
'        :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'    end if;',
'',
'    :new.updated := localtimestamp;',
'    :new.updated_by := nvl(wwv_flow.g_user,user);',
'    :new.email_first_to := lower(:new.email_first_to);',
'    :new.email_from := lower(:new.email_from);',
'end;',
'/',
'alter trigger  biu_eba_proj_status_email_log enable',
'/'))
);
wwv_flow_imp.component_end;
end;
/
