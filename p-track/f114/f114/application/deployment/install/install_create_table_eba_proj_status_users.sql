prompt --application/deployment/install/install_create_table_eba_proj_status_users
begin
--   Manifest
--     INSTALL: INSTALL-CREATE TABLE  EBA_PROJ_STATUS_USERS
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
 p_id=>wwv_flow_imp.id(6060578185164721799)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'CREATE TABLE  EBA_PROJ_STATUS_USERS'
,p_sequence=>90
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE TABLE  EBA_PROJ_STATUS_USERS',
'   (',
'   ID                        NUMBER primary key,',
'   ROW_VERSION_NUMBER        NUMBER,',
'   USERNAME                  VARCHAR2(255) NOT NULL unique,',
'   first_name                varchar2(100),',
'   last_name                 varchar2(100),',
'   --',
'   email_address             varchar2(255),',
'   phone_01                  varchar2(30),',
'   phone_02                  varchar2(30),',
'   title                     varchar2(255),',
'   address                   varchar2(4000),',
'   note                      varchar2(4000),',
'   assistant_name            varchar2(255),',
'   assistant_phone           varchar2(30),',
'   home_sort_filter_value    varchar2(20),',
'   photo_blob                blob,',
'   photo_name                varchar2(512),',
'   photo_mimetype            varchar2(512),',
'   photo_charset             varchar2(512),',
'   photo_lastupd             date,',
'   past_due_reminders_freq   varchar2(30) default ''UNSET'',',
'   upcoming_reminders_freq   varchar2(30) default ''UNSET'',',
'   project_summary_fav_freq  varchar2(30) default ''UNSET'',',
'   project_summary_fav_scope varchar2(30),',
'   project_status_fav_freq   varchar2(30) default ''UNSET'',',
'   project_status_fav_scope  varchar2(30),',
'   country_id                number references eba_proj_countries on delete set null,',
'   region_id                 number references eba_proj_regions   on delete set null,',
'   home_timezone             varchar2(50),',
'   team_groups               varchar2(255),',
'   skillsets                 varchar2(255),',
'   bg_checks                 varchar2(255),',
'   hippa_cert_date           timestamp with local time zone,',
'   --',
'   CREATED                   TIMESTAMP (6) WITH LOCAL TIME ZONE,',
'   CREATED_BY                VARCHAR2(255),',
'   UPDATED                   TIMESTAMP (6) WITH LOCAL TIME ZONE,',
'   UPDATED_BY                VARCHAR2(255),',
'   ACCESS_LEVEL_ID           NUMBER references eba_proj_status_access_levels(id),',
'   ACCOUNT_LOCKED            VARCHAR2(1)',
');',
'',
'create index eba_pstat_users_acc_lvl_idx on eba_proj_status_users(access_level_id);'))
);
wwv_flow_imp.component_end;
end;
/
