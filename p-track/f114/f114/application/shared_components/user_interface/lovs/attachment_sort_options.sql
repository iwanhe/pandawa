prompt --application/shared_components/user_interface/lovs/attachment_sort_options
begin
--   Manifest
--     ATTACHMENT SORT OPTIONS
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
 p_id=>wwv_flow_imp.id(6726386795412029846)
,p_lov_name=>'ATTACHMENT SORT OPTIONS'
,p_lov_query=>'.'||wwv_flow_imp.id(6726386795412029846)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366590997
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6726387167338029856)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Filename'
,p_lov_return_value=>'FILE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6726387720177029861)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Created Descending'
,p_lov_return_value=>'DATE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6726907688773220564)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'Contributor'
,p_lov_return_value=>'CONT'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6726908906036249603)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'Size'
,p_lov_return_value=>'SIZE'
);
wwv_flow_imp.component_end;
end;
/
