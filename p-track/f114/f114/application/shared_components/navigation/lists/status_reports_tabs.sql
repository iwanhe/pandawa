prompt --application/shared_components/navigation/lists/status_reports_tabs
begin
--   Manifest
--     LIST: Status Reports Tabs
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
 p_id=>wwv_flow_imp.id(6061519386492000444)
,p_name=>'Status Reports Tabs'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366589939
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6061519596443000450)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'By Date'
,p_list_item_link_target=>'f?p=&APP_ID.:117:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'117'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6072505787684124177)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'By Submitter'
,p_list_item_link_target=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
