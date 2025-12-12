prompt --application/shared_components/navigation/lists/admin_utilities
begin
--   Manifest
--     LIST: Admin Utilities
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
 p_id=>wwv_flow_imp.id(5885546993104226494)
,p_name=>'Admin Utilities'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366589874
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5885548107196226502)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Status Update Types'
,p_list_item_link_target=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-pencil'
,p_list_text_01=>'Status updates are classified as a "type of update".  Use this interface to manage the list of available status update types.'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5885548413536226502)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Action Item Types'
,p_list_item_link_target=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-pencil'
,p_list_text_01=>'Each action item can be of a particular type.  Use this to manage the list of available types.'
,p_list_text_02=>'formIcon'
,p_list_text_03=>'Action Item Types'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5885550188248226505)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Rename Application'
,p_list_item_link_target=>'f?p=&APP_ID.:42:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-pencil'
,p_list_text_01=>'Change the application name, displayed on the top left of each page, to one of your choosing.  By default, the application name is "&APP_NAME.".'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6988148099136017038)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Theme Style'
,p_list_item_link_target=>'f?p=&APP_ID.:148:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-desktop'
,p_list_text_01=>'Select the color schema and user interface look and feel for all users of this application.'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5975770898001502395)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Set outgoing Email preferences'
,p_list_item_link_target=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:RP,110:::'
,p_list_item_icon=>'fa-envelope-o'
,p_list_text_01=>'Set the email user from address from which to send messages.'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6064689301462381756)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Manage validations'
,p_list_item_link_target=>'f?p=&APP_ID.:114:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-pencil'
,p_list_text_01=>'View all project validations with ability to update and delete validations.'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
