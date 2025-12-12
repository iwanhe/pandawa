prompt --application/shared_components/navigation/lists/action_items_tabs
begin
--   Manifest
--     LIST: Action Items Tabs
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
 p_id=>wwv_flow_imp.id(8957466624617531900)
,p_name=>'Action Items Tabs'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366590487
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8959388822148400902)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:50:::'
,p_list_item_icon=>'fa-dashboard'
,p_list_text_01=>'Dashboard view of recent action items, etc.'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'50'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19289552001801041894)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Analysis Report'
,p_list_item_link_target=>'f?p=&APP_ID.:216:&SESSION.::&DEBUG.:RP,216,RIR:::'
,p_list_item_icon=>'fa-binoculars'
,p_list_text_01=>'Compare original due dates to actual completion dates and see the difference in days between the two.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(8958189319134744591)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Interactive Report'
,p_list_item_link_target=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,49,CIR:::'
,p_list_item_icon=>'fa-table'
,p_list_text_01=>'Interactive reporting includes the ability to download, filter, format, and sort report data as well as saving modified reports as "Saved Reports".'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'49'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5979196195679466198)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'By Owner Timeline'
,p_list_item_link_target=>'f?p=&APP_ID.:111:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'Searchable report of action items broken down by owner'
,p_list_item_current_type=>'COLON_DELIMITED_PAGE_LIST'
,p_list_item_current_for_pages=>'111'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5201490134262941024)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Past Due Action Items'
,p_list_item_link_target=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,RIR:IR_PAST_DUE,P49_PAST_DUE_YN:Yes,Y:'
,p_list_item_icon=>'fa-flag'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_text_01=>'Interactive report of all open past due action items.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(18944941119141715868)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Summary by Project'
,p_list_item_link_target=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-check'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_text_01=>'Interactive report of projects action items summarized by project'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
