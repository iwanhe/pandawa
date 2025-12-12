prompt --application/pages/page_00050
begin
--   Manifest
--     PAGE: 00050
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
 p_id=>50
,p_name=>'Action Items Dashboard'
,p_step_title=>'Action Items Dashboard'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486291560075385)
,p_step_template=>wwv_flow_imp.id(6672319528586369818)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This page contains many bar charts, graphs, and reports of action item information. Use the filter controls on the left to change the results displayed in the bar charts, graphs, and reports displayed on the page. Click the links displayed in the cha'
||'rts to drill down to more pertinent details. Click the <strong>Reset</strong> button to reset the filters and charts.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1410327073987910649)
,p_plug_name=>'Action Items by Type'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--hiddenOverflow'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>60
,p_plug_new_grid_row=>false
,p_location=>null
,p_plug_source_type=>'NATIVE_JET_CHART'
,p_plug_query_num_rows=>15
);
wwv_flow_imp_page.create_jet_chart(
 p_id=>wwv_flow_imp.id(1410327141304910650)
,p_region_id=>wwv_flow_imp.id(1410327073987910649)
,p_chart_type=>'bar'
,p_animation_on_display=>'none'
,p_animation_on_data_change=>'none'
,p_orientation=>'vertical'
,p_data_cursor=>'auto'
,p_data_cursor_behavior=>'auto'
,p_hover_behavior=>'none'
,p_stack=>'off'
,p_stack_label=>'off'
,p_spark_chart=>'N'
,p_connect_nulls=>'Y'
,p_value_position=>'auto'
,p_sorting=>'label-asc'
,p_fill_multi_series_gaps=>true
,p_zoom_and_scroll=>'off'
,p_tooltip_rendered=>'Y'
,p_show_series_name=>false
,p_show_group_name=>false
,p_show_value=>true
,p_show_label=>true
,p_show_row=>true
,p_show_start=>true
,p_show_end=>true
,p_show_progress=>true
,p_show_baseline=>true
,p_legend_rendered=>'off'
,p_legend_position=>'auto'
,p_overview_rendered=>'off'
,p_horizontal_grid=>'auto'
,p_vertical_grid=>'auto'
,p_gauge_orientation=>'circular'
,p_gauge_plot_area=>'on'
,p_show_gauge_value=>true
);
wwv_flow_imp_page.create_jet_chart_series(
 p_id=>wwv_flow_imp.id(1410327303585910651)
,p_chart_id=>wwv_flow_imp.id(1410327141304910650)
,p_seq=>10
,p_name=>'Action Items by Type'
,p_data_source_type=>'SQL'
,p_data_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select action_type, count(*) c',
'from (',
'    select nvl((select ai_type from eba_proj_status_ais_types t where t.id = a.type_id),''Not Set'') action_type',
'    from eba_proj_status_ais a,',
'        eba_proj_status p',
'    where a.project_id = p.id',
'        and ( :P50_PROJECT is null',
'            or a.project_id = :P50_PROJECT',
'            or (nvl(:P50_SHOW_CHILD_PROJ,''N'') = ''Y''',
'                and a.project_id in (   select id',
'                                        from eba_proj_status ps',
'                                        where ps.parent_project_id = :P50_PROJECT)))',
'        and ( :P50_AI_OWNER is null',
'            or ( a.owner_role_id is null',
'                and (  lower(a.action_owner_01) = lower(:P50_AI_OWNER)',
'                    or lower(a.action_owner_02) = lower(:P50_AI_OWNER)',
'                    or lower(a.action_owner_03) = lower(:P50_AI_OWNER)',
'                    or lower(a.action_owner_04) = lower(:P50_AI_OWNER) ))',
'            or ( a.owner_role_id is not null',
'                and exists (select null',
'                            from eba_proj_user_ref rf,',
'                                eba_proj_status_users u',
'                            where rf.role_id = a.owner_role_id',
'                                and rf.project_id = a.project_id',
'                                and u.id = rf.user_id',
'                                and lower(u.username) = lower(:P50_AI_OWNER)) )',
'        )',
'        and ( :P50_SEARCH is null',
'            or instr( upper(a.action), upper(:P50_SEARCH) ) > 0',
'            or instr( upper(a.action_description), upper(:P50_SEARCH) ) > 0 )',
'        and ( :P50_CATEGORY is null or p.cat_id = :P50_CATEGORY )',
'        and (:P50_PROJECT_OWNER is null',
'            or exists ( select null',
'                        from eba_proj_user_ref rf,',
'                            eba_proj_status_users u,',
'                            eba_proj_roles r',
'                        where lower(u.username) = lower(:P50_PROJECT_OWNER)',
'                            and rf.user_id = u.id',
'                            and rf.role_id = r.id',
'                            and rf.project_id = p.id',
'                            and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'') )',
') x',
'group by action_type',
'order by 2 desc'))
,p_items_value_column_name=>'C'
,p_items_label_column_name=>'ACTION_TYPE'
,p_assigned_to_y2=>'off'
,p_items_label_rendered=>false
,p_items_label_display_as=>'PERCENT'
,p_threshold_display=>'onIndicator'
,p_link_target=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,49,CIR:IREQ_AI_TYPE:&ACTION_TYPE.'
,p_link_target_type=>'REDIRECT_PAGE'
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(1410327413131910653)
,p_chart_id=>wwv_flow_imp.id(1410327141304910650)
,p_axis=>'y'
,p_is_rendered=>'on'
,p_title=>'Number of Action Items'
,p_format_type=>'decimal'
,p_decimal_places=>0
,p_format_scaling=>'none'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_position=>'auto'
,p_major_tick_rendered=>'on'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_jet_chart_axis(
 p_id=>wwv_flow_imp.id(1410327351141910652)
,p_chart_id=>wwv_flow_imp.id(1410327141304910650)
,p_axis=>'x'
,p_is_rendered=>'on'
,p_title=>'Action Item Types'
,p_format_scaling=>'auto'
,p_scaling=>'linear'
,p_baseline_scaling=>'zero'
,p_major_tick_rendered=>'off'
,p_minor_tick_rendered=>'off'
,p_tick_label_rendered=>'on'
,p_tick_label_rotation=>'auto'
,p_tick_label_position=>'outside'
,p_zoom_order_seconds=>false
,p_zoom_order_minutes=>false
,p_zoom_order_hours=>false
,p_zoom_order_days=>false
,p_zoom_order_weeks=>false
,p_zoom_order_months=>false
,p_zoom_order_quarters=>false
,p_zoom_order_years=>false
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5979239304126744899)
,p_plug_name=>'Action Items by Status'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(a.action_status,''No Status'') action_status,',
'    count(*) c',
'from eba_proj_status_ais a,',
'    eba_proj_status p',
'where a.project_id = p.id',
'    and ( :P50_PROJECT is null',
'        or a.project_id = :P50_PROJECT',
'        or (nvl(:P50_SHOW_CHILD_PROJ,''N'') = ''Y''',
'            and a.project_id in (   select id',
'                                    from eba_proj_status ps',
'                                    where ps.parent_project_id = :P50_PROJECT)))',
'    and ( :P50_AI_OWNER is null',
'        or ( a.owner_role_id is null',
'            and (  lower(a.action_owner_01) = lower(:P50_AI_OWNER)',
'                or lower(a.action_owner_02) = lower(:P50_AI_OWNER)',
'                or lower(a.action_owner_03) = lower(:P50_AI_OWNER)',
'                or lower(a.action_owner_04) = lower(:P50_AI_OWNER) ))',
'        or ( a.owner_role_id is not null',
'            and exists (select null',
'                        from eba_proj_user_ref rf,',
'                            eba_proj_status_users u',
'                        where rf.role_id = a.owner_role_id',
'                            and rf.project_id = a.project_id',
'                            and u.id = rf.user_id',
'                            and lower(u.username) = lower(:P50_AI_OWNER)) )',
'    )',
'    and ( :P50_SEARCH is null',
'        or instr( upper(a.action), upper(:P50_SEARCH) ) > 0',
'        or instr( upper(a.action_description), upper(:P50_SEARCH) ) > 0 )',
'    and ( :P50_CATEGORY is null or p.cat_id = :P50_CATEGORY )',
'    and (:P50_PROJECT_OWNER is null or',
'        exists (select null',
'                from eba_proj_user_ref rf,',
'                    eba_proj_status_users u,',
'                    eba_proj_roles r',
'                where lower(u.username) = lower(:P50_PROJECT_OWNER)',
'                    and rf.user_id = u.id',
'                    and rf.role_id = r.id',
'                    and rf.project_id = p.id',
'                    and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'') )',
'group by nvl(a.action_status,''No Status'')',
'order by 2 desc'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.BADGE_LIST'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'ACTION_STATUS',
  'attribute_02', 'C',
  'attribute_04', 'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,49,CIR:IR_ACTION_STATUS:&ACTION_STATUS.',
  'attribute_05', '3',
  'attribute_07', 'BOX',
  'attribute_08', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6690532274194856675)
,p_plug_name=>'Open Action Items'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with ow as (',
'    select a.id action_item_id,',
'        lower(ai_owner) ai_owner',
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
'        lower(u.username) ai_owner',
'    from eba_proj_status_ais a,',
'        eba_proj_user_ref rf,',
'        eba_proj_status_users u',
'    where a.owner_role_id is not null',
'        and rf.role_id = a.owner_role_id',
'        and rf.project_id = a.project_id',
'        and rf.user_id = u.id',
')',
'select ow.ai_owner name,',
'    eba_proj_fw.get_name_from_email_address(ow.ai_owner) as display_name,',
'    count(*) value,',
'    upper(decode(instr(replace(ai_owner,''.'','' ''),'' ''),',
'         0, ',
'         substr(ai_owner,1,2),',
'         substr(ai_owner,1,1)||substr(ai_owner,instr(replace(ai_owner,''.'','' ''),'' '')+1,1)',
'    )) initials',
'from eba_proj_status_ais a,',
'    ow',
'where a.action_status = ''Open''',
'    and a.id = ow.action_item_id',
'    and ( :P50_PROJECT is null',
'        or a.project_id = :P50_PROJECT',
'        or (nvl(:P50_SHOW_CHILD_PROJ,''N'') = ''Y''',
'            and a.project_id in (   select id',
'                                    from eba_proj_status ps',
'                                    where ps.parent_project_id = :P50_PROJECT)))',
'    and ( :P50_AI_OWNER is null',
'        or lower(:P50_AI_OWNER) = ow.ai_owner )',
'    and ( :P50_SEARCH is null',
'        or instr( upper(a.action), upper(:P50_SEARCH) ) > 0',
'        or instr( upper(a.action_description), upper(:P50_SEARCH) ) > 0 )',
'    and ( :P50_CATEGORY is null',
'        or a.project_id in (select s.id',
'                            from eba_proj_status s',
'                            where s.cat_id = :P50_CATEGORY) )',
'    and (:P50_PROJECT_OWNER is null or',
'        exists (select null',
'                from eba_proj_user_ref rf,',
'                    eba_proj_status_users u,',
'                    eba_proj_roles r',
'                where lower(u.username) = lower(:P50_PROJECT_OWNER)',
'                    and rf.user_id = u.id',
'                    and rf.role_id = r.id',
'                    and rf.project_id = a.project_id',
'                    and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'') )',
'group by ow.ai_owner',
'order by 3 desc, 1'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'INITIALS',
  'attribute_02', 'DISPLAY_NAME',
  'attribute_03', 'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,49,CIR:IR_ACTION_STATUS,IRC_OWNER:Open,&NAME.',
  'attribute_04', 'VALUE',
  'attribute_05', 'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,49,CIR:IR_ACTION_STATUS,IRC_OWNER:Open,&NAME.',
  'attribute_09', 'INITIALS',
  'attribute_11', 'VALUE',
  'attribute_14', '50',
  'attribute_15', 'ICON',
  'attribute_16', 'ABSOLUTE',
  'attribute_17', 'MODERN',
  'attribute_20', 'No data found')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8043785016777624554)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8925932137579346370)
,p_plug_name=>'Overdue Action Items by Owner'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>70
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with ow as (',
'    select a.id action_item_id,',
'        lower(ai_owner) ai_owner',
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
'        lower(u.username) ai_owner',
'    from eba_proj_status_ais a,',
'        eba_proj_user_ref rf,',
'        eba_proj_status_users u',
'    where a.owner_role_id is not null',
'        and rf.role_id = a.owner_role_id',
'        and rf.project_id = a.project_id',
'        and rf.user_id = u.id',
')',
'select ow.ai_owner name,',
'       eba_proj_fw.get_name_from_email_address(ow.ai_owner) as display_name,',
'       count(*) value,',
'       ''#EA0000'' as color,',
'       to_char(localtimestamp,:APP_DATE_FORMAT) as curr_date',
'from eba_proj_status_ais a,',
'    ow',
'where a.action_status = ''Open''',
'    and a.due_date < current_date',
'    and a.id = ow.action_item_id',
'    and ( :P50_PROJECT is null',
'        or a.project_id = :P50_PROJECT',
'        or (nvl(:P50_SHOW_CHILD_PROJ,''N'') = ''Y''',
'            and a.project_id in (   select id',
'                                    from eba_proj_status ps',
'                                    where ps.parent_project_id = :P50_PROJECT)))',
'    and ( :P50_AI_OWNER is null',
'        or lower(:P50_AI_OWNER) = ow.ai_owner )',
'    and ( :P50_SEARCH is null',
'        or instr( upper(a.action), upper(:P50_SEARCH) ) > 0',
'        or instr( upper(a.action_description), upper(:P50_SEARCH) ) > 0 )',
'    and ( :P50_CATEGORY is null',
'        or a.project_id in (select s.id',
'                            from eba_proj_status s',
'                            where s.cat_id = :P50_CATEGORY) )',
'    and (:P50_PROJECT_OWNER is null or',
'        exists (select null',
'                from eba_proj_user_ref rf,',
'                    eba_proj_status_users u,',
'                    eba_proj_roles r',
'                where lower(u.username) = lower(:P50_PROJECT_OWNER)',
'                    and rf.user_id = u.id',
'                    and rf.role_id = r.id',
'                    and rf.project_id = a.project_id',
'                    and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'') )',
'group by ai_owner',
'order by 3 desc, 1'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_02', 'DISPLAY_NAME',
  'attribute_03', 'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,49,CIR:IR_PAST_DUE,IRC_OWNER,IRLT_DUE_DATE:Yes,&NAME.,&CURR_DATE.',
  'attribute_04', 'VALUE',
  'attribute_05', 'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,49,CIR:IR_PAST_DUE,IRC_OWNER,IRLT_DUE_DATE:Yes,&NAME.,&CURR_DATE.',
  'attribute_11', 'VALUE',
  'attribute_14', '50',
  'attribute_15', 'TEXT',
  'attribute_16', 'ABSOLUTE',
  'attribute_17', 'MODERN',
  'attribute_18', 'AROUND',
  'attribute_20', 'No data found')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8925932746021358239)
,p_plug_name=>'Completed Action Items by Owner (last month)'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>30
,p_plug_new_grid_row=>false
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with ow as (',
'    select a.id action_item_id,',
'        lower(ai_owner) ai_owner',
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
'        lower(u.username) ai_owner',
'    from eba_proj_status_ais a,',
'        eba_proj_user_ref rf,',
'        eba_proj_status_users u',
'    where a.owner_role_id is not null',
'        and rf.role_id = a.owner_role_id',
'        and rf.project_id = a.project_id',
'        and rf.user_id = u.id',
')',
'select ow.ai_owner name,',
'    eba_proj_fw.get_name_from_email_address(ow.ai_owner) as display_name,',
'    count(*) value,',
'    upper(decode(instr(replace(ai_owner,''.'','' ''),'' ''),',
'         0, ',
'         substr(ai_owner,1,2),',
'         substr(ai_owner,1,1)||substr(ai_owner,instr(replace(ai_owner,''.'','' ''),'' '')+1,1)',
'    )) initials',
'from eba_proj_status_ais a,',
'    ow',
'where a.action_status = ''Closed''',
'    and a.updated > add_months(localtimestamp,-1)',
'    and a.id = ow.action_item_id',
'    and ( :P50_PROJECT is null',
'        or a.project_id = :P50_PROJECT',
'        or (nvl(:P50_SHOW_CHILD_PROJ,''N'') = ''Y''',
'            and a.project_id in (   select id',
'                                    from eba_proj_status ps',
'                                    where ps.parent_project_id = :P50_PROJECT)))',
'    and ( :P50_AI_OWNER is null',
'        or lower(:P50_AI_OWNER) = ow.ai_owner )',
'    and ( :P50_SEARCH is null',
'        or instr( upper(a.action), upper(:P50_SEARCH) ) > 0',
'        or instr( upper(a.action_description), upper(:P50_SEARCH) ) > 0 )',
'    and ( :P50_CATEGORY is null',
'        or a.project_id in (select s.id',
'                            from eba_proj_status s',
'                            where s.cat_id = :P50_CATEGORY) )',
'    and (:P50_PROJECT_OWNER is null or',
'        exists (select null',
'                from eba_proj_user_ref rf,',
'                    eba_proj_status_users u,',
'                    eba_proj_roles r',
'                where lower(u.username) = lower(:P50_PROJECT_OWNER)',
'                    and rf.user_id = u.id',
'                    and rf.role_id = r.id',
'                    and rf.project_id = a.project_id',
'                    and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'') )',
'group by ow.ai_owner',
'order by 3 desc, 1'))
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.HTML5_BAR_CHART'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'INITIALS',
  'attribute_02', 'DISPLAY_NAME',
  'attribute_03', 'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,49,CIR:IR_ACTION_STATUS,IRC_OWNER,IRGT_UPDATED_HIDDEN:Closed,&NAME.,&P50_A_MONTH_AGO.',
  'attribute_04', 'VALUE',
  'attribute_05', 'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,49,CIR:IR_ACTION_STATUS,IRC_OWNER,IRGT_UPDATED_HIDDEN:Closed,&NAME.,&P50_A_MONTH_AGO.',
  'attribute_09', 'INITIALS',
  'attribute_11', 'VALUE',
  'attribute_14', '50',
  'attribute_15', 'ICON',
  'attribute_16', 'ABSOLUTE',
  'attribute_17', 'MODERN',
  'attribute_20', 'No data found')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8925936229838410269)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow:t-Form--stretchInputs:t-Region--hideHeader'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(8925937037457412507)
,p_name=>'Open Action Items by Project'
,p_region_name=>'AIBP'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>40
,p_region_css_classes=>'scrollable-region'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:i-h320:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-AVPList--rightAligned'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.project, count(*) c, p.id',
'from eba_proj_status_ais a,',
'    eba_proj_status p',
'where action_status = ''Open'' and a.project_id = p.id',
'    and ( :P50_PROJECT is null',
'        or a.project_id = :P50_PROJECT',
'        or (nvl(:P50_SHOW_CHILD_PROJ,''N'') = ''Y''',
'            and a.project_id in (   select id',
'                                    from eba_proj_status ps',
'                                    where ps.parent_project_id = :P50_PROJECT)))',
'    and ( :P50_AI_OWNER is null',
'        or ( a.owner_role_id is null',
'            and (  lower(a.action_owner_01) = lower(:P50_AI_OWNER)',
'                or lower(a.action_owner_02) = lower(:P50_AI_OWNER)',
'                or lower(a.action_owner_03) = lower(:P50_AI_OWNER)',
'                or lower(a.action_owner_04) = lower(:P50_AI_OWNER) ))',
'        or ( a.owner_role_id is not null',
'            and exists (select null',
'                        from eba_proj_user_ref rf,',
'                            eba_proj_status_users u',
'                        where rf.role_id = a.owner_role_id',
'                            and rf.project_id = a.project_id',
'                            and u.id = rf.user_id',
'                            and lower(u.username) = lower(:P50_AI_OWNER)) )',
'    )',
'    and ( :P50_SEARCH is null',
'        or instr( upper(a.action), upper(:P50_SEARCH) ) > 0',
'        or instr( upper(a.action_description), upper(:P50_SEARCH) ) > 0 )',
'    and ( :P50_CATEGORY is null or p.cat_id = :P50_CATEGORY )',
'    and (:P50_PROJECT_OWNER is null or',
'        exists (select null',
'                from eba_proj_user_ref rf,',
'                    eba_proj_status_users u,',
'                    eba_proj_roles r',
'                where lower(u.username) = lower(:P50_PROJECT_OWNER)',
'                    and rf.user_id = u.id',
'                    and rf.role_id = r.id',
'                    and rf.project_id = p.id',
'                    and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'') )',
'group by p.project, p.id',
'order by 2 desc'))
,p_ajax_enabled=>'Y'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672366242452369910)
,p_query_headings_type=>'NO_HEADINGS'
,p_query_num_rows=>6
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No data found'
,p_query_row_count_max=>50
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8925937246898412507)
,p_query_column_id=>1
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>1
,p_column_link=>'f?p=&APP_ID.:46:&SESSION.::&DEBUG.:RIR,46:IREQ_PROJECT_ID,IREQ_OPEN:#ID#,Open'
,p_column_linktext=>'#PROJECT#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8925937325360412507)
,p_query_column_id=>2
,p_column_alias=>'C'
,p_column_display_sequence=>2
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(8925937442662412507)
,p_query_column_id=>3
,p_column_alias=>'ID'
,p_column_display_sequence=>3
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7864204603716697465)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'CREATE_ACTION_ITEM'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Action Item'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:73::'
,p_button_condition_type=>'NEVER'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8925936418874410270)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(8925936229838410269)
,p_button_name=>'P50_RESET'
,p_button_static_id=>'P50_RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_image_alt=>'Reset'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:50::'
,p_icon_css_classes=>'fa-undo-alt'
,p_request_source_type=>'ALWAYS_NULL'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(8925937519926416932)
,p_branch_action=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:RP,50::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(8925936418874410270)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 22-DEC-2010 08:26 by MIKE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6744826498491711621)
,p_name=>'P50_SHOW_CHILD_PROJ'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8925936229838410269)
,p_item_default=>'N'
,p_prompt=>'Show Child Projects'
,p_source=>'N'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES NO RETURNS Y N'
,p_lov=>'.'||wwv_flow_imp.id(8910494933283350717)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(19782202788559795354)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6800209494830202906)
,p_name=>'P50_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(8925936229838410269)
,p_prompt=>'Search'
,p_placeholder=>'Search Action Items'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6800280414916208681)
,p_name=>'P50_PROJECT_OWNER'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8925936229838410269)
,p_prompt=>'Project Owner'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'DISTINCT PROJECT OWNERS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select eba_proj_fw.get_name_from_email_address(u.username) d, lower(u.username) r',
'from eba_proj_status_users u',
'where exists ( select null',
'               from eba_proj_user_ref rf,',
'                   eba_proj_roles r,',
'                   eba_proj_status p,',
'                   eba_proj_status_codes sc',
'               where rf.user_id = u.id',
'                   and p.id = rf.project_id',
'                   and rf.role_id = r.id',
'                   and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y''',
'                   and p.project_status = sc.id',
'                   and sc.is_closed_status != ''Y'' )',
'order by lower(u.username)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Owners -'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6800307489074210676)
,p_name=>'P50_AI_OWNER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8925936229838410269)
,p_prompt=>'Action Item Owner'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ACTION ITEM OWNERS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct v1.owner d, lower(v1.username) r',
'from (',
'    select eba_proj_fw.get_name_from_email_address(action_owner_01) owner, action_owner_01 username from eba_proj_status_ais',
'    union all',
'    select eba_proj_fw.get_name_from_email_address(action_owner_02) owner, action_owner_02 username from eba_proj_status_ais',
'    union all',
'    select eba_proj_fw.get_name_from_email_address(action_owner_03) owner, action_owner_03 username from eba_proj_status_ais',
'    union all',
'    select eba_proj_fw.get_name_from_email_address(action_owner_04) owner, action_owner_04 username from eba_proj_status_ais',
'    union all',
'    select eba_proj_fw.get_name_from_email_address(u.username) owner, u.username username',
'    from eba_proj_status_users u',
'    where exists (  select null',
'                      from eba_proj_status_ais a,',
'                           eba_proj_user_ref rf',
'                     where rf.role_id = a.owner_role_id',
'                       and rf.project_id = a.project_id',
'                       and rf.user_id = u.id',
'                 )',
'    ) v1',
'where v1.owner is not null',
'order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Owners -'
,p_cSize=>30
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6800322794961212408)
,p_name=>'P50_CATEGORY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8925936229838410269)
,p_prompt=>'&CAT_TITLE.'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CATEGORIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CATEGORY display_value, ID return_value ',
'from EBA_PROJ_STATUS_CATS',
'where is_active_yn = ''Y''',
'order by display_sequence nulls last, 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All &CAT_TITLE_PL. -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8925936648763410270)
,p_name=>'P50_PROJECT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8925936229838410269)
,p_prompt=>'Project'
,p_display_as=>'NATIVE_POPUP_LOV'
,p_named_lov=>'PROJECTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select project d, id r',
'from eba_proj_status',
'order by upper(project)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Projects -'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'case_sensitive', 'N',
  'display_as', 'DIALOG',
  'initial_fetch', 'FIRST_ROWSET',
  'manual_entry', 'N',
  'match_type', 'CONTAINS',
  'min_chars', '0')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18808040115045757043)
,p_name=>'P50_A_MONTH_AGO'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8925936229838410269)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(18808040133760757044)
,p_computation_sequence=>10
,p_computation_item=>'P50_A_MONTH_AGO'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'to_char(add_months(localtimestamp,-1),''DD-MON-YYYY'')'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(8925938333910430372)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'50'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6744841705418713663)
,p_name=>'show child selector'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P50_PROJECT'
,p_condition_element=>'P50_PROJECT'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6744842004281713664)
,p_event_id=>wwv_flow_imp.id(6744841705418713663)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P50_SHOW_CHILD_PROJ'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6744842199419713664)
,p_event_id=>wwv_flow_imp.id(6744841705418713663)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P50_SHOW_CHILD_PROJ'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(13305559465747764856)
,p_name=>'Refresh Regions on Dialog Close'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7864204603716697465)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13305559584690764857)
,p_event_id=>wwv_flow_imp.id(13305559465747764856)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8925937037457412507)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13305559650199764858)
,p_event_id=>wwv_flow_imp.id(13305559465747764856)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8925932746021358239)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13305559794386764859)
,p_event_id=>wwv_flow_imp.id(13305559465747764856)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6690532274194856675)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13305559821285764860)
,p_event_id=>wwv_flow_imp.id(13305559465747764856)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8925932137579346370)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(13305560015203764861)
,p_event_id=>wwv_flow_imp.id(13305559465747764856)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5979239304126744899)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15331872934043223546)
,p_name=>'refresh results on filter value change'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P50_PROJECT,P50_SHOW_CHILD_PROJ,P50_PROJECT_OWNER,P50_AI_OWNER,P50_CATEGORY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331873104913223547)
,p_event_id=>wwv_flow_imp.id(15331872934043223546)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P50_PROJECT,P50_SHOW_CHILD_PROJ,P50_PROJECT_OWNER,P50_AI_OWNER,P50_CATEGORY'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331873197383223548)
,p_event_id=>wwv_flow_imp.id(15331872934043223546)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8925932746021358239)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331873284149223549)
,p_event_id=>wwv_flow_imp.id(15331872934043223546)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6690532274194856675)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331873368528223550)
,p_event_id=>wwv_flow_imp.id(15331872934043223546)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8925937037457412507)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331873484820223551)
,p_event_id=>wwv_flow_imp.id(15331872934043223546)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8925932137579346370)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331873557307223552)
,p_event_id=>wwv_flow_imp.id(15331872934043223546)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5979239304126744899)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15339332700813960339)
,p_name=>'Search Action Items on Enter'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P50_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.keyCode == 13'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'change, keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15339333609964960341)
,p_event_id=>wwv_flow_imp.id(15339332700813960339)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P50_SEARCH,P50_PROJECT,P50_SHOW_CHILD_PROJ,P50_PROJECT_OWNER,P50_AI_OWNER,P50_CATEGORY'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15339333106068960340)
,p_event_id=>wwv_flow_imp.id(15339332700813960339)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'this.browserEvent.preventDefault();'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15339334029227960343)
,p_event_id=>wwv_flow_imp.id(15339332700813960339)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8925932746021358239)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331873807945223554)
,p_event_id=>wwv_flow_imp.id(15339332700813960339)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6690532274194856675)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331873915296223555)
,p_event_id=>wwv_flow_imp.id(15339332700813960339)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8925937037457412507)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331873983086223556)
,p_event_id=>wwv_flow_imp.id(15339332700813960339)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(8925932137579346370)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15331874084917223557)
,p_event_id=>wwv_flow_imp.id(15339332700813960339)
,p_event_result=>'TRUE'
,p_action_sequence=>70
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5979239304126744899)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
