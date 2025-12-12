prompt --application/pages/page_00095
begin
--   Manifest
--     PAGE: 00095
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
 p_id=>95
,p_name=>'User Involvement Report'
,p_step_title=>'User Involvement Report'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.involvement-user-role {display: block;}',
'.involvement-project-name,',
'.involvement-user-role {font-weight: bold;}',
'.involvement-pct {white-space: nowrap;}'))
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(12124281749376450905)
,p_help_text=>unistr('This interactive report shows the level of involvement users have inside of projects. Click the <strong>Reset</strong> button to reset the interactive report. Click the <strong>Actions \00BF</strong> button to define the number of rows displayed per page')
||', filter, format, download, and/or save the interactive report.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20027707430077144226)
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
 p_id=>wwv_flow_imp.id(20027708061402144229)
,p_plug_name=>'User Involvement Report'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_plug_template=>wwv_flow_imp.id(6672356271346369882)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select p.id,',
'    p.project,',
'    r.name role,',
'    eba_proj_fw.get_name_from_email_address(u.username) as username,',
'    case when eba_proj_fw.is_edit_authorized(p_username => upper(:APP_USER), p_project_id => p.id, p_min_auth => 3 ) = ''Y'' then',
'        ''<a href="''',
'            ||apex_util.prepare_url(''f?p=''||:APP_ID||'':150:''||:APP_SESSION||'':::150:P150_ID:''||rf.id)',
'            ||''"><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil"''',
'            ||''alt="Edit User''''s Involvement Level" title="Edit User''''s Involvement Level"></a>''',
'    else',
'        null',
'    end as edit_link,',
'    case',
'        when 1 = (select acl_status_level from eba_proj_status p where p.id = :P137_ID) then',
'            -- Open; show P-Track access level',
'            (   select access_level',
'                from eba_proj_status_access_levels pal',
'                where pal.id = u.access_level_id )',
'        else',
'            -- Restricted. Show project access level',
'            case nvl(rf.acl_status_level,r.default_acl_status_level)',
'                when 1 then ''Read Only''',
'                when 2 then ''Edit''',
'                when 3 then ''Full Access''',
'            end',
'    end as access_level,',
'    nvl((   select nvl(PERCENTAGE,0) x',
'              from eba_proj_involvement_levels il',
'             where il.id = rf.involvement_level_id',
'    ),0) involvement,',
'    (   select nvl(PERCENTAGE,0) x',
'        from eba_proj_involvement_levels il',
'        where il.id = rf.involvement_level_id',
'    ) involvement_pct,',
'    substr(notes,1,500)||decode(greatest( NVL(length(notes),0), 500),500,'''',''...'') notes,',
'    (select category from EBA_PROJ_STATUS_CATS  cat where cat.id = p.cat_id) category,',
'     p.updated,',
'     p.id project_id,',
'     eba_proj_stat_get_con_comp(p.id) complete_status, ',
'     (  select status_short_desc',
'                            from eba_proj_status_codes c',
'                            where c.id = p.project_status) project_status,',
'     (select decode(IS_CLOSED_STATUS ,''Y'',''No'',''Yes'') x from eba_proj_status_codes c',
'                            where c.id = p.project_status ) is_open,',
'     (select decode(IS_CLOSED_STATUS ,''Y'',''Closed'',''Open'') x from eba_proj_status_codes c',
'                            where c.id = p.project_status ) open_label,',
'     (select decode(IS_CLOSED_STATUS ,''Y'',''is-complete'',''is-info'') x from eba_proj_status_codes c',
'                            where c.id = p.project_status ) open_class,',
'    rf.id rf_id',
'from eba_proj_user_ref rf,',
'    eba_proj_roles r,',
'    eba_proj_status_users u,',
'    eba_proj_status p',
'where ',
'    rf.project_id = p.id',
'    and rf.user_id = u.id',
'    and rf.role_id = r.id'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(20027708205760144229)
,p_name=>'User Involvement Report'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'ALLAN'
,p_internal_uid=>18907989290339162016
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20027708537899144242)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20027709412576144247)
,p_db_column_name=>'PROJECT'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Project'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP:P200_ID:#ID#'
,p_column_linktext=>'#PROJECT#'
,p_column_link_attr=>'class="involvement-project-name"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20027709810874144248)
,p_db_column_name=>'ROLE'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Role'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<span class="involvement-user-role">#ROLE#</span>',
'<span class="involvement-user-notes">#NOTES#</span>'))
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20027710152672144249)
,p_db_column_name=>'EDIT_LINK'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Edit'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20027710581603144249)
,p_db_column_name=>'ACCESS_LEVEL'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Access Level'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20027711320135144251)
,p_db_column_name=>'INVOLVEMENT_PCT'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Involvement (%)'
,p_column_html_expression=>'<span class="involvement-pct">#INVOLVEMENT#</span>'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20027711732702144252)
,p_db_column_name=>'NOTES'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Notes'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20027712130076144253)
,p_db_column_name=>'CATEGORY'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'&CAT_TITLE.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20027712604798144253)
,p_db_column_name=>'UPDATED'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20027712972488144254)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Project Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20027713370606144255)
,p_db_column_name=>'COMPLETE_STATUS'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Project Completeness'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20027713782535144256)
,p_db_column_name=>'PROJECT_STATUS'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Project Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20027714192514144257)
,p_db_column_name=>'IS_OPEN'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'Project Open'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20027714582885144257)
,p_db_column_name=>'OPEN_LABEL'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'Open Label'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20027714986366144258)
,p_db_column_name=>'OPEN_CLASS'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Open Class'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20027715359900144259)
,p_db_column_name=>'RF_ID'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Rf Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19865366610986670950)
,p_db_column_name=>'USERNAME'
,p_display_order=>28
,p_column_identifier=>'S'
,p_column_label=>'User'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(19865366744130670952)
,p_db_column_name=>'INVOLVEMENT'
,p_display_order=>38
,p_column_identifier=>'T'
,p_column_label=>'Involvement'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(20027702788445948106)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'189079839'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'EDIT_LINK:PROJECT:USERNAME:INVOLVEMENT_PCT:'
,p_sort_column_1=>'INVOLVEMENT_PCT'
,p_sort_direction_1=>'DESC'
,p_sum_columns_on_break=>'INVOLVEMENT_PCT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(19865366713309670951)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(20027708061402144229)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1971562212022502678)
,p_name=>'Refresh on edit'
,p_event_sequence=>10
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(20027708061402144229)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1971562345533502679)
,p_event_id=>wwv_flow_imp.id(1971562212022502678)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(20027708061402144229)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
