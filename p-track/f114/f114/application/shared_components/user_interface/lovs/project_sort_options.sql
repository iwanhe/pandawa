prompt --application/shared_components/user_interface/lovs/project_sort_options
begin
--   Manifest
--     PROJECT SORT OPTIONS
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
 p_id=>wwv_flow_imp.id(8959437320303609223)
,p_lov_name=>'PROJECT SORT OPTIONS'
,p_lov_query=>'.'||wwv_flow_imp.id(8959437320303609223)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366592582
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8959437535028609232)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Project Name'
,p_lov_return_value=>'PROJECT'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8959437738897609240)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Last Updated Descending'
,p_lov_return_value=>'DATE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8959437946487609240)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Created Descending'
,p_lov_return_value=>'CREATED'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8959438121633609240)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'Next Milestone'
,p_lov_return_value=>'MILESTONE'
);
wwv_flow_imp.component_end;
end;
/
