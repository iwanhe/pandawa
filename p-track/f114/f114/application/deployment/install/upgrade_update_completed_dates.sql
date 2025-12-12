prompt --application/deployment/install/upgrade_update_completed_dates
begin
--   Manifest
--     INSTALL: UPGRADE-Update Completed Dates
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
 p_id=>wwv_flow_imp.id(19564562826927258460)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Update Completed Dates'
,p_sequence=>1080
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'--',
'-- Update Action Items',
'--',
'',
'-- Disable Trigger',
'alter trigger aiu_eba_proj_status_ais disable;',
'',
'-- Update Completed_Date Column Value',
'update eba_proj_status_ais$',
'   set completed_date = due_date',
' where action_status = ''Closed''',
'   and completed_date is null;',
'',
'-- Enable Trigger',
'alter trigger aiu_eba_proj_status_ais enable;',
'',
'--',
'-- Update Milestones',
'--',
'',
'-- Disable Trigger',
'alter trigger aiu_eba_proj_status_ms disable;',
'',
'-- Update Completed_Date Column Value',
'update eba_proj_status_ms$',
'   set completed_date = milestone_date',
' where milestone_status = ''Completed''',
'   and completed_date is null;',
'',
'-- Enable Trigger',
'alter trigger aiu_eba_proj_status_ms enable;',
'',
'commit;'))
);
wwv_flow_imp.component_end;
end;
/
