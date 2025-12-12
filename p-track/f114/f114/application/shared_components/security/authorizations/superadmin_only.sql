prompt --application/shared_components/security/authorizations/superadmin_only
begin
--   Manifest
--     SECURITY SCHEME: SUPERADMIN ONLY
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_security_scheme(
 p_id=>wwv_flow_imp.id(16958742599275547529)
,p_name=>'SUPERADMIN ONLY'
,p_scheme_type=>'NATIVE_FUNCTION_BODY'
,p_attribute_01=>'return eba_proj_stat_ui.get_authorization_level(:APP_USER) >= 4;'
,p_error_message=>'Insufficient privileges, user is not a Super Administrator'
,p_version_scn=>39567366590758
,p_caching=>'BY_USER_BY_SESSION'
);
wwv_flow_imp.component_end;
end;
/
