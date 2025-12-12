prompt --application/shared_components/navigation/lists/project_content
begin
--   Manifest
--     LIST: Project Content
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
 p_id=>wwv_flow_imp.id(6064035707985433696)
,p_name=>'Project Content'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366590098
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(25447626203504386985)
,p_list_item_display_sequence=>1
,p_list_item_link_text=>'Email'
,p_list_item_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:20:P20_ID:&P200_ID.:'
,p_list_item_icon=>'fa-envelope-o'
,p_list_item_current_type=>'NEVER'
,p_list_item_current_for_pages=>'f?p=&APP_ID.:20:&APP_SESSION.:::20:P20_ID:&P200_ID.'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(12044570300678913530)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Add Person'
,p_list_item_link_target=>'f?p=&APP_ID.:150:&SESSION.::&DEBUG.:150:P150_PROJECT_ID:&P200_ID.:'
,p_list_item_icon=>'fa-user'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID,',
'    p_min_auth   => 3 ) = ''Y'''))
,p_list_item_disp_condition2=>'PLSQL'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(18880549722925791075)
,p_list_item_display_sequence=>15
,p_list_item_link_text=>'Add Country'
,p_list_item_link_target=>'f?p=&APP_ID.:210:&SESSION.::&DEBUG.:210:P210_PROJECT_ID:&P200_ID.:'
,p_list_item_icon=>'fa-globe'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID,',
'    p_min_auth   => 2 ) = ''Y'''))
,p_list_item_disp_condition2=>'PLSQL'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_required_patch=>wwv_flow_imp.id(18882216890018093962)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7564502712351459105)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Add Issue'
,p_list_item_link_target=>'f?p=&APP_ID.:24:&SESSION.::&DEBUG.:RP,24:P24_PROJECT_ID:&P200_ID.:'
,p_list_item_icon=>'fa-flag-o'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_required_patch=>wwv_flow_imp.id(7563953019503314303)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(12021536958545295057)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Add Resource'
,p_list_item_link_target=>'f?p=&APP_ID.:170:&SESSION.::&DEBUG.:170:P170_PROJECT_ID:&P200_ID.:'
,p_list_item_icon=>'fa-archive'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_required_patch=>wwv_flow_imp.id(12021369465070232745)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6064036492030433706)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Add Milestone'
,p_list_item_link_target=>'f?p=&APP_ID.:48:&SESSION.::&DEBUG.:RP,48:P48_PROJECT_ID,LAST_VIEW:&P200_ID.,200:'
,p_list_item_icon=>'fa-calendar'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID ) = ''N'''))
,p_list_item_disp_condition2=>'PLSQL'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_required_patch=>wwv_flow_imp.id(11756681878669227855)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6064036813185433706)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Add Action Item'
,p_list_item_link_target=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:RP,73:P73_PROJECT_ID,LAST_VIEW:&P200_ID.,200:'
,p_list_item_icon=>'fa-check-circle-o'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID ) = ''N'''))
,p_list_item_disp_condition2=>'PLSQL'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_required_patch=>wwv_flow_imp.id(11756699376794143132)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6064036194960433706)
,p_list_item_display_sequence=>60
,p_list_item_link_text=>'Add Link'
,p_list_item_link_target=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:RP,3:P3_PROJECT_ID:&P200_ID.:'
,p_list_item_icon=>'fa-external-link'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_required_patch=>wwv_flow_imp.id(11756752007201202936)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6064044199444536058)
,p_list_item_display_sequence=>70
,p_list_item_link_text=>'Attach File'
,p_list_item_link_target=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:43:P43_PROJECT_ID:&P200_ID.:'
,p_list_item_icon=>'fa-paperclip'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_required_patch=>wwv_flow_imp.id(11756682088337229718)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6064035905902433700)
,p_list_item_display_sequence=>80
,p_list_item_link_text=>'Add Update'
,p_list_item_link_target=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:12:P12_PROJECT_ID:&P200_ID.:'
,p_list_item_icon=>'fa-comment-o'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_required_patch=>wwv_flow_imp.id(11756704262311161627)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6696880771958277956)
,p_list_item_display_sequence=>90
,p_list_item_link_text=>'Add Status Report'
,p_list_item_link_target=>'f?p=&APP_ID.:116:&SESSION.::&DEBUG.:116:P116_PROJECT_ID,LAST_VIEW:&P200_ID.,200,200:'
,p_list_item_icon=>'fa-file-plus'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_required_patch=>wwv_flow_imp.id(6086979797456591004)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(25447625897211386981)
,p_list_item_display_sequence=>95
,p_list_item_link_text=>'Perma Link'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:200:P200_ID:&P200_ID.:'
,p_list_item_icon=>'fa-bookmark'
,p_required_patch=>wwv_flow_imp.id(12539864623145401807)
,p_list_item_current_type=>'NEVER'
,p_list_item_current_for_pages=>'f?p=&APP_ID.:200:&APP_SESSION.:::200:P200_ID:&P200_ID.'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(25447626521382386985)
,p_list_item_display_sequence=>100
,p_list_item_link_text=>'Merge'
,p_list_item_link_target=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.:RP,54:P54_PRIMARY_PROJECT:&P200_ID.:'
,p_list_item_icon=>'fa-copy'
,p_list_item_disp_cond_type=>'EXPRESSION'
,p_list_item_disp_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID ) = ''Y'''))
,p_list_item_disp_condition2=>'PLSQL'
,p_required_patch=>wwv_flow_imp.id(12539867860766490810)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
