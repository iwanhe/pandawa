prompt --application/shared_components/navigation/lists/access_control_6736815
begin
--   Manifest
--     LIST: Access Control-6736815
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
 p_id=>wwv_flow_imp.id(7759564409255624939)
,p_name=>'Access Control-6736815'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366590292
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7759564595132624941)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Enable'
,p_list_item_link_target=>'javascript:openModal(''confirmEnableACL'');'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_text_01=>'Enabling Access Control allows access to the application and its features to be controlled by an Access Control List (ACL).  Until access control is enabled, all authenticated users are administrators.'
,p_list_text_02=>'switchIcon'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7759565212040624944)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Access Control'
,p_list_item_link_target=>'f?p=&APP_ID.:223:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-key'
,p_list_text_01=>'Use to change the Access Control Scope or to disable Access Control.'
,p_list_text_02=>'switchIcon'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7759564892107624944)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Users'
,p_list_item_link_target=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.:89,RIR:::'
,p_list_item_icon=>'fa-users'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>'eba_proj_fw.get_preference_value(''ACCESS_CONTROL_ENABLED'') = ''Y'''
,p_list_item_disp_condition2=>'PLSQL'
,p_list_text_01=>'Administrators can define the domain of users and assign each a role.'
,p_list_text_02=>'userIcon'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5909265310632790553)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Username Format'
,p_list_item_link_target=>'f?p=&APP_ID.:71:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-at'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_text_01=>'Define the username format for new users in this application.'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
