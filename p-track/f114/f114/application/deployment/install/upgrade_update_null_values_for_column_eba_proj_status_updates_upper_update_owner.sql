prompt --application/deployment/install/upgrade_update_null_values_for_column_eba_proj_status_updates_upper_update_owner
begin
--   Manifest
--     INSTALL: UPGRADE-update null values for column EBA_PROJ_STATUS_UPDATES$.UPPER_UPDATE_OWNER
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
 p_id=>wwv_flow_imp.id(4194368398152318085)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'update null values for column EBA_PROJ_STATUS_UPDATES$.UPPER_UPDATE_OWNER'
,p_sequence=>1300
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>'select 1 from EBA_PROJ_STATUS_UPDATES$ where UPPER_UPDATE_OWNER is null'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter trigger bi_eba_proj_status_updates disable',
'/',
'',
'update EBA_PROJ_STATUS_UPDATES$ set UPPER_UPDATE_OWNER = upper(update_owner) where upper_update_owner is null;',
'commit;',
'',
'alter trigger bi_eba_proj_status_updates enable',
'/',
'',
''))
);
wwv_flow_imp.component_end;
end;
/
