prompt --application/shared_components/user_interface/lovs/project_acl_levels
begin
--   Manifest
--     PROJECT ACL LEVELS
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
 p_id=>wwv_flow_imp.id(11045413827346451385)
,p_lov_name=>'PROJECT ACL LEVELS'
,p_lov_query=>'.'||wwv_flow_imp.id(11045413827346451385)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366592466
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(11045414152472451387)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Open'
,p_lov_return_value=>'1'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(11045414536412451389)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Project Restricted: Editable by Associated People; Readable by All'
,p_lov_return_value=>'2'
,p_lov_disp_cond_type=>'NEVER'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(11045414865484451390)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Restricted - Only Accessible by Associated People'
,p_lov_return_value=>'3'
);
wwv_flow_imp.component_end;
end;
/
