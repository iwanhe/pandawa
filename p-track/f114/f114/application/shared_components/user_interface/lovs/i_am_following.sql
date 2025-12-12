prompt --application/shared_components/user_interface/lovs/i_am_following
begin
--   Manifest
--     I AM FOLLOWING
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
 p_id=>wwv_flow_imp.id(6075097187837583330)
,p_lov_name=>'I AM FOLLOWING'
,p_lov_query=>'.'||wwv_flow_imp.id(6075097187837583330)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591415
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6075097686800583341)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Projects I''m Following'
,p_lov_return_value=>'1'
);
wwv_flow_imp.component_end;
end;
/
