prompt --application/shared_components/navigation/lists/incidents_reports
begin
--   Manifest
--     LIST: incidents reports
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
 p_id=>wwv_flow_imp.id(2777351942079417697)
,p_name=>'incidents reports'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567690152268
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2784198363076109096)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Search'
,p_list_item_link_target=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:RP,37:::'
,p_list_item_icon=>'fa-search'
,p_list_text_01=>'Search tickets, customers and customer data.'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2777352164501417709)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'New Incidents Timeline'
,p_list_item_link_target=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'View a timeline of new incident filed.'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2795019257062810275)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Tags'
,p_list_item_link_target=>'f?p=&APP_ID.:25:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-tag'
,p_list_text_01=>'View a tag cloud with drill down to components.'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(3268302358110790282)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Recently Activity'
,p_list_item_link_target=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-clock-o'
,p_list_text_01=>'Report of recently edited projects'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(3338119051003531404)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Ticket Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'Monthly calendar of ticket create / close dates.'
,p_list_text_02=>'calendarIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
