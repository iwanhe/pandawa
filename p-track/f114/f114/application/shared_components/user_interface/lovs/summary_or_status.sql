prompt --application/shared_components/user_interface/lovs/summary_or_status
begin
--   Manifest
--     SUMMARY_OR_STATUS
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
 p_id=>wwv_flow_imp.id(18800283283728490867)
,p_lov_name=>'SUMMARY_OR_STATUS'
,p_lov_query=>'.'||wwv_flow_imp.id(18800283283728490867)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366593051
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(18800283609060490871)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Project Details Email'
,p_lov_return_value=>'SUMMARY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(18800283938605490875)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Project Status Email'
,p_lov_return_value=>'STATUS'
);
wwv_flow_imp.component_end;
end;
/
