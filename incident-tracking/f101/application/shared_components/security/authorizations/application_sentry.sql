prompt --application/shared_components/security/authorizations/application_sentry
begin
--   Manifest
--     SECURITY SCHEME: APPLICATION SENTRY
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(3204234644270058484)
,p_name=>'APPLICATION SENTRY'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    if :APP_PAGE_ID = 101 then',
'        return true;',
'    else',
'        return (eba_intrack.get_authorization_level(:APP_USER) > 0);',
'    end if;',
'end;'))
,p_error_message=>'You are not authorized to view this application, either because you have not been granted access, or your account has been locked. Please contact the application administrator.'
,p_version_scn=>39567690152331
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
