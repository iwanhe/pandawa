prompt --application/shared_components/user_interface/lovs/milestone_status_values
begin
--   Manifest
--     MILESTONE STATUS VALUES
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
 p_id=>wwv_flow_imp.id(17589125109761517445)
,p_lov_name=>'MILESTONE STATUS VALUES'
,p_lov_query=>'.'||wwv_flow_imp.id(17589125109761517445)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591462
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17589125267811517447)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Open'
,p_lov_return_value=>'Open'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17589125626617517450)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Closed / Completed'
,p_lov_return_value=>'Completed'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17589181393916478498)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Not Applicable'
,p_lov_return_value=>'Not Applicable'
);
wwv_flow_imp.component_end;
end;
/
