prompt --application/shared_components/navigation/lists/admin_code_tables
begin
--   Manifest
--     LIST: Admin Code Tables
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
 p_id=>wwv_flow_imp.id(5253656680541696947)
,p_name=>'Admin Code Tables'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366589655
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(3370136450350191852)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Quarters'
,p_list_item_link_target=>'f?p=&APP_ID.:112:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'Manage the quarters (fiscal or calendar) maintained in this application'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253657226732696948)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Status Codes'
,p_list_item_link_target=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-pencil'
,p_list_text_01=>'Manage domain of status codes'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(18877598070168098228)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Regions and Countries'
,p_list_item_link_target=>'f?p=&APP_ID.:135:&SESSION.::&DEBUG.:RP,RIR,135:::'
,p_list_item_icon=>'fa-globe'
,p_list_text_01=>'Manage which regions and countries are available for projects'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(18882216890018093962)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(3927736177482667797)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Issue &CAT_TITLE_PL.'
,p_list_item_link_target=>'f?p=&APP_ID.:153:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-bug'
,p_list_text_01=>'Manage the categories available for issues to be assigned to.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(3927734266816599065)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(119939042047886461)
,p_list_item_display_sequence=>75
,p_list_item_link_text=>'Issue Levels'
,p_list_item_link_target=>'f?p=&APP_ID.:220:&SESSION.::&DEBUG.:220,RIR:::'
,p_list_item_icon=>'fa-crosshairs'
,p_list_text_01=>'Manage the levels available for issues to be assigned to.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253659658142696950)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'&CAT_TITLE_PL.'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-pencil-square-o'
,p_list_text_01=>'Manage domain of &CAT_TITLE_PL_LC. used to group projects.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253664861105718214)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Status Update Types'
,p_list_item_link_target=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-pencil'
,p_list_text_01=>'Status updates are classified as a "type of update".  Use this interface to manage the list of available status update types.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253665125571721076)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Action Item Types'
,p_list_item_link_target=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-pencil'
,p_list_text_01=>'Each action item can be of a particular type.  Use this to manage the list of available types.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11619070931018797401)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Project Roles'
,p_list_item_link_target=>'f?p=&APP_ID.:160:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-lock'
,p_list_text_01=>'Manage project  role definitions.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(12101574660395280507)
,p_list_item_display_sequence=>115
,p_list_item_link_text=>'Project Sizes'
,p_list_item_link_target=>'f?p=&APP_ID.:156:&SESSION.::&DEBUG.:RP,RIR,156:::'
,p_list_item_icon=>'fa-signal'
,p_list_text_01=>'Manage the list of sizes available for projects'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(12131994237014236636)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11753100518560013771)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Involvement Levels'
,p_list_item_link_target=>'f?p=&APP_ID.:165:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-male'
,p_list_text_01=>'Define domain of classifications that are used to define the level of engagement for each person for each project.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(12124281749376450905)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(12030857080545018344)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'Resource Types'
,p_list_item_link_target=>'f?p=&APP_ID.:172:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-building'
,p_list_text_01=>'When using resources, define the domain of resources that can be associated with any project.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(12021369465070232745)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19157818806201701432)
,p_list_item_display_sequence=>140
,p_list_item_link_text=>'Deal Types'
,p_list_item_link_target=>'f?p=&APP_ID.:206:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-certificate'
,p_list_text_01=>'Define the Deal Types that are to be used in this application.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(19136688366517761209)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
