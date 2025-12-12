prompt --application/shared_components/logic/application_processes/set_counts
begin
--   Manifest
--     APPLICATION PROCESS: set counts
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(6708180401687689961)
,p_process_sequence=>3
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set counts'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    function fmt (p_number in number default 0) return varchar2',
'    as ',
'    begin',
'         if p_number >= 1000000 then',
'            return trim(to_char(trunc(p_number/1000000),''999G999G999G990''))||''M'';',
'         elsif p_number >= 1000 then',
'            return trim(to_char(trunc(p_number/1000),''999G999G999G990''))||''K'';',
'         else',
'            return trim(to_char(p_number,''999G999G999G990''));',
'         end if;',
'    end fmt;',
'begin',
'for c1 in (select count(*) c from EBA_PROJ_STATUS_FILES) loop',
'   :attachments := fmt(c1.c);',
'end loop;',
'',
'for c1 in (',
'select count(*) c  ',
'from eba_proj_status p, EBA_PROJ_STATUS_CODES s ',
'where p.PROJECT_STATUS = s.id(+) ',
'      and nvl(IS_CLOSED_STATUS,''N'') != ''Y'') loop',
'    :PROJECTS := fmt(c1.c);',
'end loop;',
'',
'for c1 in (select count(*) c  from eba_proj_status_ms) loop',
'    :MILESTONES := fmt(c1.c);',
'end loop;',
'for c1 in (select count(*) c  from eba_proj_status_ais) loop',
'    :AI := fmt(c1.c);',
'end loop;',
'for c1 in (select count(*) c  from EBA_PROJ_STATUS_RPTS) loop',
'    :SR := fmt(c1.c);',
'end loop;',
'for c1 in (select count(*) c  from eba_proj_status_updates) loop',
'    :UPDATES := fmt(c1.c);',
'end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_when_type=>'NEVER'
,p_version_scn=>39567366590769
);
wwv_flow_imp.component_end;
end;
/
