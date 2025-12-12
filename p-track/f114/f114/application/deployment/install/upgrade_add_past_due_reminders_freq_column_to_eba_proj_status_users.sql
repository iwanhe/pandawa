prompt --application/deployment/install/upgrade_add_past_due_reminders_freq_column_to_eba_proj_status_users
begin
--   Manifest
--     INSTALL: UPGRADE-add past_due_reminders_freq column to EBA_PROJ_STATUS_USERS
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
 p_id=>wwv_flow_imp.id(16868773075339022245)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'add past_due_reminders_freq column to EBA_PROJ_STATUS_USERS'
,p_sequence=>890
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from user_tab_cols',
' where table_name = ''EBA_PROJ_STATUS_USERS''',
'   and column_name = ''PAST_DUE_REMINDERS_FREQ'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table EBA_PROJ_STATUS_USERS add past_due_reminders_freq varchar2(30) default ''UNSET''',
'/',
'',
'update EBA_PROJ_STATUS_USERS set past_due_reminders_freq = ''UNSET'' where past_due_reminders_freq is null;',
'commit;'))
);
wwv_flow_imp.component_end;
end;
/
