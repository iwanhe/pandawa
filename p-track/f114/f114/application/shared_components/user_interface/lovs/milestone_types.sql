prompt --application/shared_components/user_interface/lovs/milestone_types
begin
--   Manifest
--     MILESTONE TYPES
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
 p_id=>wwv_flow_imp.id(20646355853476294049)
,p_lov_name=>'MILESTONE TYPES'
,p_lov_query=>'.'||wwv_flow_imp.id(20646355853476294049)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591462
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(20646356173265294053)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Major'
,p_lov_return_value=>'MAJOR'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(20646356562246294055)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Minor'
,p_lov_return_value=>'MINOR'
);
wwv_flow_imp.component_end;
end;
/
