prompt --application/deployment/install/upgrade_add_photo_columns_to_user_table
begin
--   Manifest
--     INSTALL: UPGRADE-Add photo columns to user table
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
 p_id=>wwv_flow_imp.id(15180452224347548647)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Add photo columns to user table'
,p_sequence=>530
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tab_cols',
'where table_name = ''EBA_PROJ_STATUS_USERS''',
'    and column_name = ''PHOTO_BLOB'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table EBA_PROJ_STATUS_USERS add (',
'   photo_blob         blob,',
'   photo_name         varchar2(512),',
'   photo_mimetype     varchar2(512),',
'   photo_charset      varchar2(512),',
'   photo_lastupd      date,',
'   first_name         varchar2(100),',
'   last_name          varchar2(100)',
');'))
);
wwv_flow_imp.component_end;
end;
/
