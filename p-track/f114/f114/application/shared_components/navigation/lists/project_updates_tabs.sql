prompt --application/shared_components/navigation/lists/project_updates_tabs
begin
--   Manifest
--     LIST: Project Updates Tabs
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
 p_id=>wwv_flow_imp.id(8957458144310509260)
,p_name=>'Project Updates Tabs'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366590432
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8957458329677509260)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'By Date'
,p_list_item_link_target=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.:59:::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'59'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6086623899364851997)
,p_list_item_display_sequence=>27
,p_list_item_link_text=>'Dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:88:&SESSION.::&DEBUG.:RP:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
