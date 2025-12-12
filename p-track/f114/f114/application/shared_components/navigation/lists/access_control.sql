prompt --application/shared_components/navigation/lists/access_control
begin
--   Manifest
--     LIST: Access Control
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
 p_id=>wwv_flow_imp.id(5253669975849802718)
,p_name=>'Access Control'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366589683
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253670154382802718)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Access Control List'
,p_list_item_link_target=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-users'
,p_list_text_01=>'Manage application users and role assignments.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
