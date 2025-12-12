prompt --application/shared_components/user_interface/lovs/major_milestones
begin
--   Manifest
--     MAJOR MILESTONES
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
 p_id=>wwv_flow_imp.id(8030253724000369799)
,p_lov_name=>'MAJOR MILESTONES'
,p_lov_query=>'.'||wwv_flow_imp.id(8030253724000369799)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591418
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8030253946683369803)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Major Only'
,p_lov_return_value=>'MAJOR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8030254147694369806)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Major and Minor'
,p_lov_return_value=>'ALL'
);
wwv_flow_imp.component_end;
end;
/
