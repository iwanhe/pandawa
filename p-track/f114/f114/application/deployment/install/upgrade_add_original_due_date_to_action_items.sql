prompt --application/deployment/install/upgrade_add_original_due_date_to_action_items
begin
--   Manifest
--     INSTALL: UPGRADE-add original_due_date to action items
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
 p_id=>wwv_flow_imp.id(17976642739635421869)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'add original_due_date to action items'
,p_sequence=>580
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tab_cols',
'where table_name = ''EBA_PROJ_STATUS_AIS$''',
'and column_name = ''ORIGINAL_DUE_DATE'';',
''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_proj_status_ais$ add original_due_date timestamp(6) with local time zone;',
'/',
'',
'alter trigger AIU_EBA_PROJ_STATUS_AIS disable;',
'alter trigger AU_EBA_PROJ_STATUS_AIS disable;',
'alter trigger BI_EBA_PROJ_STATUS_AIS disable;',
'',
'update eba_proj_status_ais$ a',
'set original_due_date =',
'        nvl(',
'            to_date(substr((   select distinct first_value(h.old_value) over (order by change_date asc)',
'                from eba_proj_history$ h',
'                where h.component_id = a.id',
'                    and h.column_name = ''DUE_DATE'' ),1,11),''DD-MON-YYYY''),',
'            a.due_date',
'        )',
'where a.original_due_date is null;',
'',
'alter trigger AIU_EBA_PROJ_STATUS_AIS enable;',
'alter trigger AU_EBA_PROJ_STATUS_AIS enable;',
'alter trigger BI_EBA_PROJ_STATUS_AIS enable;',
'',
'alter table eba_proj_status_ais$ modify original_due_date timestamp(6) with local time zone not null;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
