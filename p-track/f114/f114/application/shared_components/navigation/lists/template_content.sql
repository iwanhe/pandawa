prompt --application/shared_components/navigation/lists/template_content
begin
--   Manifest
--     LIST: Template Content
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
 p_id=>wwv_flow_imp.id(13621114399891564754)
,p_name=>'Template Content'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366590702
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(13621115317229564759)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Add Milestone'
,p_list_item_link_target=>'f?p=&APP_ID.:181:&SESSION.::&DEBUG.:RP,181:P181_TEMPLATE_ID:&P184_ID.:'
,p_list_item_icon=>'fa-calendar'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(11756681878669227855)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(13621115742345564759)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Add Action Item'
,p_list_item_link_target=>'f?p=&APP_ID.:183:&SESSION.::&DEBUG.:RP,183:P183_TEMPLATE_ID:&P184_ID.:'
,p_list_item_icon=>'fa-check-circle-o'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(11756699376794143132)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
