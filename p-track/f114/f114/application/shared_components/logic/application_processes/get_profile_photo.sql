prompt --application/shared_components/logic/application_processes/get_profile_photo
begin
--   Manifest
--     APPLICATION PROCESS: GET_PROFILE_PHOTO
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
 p_id=>wwv_flow_imp.id(15212964782264295597)
,p_process_sequence=>1
,p_process_point=>'ON_DEMAND'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'GET_PROFILE_PHOTO'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if apex_authentication.is_authenticated then ',
'        apex_debug.message(''user is authed'', p_force => true);',
'        apex_debug.message(wwv_flow.g_user, p_force => true);',
'        apex_debug.message(APEX_CUSTOM_AUTH.GET_USERNAME, p_force => true);',
'        apex_debug.message(APEX_CUSTOM_AUTH.GET_SESSION_ID, p_force => true);',
'        apex_debug.message(APEX_CUSTOM_AUTH.GET_SESSION_ID_FROM_COOKIE, p_force => true);',
'    else ',
'        apex_debug.message(''user is not authed'', p_force => true);',
'        apex_debug.message(wwv_flow.g_user, p_force => true);',
'        apex_debug.message(APEX_CUSTOM_AUTH.GET_USERNAME, p_force => true);',
'        apex_debug.message(APEX_CUSTOM_AUTH.GET_SESSION_ID, p_force => true);',
'        apex_debug.message(APEX_CUSTOM_AUTH.GET_SESSION_ID_FROM_COOKIE, p_force => true);',
'    end if; ',
'',
'    for c1 in ( select photo_blob,',
'                    photo_name,',
'                    photo_mimetype,',
'                    dbms_lob.getlength(photo_blob) len',
'                from eba_proj_status_users',
'                where upper(username) = upper(:GET_ID) ) loop',
'        if c1.len > 0 then',
'            sys.htp.init();',
'            sys.owa_util.mime_header(',
'                nvl(c1.photo_mimetype, ''application/octet''),',
'                false',
'            );',
'            sys.htp.p(''Cache-Control: max-age=36000'');',
'            sys.htp.p(''Content-Length: '' || c1.len);',
'            sys.htp.p(''Content-Disposition: inline; filename="''',
'                ||apex_escape.html(c1.photo_name)|| ''"; filename*=UTF-8''''''''''',
'                ||apex_escape.html(c1.photo_name));',
'            sys.owa_util.http_header_close;',
'            sys.wpg_docload.download_file(c1.photo_blob);',
'            apex_application.stop_apex_engine;',
'        else',
'            apex_util.redirect_url(''#APP_IMAGES#no-photo.png'');',
'        end if;',
'    end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_security_scheme=>'MUST_NOT_BE_PUBLIC_USER'
,p_version_scn=>39567366590769
);
wwv_flow_imp.component_end;
end;
/
