prompt --application/shared_components/user_interface/lovs/access_control_scope
begin
--   Manifest
--     ACCESS CONTROL SCOPE
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
 p_id=>wwv_flow_imp.id(7759586806221698035)
,p_lov_name=>'ACCESS CONTROL SCOPE'
,p_lov_query=>'.'||wwv_flow_imp.id(7759586806221698035)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366590916
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(5911764385505093739)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Reader access for any authenticated user'
,p_lov_return_value=>'PUBLIC_READONLY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(5911764706214093739)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Contributor access for any authenticated user'
,p_lov_return_value=>'PUBLIC_CONTRIBUTE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(5911764989758093739)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Restricted to users defined in access control list'
,p_lov_return_value=>'ACL_ONLY'
);
wwv_flow_imp.component_end;
end;
/
