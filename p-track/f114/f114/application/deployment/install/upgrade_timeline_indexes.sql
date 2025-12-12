prompt --application/deployment/install/upgrade_timeline_indexes
begin
--   Manifest
--     INSTALL: UPGRADE-Timeline Indexes
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
 p_id=>wwv_flow_imp.id(13393787308156234950)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Timeline Indexes'
,p_sequence=>460
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_indexes',
'where index_name = ''EBA_PROJ_STATUS_MS_I3'';'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create index eba_proj_status_i18       on eba_proj_status$(created);',
'create index eba_proj_status_ms_i3     on eba_proj_status_ms$(created);',
'create index eba_proj_status_ais_i8    on eba_proj_status_ais$(created);',
'create index eba_proj_status_files_i2  on eba_proj_status_files$(created);',
'create index eba_proj_status_links_i2  on eba_proj_status_links$(created);',
'create index eba_proj_status_upd_i3    on eba_proj_status_updates$(created);',
'create index eba_proj_status_rpts_i3   on eba_proj_status_rpts$(created);',
'create index eba_proj_history_i2       on eba_proj_history$(change_date, component_id);',
'create index eba_proj_user_ref_n4      on eba_proj_user_ref(created);'))
);
wwv_flow_imp.component_end;
end;
/
