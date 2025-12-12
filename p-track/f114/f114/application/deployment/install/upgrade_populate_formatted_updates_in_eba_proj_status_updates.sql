prompt --application/deployment/install/upgrade_populate_formatted_updates_in_eba_proj_status_updates
begin
--   Manifest
--     INSTALL: UPGRADE-Populate Formatted Updates in eba_proj_status_updates
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
 p_id=>wwv_flow_imp.id(3908390835088993170)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Populate Formatted Updates in eba_proj_status_updates'
,p_sequence=>1250
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter trigger bi_eba_proj_status_updates disable;',
'/',
'',
'update eba_proj_status_updates$',
'set formatted_update = eba_proj_fw.save_formatted_status_update( status_update )',
'where formatted_update is null;',
'/',
'commit;',
'',
'alter trigger bi_eba_proj_status_updates enable;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
