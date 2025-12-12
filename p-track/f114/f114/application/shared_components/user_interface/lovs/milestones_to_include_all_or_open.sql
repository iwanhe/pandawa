prompt --application/shared_components/user_interface/lovs/milestones_to_include_all_or_open
begin
--   Manifest
--     MILESTONES TO INCLUDE ALL OR OPEN
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
 p_id=>wwv_flow_imp.id(12377098388122604202)
,p_lov_name=>'MILESTONES TO INCLUDE ALL OR OPEN'
,p_lov_query=>'.'||wwv_flow_imp.id(12377098388122604202)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591485
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(12377098599659604206)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'All Milestones'
,p_lov_return_value=>'ALL'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(12377098939120604210)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Open Milestones'
,p_lov_return_value=>'OPEN'
);
wwv_flow_imp.component_end;
end;
/
