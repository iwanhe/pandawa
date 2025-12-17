prompt --application/shared_components/navigation/lists/administration
begin
--   Manifest
--     LIST: administration
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
 p_id=>wwv_flow_imp.id(2873410966419664302)
,p_name=>'administration'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567690152271
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2873411762689664310)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Products'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-archive'
,p_list_text_01=>'Manage products'
,p_list_text_02=>'formIcon'
,p_list_text_03=>'&CNT_01.'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(320187505812192659)
,p_list_item_display_sequence=>15
,p_list_item_link_text=>'Product Versions'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:13,RIR:::'
,p_list_item_icon=>'fa-copyright'
,p_list_text_01=>'Manage product versions'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2873412667716664311)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Category'
,p_list_item_link_target=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-align-justify'
,p_list_text_01=>'Manage categories which are used to classify tickets.'
,p_list_text_02=>'reportIcon'
,p_list_text_03=>'&CNT_02.'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2873413244566664311)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Customers'
,p_list_item_link_target=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-user'
,p_list_text_01=>'Manage and report on customer information.'
,p_list_text_02=>'reportIcon'
,p_list_text_03=>'&CNT_03.'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2873413554222664311)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Customer Contacts'
,p_list_item_link_target=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-users'
,p_list_text_01=>'Search and locate customer contacts'
,p_list_text_02=>'reportIcon'
,p_list_text_03=>'&CNT_04.'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2892136942196671874)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Notifications'
,p_list_item_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-bullhorn'
,p_list_text_01=>'Define notifications that are displayed on the application home page.  Use notifications to alert users of important information.'
,p_list_text_02=>'reportIcon'
,p_list_text_03=>'&CNT_05.'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1539880346752835182)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Build Options'
,p_list_item_link_target=>'f?p=&APP_ID.:65:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-cubes'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID'))
,p_list_text_01=>'Manage the status of build options. Build options allow application functionality to be included or excluded from an application.  Use build options to factor your application.'
,p_list_text_02=>'formIcon'
,p_list_text_03=>'&CNT_06.'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(3312565868059366501)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Application Error Log'
,p_list_item_link_target=>'f?p=&APP_ID.:175:&SESSION.::&DEBUG.:RP,RIR,CIR:::'
,p_list_item_icon=>'fa-alert'
,p_list_text_01=>'Report of all internal errors encountered within the application.'
,p_list_text_02=>'reportIcon'
,p_list_text_03=>'&CNT_07.'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1320027166905041994)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Page Privileges'
,p_list_item_link_target=>'f?p=&APP_ID.:61:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-file-excel-o'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_text_01=>'Report of the pages within this application and their corresponding access control security level.'
,p_list_text_02=>'reportIcon'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1334935363853389984)
,p_list_item_display_sequence=>600
,p_list_item_link_text=>'Rename Application'
,p_list_item_link_target=>'f?p=&APP_ID.:62:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-pencil'
,p_list_text_01=>'Change the application name, displayed on the top left of each page, to one of your choosing.  By default, the application name is "&APP_NAME.".'
,p_list_text_02=>'formIcon'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1988747526267536747)
,p_list_item_display_sequence=>800
,p_list_item_link_text=>'Manage Sample Data'
,p_list_item_link_target=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-database'
,p_list_text_01=>'Remove, create, or re-create sample data provided with this application.'
,p_security_scheme=>wwv_flow_imp.id(3204234467922058482)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1840679200385458269)
,p_list_item_display_sequence=>810
,p_list_item_link_text=>'Application Appearance'
,p_list_item_link_target=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:RP,70:::'
,p_list_item_icon=>'fa-desktop'
,p_list_text_01=>'Change user interface theme styles for all users.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
