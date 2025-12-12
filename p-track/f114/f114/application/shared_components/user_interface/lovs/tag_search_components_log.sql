prompt --application/shared_components/user_interface/lovs/tag_search_components_log
begin
--   Manifest
--     TAG SEARCH COMPONENTS LOG
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
 p_id=>wwv_flow_imp.id(5985370600998564807)
,p_lov_name=>'TAG SEARCH COMPONENTS LOG'
,p_lov_query=>'.'||wwv_flow_imp.id(5985370600998564807)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366593070
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(5985370907250564817)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Projects'
,p_lov_return_value=>'P'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(5985371201839564821)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Action Items'
,p_lov_return_value=>'I'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(5985371795961564821)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Links'
,p_lov_return_value=>'L'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(5985372385473564822)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'Milestones'
,p_lov_return_value=>'M'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(5985373005083564822)
,p_lov_disp_sequence=>70
,p_lov_disp_value=>'Files'
,p_lov_return_value=>'F'
);
wwv_flow_imp.component_end;
end;
/
