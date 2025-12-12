prompt --application/pages/page_00113
begin
--   Manifest
--     PAGE: 00113
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_page.create_page(
 p_id=>113
,p_name=>'&APPLICATION_TITLE.: Project Updates Dashboard'
,p_step_title=>'&APPLICATION_TITLE.: Project Updates Dashboard'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486396754076853)
,p_step_template=>wwv_flow_imp.id(6672316913709369812)
,p_help_text=>'The People "Dashboard" displays graphs and charts reflecting various user statistics.  Click the "People" tab to see an interactive report of all people using the application.'
,p_page_component_map=>'06'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5253673546025830366)
,p_plug_name=>'Owners Tabs'
,p_component_template_options=>'#DEFAULT#:t-Tabs--simple'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>1
,p_list_id=>wwv_flow_imp.id(5253671747534830364)
,p_plug_source_type=>'NATIVE_LIST'
,p_list_template_id=>wwv_flow_imp.id(7039984001139713129)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6799591489009756806)
,p_plug_name=>'Open Milestone Owners'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h480:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>40
,p_plug_new_grid_row=>false
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with ow as (',
'    select m.id milestone_id, lower(m.milestone_owner) as ms_owner, eba_proj_fw.get_name_from_email_address(m.milestone_owner) owner',
'    from eba_proj_status_ms m',
'    where m.owner_role_id is null',
'        and m.milestone_owner is not null',
'        and m.milestone_status = ''Open''',
'    union all',
'    select m.id milestone_id, lower(u.username) as ms_owner, eba_proj_fw.get_name_from_email_address(u.username) owner',
'    from eba_proj_status_ms m,',
'        eba_proj_user_ref rf,',
'        eba_proj_status_users u',
'    where rf.role_id = m.owner_role_id',
'        and rf.project_id = m.project_id',
'        and u.id = rf.user_id',
'        and m.owner_role_id is not null',
'        and m.milestone_status = ''Open''',
')',
'select ow.ms_owner ms_owner, ow.owner project_owner, count(*) value',
'from ow',
'group by ow.ms_owner, ow.owner',
'order by 3 desc'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_02', 'PROJECT_OWNER',
  'attribute_03', 'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:17:P17_MILESTONE_OWNER:&MS_OWNER.',
  'attribute_04', 'VALUE',
  'attribute_11', 'VALUE',
  'attribute_14', '50',
  'attribute_15', 'TEXT',
  'attribute_16', 'ABSOLUTE',
  'attribute_17', 'MODERN',
  'attribute_18', 'AROUND',
  'attribute_20', 'No data found.')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6799591721448756807)
,p_plug_name=>'Project People'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h480:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>30
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select u.id as user_id, eba_proj_fw.get_name_from_email_address(u.username) project_owner, count(*) value',
'from eba_proj_user_ref rf,',
'    eba_proj_status_users u,',
'    eba_proj_roles r,',
'    eba_proj_status p',
'where rf.user_id = u.id',
'    and rf.role_id = r.id',
'    and rf.project_id = p.id',
'    and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y''',
'group by u.id, eba_proj_fw.get_name_from_email_address(u.username) ',
'order by 3 desc',
''))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_02', 'PROJECT_OWNER',
  'attribute_03', 'f?p=&APP_ID.:64:&SESSION.::&DEBUG.::P64_OWNER:&USER_ID.',
  'attribute_04', 'VALUE',
  'attribute_11', 'VALUE',
  'attribute_14', '50',
  'attribute_15', 'TEXT',
  'attribute_16', 'ABSOLUTE',
  'attribute_17', 'MODERN',
  'attribute_18', 'AROUND',
  'attribute_20', 'No data found.')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6799592343390756813)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--showBreadcrumb:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6799646342926818728)
,p_plug_name=>'Open Action Items'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with ow as (',
'    select a.id action_item_id,',
'        lower(ai_owner) ai_owner,',
'        eba_proj_fw.get_name_from_email_address(ai_owner) owner',
'    from eba_proj_status_ais unpivot exclude nulls',
'        ( ai_owner for action_owner_no in ( action_owner_01 as 1,',
'                                            action_owner_02 as 2,',
'                                            action_owner_03 as 3,',
'                                            action_owner_04 as 4',
'                                        )',
'        ) a',
'    where a.owner_role_id is null',
'    union all',
'    select a.id action_item_id,',
'        lower(u.username) ai_owner,',
'        eba_proj_fw.get_name_from_email_address(u.username) owner',
'    from eba_proj_status_ais a,',
'        eba_proj_user_ref rf,',
'        eba_proj_status_users u',
'    where a.owner_role_id is not null',
'        and rf.role_id = a.owner_role_id',
'        and rf.project_id = a.project_id',
'        and rf.user_id = u.id',
')',
'select ow.ai_owner name,',
'    ow.owner,',
'    count(*) value',
'from eba_proj_status_ais a,',
'    ow',
'where a.action_status = ''Open''',
'    and ow.action_item_id = a.id',
'group by ow.owner, ow.ai_owner',
'order by 3 desc, 1'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_02', 'OWNER',
  'attribute_03', 'f?p=&APP_ID.:111:&SESSION.::&DEBUG.:RP,111:P111_STATUS,P111_OWNER:Open,&NAME.',
  'attribute_04', 'VALUE',
  'attribute_11', 'VALUE',
  'attribute_14', '50',
  'attribute_15', 'TEXT',
  'attribute_16', 'ABSOLUTE',
  'attribute_17', 'MODERN',
  'attribute_18', 'AROUND',
  'attribute_20', 'No data found.')).to_clob
);
wwv_flow_imp.component_end;
end;
/
