prompt --application/shared_components/user_interface/lovs/p3_gold_yn
begin
--   Manifest
--     P3_GOLD_YN
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
 p_id=>wwv_flow_imp.id(416117728134076741)
,p_lov_name=>'P3_GOLD_YN'
,p_lov_query=>'.'||wwv_flow_imp.id(416117728134076741)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366592390
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(416117916858076742)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Mark as Gold'
,p_lov_return_value=>'Y'
);
wwv_flow_imp.component_end;
end;
/
