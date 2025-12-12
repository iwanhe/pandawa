prompt --application/shared_components/navigation/lists/administration_reports
begin
--   Manifest
--     LIST: Administration Reports
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
 p_id=>wwv_flow_imp.id(8913382841158050684)
,p_name=>'Administration Reports'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366590292
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8913525432348937472)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Status Codes'
,p_list_item_link_target=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-pencil'
,p_list_text_01=>'Manage status codes used by projects.'
,p_list_text_02=>'formIcon'
,p_list_text_03=>'&CNT_02.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'31'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7036707011280352568)
,p_list_item_display_sequence=>17
,p_list_item_link_text=>'&CAT_TITLE_PL.'
,p_list_item_link_target=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-pencil'
,p_list_text_01=>'Manage &CAT_TITLE_PL_LC. which are used to group projects.'
,p_list_text_02=>'formIcon'
,p_list_text_03=>'&CNT_03.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8921491332023433747)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Ingest Log'
,p_list_item_link_target=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:RP,39:::'
,p_list_item_icon=>'fa-table'
,p_list_text_01=>'Review ingest entries from email parser.'
,p_list_text_02=>'reportIcon'
,p_list_text_03=>'&CNT_06.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(6855415494149142740)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'39'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7417820785821862097)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Notifications'
,p_list_item_link_target=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-comments'
,p_list_text_01=>'Manage notifications that show on the top of the home page.  Use notifications to alert users of important information.'
,p_list_text_02=>'formIcon'
,p_list_text_03=>'&CNT_07.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5969678511438576411)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Build Options'
,p_list_item_link_target=>'f?p=&APP_ID.:105:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-gear'
,p_list_item_disp_cond_type=>'EXISTS'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID'))
,p_list_text_01=>'Manage the status of build options. Build options allow application functionality to be included or excluded from an application.  Use build options to factor your application.'
,p_list_text_02=>'formIcon'
,p_list_text_03=>'&CNT_08.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7156355278910240962)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Manage Sample Data'
,p_list_item_link_target=>'f?p=&APP_ID.:149:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-database'
,p_list_text_01=>'This application ships with sample data. You can remove or recreate sample data using this administrative page.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7840731209466521113)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Application Error Log'
,p_list_item_link_target=>'f?p=&APP_ID.:175:&SESSION.::&DEBUG.:RP,RIR:::'
,p_list_item_icon=>'fa-table'
,p_list_text_01=>'Report of all internal errors encountered within the application.'
,p_list_text_02=>'reportIcon'
,p_list_text_03=>'&CNT_05.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5847487585874095542)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Page Privileges'
,p_list_item_link_target=>'f?p=&APP_ID.:96:&SESSION.::&DEBUG.::::'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_text_01=>'Report of the pages within this application and their corresponding access control security level.'
,p_list_text_02=>'reportIcon'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7507332367316277000)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Flex Columns'
,p_list_item_link_target=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.:RP,140:::'
,p_list_item_icon=>'fa-wrench'
,p_list_text_01=>'Define and manage additional columns.'
,p_translate_list_text_y_n=>'Y'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
