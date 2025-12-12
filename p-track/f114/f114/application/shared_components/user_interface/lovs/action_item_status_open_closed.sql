prompt --application/shared_components/user_interface/lovs/action_item_status_open_closed
begin
--   Manifest
--     ACTION ITEM STATUS (OPEN, CLOSED)
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
 p_id=>wwv_flow_imp.id(8959401832930782472)
,p_lov_name=>'ACTION ITEM STATUS (OPEN, CLOSED)'
,p_lov_query=>'.'||wwv_flow_imp.id(8959401832930782472)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366590996
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8959402036561782480)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Open'
,p_lov_return_value=>'Open'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(8959402226360782485)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Closed / Completed'
,p_lov_return_value=>'Closed'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(18118374838673398482)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Not Applicable'
,p_lov_return_value=>'Not Applicable'
);
wwv_flow_imp.component_end;
end;
/
