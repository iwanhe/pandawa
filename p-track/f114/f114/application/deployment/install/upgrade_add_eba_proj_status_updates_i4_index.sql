prompt --application/deployment/install/upgrade_add_eba_proj_status_updates_i4_index
begin
--   Manifest
--     INSTALL: UPGRADE-add EBA_PROJ_STATUS_UPDATES_i4 index 
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
 p_id=>wwv_flow_imp.id(4231444536873426322)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'add EBA_PROJ_STATUS_UPDATES_i4 index '
,p_sequence=>1330
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_indexes',
'where index_name = ''EBA_PROJ_STATUS_UPDATES_I4'';'))
,p_script_clob=>'create index EBA_PROJ_STATUS_UPDATES_I4 on EBA_PROJ_STATUS_UPDATES$ (updated, id);'
);
wwv_flow_imp.component_end;
end;
/
