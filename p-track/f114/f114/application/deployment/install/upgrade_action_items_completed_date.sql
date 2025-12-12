prompt --application/deployment/install/upgrade_action_items_completed_date
begin
--   Manifest
--     INSTALL: UPGRADE-Action Items Completed Date
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
 p_id=>wwv_flow_imp.id(19563271241202766569)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Action Items Completed Date'
,p_sequence=>710
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from user_tab_cols',
' where table_name = ''EBA_PROJ_STATUS_AIS$''',
'   and column_name = ''COMPLETED_DATE'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_proj_status_ais$ add completed_date timestamp with local time zone',
'/'))
);
wwv_flow_imp.component_end;
end;
/
