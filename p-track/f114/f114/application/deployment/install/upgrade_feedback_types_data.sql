prompt --application/deployment/install/upgrade_feedback_types_data
begin
--   Manifest
--     INSTALL: UPGRADE-Feedback Types Data
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
 p_id=>wwv_flow_imp.id(16930805368636868748)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Feedback Types Data'
,p_sequence=>940
,p_script_type=>'UPGRADE'
,p_condition_type=>'FUNCTION_BODY'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_table_cnt number;',
'    l_row_cnt   number;',
'begin',
'    select count(*)',
'      into l_table_cnt',
'      from user_tables',
'     where table_name = ''EBA_PROJ_FEEDBACK_TYPES'';',
'    if l_table_cnt = 1 then',
'        select count(*)',
'          into l_row_cnt',
'          from eba_proj_feedback_types;',
'        if l_row_cnt = 0 then',
'            return true;',
'        end if;',
'    end if;',
'    return false;',
'end;'))
,p_condition2=>'PLSQL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into eba_proj_feedback_types (id, type) values (1, ''General Comment'');',
'insert into eba_proj_feedback_types (id, type) values (2, ''Enhancement Request'');',
'insert into eba_proj_feedback_types (id, type) values (3, ''Bug'');',
'commit;'))
);
wwv_flow_imp.component_end;
end;
/
