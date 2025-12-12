prompt --application/shared_components/user_interface/lovs/status_rpts_viewable_by
begin
--   Manifest
--     STATUS RPTS VIEWABLE BY
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
 p_id=>wwv_flow_imp.id(6061406382901171650)
,p_lov_name=>'STATUS RPTS VIEWABLE BY'
,p_lov_query=>'.'||wwv_flow_imp.id(6061406382901171650)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366593048
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6061406688024171657)
,p_lov_disp_sequence=>1
,p_lov_disp_value=>'Submitter'
,p_lov_return_value=>'Submitter'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6061407007456171662)
,p_lov_disp_sequence=>2
,p_lov_disp_value=>'Submitter and Project Members'
,p_lov_return_value=>'Submitter and Project Members'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(6061407292372171663)
,p_lov_disp_sequence=>3
,p_lov_disp_value=>'All'
,p_lov_return_value=>'All'
);
wwv_flow_imp.component_end;
end;
/
