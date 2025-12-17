prompt --application/shared_components/navigation/lists/access_control
begin
--   Manifest
--     LIST: Access Control
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
 p_id=>wwv_flow_imp.id(3204237058879103169)
,p_name=>'Access Control'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567690152273
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(3204237557769103171)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Access Control'
,p_list_item_link_target=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-key'
,p_list_text_01=>'Use to change the Access Control Scope or to disable Access Control.'
,p_list_text_02=>'switchIcon'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(3204237851175103172)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Users'
,p_list_item_link_target=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:31,RIR:::'
,p_list_item_icon=>'fa-users'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>'eba_intrack_fw.get_preference_value(''ACCESS_CONTROL_ENABLED'') = ''Y'''
,p_list_item_disp_condition2=>'PLSQL'
,p_list_text_01=>'Administrators can define the domain of users and assign each a role.'
,p_list_text_02=>'userIcon'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1436194651204379791)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Username Format'
,p_list_item_link_target=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-user'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_text_01=>'Define the username format for new users in this application.'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
