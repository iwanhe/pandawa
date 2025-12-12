prompt --application/pages/page_00126
begin
--   Manifest
--     PAGE: 00126
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
 p_id=>126
,p_name=>'Projects History Report'
,p_step_title=>'Projects History Report'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486396754076853)
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''th#affectedItem'').attr(''style'',''max-width:300px; width:300px;'');',
'$(''td[headers=affectedItem]'').attr(''style'',''max-width:300px; width:300px; overflow: auto;'');'))
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>unistr('This interactive report shows all changes made in all projects over the last 90 days. Click the <strong>Reset</strong> button to reset the interactive report. Click the <strong>Actions \00BF</strong> button to define the number of rows displayed per page')
||', filter, format, download, and/or save the interactive report.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(18074437382231368001)
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
 p_id=>wwv_flow_imp.id(18074437968824368003)
,p_plug_name=>'Project History'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton'
,p_plug_template=>wwv_flow_imp.id(6672356271346369882)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select /*+ ALL_ROWS LEADING(x project) NO_MERGE(x) USE_CONCAT(x) NO_EXPAND(x) */',
'       x.comment_text,',
'       x.affected_item,',
'       case',
'           when substr(x.attribute_1, 3, 1) = ''-'' and substr(x.attribute_1, 7, 1) = ''-'' and length(x.attribute_1) > 11 then',
'               substr(x.attribute_1, 1, 11)',
'           else',
'               x.attribute_1',
'       end as attribute_1,',
'       case',
'           when substr(x.attribute_2, 3, 1) = ''-'' and substr(x.attribute_2, 7, 1) = ''-'' and length(x.attribute_2) > 11 then',
'               substr(x.attribute_2, 1, 11)',
'           else',
'               x.attribute_2',
'       end as attribute_2,',
'       eba_proj_fw.get_name_from_email_address(x.user_name) as user_name,',
'       x.comment_date,',
'       x.created,',
'       apex_util.prepare_url(''f?p='' || :APP_ID || '':133:'' || :APP_SESSION || '':::133,RIR:IR_USERNAME:'' || x.user_id) as profile_url,',
'       project.id as project_id,',
'       project.project as project_name',
'  from eba_proj_history_90day_v x,',
'       eba_proj_status project',
' where x.project_id = project.id',
'   and project.is_deleted_yn = ''N''',
'   and (',
'            project.acl_status_level = 1',
'            or',
'            (',
'                project.acl_status_level > 1',
'                and',
'                exists ( select null',
'                           from eba_proj_user_ref rf,',
'                                eba_proj_status_users u,',
'                                eba_proj_roles r',
'                          where rf.project_id = project.id',
'                            and rf.user_id = u.id',
'                            and rf.role_id = r.id',
'                            and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y''',
'                            and u.id = :CURRENT_USER_ID)',
'            )',
'       )'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(18074438077371368003)
,p_name=>'Project History'
,p_max_row_count=>'50000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_allow_report_categories=>'N'
,p_pagination_type=>'ROWS_X_TO_Y_OF_Z'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'ALLAN'
,p_internal_uid=>16954719161950385790
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18074439505950368048)
,p_db_column_name=>'COMMENT_TEXT'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Update'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18067127715936239726)
,p_db_column_name=>'AFFECTED_ITEM'
,p_display_order=>13
,p_column_identifier=>'Q'
,p_column_label=>'Updated Item'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_static_id=>'affectedItem'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18074439909674368050)
,p_db_column_name=>'ATTRIBUTE_1'
,p_display_order=>23
,p_column_identifier=>'D'
,p_column_label=>'Changed From'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18074440207576368052)
,p_db_column_name=>'ATTRIBUTE_2'
,p_display_order=>33
,p_column_identifier=>'E'
,p_column_label=>'Changed To'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18074441402071368058)
,p_db_column_name=>'USER_NAME'
,p_display_order=>63
,p_column_identifier=>'H'
,p_column_label=>'Updated By'
,p_column_html_expression=>'<a href="#PROFILE_URL#">#USER_NAME#</a>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18074443726130368069)
,p_db_column_name=>'PROFILE_URL'
,p_display_order=>123
,p_column_identifier=>'N'
,p_column_label=>'Profile Url'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18067127459481239723)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>133
,p_column_identifier=>'O'
,p_column_label=>'Project id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18067127578462239724)
,p_db_column_name=>'PROJECT_NAME'
,p_display_order=>143
,p_column_identifier=>'P'
,p_column_label=>'Project'
,p_column_html_expression=>'<a href="f?p=&APP_ID.:200:&APP_SESSION.:::200:P200_ID:#PROJECT_ID#">#PROJECT_NAME#</a>'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(18208248481621393642)
,p_db_column_name=>'CREATED'
,p_display_order=>153
,p_column_identifier=>'R'
,p_column_label=>'Changed On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20124882768303729633)
,p_db_column_name=>'COMMENT_DATE'
,p_display_order=>163
,p_column_identifier=>'S'
,p_column_label=>'Comment date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(18074445700115368946)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'169547268'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PROJECT_NAME:COMMENT_TEXT:AFFECTED_ITEM:ATTRIBUTE_1:ATTRIBUTE_2:USER_NAME:CREATED:'
,p_sort_column_1=>'CREATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'COMMENT_DATE'
,p_sort_direction_2=>'DESC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(18067127684662239725)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(18074437968824368003)
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
 p_id=>wwv_flow_imp.id(18208248915741393647)
,p_name=>'Refresh IR after change'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P126_ROWS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18208249156462393649)
,p_event_id=>wwv_flow_imp.id(18208248915741393647)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if :P126_ROWS <= 100 then',
'    :P126_HINT_ROWS := :P126_ROWS;',
'elsif :P126_ROWS between 500 and 1000 then',
'    :P126_HINT_ROWS := 100;',
'elsif :P126_ROWS > 1000 then',
'    :P126_HINT_ROWS := 1000;',
'end if;'))
,p_attribute_02=>'P126_ROWS'
,p_attribute_03=>'P126_HINT_ROWS'
,p_attribute_04=>'N'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18208249027568393648)
,p_event_id=>wwv_flow_imp.id(18208248915741393647)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(18074437968824368003)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
