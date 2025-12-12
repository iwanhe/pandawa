prompt --application/deployment/install/upgrade_action_item_resolution
begin
--   Manifest
--     INSTALL: UPGRADE-action item resolution
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
 p_id=>wwv_flow_imp.id(17695301176129800326)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'action item resolution'
,p_sequence=>600
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from user_tab_cols',
' where table_name = ''EBA_PROJ_STATUS_AIS$''',
'   and column_name = ''RESOLUTION'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_proj_status_ais$ add resolution varchar2(4000)',
'/'))
);
wwv_flow_imp.component_end;
end;
/
