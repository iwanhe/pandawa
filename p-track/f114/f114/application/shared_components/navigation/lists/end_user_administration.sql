prompt --application/shared_components/navigation/lists/end_user_administration
begin
--   Manifest
--     LIST: End User Administration
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
 p_id=>wwv_flow_imp.id(5963195493902316416)
,p_name=>'End User Administration'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366589913
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5963195687717316418)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Change my password'
,p_list_item_link_target=>'f?p=&APP_ID.:97:&SESSION.::&DEBUG.:RP,97:::'
,p_list_item_icon=>'fa-pencil'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_text_01=>'Change current users password.  A screen will popup to re-enter your existing password, and to supply a new password.'
,p_list_text_02=>'userIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5963211311501539568)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Change My Time Zone'
,p_list_item_link_target=>'f?p=&APP_ID.:99:&SESSION.::&DEBUG.:RP,99:::'
,p_list_item_icon=>'fa-globe'
,p_list_text_01=>'Set your time zone preference for this application.'
,p_list_text_02=>'formIcon'
,p_list_text_03=>'&TZ.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5963269199764657812)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Change My Password'
,p_list_item_link_target=>'f?p=4155:50:&SESSION.::NO::FSP_AFTER_LOGIN_URL:f?p=&APP_ID.|10|&APP_SESSION.'
,p_list_item_icon=>'fa-pencil'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>'select 1 from apex_applications where AUTHENTICATION_SCHEME_TYPE = ''Application Express Accounts'' and application_id = :APP_ID'
,p_list_text_01=>'Change your current password.'
,p_list_text_02=>'userIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5292926775394505088)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Project Tree View Options'
,p_list_item_link_target=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-pencil-square-o'
,p_list_text_01=>'Set a preference to determine if you wish to see all projects in the tree navigation or only open projects.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(15181494798632888306)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Update My Profile'
,p_list_item_link_target=>'f?p=&APP_ID.:195:&SESSION.::&DEBUG.:195:P195_USERNAME:&APP_USER.:'
,p_list_item_icon=>'fa-user'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>'select 1 from EBA_PROJ_STATUS_USERS where upper(USERNAME) = upper(:APP_USER)'
,p_list_text_01=>'Update my photo and or text profile.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(16884434956105699786)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Email Preferences'
,p_list_item_link_target=>'f?p=&APP_ID.:199:&SESSION.::&DEBUG.:199:::'
,p_list_item_icon=>'fa-envelope-o'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Email Past Due Deliverables''',
'   and build_option_status = ''Include''',
'union all',
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Email Upcoming Deliverables''',
'   and build_option_status = ''Include''',
'union all',
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Email Project Details''',
'   and build_option_status = ''Include'''))
,p_list_text_01=>'Define the frequency in which you would prefer to receive &APPLICATION_TITLE. automated emails.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
