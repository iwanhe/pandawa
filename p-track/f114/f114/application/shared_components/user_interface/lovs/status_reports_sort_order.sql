prompt --application/shared_components/user_interface/lovs/status_reports_sort_order
begin
--   Manifest
--     STATUS REPORTS SORT ORDER
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
 p_id=>wwv_flow_imp.id(6067001406324891826)
,p_lov_name=>'STATUS REPORTS SORT ORDER'
,p_lov_query=>'.'||wwv_flow_imp.id(6067001406324891826)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366592949
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6067001697702891832)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Submission Date, Project'
,p_lov_return_value=>'DATE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6067002003635891837)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Project, Submission Date'
,p_lov_return_value=>'PROJECT'
);
wwv_flow_imp.component_end;
end;
/
