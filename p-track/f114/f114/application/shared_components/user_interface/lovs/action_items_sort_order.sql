prompt --application/shared_components/user_interface/lovs/action_items_sort_order
begin
--   Manifest
--     ACTION ITEMS SORT ORDER
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
 p_id=>wwv_flow_imp.id(8959635237446662859)
,p_lov_name=>'ACTION ITEMS SORT ORDER'
,p_lov_query=>'.'||wwv_flow_imp.id(8959635237446662859)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366590997
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8959635445709662871)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Due Date Asc'
,p_lov_return_value=>'DUE_DATE'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8959635618440662876)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Due Date Desc'
,p_lov_return_value=>'DUE_DATE2'
);
wwv_flow_imp.component_end;
end;
/
