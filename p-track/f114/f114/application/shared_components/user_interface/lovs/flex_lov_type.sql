prompt --application/shared_components/user_interface/lovs/flex_lov_type
begin
--   Manifest
--     FLEX_LOV_TYPE
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
 p_id=>wwv_flow_imp.id(6143622687220059778)
,p_lov_name=>'FLEX_LOV_TYPE'
,p_lov_query=>'.'||wwv_flow_imp.id(6143622687220059778)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591414
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6143623002711059778)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Static List of Values'
,p_lov_return_value=>'STATIC'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6143623298006059779)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Dynamic List of Values (based on a SQL Query)'
,p_lov_return_value=>'DYNAMIC'
);
wwv_flow_imp.component_end;
end;
/
