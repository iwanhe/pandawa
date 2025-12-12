prompt --application/shared_components/user_interface/lovs/milestones_sort_order
begin
--   Manifest
--     MILESTONES SORT ORDER
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
 p_id=>wwv_flow_imp.id(6810783702064302550)
,p_lov_name=>'MILESTONES SORT ORDER'
,p_lov_query=>'.'||wwv_flow_imp.id(6810783702064302550)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591464
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6810783995561302552)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Milestone Date Desc'
,p_lov_return_value=>'DATE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6071825500943623687)
,p_lov_disp_sequence=>15
,p_lov_disp_value=>'Milestone Date Asc'
,p_lov_return_value=>'DATE2'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6810784193234302552)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Project, Milestone Date'
,p_lov_return_value=>'PROJECT'
,p_lov_disp_cond_type=>'NEVER'
);
wwv_flow_imp.component_end;
end;
/
