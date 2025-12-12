prompt --application/shared_components/user_interface/lovs/project_updates_sort_order
begin
--   Manifest
--     PROJECT UPDATES SORT ORDER
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
 p_id=>wwv_flow_imp.id(6805033299538469192)
,p_lov_name=>'PROJECT UPDATES SORT ORDER'
,p_lov_query=>'.'||wwv_flow_imp.id(6805033299538469192)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366592612
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6805033590634469193)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Update Date, Project'
,p_lov_return_value=>'DATE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6805033793403469194)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Project, Update Date'
,p_lov_return_value=>'PROJECT'
);
wwv_flow_imp.component_end;
end;
/
