prompt --application/shared_components/user_interface/lovs/show_project_views_checkbox
begin
--   Manifest
--     SHOW PROJECT VIEWS CHECKBOX
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
 p_id=>wwv_flow_imp.id(17335847420024907997)
,p_lov_name=>'SHOW PROJECT VIEWS CHECKBOX'
,p_lov_query=>'.'||wwv_flow_imp.id(17335847420024907997)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366592913
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17335847673775908003)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Show Project Views'
,p_lov_return_value=>'Y'
);
wwv_flow_imp.component_end;
end;
/
