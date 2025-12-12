prompt --application/shared_components/user_interface/lovs/notification_types
begin
--   Manifest
--     NOTIFICATION TYPES
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
 p_id=>wwv_flow_imp.id(7036844660079194916)
,p_lov_name=>'NOTIFICATION TYPES'
,p_lov_query=>'.'||wwv_flow_imp.id(7036844660079194916)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591550
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(7036844864314194919)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Yellow'
,p_lov_return_value=>'YELLOW'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(7036845200272194922)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Red'
,p_lov_return_value=>'RED'
);
wwv_flow_imp.component_end;
end;
/
