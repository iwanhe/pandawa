prompt --application/shared_components/user_interface/lovs/project_creation_roles
begin
--   Manifest
--     PROJECT CREATION ROLES
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
 p_id=>wwv_flow_imp.id(20354645645213395392)
,p_lov_name=>'PROJECT CREATION ROLES'
,p_lov_query=>'.'||wwv_flow_imp.id(20354645645213395392)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366592523
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(20354655982863395397)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Contributors (and above)'
,p_lov_return_value=>'CONTRIBUTORS'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(20354656353215395401)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Application Administrators (and above)'
,p_lov_return_value=>'ADMINS'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(20354656800277395401)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Super Admins'
,p_lov_return_value=>'SUPER_ADMINS'
);
wwv_flow_imp.component_end;
end;
/
