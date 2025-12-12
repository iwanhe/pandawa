prompt --application/shared_components/navigation/lists/activity_reports
begin
--   Manifest
--     LIST: Activity Reports
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
 p_id=>wwv_flow_imp.id(8919260028288162551)
,p_name=>'Activity Reports'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366590426
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6096970205395615269)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Page Views by Day'
,p_list_item_link_target=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'Monthly calendar of application activity reporting distinct users and total page views by day.'
,p_list_text_02=>'calendarIcon'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8919260236391162551)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Page Views'
,p_list_item_link_target=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-table'
,p_list_text_01=>'Interactive report of each page view.  View user, elapsed time, and page.'
,p_list_text_02=>'reportIcon'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'38'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8919263023963199092)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Top Users'
,p_list_item_link_target=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-table'
,p_list_text_01=>'Report of page views aggregated by user.'
,p_list_text_02=>'reportIcon'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'38'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7868314707067299970)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Activity Calendar by User by Day'
,p_list_item_link_target=>'f?p=&APP_ID.:94:&SESSION.::&DEBUG.:RP,94:::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'Page views by user summarized by day in a monthly calendar.'
,p_list_text_02=>'calendarIcon'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6075303514866775887)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Application Activity by Page'
,p_list_item_link_target=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-table'
,p_list_text_01=>'Use this report to review application page performance and popularity.  A weighted page performance column multiplies page views by median rendering time.  Use this report to validate application performance.'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6697963485242003873)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Email Log'
,p_list_item_link_target=>'f?p=&APP_ID.:56:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-envelope-o'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_text_01=>'Show emails sent from this system.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6697964906353025077)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Search Results'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-table'
,p_list_text_01=>'View Log of who searched for what.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253668100446767132)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Application Error Log'
,p_list_item_link_target=>'f?p=&APP_ID.:175:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-alert'
,p_list_text_01=>'Report of unexpected errors logged by this application'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
