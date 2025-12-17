prompt --application/shared_components/navigation/lists/look_up_values
begin
--   Manifest
--     LIST: Look up values
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
 p_id=>wwv_flow_imp.id(2752065368902618135)
,p_name=>'Look up values'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567690152268
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2752065549263618136)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Status Codes'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_text_02=>'reportIcon'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2752368972328666533)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Incident Severity'
,p_list_item_link_target=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.::::'
,p_list_text_02=>'reportIcon'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2752631855752690133)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Urgencies'
,p_list_item_link_target=>'f?p=&APP_ID.:11:&SESSION.::&DEBUG.:RP:::'
,p_list_text_02=>'reportIcon'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2780735773682702262)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Preferences'
,p_list_item_link_target=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.::::'
,p_list_text_02=>'switchIcon'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
