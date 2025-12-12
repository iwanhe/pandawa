prompt --application/deployment/install/upgrade_action_item_milestone_index
begin
--   Manifest
--     INSTALL: UPGRADE-Action Item Milestone index
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
 p_id=>wwv_flow_imp.id(6187394989655165588)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Action Item Milestone index'
,p_sequence=>380
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select *',
'from user_indexes',
'where index_name = ''EBA_PROJ_STATUS_AIS_I7'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create index eba_proj_status_ais_i7 on eba_proj_status_ais( milestone_id );',
''))
);
wwv_flow_imp.component_end;
end;
/
