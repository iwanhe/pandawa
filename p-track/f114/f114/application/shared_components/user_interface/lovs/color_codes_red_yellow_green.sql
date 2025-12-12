prompt --application/shared_components/user_interface/lovs/color_codes_red_yellow_green
begin
--   Manifest
--     COLOR CODES RED, YELLOW, GREEN
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
 p_id=>wwv_flow_imp.id(8922535818434419398)
,p_lov_name=>'COLOR CODES RED, YELLOW, GREEN'
,p_lov_query=>'.'||wwv_flow_imp.id(8922535818434419398)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366590997
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8922536019352419413)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Red'
,p_lov_return_value=>'Red'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8922536238497419424)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Yellow'
,p_lov_return_value=>'Yellow'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8922536432116419424)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Green'
,p_lov_return_value=>'Green'
);
wwv_flow_imp.component_end;
end;
/
