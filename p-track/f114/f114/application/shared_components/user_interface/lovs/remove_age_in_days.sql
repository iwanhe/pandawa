prompt --application/shared_components/user_interface/lovs/remove_age_in_days
begin
--   Manifest
--     REMOVE AGE IN DAYS
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
 p_id=>wwv_flow_imp.id(6229432398899579895)
,p_lov_name=>'REMOVE AGE IN DAYS'
,p_lov_query=>'.'||wwv_flow_imp.id(6229432398899579895)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366592767
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6229432604780579902)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'90 (~ 3 months)'
,p_lov_return_value=>'90'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6229432886576579911)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'180 (~ 6 months)'
,p_lov_return_value=>'180'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6229433200538579911)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'365 (1 Year)'
,p_lov_return_value=>'365'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6229433514057579911)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'730 (2 Years)'
,p_lov_return_value=>'730'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6229433786600579911)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'1095 (3 years)'
,p_lov_return_value=>'1095'
);
wwv_flow_imp.component_end;
end;
/
