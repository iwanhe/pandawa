prompt --application/shared_components/navigation/lists/project_utilities
begin
--   Manifest
--     LIST: project utilities
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
 p_id=>wwv_flow_imp.id(5847557110072017419)
,p_name=>'project utilities'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366589774
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5847557303390017423)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Merge Projects'
,p_list_item_link_target=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-gear'
,p_list_text_01=>'Merge two projects into one project.'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
