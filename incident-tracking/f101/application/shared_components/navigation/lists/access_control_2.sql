prompt --application/shared_components/navigation/lists/access_control_2
begin
--   Manifest
--     LIST: Access Control 2
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
 p_id=>wwv_flow_imp.id(2873828373700742038)
,p_name=>'Access Control 2'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567690152272
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2873831246710742061)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Users'
,p_list_item_link_target=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:RP:::'
,p_list_text_01=>'Define the domain of users that can use this application.  Application users can be administrators, contributors, or readers.'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
