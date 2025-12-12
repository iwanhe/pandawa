prompt --application/shared_components/navigation/lists/projects_tabs
begin
--   Manifest
--     LIST: Projects Tabs
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
 p_id=>wwv_flow_imp.id(8957425219891464321)
,p_name=>'Projects Tabs'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366590432
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8959288525248500163)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'By Project'
,p_list_item_link_target=>'f?p=&APP_ID.:64:&SESSION.::&DEBUG.:RP:::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'64'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8959407527707903911)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'By Owner'
,p_list_item_link_target=>'f?p=&APP_ID.:65:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'65'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8959399120004570556)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'By &CAT_TITLE.'
,p_list_item_link_target=>'f?p=&APP_ID.:61:&SESSION.::&DEBUG.:RP:::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'61'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6228104914535200485)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'As a Tree'
,p_list_item_link_target=>'f?p=&APP_ID.:72:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8957425428204464333)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:51:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'51'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6147058695912434977)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Interactive Report'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,RIR,1:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
