prompt --application/shared_components/user_interface/lovs/project_details_scope_options
begin
--   Manifest
--     PROJECT DETAILS SCOPE OPTIONS
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
 p_id=>wwv_flow_imp.id(17470115273394938265)
,p_lov_name=>'PROJECT DETAILS SCOPE OPTIONS'
,p_lov_query=>'.'||wwv_flow_imp.id(17470115273394938265)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366592565
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17470115544610938273)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'All Projects'
,p_lov_return_value=>'ALL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17470116011982938276)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Projects I''m Following'
,p_lov_return_value=>'FOLLOW'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17470116347073938277)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Projects I''m a Member of'
,p_lov_return_value=>'MEMBER'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17470116795242938277)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Projects I''m a Member of and I''m Following'
,p_lov_return_value=>'BOTH'
);
wwv_flow_imp.component_end;
end;
/
