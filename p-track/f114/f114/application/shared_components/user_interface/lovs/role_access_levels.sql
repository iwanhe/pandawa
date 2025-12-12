prompt --application/shared_components/user_interface/lovs/role_access_levels
begin
--   Manifest
--     ROLE ACCESS LEVELS
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
 p_id=>wwv_flow_imp.id(11618264107765638301)
,p_lov_name=>'ROLE ACCESS LEVELS'
,p_lov_query=>'.'||wwv_flow_imp.id(11618264107765638301)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366592768
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(11618264370866638305)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Read Only'
,p_lov_return_value=>'1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(11618264770455638307)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Read / Write'
,p_lov_return_value=>'2'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(11618265192508638307)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Read / Write (with Admin)'
,p_lov_return_value=>'3'
);
wwv_flow_imp.component_end;
end;
/
