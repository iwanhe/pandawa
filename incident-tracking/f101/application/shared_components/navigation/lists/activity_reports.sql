prompt --application/shared_components/navigation/lists/activity_reports
begin
--   Manifest
--     LIST: Activity Reports
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
 p_id=>wwv_flow_imp.id(3340630669665685804)
,p_name=>'Activity Reports'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567690152273
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1569379574309759198)
,p_list_item_display_sequence=>3
,p_list_item_link_text=>'Application Activity'
,p_list_item_link_target=>'f?p=&APP_ID.:68:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'Monthly calendar of application activity reporting distinct users and total page views by day.  Available to contributors.'
,p_list_text_02=>'calendarIcon'
,p_security_scheme=>wwv_flow_imp.id(3204234956647058484)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(3340630872592685805)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Activity Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:60:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'Monthly calendar of page views with summary of page views by user by day.  Available to contributors.'
,p_list_text_02=>'reportIcon'
,p_security_scheme=>wwv_flow_imp.id(3204234956647058484)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(1559336071091231397)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Application Activity by Page'
,p_list_item_link_target=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-file-o'
,p_list_text_01=>'Use this report to review application page performance and popularity.  A weighted page performance column multiplies page views by median rendering time.  Use this report to validate application performance.'
,p_list_text_02=>'reportIcon'
,p_security_scheme=>wwv_flow_imp.id(3204234956647058484)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
