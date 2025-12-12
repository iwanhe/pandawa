prompt --application/shared_components/user_interface/lovs/mass_update_actions
begin
--   Manifest
--     MASS_UPDATE_ACTIONS
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
 p_id=>wwv_flow_imp.id(20420786276030524307)
,p_lov_name=>'MASS_UPDATE_ACTIONS'
,p_lov_query=>'.'||wwv_flow_imp.id(20420786276030524307)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591428
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(20420786561011524311)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Change Status'
,p_lov_return_value=>'CHANGE_STATUS'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(20420786997719524313)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Change Due Date'
,p_lov_return_value=>'CHANGE_DUE_DATE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(20420787326886524313)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Change Owner'
,p_lov_return_value=>'CHANGE_OWNER'
,p_lov_disp_cond_type=>'NEVER'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(20420787763420524313)
,p_lov_disp_sequence=>4
,p_lov_disp_value=>'Change Type'
,p_lov_return_value=>'CHANGE_TYPE'
,p_lov_disp_cond_type=>'NEVER'
);
wwv_flow_imp.component_end;
end;
/
