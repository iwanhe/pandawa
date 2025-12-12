prompt --application/shared_components/logic/application_processes/set_time_zone
begin
--   Manifest
--     APPLICATION PROCESS: set time zone
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
 p_id=>wwv_flow_imp.id(5963506114055702415)
,p_process_sequence=>2
,p_process_point=>'AFTER_LOGIN'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'set time zone'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    c integer := 0;',
'begin',
'    for c1 in (',
'       select timezone_preference',
'       from   eba_proj_tz_pref',
'       where  username = upper(:APP_USER)) loop',
'       --',
'       if c1.timezone_preference is not null then',
'           c := c + 1;',
'           APEX_UTIL.SET_SESSION_TIME_ZONE (P_TIME_ZONE => c1.timezone_preference ); ',
'       end if;',
'       exit;',
'    end loop;',
'    if c = 0 then',
'        if apex_util.get_session_time_zone is null then',
'            APEX_UTIL.SET_SESSION_TIME_ZONE (P_TIME_ZONE => ''US/Pacific''); ',
'        end if;',
'    end if;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_version_scn=>39567366590761
);
wwv_flow_imp.component_end;
end;
/
