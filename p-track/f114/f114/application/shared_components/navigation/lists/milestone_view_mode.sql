prompt --application/shared_components/navigation/lists/milestone_view_mode
begin
--   Manifest
--     LIST: Milestone View Mode
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
 p_id=>wwv_flow_imp.id(8957335740783211398)
,p_name=>'Milestone View Mode'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366590430
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8957336216865211398)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'By Date'
,p_list_item_link_target=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.::::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'35'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8957335925723211398)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Monthly Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:5:::'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8958193240091788561)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Interactive Report'
,p_list_item_link_target=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:RP,63,RIR:::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'63'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8959696923724662616)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Gantt'
,p_list_item_link_target=>'f?p=&APP_ID.:68:&SESSION.::&DEBUG.:68:::'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'68'
);
wwv_flow_imp.component_end;
end;
/
