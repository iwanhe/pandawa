prompt --application/shared_components/navigation/lists/wiz_progress
begin
--   Manifest
--     LIST: Wiz progress
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
 p_id=>wwv_flow_imp.id(2757987265671159566)
,p_name=>'Wiz progress'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567690152268
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2757987467411159567)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Customer'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.::::'
,p_security_scheme=>wwv_flow_imp.id(3204234956647058484)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2757987764752159567)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Product'
,p_list_item_link_target=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.::::'
,p_security_scheme=>wwv_flow_imp.id(3204234956647058484)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2757988051281159567)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Problem'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.::::'
,p_security_scheme=>wwv_flow_imp.id(3204234956647058484)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
