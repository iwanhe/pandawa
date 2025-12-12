prompt --application/deployment/install/upgrade_add_columns_to_eba_proj_status_users
begin
--   Manifest
--     INSTALL: UPGRADE-add columns to eba_proj_status_users
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
 p_id=>wwv_flow_imp.id(11042194587176351183)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'add columns to eba_proj_status_users'
,p_sequence=>220
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tab_cols',
'where table_name = ''EBA_PROJ_STATUS_USERS''',
'    and column_name = ''PHONE_01'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table EBA_PROJ_STATUS_USERS add (',
'    email_address varchar2(30),',
'    phone_01 varchar2(30),',
'    phone_02 varchar2(30),',
'    title varchar2(255),',
'    address varchar2(4000),',
'    note varchar2(4000),',
'    assistant_name varchar2(255),',
'    assistant_phone varchar2(30)',
');'))
);
wwv_flow_imp.component_end;
end;
/
