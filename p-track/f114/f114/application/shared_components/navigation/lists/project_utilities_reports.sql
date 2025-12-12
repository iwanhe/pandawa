prompt --application/shared_components/navigation/lists/project_utilities_reports
begin
--   Manifest
--     LIST: project utilities reports
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
 p_id=>wwv_flow_imp.id(6072733413638866072)
,p_name=>'project utilities reports'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366590137
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253675259667848069)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Tree'
,p_list_item_link_target=>'f?p=&APP_ID.:72:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-align-left'
,p_list_text_01=>'View projects as a tree'
,p_required_patch=>wwv_flow_imp.id(19782202788559795354)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6072734789207866081)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Project Creation Date Calendar'
,p_list_item_link_target=>'f?p=&APP_ID.:98:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-calendar'
,p_list_text_01=>'View a monthly calendar of projects displayed by date created'
,p_list_text_02=>'calendarIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6072735394125866081)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Interactive Report of Projects'
,p_list_item_link_target=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP,1,RIR:::'
,p_list_item_icon=>'fa-table'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_text_01=>'Use the interactive report view to create complex filters, choose arbitrary column combinations and download project data to a spreadsheet.'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6072791191995514043)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Milestone Summary by Project'
,p_list_item_link_target=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-table'
,p_list_item_disp_cond_type=>'NEVER'
,p_list_text_01=>'Interactive report of projects milestone summarized by project'
,p_list_text_02=>'reportIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(20042418267903581649)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'User Involvement Report'
,p_list_item_link_target=>'f?p=&APP_ID.:95:&SESSION.::&DEBUG.:RP,95,RIR:::'
,p_list_item_icon=>'fa-users'
,p_list_text_01=>'Interactive report of all user involvement'
,p_required_patch=>wwv_flow_imp.id(12124281749376450905)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7693423163710504924)
,p_list_item_display_sequence=>110
,p_list_item_link_text=>'Project Followers Report'
,p_list_item_link_target=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:RP,14,RIR:::'
,p_list_item_icon=>'fa-user'
,p_list_text_01=>'Reports of project followers and projects'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5253806261600463263)
,p_list_item_display_sequence=>120
,p_list_item_link_text=>'Search Requests Report'
,p_list_item_link_target=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:RP,13,RIR:::'
,p_list_item_icon=>'fa-eye'
,p_list_text_01=>'View popular search terms'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(12130096913338981038)
,p_list_item_display_sequence=>130
,p_list_item_link_text=>'Project Resources Report'
,p_list_item_link_target=>'f?p=&APP_ID.:158:&SESSION.::&DEBUG.:RP,158,RIR:::'
,p_list_item_icon=>'fa-archive'
,p_list_text_01=>'Report of projects which utilize specific resources'
,p_required_patch=>wwv_flow_imp.id(12021369465070232745)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(23961598065959011752)
,p_list_item_display_sequence=>210
,p_list_item_link_text=>'Project Validations Report'
,p_list_item_link_target=>'f?p=&APP_ID.:114:&SESSION.::&DEBUG.:RP,114,RIR:::'
,p_list_item_icon=>'fa-check'
,p_list_text_01=>'View and search all project validations'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(6064816709620137382)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(23961736832971715122)
,p_list_item_display_sequence=>240
,p_list_item_link_text=>'Tags'
,p_list_item_link_target=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-tag'
,p_list_text_01=>'View tags in a tag cloud'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
