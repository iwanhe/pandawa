prompt --application/deployment/install/upgrade_add_inc_in_status_eml_yn_to_project_ais
begin
--   Manifest
--     INSTALL: UPGRADE-add inc_in_status_eml_yn to project AIs
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
 p_id=>wwv_flow_imp.id(18807249672181458608)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'add inc_in_status_eml_yn to project AIs'
,p_sequence=>700
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from user_tab_cols',
' where table_name = ''EBA_PROJ_STATUS_AIS$''',
'   and column_name = ''INC_IN_STATUS_EML_YN'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_proj_status_ais$ add inc_in_status_eml_yn varchar2(1)',
'/'))
);
wwv_flow_imp.component_end;
end;
/
