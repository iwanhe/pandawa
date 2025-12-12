prompt --application/shared_components/user_interface/lovs/ms_delete_options
begin
--   Manifest
--     MS_DELETE_OPTIONS
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
 p_id=>wwv_flow_imp.id(747397126560877496)
,p_lov_name=>'MS_DELETE_OPTIONS'
,p_lov_query=>'.'||wwv_flow_imp.id(747397126560877496)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591503
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(747397493214877497)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Delete the Milestone and all associated action items'
,p_lov_return_value=>'DELETE_ALL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(747397860787877499)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Delete the Milestone and un-associate all associated action items'
,p_lov_return_value=>'DELETE_UNASSOCIATE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(747398283934877499)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'Delete the Milestone and re-assign the associated action items to a different open milestone'
,p_lov_return_value=>'DELETE_REASSIGN'
,p_lov_disp_cond_type=>'EXISTS'
,p_lov_disp_cond=>'select null from eba_proj_status_ms where project_id = :P221_PRJ_ID and upper(milestone_status) = ''OPEN'' and id != :P221_MS_ID'
);
wwv_flow_imp.component_end;
end;
/
