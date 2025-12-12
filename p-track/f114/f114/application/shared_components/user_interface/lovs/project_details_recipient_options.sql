prompt --application/shared_components/user_interface/lovs/project_details_recipient_options
begin
--   Manifest
--     PROJECT DETAILS RECIPIENT OPTIONS
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
 p_id=>wwv_flow_imp.id(17204189208091748169)
,p_lov_name=>'PROJECT DETAILS RECIPIENT OPTIONS'
,p_lov_query=>'.'||wwv_flow_imp.id(17204189208091748169)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366592564
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17204189426980748178)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Project Members'
,p_lov_return_value=>'MEMBERS'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17204189827275748182)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Project Followers'
,p_lov_return_value=>'FOLLOWERS'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(17204190252755748182)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Both'
,p_lov_return_value=>'BOTH'
);
wwv_flow_imp.component_end;
end;
/
