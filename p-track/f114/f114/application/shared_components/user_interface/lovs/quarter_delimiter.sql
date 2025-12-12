prompt --application/shared_components/user_interface/lovs/quarter_delimiter
begin
--   Manifest
--     QUARTER DELIMITER
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
 p_id=>wwv_flow_imp.id(3381443365013268398)
,p_lov_name=>'QUARTER DELIMITER'
,p_lov_query=>'.'||wwv_flow_imp.id(3381443365013268398)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366592620
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(3381443676694268399)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Hyphen'
,p_lov_return_value=>' - '
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(3381444059615268399)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'FY (for Fiscal Year)'
,p_lov_return_value=>'FY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(3381444428162268399)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'CY (for Calendar Year)'
,p_lov_return_value=>'CY'
);
wwv_flow_imp.component_end;
end;
/
