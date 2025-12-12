prompt --application/shared_components/navigation/lists/admin_email_list
begin
--   Manifest
--     LIST: admin email list
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
 p_id=>wwv_flow_imp.id(11823637669753957766)
,p_name=>'admin email list'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366590570
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19485807848671782087)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'Email Preferences'
,p_list_item_link_target=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:110:::'
,p_list_item_icon=>'fa-envelope-o'
,p_list_text_01=>'Set the default message header, footer, and body text as well as the verbosity level of the Project Status Emails'' "Risks" section.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11823637871582957769)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Email Past Due Deliverables'
,p_list_item_link_target=>'f?p=&APP_ID.:100:&SESSION.::&DEBUG.:RP,100:::'
,p_list_item_icon=>'fa-envelope-o'
,p_list_text_01=>'Send per-user email reminders of past due action items and milestones.  '
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(11876370140123189618)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11984635071781896688)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Automate Sending Past Due Deliverables Emails'
,p_list_item_link_target=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:RP,163:::'
,p_list_item_icon=>'fa-cogs'
,p_list_text_01=>'Enable/Disable the database job that automatically sends these emails out on a daily basis.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(11876370140123189618)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11888570476024509880)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Email Upcoming Deliverables'
,p_list_item_link_target=>'f?p=&APP_ID.:180:&SESSION.::&DEBUG.:RP,180:::'
,p_list_item_icon=>'fa-envelope-o'
,p_list_text_01=>'Send per-user email reminders of upcoming action items and milestones.  '
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(11888600020324608728)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11984635403026896693)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Automate Sending Upcoming Deliverables Emails'
,p_list_item_link_target=>'f?p=&APP_ID.:167:&SESSION.::&DEBUG.:RP,167:::'
,p_list_item_icon=>'fa-cogs'
,p_list_text_01=>'Enable/Disable the database job that automatically sends these emails out on a daily basis.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(11888600020324608728)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(16059123304327990814)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Email Project Details'
,p_list_item_link_target=>'f?p=&APP_ID.:196:&SESSION.::&DEBUG.:196:::'
,p_list_item_icon=>'fa-envelope-o'
,p_list_text_01=>'Send project details emails out to all project members for one project or for all projects.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(15764621210683200192)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(16059160388831060235)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Automate Sending Project Details Emails'
,p_list_item_link_target=>'f?p=&APP_ID.:197:&SESSION.::&DEBUG.:197:::'
,p_list_item_icon=>'fa-cogs'
,p_list_text_01=>'Enable/Disable the database job that sends project details emails.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(15764621210683200192)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(18523939931249071197)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Email Project Statuses'
,p_list_item_link_target=>'f?p=&APP_ID.:131:&SESSION.::&DEBUG.:131:::'
,p_list_item_icon=>'fa-envelope-o'
,p_list_text_01=>'Send project status emails out to all project members for one project or for all projects.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(18524168470145109483)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(18523940365162071198)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Automate Sending Project Status Emails'
,p_list_item_link_target=>'f?p=&APP_ID.:134:&SESSION.::&DEBUG.:134:::'
,p_list_item_icon=>'fa-gears'
,p_list_text_01=>'Enable/Disable the database job that sends project status emails.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(18524168470145109483)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11824012970007043731)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Email Log'
,p_list_item_link_target=>'f?p=&APP_ID.:56:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-envelope-o'
,p_list_text_01=>'Show emails sent from this system.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(3946129203439859085)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Ingest Log'
,p_list_item_link_target=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:39:::'
,p_list_item_icon=>'fa-table'
,p_list_text_01=>'Review ingest entries from email parser.'
,p_list_text_03=>'&CNT_06.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(6855415494149142740)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
