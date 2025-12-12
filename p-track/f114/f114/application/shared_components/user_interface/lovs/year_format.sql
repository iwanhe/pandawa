prompt --application/shared_components/user_interface/lovs/year_format
begin
--   Manifest
--     YEAR_FORMAT
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
 p_id=>wwv_flow_imp.id(3381437203340252599)
,p_lov_name=>'YEAR_FORMAT'
,p_lov_query=>'.'||wwv_flow_imp.id(3381437203340252599)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366593090
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(3381437472287252599)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'2 Digit Year'
,p_lov_return_value=>'YY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(3381437825841252600)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'4 Digit Year'
,p_lov_return_value=>'YYYY'
);
wwv_flow_imp.component_end;
end;
/
