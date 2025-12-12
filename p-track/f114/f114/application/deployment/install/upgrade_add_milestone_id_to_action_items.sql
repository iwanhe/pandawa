prompt --application/deployment/install/upgrade_add_milestone_id_to_action_items
begin
--   Manifest
--     INSTALL: UPGRADE-Add milestone_id to action items
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
 p_id=>wwv_flow_imp.id(6064191189945719843)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Add milestone_id to action items'
,p_sequence=>100
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tab_cols',
'where table_name = ''EBA_PROJ_STATUS_AIS$''',
'    and column_name = ''MILESTONE_ID'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_proj_status_ais$',
'add milestone_id number;',
'',
'alter table eba_proj_status_ais',
'add constraint eba_proj_status_ai_ms_fk',
'               foreign key ( milestone_id )',
'               references eba_proj_status_ms$(id)',
'               on delete set null;'))
);
wwv_flow_imp.component_end;
end;
/
