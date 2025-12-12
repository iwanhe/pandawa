prompt --application/shared_components/navigation/lists/projects
begin
--   Manifest
--     LIST: Projects
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
 p_id=>wwv_flow_imp.id(5253627245363136160)
,p_name=>'Projects'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366589624
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253627418471136161)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:51:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-dashboard'
,p_list_text_01=>'View dashboard of key metrics'
,p_required_patch=>wwv_flow_imp.id(11807336118869114840)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253807239774472614)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Interactive Report'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:1,RIR:::'
,p_list_item_icon=>'fa-table'
,p_list_text_01=>'Interactive reporting includes the ability to download, filter, format, and sort report data as well as saving modified reports as "Saved Reports".'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2727525047159716494)
,p_list_item_display_sequence=>25
,p_list_item_link_text=>'Headlines Report'
,p_list_item_link_target=>'f?p=&APP_ID.:19:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-newspaper-o'
,p_list_text_01=>'Interactive report of project headlines'
,p_required_patch=>wwv_flow_imp.id(2661826592516005471)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2755211302600153096)
,p_list_item_display_sequence=>27
,p_list_item_link_text=>'Heatmap'
,p_list_item_link_target=>'f?p=&APP_ID.:84:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-layout-grid-3x'
,p_list_text_01=>'Interactive report of project headlines'
,p_required_patch=>wwv_flow_imp.id(2756021856878002704)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(36782383988667151687)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'History Report'
,p_list_item_link_target=>'f?p=&APP_ID.:126:&SESSION.::&DEBUG.:126,RIR:::'
,p_list_item_icon=>'fa-table'
,p_list_text_01=>'Interactive report of all changes made in all projects over the last 90 days.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19999924305084949421)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Issues Report'
,p_list_item_link_target=>'f?p=&APP_ID.:22:&SESSION.::&DEBUG.:22,RIR:::'
,p_list_item_icon=>'fa-bug'
,p_list_text_01=>'Interactive report of all project issues'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253805911966458636)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Links Report'
,p_list_item_link_target=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:21,RIR:::'
,p_list_item_icon=>'fa-external-link'
,p_list_text_01=>'View all links for all projects'
,p_required_patch=>wwv_flow_imp.id(11756752007201202936)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(23960816909523235824)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'&CAT_TITLE. Stacked Bar Chart'
,p_list_item_link_target=>'f?p=&APP_ID.:61:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-bar-chart'
,p_list_text_01=>'Stacked Bar chart of projects counts with each bar representing a &CAT_TITLE_LC..  Each bar is further delineated by project status.'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(23960817174585238278)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Status Stacked Bar Chart'
,p_list_item_link_target=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-bar-chart'
,p_list_text_01=>'Stacked Bar chart of projects counts with each bar representing a project status.  Each bar is further delineated by project &CAT_TITLE_LC..'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253637122295218102)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Updates Timeline'
,p_list_item_link_target=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'View all project updates in a timeline.'
,p_required_patch=>wwv_flow_imp.id(11756704262311161627)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253786688907335013)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Attachments Timeline'
,p_list_item_link_target=>'f?p=&APP_ID.:132:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'View and search all attachments '
,p_required_patch=>wwv_flow_imp.id(11756682088337229718)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253638536917226519)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Status Reports Timeline'
,p_list_item_link_target=>'f?p=&APP_ID.:117:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'View and search all project status reports'
,p_required_patch=>wwv_flow_imp.id(6086979797456591004)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
