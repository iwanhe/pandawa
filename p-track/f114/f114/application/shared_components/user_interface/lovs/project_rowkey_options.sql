prompt --application/shared_components/user_interface/lovs/project_rowkey_options
begin
--   Manifest
--     PROJECT ROWKEY OPTIONS
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
 p_id=>wwv_flow_imp.id(19743665795053002032)
,p_lov_name=>'PROJECT ROWKEY OPTIONS'
,p_lov_query=>'.'||wwv_flow_imp.id(19743665795053002032)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366592581
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(19743666128432002034)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Project Name Only'
,p_lov_return_value=>'DO_NOT_DISPLAY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(19743666567725002035)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Project Name and System-Generated Unique Identifier'
,p_lov_return_value=>'ROWKEY'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(19743666966831002036)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Project Name and Code Name'
,p_lov_return_value=>'CODE_NAME'
,p_required_patch=>wwv_flow_imp.id(19136678749050950256)
);
wwv_flow_imp.component_end;
end;
/
