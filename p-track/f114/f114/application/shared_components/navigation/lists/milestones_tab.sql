prompt --application/shared_components/navigation/lists/milestones_tab
begin
--   Manifest
--     LIST: Milestones Tab
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
 p_id=>wwv_flow_imp.id(5253677596989895621)
,p_name=>'Milestones Tab'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366589683
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19273123339342031258)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Analysis Report'
,p_list_item_link_target=>'f?p=&APP_ID.:214:&SESSION.::&DEBUG.:RP,214,RIR:::'
,p_list_item_icon=>'fa-binoculars'
,p_list_text_01=>'Compare original due dates to actual completion dates and see the difference in days between the two. '
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253678990440895625)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Interactive Report'
,p_list_item_link_target=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:RP,RIR,63:::'
,p_list_item_icon=>'fa-table'
,p_list_text_01=>'Interactive reporting includes the ability to download, filter, format, and sort report data as well as saving modified reports as "Saved Reports".'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5354126472682020446)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'By Owner Timeline'
,p_list_item_link_target=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:17:::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'Filterable list of projects by milestone owners'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253678233730895624)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'&CAT_TITLE. Bar Chart'
,p_list_item_link_target=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:RP,9:::'
,p_list_item_icon=>'fa-bar-chart'
,p_list_text_01=>'Bart chart of milestones by &CAT_TITLE_LC., color coded for open and closed status'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253679390618895625)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Gantt Chart'
,p_list_item_link_target=>'f?p=&APP_ID.:68:&SESSION.::&DEBUG.:RP,68:::'
,p_list_item_icon=>'fa-list'
,p_list_text_01=>'Gantt chart of milestones'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253678620645895624)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Monthly Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'Monthly calendar of milesones'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(14017375963575379436)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Past Due Milestones'
,p_list_item_link_target=>'f?p=&APP_ID.:29:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-flag'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_text_01=>'Report of all past due milestones over all projects.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253682143584905162)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Milestone Summary by Project'
,p_list_item_link_target=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:26:::'
,p_list_item_icon=>'fa-table'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_text_01=>'Interactive report of projects milestone summarized by project'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
