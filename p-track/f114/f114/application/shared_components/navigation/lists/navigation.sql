prompt --application/shared_components/navigation/lists/navigation
begin
--   Manifest
--     LIST: Navigation
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
 p_id=>wwv_flow_imp.id(5750514095532766294)
,p_name=>'Navigation'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366589743
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5750514294161766299)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Administration'
,p_list_item_link_target=>'f?p=&APP_ID.:settings:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'settings'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5750514598587766307)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Mobile'
,p_list_item_link_target=>'f?p=&APP_ID.:mobile:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'mobile'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5750514900327766307)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Help'
,p_list_item_link_target=>'f?p=&APP_ID.:help:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'help'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
