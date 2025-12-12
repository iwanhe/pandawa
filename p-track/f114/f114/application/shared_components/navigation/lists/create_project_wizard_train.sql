prompt --application/shared_components/navigation/lists/create_project_wizard_train
begin
--   Manifest
--     LIST: Create Project Wizard Train
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
 p_id=>wwv_flow_imp.id(11567832365745161959)
,p_name=>'Create Project Wizard Train'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366590568
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11567832574287161965)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Project'
,p_list_item_link_target=>'f?p=&APP_ID.:300:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11567832972100161966)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Access'
,p_list_item_link_target=>'f?p=&APP_ID.:301:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11567833330348161967)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Details'
,p_list_item_link_target=>'f?p=&APP_ID.:302:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11567833751450161967)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Confirmation'
,p_list_item_link_target=>'f?p=&APP_ID.:303:&SESSION.:'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
