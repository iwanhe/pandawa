prompt --application/shared_components/navigation/lists/navigation_menu
begin
--   Manifest
--     LIST: Navigation Menu
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(1609261271728075635)
,p_name=>'Navigation Menu'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567690152266
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609261379831075639)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Home'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-home'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'1,21,27,34,51,56,57,63,73,74,46'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609261521576075642)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Tickets [&A01.]'
,p_list_item_link_target=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-tags'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'15,16,17,28,44,50,52,54,53,49,55,64,66,2'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(607858506109718317)
,p_list_item_display_sequence=>25
,p_list_item_link_text=>'Open Tickets [&A04.]'
,p_list_item_link_target=>'f?p=&APP_ID.:71:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-tags'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'71'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609261595960075642)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Customers [&A02.]'
,p_list_item_link_target=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-user'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'47,30,45'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609261742541075642)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Assignees [&A03.]'
,p_list_item_link_target=>'f?p=&APP_ID.:48:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-users'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'48,58'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609261805675075642)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Reports'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-file-o'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'3,29,25,38,39,41,42,43,40,59,60,67,68,37'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1609746042684202266)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Administration'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-gear'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'4,5,6,7,8,9,11,12,18,20,22,23,24,26,31,32,33,35,36,46,56,61,62,65,70,175,10,13,14,19,70'
);
wwv_flow_imp.component_end;
end;
/
