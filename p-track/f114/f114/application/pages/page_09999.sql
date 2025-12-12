prompt --application/pages/page_09999
begin
--   Manifest
--     PAGE: 09999
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_page.create_page(
 p_id=>9999
,p_name=>'Profile Photo Download'
,p_alias=>'IMAGE'
,p_step_title=>'Profile Photo Download'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486190175074984)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This page is not accessible directly through the UI. It is used to facilitate profile photo downloading.'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19204381191559214119)
,p_process_sequence=>10
,p_process_point=>'BEFORE_HEADER'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Fetch Image'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    for c1 in ( select photo_blob,',
'                    photo_name,',
'                    photo_mimetype,',
'                    dbms_lob.getlength(photo_blob) photo_length',
'               from eba_proj_status_users',
'               where upper(username) = upper(:GET_ID)',
'            ) loop',
'        if c1.photo_length > 0 then',
'            sys.htp.init();',
'            sys.owa_util.mime_header(',
'                nvl(c1.photo_mimetype, ''application/octet''),',
'                false',
'            );',
'            sys.htp.p(''Cache-Control: max-age=36000'');',
'            sys.htp.p(''Content-Length: '' || c1.photo_length);',
'            sys.htp.p(''Content-Disposition: inline; filename="''',
'                ||apex_escape.html(c1.photo_name)||''"; filename*=UTF-8''''''''''||apex_escape.html(c1.photo_name));',
'            sys.owa_util.http_header_close();',
'            sys.wpg_docload.download_file(c1.photo_blob);',
'            apex_application.stop_apex_engine;',
'        else',
'            apex_util.redirect_url(''#APP_IMAGES#no-photo.png'');',
'        end if;',
'    end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>19204381191559214119
);
wwv_flow_imp.component_end;
end;
/
