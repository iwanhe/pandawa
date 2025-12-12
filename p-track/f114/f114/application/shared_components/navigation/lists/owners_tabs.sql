prompt --application/shared_components/navigation/lists/owners_tabs
begin
--   Manifest
--     LIST: Owners Tabs
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(5253671747534830364)
,p_name=>'Owners Tabs'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366589683
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253671884164830365)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'People'
,p_list_item_link_target=>'f?p=&APP_ID.:133:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253672294287830365)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:113:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
