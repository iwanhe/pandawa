prompt --application/shared_components/logic/application_processes/set_time_zone
begin
--   Manifest
--     APPLICATION PROCESS: set time zone
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_flow_process(
 p_id=>wwv_flow_imp.id(3210650664015126348)
,p_process_sequence=>1
,p_process_point=>'AFTER_LOGIN'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set time zone'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  c integer := 0;',
'begin',
'for c1 in (',
'   select TIMEZONE_PREFERENCE',
'   from   eba_intrack_tz_pref',
'   where  USERID = :APP_USER) loop',
'   --',
'   if c1.TIMEZONE_PREFERENCE is not null then',
'       c := c + 1;',
'       APEX_UTIL.SET_SESSION_TIME_ZONE (P_TIME_ZONE => c1.TIMEZONE_PREFERENCE ); ',
'   end if;',
'   exit;',
'end loop;',
'if c = 0 then',
'    if apex_util.get_session_time_zone is null then',
'        APEX_UTIL.SET_SESSION_TIME_ZONE (P_TIME_ZONE => ''US/Pacific''); ',
'    end if;',
'end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'Unable to set time zone'
,p_version_scn=>39567690152414
);
wwv_flow_imp.component_end;
end;
/
