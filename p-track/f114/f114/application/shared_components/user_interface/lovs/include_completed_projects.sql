prompt --application/shared_components/user_interface/lovs/include_completed_projects
begin
--   Manifest
--     INCLUDE COMPLETED PROJECTS
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
 p_id=>wwv_flow_imp.id(8904684536477243601)
,p_lov_name=>'INCLUDE COMPLETED PROJECTS'
,p_lov_query=>'.'||wwv_flow_imp.id(8904684536477243601)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591415
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8904684738833243607)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Include Completed Projects'
,p_lov_return_value=>'Y'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8907619818873607441)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Exclude Completed Projects'
,p_lov_return_value=>'N'
);
wwv_flow_imp.component_end;
end;
/
