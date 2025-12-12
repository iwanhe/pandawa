prompt --application/pages/page_00215
begin
--   Manifest
--     PAGE: 00215
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
 p_id=>215
,p_name=>'Mass Update My Open Milestones'
,p_step_title=>'Mass Update My Open Milestones'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486291560075385)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
' $( ''#myOpenAIs_search_field'' ).bind(''keypress'', function(e){',
'   if ( e.keyCode == 13 ) {',
'        $(''input[type=checkbox][name=f01]'').prop(''checked'',false);',
'        $(''#instructions div'').html(''<p>Click the "Select All" check box (at the top) or individual check boxes in the report on the right to select the Action Items you would like to update.</p>'');',
'        $s(''P212_ACTION'','''');',
'        $(''#P212_ACTION_CONTAINER'').hide();',
'        $(''#P212_NEW_RESOLUTION_CONTAINER'').hide();',
'        $(''#P212_NEW_STATUS_CONTAINER'').hide();',
'        $(''#P212_NEW_DUE_DATE_CONTAINER'').hide();',
'        $(''#P212_NEW_TYPE_CONTAINER'').hide();',
'   }',
' });'))
,p_step_template=>wwv_flow_imp.id(6672319528586369818)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_help_text=>'Click the "Select All" check box (at the top) or individual check boxes in the report to select the Milestones you would like to update. Select an action, provide the requested information, and click the <strong>Preview Changes</strong> button.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20619520386324799326)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20642370426120085534)
,p_plug_name=>'Instructions'
,p_region_name=>'instructions'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source=>'<p>Click the "Select All" check box (at the top) or individual check boxes in the report to select the Milestones you would like to update.</p>'
,p_plug_header=>'<div style="margin:15px;">'
,p_plug_footer=>'</div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20642370870520085538)
,p_plug_name=>'Mass Update My Open Milestones'
,p_region_name=>'myOpenMSs'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672356271346369882)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    m.id,',
'    case when m.is_major_yn = ''Y'' then ''Major'' else ''Minor'' end as type,',
'    apex_item.checkbox(1,m.id,''UNCHECKED'') as cb,',
'    milestone_name title,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':107:''||:APP_SESSION||'':::107:P107_ID,P107_PROJECT_ID,P200_ID:''||m.id||'',''||s.id||'',''||s.id) link,',
'    s.project,',
'    m.milestone_description,',
'    m.milestone_status status,',
'    m.milestone_date as due_date,',
'    case when owner_role_id is null then',
'        eba_proj_fw.get_name_from_email_address(m.milestone_owner)',
'    else',
'        nvl((select r.name||'': ''||listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '')',
'                within group (order by lower(u.username)) owner',
'            from eba_proj_user_ref rf,',
'                eba_proj_status_users u,',
'                eba_proj_roles r',
'            where rf.role_id = m.owner_role_id',
'                and rf.project_id = m.project_id',
'                and u.id = rf.user_id',
'                and r.id = rf.role_id',
'            group by r.name',
'        ), (select ''No ''||r.name||'' defined''',
'            from eba_proj_roles r',
'            where r.id = m.owner_role_id)',
'        )',
'    end as owner,',
'    m.row_key',
'  from eba_proj_status_ms m,',
'       eba_proj_status s,',
'       eba_proj_status_codes c',
' where m.project_id = s.id',
'   and s.project_status = c.id',
'   and c.is_closed_status != ''Y''',
'   and m.milestone_status != ''Completed''',
'   and (( m.owner_role_id is null',
'        and (   instr(upper(m.milestone_owner), upper(:APP_USER)) > 0',
'        )) or ( m.owner_role_id is not null',
'            and exists ( select null',
'                           from eba_proj_user_ref rf,',
'                                eba_proj_status_users u',
'                          where rf.role_id = m.owner_role_id',
'                            and rf.project_id = m.project_id',
'                            and rf.user_id = u.id',
'                            and upper(u.username) = upper(:APP_USER) )',
'        )',
'       )',
'   and ( :P215_PROJECT_ID is null or s.id = :P215_PROJECT_ID )',
'order by m.milestone_date,',
'    lower(s.project)'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(20642371219516085542)
,p_name=>'Mass Update My Open Action Items'
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
,p_internal_uid=>19522652304095103329
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20642371411420085547)
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
 p_id=>wwv_flow_imp.id(20642375727493085584)
,p_db_column_name=>'CB'
,p_display_order=>11
,p_column_identifier=>'L'
,p_column_label=>'<input type="checkbox" id="selectunselectall" title="Select/Unselect All">'
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
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20642372988568085566)
,p_db_column_name=>'LINK'
,p_display_order=>21
,p_column_identifier=>'E'
,p_column_label=>'Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20642371733622085558)
,p_db_column_name=>'TITLE'
,p_display_order=>31
,p_column_identifier=>'B'
,p_column_label=>'Milestone'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20642373384976085567)
,p_db_column_name=>'PROJECT'
,p_display_order=>61
,p_column_identifier=>'F'
,p_column_label=>'Project'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20642374181347085573)
,p_db_column_name=>'STATUS'
,p_display_order=>81
,p_column_identifier=>'H'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20642374534768085574)
,p_db_column_name=>'DUE_DATE'
,p_display_order=>91
,p_column_identifier=>'I'
,p_column_label=>'Due Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20642374920319085577)
,p_db_column_name=>'OWNER'
,p_display_order=>101
,p_column_identifier=>'J'
,p_column_label=>'Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20642375331658085578)
,p_db_column_name=>'ROW_KEY'
,p_display_order=>111
,p_column_identifier=>'K'
,p_column_label=>'Row Key'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20619519537528799318)
,p_db_column_name=>'TYPE'
,p_display_order=>121
,p_column_identifier=>'N'
,p_column_label=>'Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(20619519633991799319)
,p_db_column_name=>'MILESTONE_DESCRIPTION'
,p_display_order=>131
,p_column_identifier=>'O'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(20642376528790085589)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'195226577'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CB:TITLE:PROJECT:STATUS:TYPE:DUE_DATE'
,p_sort_column_1=>'DUE_DATE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'TITLE'
,p_sort_direction_2=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20642378277328085604)
,p_plug_name=>'Filters'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--hiddenOverflow:t-Form--labelsAbove'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(20642378661486085605)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(20642378277328085604)
,p_button_name=>'PREVIEW'
,p_button_static_id=>'previewBtn'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Preview Changes'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(20642377071490085595)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(20642370870520085538)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.,RIR:P215_PROJECT_ID:&P215_PROJECT_ID.'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(20642398649180085651)
,p_branch_name=>'Go To Page 217'
,p_branch_action=>'f?p=&APP_ID.:217:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(20642378661486085605)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20642377439106085597)
,p_name=>'P215_PROJECT_ID'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(20642378277328085604)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20642379085422085605)
,p_name=>'P215_ACTION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(20642378277328085604)
,p_prompt=>'Action'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MASS_UPDATE_ACTIONS'
,p_lov=>'.'||wwv_flow_imp.id(20420786276030524307)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select an Action -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20642379484437085606)
,p_name=>'P215_NEW_STATUS'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(20642378277328085604)
,p_prompt=>'New Status'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MASS UPDATE MILESTONE STATUSES'
,p_lov=>'.'||wwv_flow_imp.id(21277278072812721052)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select New Status -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20642380304459085607)
,p_name=>'P215_NEW_COMPLETED_DATE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(20642378277328085604)
,p_item_default=>'to_date(sysdate,''DD-MON-YYYY'')'
,p_item_default_type=>'EXPRESSION'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Completed Date'
,p_format_mask=>'DD-MON-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20642380702911085608)
,p_name=>'P215_NEW_DUE_DATE'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(20642378277328085604)
,p_prompt=>'New Due Date'
,p_format_mask=>'DD-MON-YYYY'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20642381106804085608)
,p_name=>'P215_NEW_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(20642378277328085604)
,p_prompt=>'New Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MILESTONE TYPES'
,p_lov=>'.'||wwv_flow_imp.id(20646355853476294049)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select New Type -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(20642383761235085616)
,p_validation_name=>'Completed Date Not Null'
,p_validation_sequence=>20
,p_validation=>'P215_NEW_COMPLETED_DATE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_validation_condition=>':P215_ACTION = ''CHANGE_STATUS'' and :P215_NEW_STATUS = ''Closed'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(20642380304459085607)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(20642382312863085614)
,p_validation_name=>'Status Not Null'
,p_validation_sequence=>30
,p_validation=>'P215_NEW_STATUS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_validation_condition=>':P215_ACTION = ''CHANGE_STATUS'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(20642379484437085606)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(20642382614852085615)
,p_validation_name=>'Due Date Not Null'
,p_validation_sequence=>40
,p_validation=>'P215_NEW_DUE_DATE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_validation_condition=>':P215_ACTION = ''CHANGE_DUE_DATE'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_associated_item=>wwv_flow_imp.id(20642380702911085608)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(20642382967195085615)
,p_validation_name=>'Type Not Null'
,p_validation_sequence=>50
,p_validation=>'P215_NEW_TYPE'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'#LABEL# must have some value.'
,p_validation_condition=>'P215_ACTION'
,p_validation_condition2=>'CHANGE_TYPE'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_imp.id(20642381106804085608)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(20642385880352085629)
,p_name=>'Select/Unselect All'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#selectunselectall'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#myOpenMSs'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20642386335460085630)
,p_event_id=>wwv_flow_imp.id(20642385880352085629)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ( $( ''#selectunselectall'').is('':checked'') ) {',
'    $(''input[type=checkbox][name=f01]'').prop(''checked'',true);',
'}',
'else {',
'    $(''input[type=checkbox][name=f01]'').prop(''checked'',false);',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(20642390597368085636)
,p_name=>'Toggle Instructions and Action Filter on f01'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'input[type=checkbox][name=f01]'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(''input[type=checkbox][name=f01]:checked'').length > 0'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#myOpenMSs'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20642391112964085637)
,p_event_id=>wwv_flow_imp.id(20642390597368085636)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#instructions div'').html(''<p>Click the "Select All" check box (at the top) or individual check boxes in the report to select the Milestones you would like to update.</p>'');',
'$s(''P215_ACTION'','''');',
'$(''#P215_ACTION_CONTAINER'').hide();',
'$(''#P215_NEW_STATUS_CONTAINER'').hide();',
'$(''#P215_NEW_DUE_DATE_CONTAINER'').hide();',
'$(''#P215_NEW_COMPLETED_DATE_CONTAINER'').hide();',
'$(''#P215_NEW_TYPE_CONTAINER'').hide();'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20642391596669085638)
,p_event_id=>wwv_flow_imp.id(20642390597368085636)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (!$(''#P215_ACTION_CONTAINER'').is(":visible")){',
'    $(''#instructions div'').html(''<p>Now select an action from the Action select list below that will apply to all of your selected Milestones.</p>'');',
'    $s(''P215_ACTION'','''');',
'    $(''#P215_ACTION_CONTAINER'').show();',
'    $(''#P215_NEW_STATUS_CONTAINER'').hide();',
'    $(''#P215_NEW_DUE_DATE_CONTAINER'').hide();',
'    $(''#P215_NEW_TYPE_CONTAINER'').hide();',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(20642389117129085634)
,p_name=>'Toggle Instructions and Action Filter on selectall'
,p_event_sequence=>30
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#selectunselectall'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$( ''#selectunselectall'').is('':checked'')'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20642389682576085635)
,p_event_id=>wwv_flow_imp.id(20642389117129085634)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#instructions div'').html(''<p>Now select an action from the Action select list below that will apply to all of your selected Milestones.</p>'');',
'$s(''P215_ACTION'','''');',
'$(''#P215_ACTION_CONTAINER'').show();',
'$(''#P215_NEW_STATUS_CONTAINER'').hide();',
'$(''#P215_NEW_DUE_DATE_CONTAINER'').hide();',
'$(''#P215_NEW_TYPE_CONTAINER'').hide();'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20642390132204085636)
,p_event_id=>wwv_flow_imp.id(20642389117129085634)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#instructions div'').html(''<p>Click the "Select All" check box (at the top) or individual check boxes in the report to select the Milestones you would like to update.</p>'');',
'$s(''P215_ACTION'','''');',
'$(''#P215_ACTION_CONTAINER'').hide();',
'$(''#P215_NEW_STATUS_CONTAINER'').hide();',
'$(''#P215_NEW_DUE_DATE_CONTAINER'').hide();',
'$(''#P215_NEW_COMPLETED_DATE_CONTAINER'').hide();',
'$(''#P215_NEW_TYPE_CONTAINER'').hide();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(20642384417842085625)
,p_name=>'Show/Hide Filters'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P215_ACTION'
,p_condition_element=>'P215_ACTION'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20642385509180085629)
,p_event_id=>wwv_flow_imp.id(20642384417842085625)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P215_ACTION'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20642385009777085628)
,p_event_id=>wwv_flow_imp.id(20642384417842085625)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v(''P215_ACTION'') == ''CHANGE_STATUS'') {',
'    $(''#instructions div'').html(''<p>Select the status value that you would like to update all of the selected Milestones to.</p>'');',
'    $(''#P215_NEW_STATUS_CONTAINER'').show();',
'    $(''#P215_NEW_DUE_DATE_CONTAINER'').hide();',
'    $(''#P215_NEW_TYPE_CONTAINER'').hide();',
'    $s(''P215_NEW_DUE_DATE'','''');',
'    $s(''P215_NEW_TYPE'','''');',
'}',
'else if ($v(''P215_ACTION'') == ''CHANGE_DUE_DATE'') {',
'    $(''#instructions div'').html(''<p>Select the due date that you would like to update all of the selected Milestones to.</p>'');',
'    $(''#P215_NEW_STATUS_CONTAINER'').hide();',
'    $(''#P215_NEW_DUE_DATE_CONTAINER'').show();',
'    $(''#P215_NEW_COMPLETED_DATE_CONTAINER'').hide();',
'    $(''#P215_NEW_TYPE_CONTAINER'').hide();',
'    $(''#previewBtn'').show();',
'    $s(''P215_NEW_TYPE'','''');',
'    $s(''P215_NEW_STATUS'','''');',
'}',
'else if ($v(''P215_ACTION'') == ''CHANGE_TYPE'') {',
'    $(''#instructions div'').html(''<p>Select the type value that you would like to update all of the selected Milestones to.</p>'');',
'    $(''#P215_NEW_STATUS_CONTAINER'').hide();',
'    $(''#P215_NEW_DUE_DATE_CONTAINER'').hide();',
'    $(''#P215_NEW_COMPLETED_DATE_CONTAINER'').hide();',
'    $(''#P215_NEW_TYPE_CONTAINER'').show();',
'    $(''#previewBtn'').show();',
'    $s(''P215_NEW_STATUS'','''');',
'    $s(''P215_NEW_DUE_DATE'','''');',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(20642391999096085638)
,p_name=>'Hide Preview Button until it''s time to show'
,p_event_sequence=>70
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(''li.htmldbStdErr'').html() === undefined'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20642392489349085639)
,p_event_id=>wwv_flow_imp.id(20642391999096085638)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ( $(''li.htmldbStdErr'').html().indexOf(''P215_NEW_COMPLETED_DATE'') > 0 ) {',
'    $(''#instructions div'').html(''<p>Enter your completed date and then click the <strong>Update</strong> button.</p>'');',
'    $s(''P215_ACTION'',''CHANGE_STATUS'');',
'    $(''#P215_ACTION_CONTAINER'').show();',
'    $s(''P215_NEW_STATUS'',''Closed'');',
'    $(''#P215_NEW_STATUS_CONTAINER'').show();',
'    $(''#P215_NEW_COMPLETED_DATE'').show();',
'}',
'else if ( $(''li.htmldbStdErr'').html().indexOf(''P215_NEW_STATUS'') > 0 ) {',
'    $(''#instructions div'').html(''<p>Select the status value that you would like to update all of the selected Action Items to.</p>'');',
'    $(''#P215_ACTION_CONTAINER'').show();',
'    $s(''P215_ACTION'',''CHANGE_STATUS'');',
'    $(''#P215_NEW_STATUS_CONTAINER'').show();',
'}',
'else if ( $(''li.htmldbStdErr'').html().indexOf(''P215_NEW_DUE_DATE'') > 0 ) {',
'    $(''#instructions div'').html(''<p>Select the due date that you would like to update all of the selected Action Items to.</p>'');',
'    $(''#P215_ACTION_CONTAINER'').show();',
'    $s(''P215_ACTION'',''CHANGE_DUE_DATE'');',
'    $(''#P215_NEW_DUE_DATE_CONTAINER'').show();',
'}',
'else if ( $(''li.htmldbStdErr'').html().indexOf(''P215_NEW_TYPE'') > 0 ) {',
'    $(''#instructions div'').html(''<p>Select the type value that you would like to update all of the selected Action Items to.</p>'');',
'    $(''#P215_ACTION_CONTAINER'').show();',
'    $s(''P215_ACTION'',''CHANGE_TYPE'');',
'    $(''#P215_NEW_TYPE_CONTAINER'').show();',
'}'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20642392922988085643)
,p_event_id=>wwv_flow_imp.id(20642391999096085638)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#instructions div'').html(''<p>Click the "Select All" check box (at the top) or individual check boxes in the report to select the Milestones you would like to update.</p>'');',
'$s(''P215_ACTION'','''');',
'$s(''P215_NEW_STATUS'','''');',
'$s(''P215_NEW_DUE_DATE'','''');',
'$s(''P215_NEW_TYPE'','''');',
'$(''#previewBtn'').hide();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(20644875650870939105)
,p_name=>'Show/Hide Completed Date'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P215_NEW_STATUS'
,p_condition_element=>'P215_NEW_STATUS'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Completed'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20619520073384799323)
,p_event_id=>wwv_flow_imp.id(20644875650870939105)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P215_NEW_COMPLETED_DATE'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20619520223260799325)
,p_event_id=>wwv_flow_imp.id(20644875650870939105)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(20642378661486085605)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20619520116022799324)
,p_event_id=>wwv_flow_imp.id(20644875650870939105)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'BUTTON'
,p_affected_button_id=>wwv_flow_imp.id(20642378661486085605)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(20642384098124085617)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create Preview Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_ms_id           number;',
'    l_action          varchar2(30);',
'    l_old_value       varchar2(30);',
'    l_new_value       varchar2(30);',
'    l_milestone       varchar2(255);',
'    l_project         varchar2(200);',
'    l_completed_date  varchar2(11);',
'    l_completed_by    varchar2(255);',
'    l_open_ai_cnt     number;',
'    l_error_text      varchar2(500);',
'    l_close_assoc_ais varchar2(500);',
'begin',
'    apex_collection.create_or_truncate_collection(p_collection_name => ''PREVIEW_MS'');',
'    l_action := initcap( replace( :P215_ACTION, ''_'', '' '' ) );',
'    l_completed_date := :P215_NEW_COMPLETED_DATE;',
'    for i in 1..apex_application.g_f01.count',
'    loop',
'        l_ms_id := apex_application.g_f01(i);',
'        select count(*)',
'          into l_open_ai_cnt',
'          from eba_proj_status_ais',
'         where milestone_id = l_ms_id',
'           and action_status = ''Open'';',
'        for c1 in',
'        (',
'            select case',
'                       when :P215_ACTION = ''CHANGE_STATUS'' then',
'                           m.milestone_status',
'                       when :P215_ACTION = ''CHANGE_DUE_DATE'' then',
'                           upper(to_char(m.milestone_date,''DD-MON-YYYY''))',
'                       when :P215_ACTION = ''CHANGE_TYPE'' then',
'                           case when m.is_major_yn = ''Y'' then ''Major'' else ''Minor'' end',
'                   end as old_value,',
'                   case',
'                       when :P215_ACTION = ''CHANGE_STATUS'' then',
'                           :P215_NEW_STATUS',
'                       when :P215_ACTION = ''CHANGE_DUE_DATE'' then',
'                           upper(:P215_NEW_DUE_DATE)',
'                       when :P215_ACTION = ''CHANGE_TYPE'' then',
'                           initcap(:P215_NEW_TYPE)',
'                   end as new_value,',
'                   case',
'                       when :P215_ACTION = ''CHANGE_STATUS'' and :P215_NEW_STATUS = ''Completed'' then',
'                           l_completed_date',
'                   else',
'                       null',
'                   end as completed_date,',
'                   case',
'                       when :P215_ACTION = ''CHANGE_STATUS'' and :P215_NEW_STATUS = ''Completed'' then',
'                           :APP_USER',
'                   else',
'                       null',
'                   end as completed_by,',
'                   case',
'                       when (:P215_ACTION = ''CHANGE_DUE_DATE'' or :P215_ACTION = ''CHANGE_TYPE'') and',
'                            eba_proj_fw.are_ms_ai_restricted(',
'                                p_application_id => :APP_ID,',
'                                p_username   => upper(:APP_USER),',
'                                p_project_id => m.project_id ) = ''Y'' then',
'                           ''This Milestone cannot be updated because it belongs to a restricted project that has been set to not allow these types of updates.''',
'                       when :P215_ACTION = ''CHANGE_STATUS'' and :P215_NEW_STATUS = ''Completed'' and l_open_ai_cnt > 0 then',
'                           ''This Milestone cannot be closed because there are '' || l_open_ai_cnt || '' associated open Action Item(s) that must be closed first.''',
'                   else',
'                       null',
'                   end as error_text,',
'                   case',
'                       when :P215_ACTION = ''CHANGE_STATUS'' and :P215_NEW_STATUS = ''Completed'' and l_open_ai_cnt > 0 then',
'                           ''Would you like to close the associated open Action Items and this Milestone?<br>'' ||',
'                           apex_item.hidden(p_idx => 1, p_value => m.id) ||',
'                           apex_item.select_list(',
'                               p_idx         => 2,',
'                               p_value       => ''N'',',
'                               p_list_values => ''Yes;Y,No;N'',',
'                               p_show_null   => ''NO'',',
'                               p_show_extra  => ''NO'',',
'                               p_item_label  => ''Close associated open Action Items?''',
'                           ) || ''<br>'' ||',
'                           case when length((select ',
'                                                listagg(action || '' due on '' || to_char(due_date,''fmDD-MON-YYYY''), ''<br>'') within group (order by action || '' due on '' || to_char(due_date,''fmDD-MON-YYYY''))',
'                                            from',
'                                                eba_proj_status_ais',
'                                            where',
'                                                milestone_id = m.id',
'                                            and',
'                                                action_status != ''Closed'')) < 3500 then',
'                                (select ',
'                                    listagg(action || '' due on '' || to_char(due_date,''fmDD-MON-YYYY''), ''<br>'') within group (order by action || '' due on '' || to_char(due_date,''fmDD-MON-YYYY''))',
'                                from',
'                                    eba_proj_status_ais',
'                                where',
'                                    milestone_id = m.id',
'                                and',
'                                    action_status != ''Closed'')',
'                           else',
'                                substr((select ',
'                                            listagg(action || '' due on '' || to_char(due_date,''fmDD-MON-YYYY''), ''<br>'') within group (order by action || '' due on '' || to_char(due_date,''fmDD-MON-YYYY''))',
'                                        from',
'                                            eba_proj_status_ais',
'                                        where',
'                                            milestone_id = m.id',
'                                        and',
'                                            action_status != ''Closed''), 1, 3500) || '' ...''',
'                           end',
'                   else',
'                       null',
'                   end as close_open_assoc_ais,',
'                   m.milestone_name,',
'                   p.project',
'              from eba_proj_status_ms m,',
'                   eba_proj_status p',
'             where m.id = l_ms_id',
'               and m.project_id = p.id',
'        )',
'        loop',
'            l_old_value       := c1.old_value;',
'            l_new_value       := c1.new_value;',
'            l_milestone       := c1.milestone_name;',
'            l_project         := c1.project;',
'            l_completed_date  := c1.completed_date;',
'            l_completed_by    := c1.completed_by;',
'            l_error_text      := c1.error_text;',
'            l_close_assoc_ais := c1.close_open_assoc_ais;',
'        end loop;',
'        apex_collection.add_member (',
'            p_collection_name => ''PREVIEW_MS'',',
'            p_n001            => l_ms_id,',
'            p_c001            => l_milestone,',
'            p_c002            => l_action,',
'            p_c003            => l_old_value,',
'            p_c004            => l_new_value,',
'            p_c005            => l_project,',
'            p_c006            => l_completed_date,',
'            p_c007            => l_completed_by,',
'            p_c008            => l_error_text,',
'            p_c009            => l_close_assoc_ais',
'        );',
'    end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(20642378661486085605)
,p_internal_uid=>20642384098124085617
);
wwv_flow_imp.component_end;
end;
/
