prompt --application/shared_components/user_interface/lovs/status_rpts_editable_by
begin
--   Manifest
--     STATUS RPTS EDITABLE BY
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
 p_id=>wwv_flow_imp.id(6061407490520173835)
,p_lov_name=>'STATUS RPTS EDITABLE BY'
,p_lov_query=>'.'||wwv_flow_imp.id(6061407490520173835)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366592994
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6061407799781173837)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Submitter'
,p_lov_return_value=>'Submitter'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6061408108594173837)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Submitter and Project Members'
,p_lov_return_value=>'Submitter and Project Members'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6061408408439173837)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'All Contributors'
,p_lov_return_value=>'All Contributors'
);
wwv_flow_imp.component_end;
end;
/
