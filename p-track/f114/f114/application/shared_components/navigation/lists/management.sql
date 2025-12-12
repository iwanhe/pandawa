prompt --application/shared_components/navigation/lists/management
begin
--   Manifest
--     LIST: Management
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
 p_id=>wwv_flow_imp.id(5292894991392717325)
,p_name=>'Management'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366589692
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(636793732880109613)
,p_list_item_display_sequence=>5
,p_list_item_link_text=>'Additional Required Items'
,p_list_item_link_target=>'f?p=&APP_ID.:119:&SESSION.::&DEBUG.:RP,119:::'
,p_list_item_icon=>'fa-asterisk'
,p_list_text_01=>'Set optional form elements throughout the app to be required.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(5292895266889717327)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Attachments Dashboard'
,p_list_item_link_target=>'f?p=&APP_ID.:79:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-paperclip'
,p_list_text_01=>'View aggregate size of attachments with ability to purge old attachments.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(11809794217529851575)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Project Status'
,p_list_item_link_target=>'f?p=&APP_ID.:155:&SESSION.::&DEBUG.:RP,RIR,155:::'
,p_list_item_icon=>'fa-lock'
,p_list_text_01=>'Report of all projects and their deleted and access control statuses.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(16935063808029246650)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Manage Feedback'
,p_list_item_link_target=>'f?p=&APP_ID.:203:&SESSION.::&DEBUG.:203:::'
,p_list_item_icon=>'fa-comment-o'
,p_list_text_01=>'Report of all feedback left by application users. Feedback types include general comments, enhancement requests, and bugs.'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(16894992821762030465)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(19180462651365965706)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Reassign Action Items'
,p_list_item_link_target=>'f?p=&APP_ID.:108:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-user'
,p_list_text_01=>'Transfer Action Items from one user to another'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
