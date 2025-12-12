prompt --application/shared_components/user_interface/lovs/risk_verbosity_in_status_emails
begin
--   Manifest
--     RISK_VERBOSITY_IN_STATUS_EMAILS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(19089839536019237300)
,p_lov_name=>'RISK_VERBOSITY_IN_STATUS_EMAILS'
,p_lov_query=>'.'||wwv_flow_imp.id(19089839536019237300)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366592767
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(19089839898270237310)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Terse'
,p_lov_return_value=>'TERSE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(19089840221489237314)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Verbose'
,p_lov_return_value=>'VERBOSE'
);
wwv_flow_imp.component_end;
end;
/
