prompt --application/shared_components/user_interface/lovs/show_all_open
begin
--   Manifest
--     SHOW ALL OPEN
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
 p_id=>wwv_flow_imp.id(8030284120218013671)
,p_lov_name=>'SHOW ALL OPEN'
,p_lov_query=>'.'||wwv_flow_imp.id(8030284120218013671)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366592912
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8030284321421013672)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Open and Completed'
,p_lov_return_value=>'All'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8030284539402013672)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Open'
,p_lov_return_value=>'Open'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8030285228623072823)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Completed'
,p_lov_return_value=>'Completed'
);
wwv_flow_imp.component_end;
end;
/
