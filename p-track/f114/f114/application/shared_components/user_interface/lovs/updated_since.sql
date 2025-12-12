prompt --application/shared_components/user_interface/lovs/updated_since
begin
--   Manifest
--     UPDATED SINCE
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
 p_id=>wwv_flow_imp.id(3765646761693449590)
,p_lov_name=>'UPDATED SINCE'
,p_lov_query=>'.'||wwv_flow_imp.id(3765646761693449590)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366593088
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(3765647015769449618)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Within the last 30 days'
,p_lov_return_value=>'30'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(3765647460460449620)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Within the last 60 days'
,p_lov_return_value=>'60'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(3765647854332449620)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Within the last 90 days'
,p_lov_return_value=>'90'
);
wwv_flow_imp.component_end;
end;
/
