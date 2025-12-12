prompt --application/shared_components/navigation/lists/project_actions
begin
--   Manifest
--     LIST: Project Actions
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
 p_id=>wwv_flow_imp.id(6695792826697922254)
,p_name=>'Project Actions'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366590276
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6695793012802922262)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Perma Link'
,p_list_item_link_target=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:200:P200_ID:&P200_ID.:'
,p_list_item_icon=>'fa-bookmark'
,p_required_patch=>wwv_flow_imp.id(12539864623145401807)
,p_list_item_current_type=>'NEVER'
,p_list_item_current_for_pages=>'f?p=&APP_ID.:200:&APP_SESSION.:::200:P200_ID:&P200_ID.'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6695793319095922266)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Email'
,p_list_item_link_target=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:20:P20_ID:&P200_ID.:'
,p_list_item_icon=>'fa-envelope-o'
,p_list_item_current_type=>'NEVER'
,p_list_item_current_for_pages=>'f?p=&APP_ID.:20:&APP_SESSION.:::20:P20_ID:&P200_ID.'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6695793636973922266)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Merge'
,p_list_item_link_target=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.:RP,54:P54_PRIMARY_PROJECT:&P200_ID.:'
,p_list_item_icon=>'fa-angle-double-right'
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
