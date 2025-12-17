prompt --application/shared_components/navigation/lists/incident_actions
begin
--   Manifest
--     LIST: Incident Actions
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
 p_id=>wwv_flow_imp.id(2103454868630036214)
,p_name=>'Incident Actions'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567690152267
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2103456736565036220)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Add Update'
,p_list_item_link_target=>'f?p=&APP_ID.:55:&SESSION.::&DEBUG.:55:P55_INCIDENT_ID:&P50_ID.:'
,p_list_item_icon=>'fa-comment'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2103455923822036220)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Add Link'
,p_list_item_link_target=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:49:P49_INCIDENT_ID:&P50_ID.:'
,p_list_item_icon=>'fa-external-link'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2103456267475036220)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Attach File'
,p_list_item_link_target=>'f?p=&APP_ID.:54:&SESSION.:54:&DEBUG.::P54_INCIDENT_ID:&P50_ID.:'
,p_list_item_icon=>'fa-paperclip'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
