prompt --application/shared_components/navigation/lists/ai_tabs
begin
--   Manifest
--     LIST: AI Tabs
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
 p_id=>wwv_flow_imp.id(5253685515533945422)
,p_name=>'AI Tabs'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366589691
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253685715125945423)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'50'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253686084989945423)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Due Dates'
,p_list_item_link_target=>'f?p=&APP_ID.:125:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253686575189945423)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'&CAT_TITLE_PL.'
,p_list_item_link_target=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253686904127945424)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Interactive Report'
,p_list_item_link_target=>'f?p=&APP_ID.:49:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253687349535945424)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Owners'
,p_list_item_link_target=>'f?p=&APP_ID.:111:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
