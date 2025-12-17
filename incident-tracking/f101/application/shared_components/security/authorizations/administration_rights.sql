prompt --application/shared_components/security/authorizations/administration_rights
begin
--   Manifest
--     SECURITY SCHEME: ADMINISTRATION RIGHTS
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
 p_id=>wwv_flow_imp.id(3204234467922058482)
,p_name=>'ADMINISTRATION RIGHTS'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return eba_intrack.get_authorization_level(:APP_USER) = 3;'
,p_error_message=>'Insufficient privileges, user is not an Administrator'
,p_version_scn=>39567690152298
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
