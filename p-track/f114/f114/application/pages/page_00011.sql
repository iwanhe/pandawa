prompt --application/pages/page_00011
begin
--   Manifest
--     PAGE: 00011
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
 p_id=>11
,p_name=>'Mass Update Users'
,p_step_title=>'Mass Update Users'
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
,p_help_text=>'Use this page to update an attribute of many different users at once.'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22690446406519330956)
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
 p_id=>wwv_flow_imp.id(22690447324505330965)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(22690447495197330967)
,p_plug_name=>'Instructions'
,p_region_name=>'instructions'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source=>'<p>Select the users you would like to update in the report on the right. You can click the check boxes that identify the specific users you would like to update or click the check box in the report''s column header to select all users currently displa'
||'yed.</p>'
,p_plug_header=>'<div style="margin:15px;">'
,p_plug_footer=>'</div>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(23057489607353962433)
,p_plug_name=>'Mass Update Users'
,p_region_name=>'myOpenAIs'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672356271346369882)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id,',
'    apex_item.checkbox(1,id,''UNCHECKED'') as cb,',
'    lower(username) username,',
'    access_level_id,',
'    case when account_locked = ''Y'' then ''Yes'' else ''No'' end account_locked,',
'    lower(created_by) created_by,',
'    created,',
'    lower(updated_by) updated_by,',
'    updated,',
'    phone_01,',
'    phone_02,',
'    title,',
'    address,',
'    note,',
'    country_id,',
'    region_id,',
'    home_timezone,',
'    team_groups,',
'    skillsets,',
'    bg_checks,',
'    hippa_cert_date,',
'    assistant_name,',
'    assistant_phone,',
'    email_address',
'from eba_proj_status_users'))
,p_plug_source_type=>'NATIVE_IR'
,p_plug_required_role=>wwv_flow_imp.id(7197408082264470529)
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(23057489675548962433)
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
,p_internal_uid=>22991242670733839892
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713390105794666206)
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
 p_id=>wwv_flow_imp.id(2713389348227666201)
,p_db_column_name=>'CB'
,p_display_order=>11
,p_column_identifier=>'L'
,p_column_label=>'Select/Unselect All'
,p_report_label=>'<input type="checkbox" id="selectunselectall" title="Select/Unselect All">'
,p_sync_form_label=>'N'
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
 p_id=>wwv_flow_imp.id(2713390549208666206)
,p_db_column_name=>'TITLE'
,p_display_order=>31
,p_column_identifier=>'B'
,p_column_label=>'Title'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713430982210930143)
,p_db_column_name=>'USERNAME'
,p_display_order=>41
,p_column_identifier=>'N'
,p_column_label=>'Username'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713431070056930144)
,p_db_column_name=>'ACCESS_LEVEL_ID'
,p_display_order=>51
,p_column_identifier=>'O'
,p_column_label=>'Access Level'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(6973296698397799216)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713431202871930145)
,p_db_column_name=>'ACCOUNT_LOCKED'
,p_display_order=>61
,p_column_identifier=>'P'
,p_column_label=>'Account Locked'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713431259806930146)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>71
,p_column_identifier=>'Q'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713431391703930147)
,p_db_column_name=>'CREATED'
,p_display_order=>81
,p_column_identifier=>'R'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713431412680930148)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>91
,p_column_identifier=>'S'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713431602221930149)
,p_db_column_name=>'UPDATED'
,p_display_order=>101
,p_column_identifier=>'T'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713431671267930150)
,p_db_column_name=>'PHONE_01'
,p_display_order=>111
,p_column_identifier=>'U'
,p_column_label=>'Phone 01'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713431765071930151)
,p_db_column_name=>'PHONE_02'
,p_display_order=>121
,p_column_identifier=>'V'
,p_column_label=>'Phone 02'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713431823781930152)
,p_db_column_name=>'ADDRESS'
,p_display_order=>131
,p_column_identifier=>'W'
,p_column_label=>'Address'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713432002103930153)
,p_db_column_name=>'NOTE'
,p_display_order=>141
,p_column_identifier=>'X'
,p_column_label=>'Note'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713432015920930154)
,p_db_column_name=>'COUNTRY_ID'
,p_display_order=>151
,p_column_identifier=>'Y'
,p_column_label=>'Country'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(18879629845899629495)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713432114701930155)
,p_db_column_name=>'REGION_ID'
,p_display_order=>161
,p_column_identifier=>'Z'
,p_column_label=>'Region'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(18874496462088660444)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713432279811930156)
,p_db_column_name=>'HOME_TIMEZONE'
,p_display_order=>171
,p_column_identifier=>'AA'
,p_column_label=>'Home Timezone'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713432373002930157)
,p_db_column_name=>'TEAM_GROUPS'
,p_display_order=>181
,p_column_identifier=>'AB'
,p_column_label=>'Team Groups'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(2661829695961054886)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713432406438930158)
,p_db_column_name=>'SKILLSETS'
,p_display_order=>191
,p_column_identifier=>'AC'
,p_column_label=>'Skillsets'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(2661829854737059914)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713432531754930159)
,p_db_column_name=>'BG_CHECKS'
,p_display_order=>201
,p_column_identifier=>'AD'
,p_column_label=>'Background Checks'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(2661830040094079007)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713432605457930160)
,p_db_column_name=>'HIPPA_CERT_DATE'
,p_display_order=>211
,p_column_identifier=>'AE'
,p_column_label=>'HIPPA Certified On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(2661830257654087551)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713432709770930161)
,p_db_column_name=>'ASSISTANT_NAME'
,p_display_order=>221
,p_column_identifier=>'AF'
,p_column_label=>'Assistant Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(2705749400803732907)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713432887693930162)
,p_db_column_name=>'ASSISTANT_PHONE'
,p_display_order=>231
,p_column_identifier=>'AG'
,p_column_label=>'Assistant Phone'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(2705749400803732907)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2713432923025930163)
,p_db_column_name=>'EMAIL_ADDRESS'
,p_display_order=>241
,p_column_identifier=>'AH'
,p_column_label=>'Email Address'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(23059374710627963087)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'26471475'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'CB:TITLE:USERNAME:EMAIL_ADDRESS:ACCESS_LEVEL_ID:PHONE_01:PHONE_02:ADDRESS:COUNTRY_ID:HOME_TIMEZONE:TEAM_GROUPS:SKILLSETS:BG_CHECKS:UPDATED:'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'DUE_DATE'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'TITLE'
,p_sort_direction_3=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2713385189943666183)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(22690447324505330965)
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
 p_id=>wwv_flow_imp.id(2713394986202666226)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(23057489607353962433)
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
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(2713411238489666275)
,p_branch_name=>'Go To Page 16'
,p_branch_action=>'f?p=&APP_ID.:16:&SESSION.::&DEBUG.:16::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(2713385189943666183)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2713385601267666184)
,p_name=>'P11_ACTION'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(22690447324505330965)
,p_prompt=>'Action'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MASS_UPDATE_USERS'
,p_lov=>'.'||wwv_flow_imp.id(2716491233055480639)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select an Action -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'When switching a user''s country, their associated region will be changed automatically.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2713433005502930164)
,p_name=>'P11_NEW_ACCESS_LEVEL'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(22690447324505330965)
,p_prompt=>'New Access Level'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'ACCESS_LEVELS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select access_level d, id r',
'from eba_proj_status_access_levels',
'order by 1'))
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2713433176979930165)
,p_name=>'P11_NEW_COUNTRY'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(22690447324505330965)
,p_prompt=>'New Country'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'COUNTRIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select country_name d, id r',
'from eba_proj_countries',
'order by lower(country_name)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2713433304893930167)
,p_name=>'P11_NEW_TZ'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(22690447324505330965)
,p_prompt=>'New Home Timezone'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIMEZONES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct tzname d, tzname r',
'  from V$TIMEZONE_NAMES',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2713433442639930168)
,p_name=>'P11_NEW_BG_CHKS'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(22690447324505330965)
,p_prompt=>'New Background Check(s)'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'select distinct bg_checks from eba_proj_status_users'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(2661830040094079007)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2713433543601930169)
,p_name=>'P11_NEW_SKILLSETS'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(22690447324505330965)
,p_prompt=>'New Skillsets'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'select distinct skillsets from eba_proj_status_users'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(2661829854737059914)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2713433671358930170)
,p_name=>'P11_NEW_TEAM_GRPS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(22690447324505330965)
,p_prompt=>'New Team Group(s)'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>'select distinct team_groups from eba_proj_status_users'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(2661829695961054886)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2721925164894631354)
,p_name=>'P11_NEW_LOCKED_STATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(22690447324505330965)
,p_prompt=>'New Locked Status'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'YES NO RETURNS Y N'
,p_lov=>'.'||wwv_flow_imp.id(8910494933283350717)||'.'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2713433891672930172)
,p_validation_name=>'P11_NEW_ACCESS_LEVEL is not null'
,p_validation_sequence=>10
,p_validation=>'P11_NEW_ACCESS_LEVEL'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please select an access level.'
,p_validation_condition=>'P11_ACTION'
,p_validation_condition2=>'CHANGE_ACL'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_imp.id(2713433005502930164)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2713433940722930173)
,p_validation_name=>'P11_NEW_COUNTRY is not null'
,p_validation_sequence=>20
,p_validation=>'P11_NEW_COUNTRY'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please select a country.'
,p_validation_condition=>'P11_ACTION'
,p_validation_condition2=>'CHANGE_COUNTRY'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_imp.id(2713433176979930165)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2713434199130930175)
,p_validation_name=>'P11_NEW_TZ is not null'
,p_validation_sequence=>40
,p_validation=>'P11_NEW_TZ'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please select a timezone'
,p_validation_condition=>'P11_ACTION'
,p_validation_condition2=>'CHANGE_TZ'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_imp.id(2713433304893930167)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2713434211110930176)
,p_validation_name=>'P11_NEW_BG_CHKS is not null'
,p_validation_sequence=>50
,p_validation=>'P11_NEW_BG_CHKS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please enter background check(s).'
,p_validation_condition=>'P11_ACTION'
,p_validation_condition2=>'CHANGE_BG_CHKS'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_imp.id(2713433442639930168)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2713434334222930177)
,p_validation_name=>'P11_NEW_TEAM_GRPS is not null'
,p_validation_sequence=>60
,p_validation=>'P11_NEW_TEAM_GRPS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please enter the team group(s).'
,p_validation_condition=>'P11_ACTION'
,p_validation_condition2=>'CHANGE_TEAM_GRPS'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_imp.id(2713433671358930170)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2713434490759930178)
,p_validation_name=>'P11_NEW_SKILLSETS is not null'
,p_validation_sequence=>70
,p_validation=>'P11_NEW_SKILLSETS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please enter the skillsets.'
,p_validation_condition=>'P11_ACTION'
,p_validation_condition2=>'CHANGE_SKILLSETS'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_imp.id(2713433543601930169)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(2721925279218631355)
,p_validation_name=>'P11_NEW_LOCKED_STATUS is not null'
,p_validation_sequence=>80
,p_validation=>'P11_NEW_LOCKED_STATUS'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please select a locked status.'
,p_validation_condition=>'P11_ACTION'
,p_validation_condition2=>'CHANGE_LOCKED_STATUS'
,p_validation_condition_type=>'VAL_OF_ITEM_IN_COND_EQ_COND2'
,p_associated_item=>wwv_flow_imp.id(2721925164894631354)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2713398092782666254)
,p_name=>'Select/Unselect All'
,p_event_sequence=>10
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'#selectunselectall'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#myOpenAIs'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2713398590897666256)
,p_event_id=>wwv_flow_imp.id(2713398092782666254)
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
 p_id=>wwv_flow_imp.id(2713398933355666256)
,p_name=>'Toggle Instructions and Action Filter on f01'
,p_event_sequence=>20
,p_triggering_element_type=>'JQUERY_SELECTOR'
,p_triggering_element=>'input[type=checkbox][name=f01]'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(''input[type=checkbox][name=f01]:checked'').length > 0'
,p_bind_type=>'live'
,p_bind_delegate_to_selector=>'#myOpenAIs'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2713399458593666257)
,p_event_id=>wwv_flow_imp.id(2713398933355666256)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (!$(''#P11_ACTION_CONTAINER'').is(":visible")){',
'    $(''#instructions div'').html(''<p>Now select an action from the Action select list below that will apply to all of your selected users.</p>'');',
'    $s(''P11_ACTION'','''');',
'    $s(''P11_NEW_STATUS'','''');',
'    $(''#P11_ACTION_CONTAINER'').show();',
'    $(''#P11_NEW_ACCESS_LEVEL_CONTAINER'').hide();',
'    $(''#P11_NEW_LOCKED_STATUS_CONTAINER'').hide();',
'    $(''#P11_NEW_COUNTRY_CONTAINER'').hide();',
'    $(''#P11_NEW_TZ_CONTAINER'').hide();',
'    $(''#P11_NEW_BG_CHKS_CONTAINER'').hide();',
'    $(''#P11_NEW_TEAM_GRPS_CONTAINER'').hide();',
'    $(''#P11_NEW_SKILLSETS_CONTAINER'').hide();',
'    $(''#previewBtn'').hide();',
'}'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2713399986614666257)
,p_event_id=>wwv_flow_imp.id(2713398933355666256)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#instructions div'').html(''<p>Click the "Select All" check box (at the top) or individual check boxes in the report to select the users you would like to update.</p>'');',
'$(''#P11_ACTION_CONTAINER'').hide();',
'$(''#P11_NEW_ACCESS_LEVEL_CONTAINER'').hide();',
'$(''#P11_NEW_LOCKED_STATUS_CONTAINER'').hide();',
'$(''#P11_NEW_COUNTRY_CONTAINER'').hide();',
'$(''#P11_NEW_TZ_CONTAINER'').hide();',
'$(''#P11_NEW_BG_CHKS_CONTAINER'').hide();',
'$(''#P11_NEW_TEAM_GRPS_CONTAINER'').hide();',
'$(''#P11_NEW_SKILLSETS_CONTAINER'').hide();',
'$(''#previewBtn'').hide();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2713400375527666257)
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
 p_id=>wwv_flow_imp.id(2713400816406666258)
,p_event_id=>wwv_flow_imp.id(2713400375527666257)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#instructions div'').html(''<p>Now select an action from the Action select list below that will apply to all of your selected users.</p>'');',
'$s(''P11_ACTION'','''');',
'$s(''P11_NEW_STATUS'','''');',
'$(''#P11_ACTION_CONTAINER'').show();',
'$(''#P11_NEW_ACCESS_LEVEL_CONTAINER'').hide();',
'$(''#P11_NEW_LOCKED_STATUS_CONTAINER'').hide();',
'$(''#P11_NEW_COUNTRY_CONTAINER'').hide();',
'$(''#P11_NEW_TZ_CONTAINER'').hide();',
'$(''#P11_NEW_BG_CHKS_CONTAINER'').hide();',
'$(''#P11_NEW_TEAM_GRPS_CONTAINER'').hide();',
'$(''#P11_NEW_SKILLSETS_CONTAINER'').hide();',
'$(''#previewBtn'').hide();'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2713401337736666258)
,p_event_id=>wwv_flow_imp.id(2713400375527666257)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''#instructions div'').html(''<p>Click the "Select All" check box (at the top) or individual check boxes in the report to select the users you would like to update.</p>'');',
'$(''#P11_ACTION_CONTAINER'').hide();',
'$(''#P11_NEW_ACCESS_LEVEL_CONTAINER'').hide();',
'$(''#P11_NEW_LOCKED_STATUS_CONTAINER'').hide();',
'$(''#P11_NEW_COUNTRY_CONTAINER'').hide();',
'$(''#P11_NEW_TZ_CONTAINER'').hide();',
'$(''#P11_NEW_BG_CHKS_CONTAINER'').hide();',
'$(''#P11_NEW_TEAM_GRPS_CONTAINER'').hide();',
'$(''#P11_NEW_SKILLSETS_CONTAINER'').hide();',
'$(''#previewBtn'').hide();'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2713401718099666258)
,p_name=>'Show/Hide Filters'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_ACTION'
,p_condition_element=>'P11_ACTION'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2713402275542666260)
,p_event_id=>wwv_flow_imp.id(2713401718099666258)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P11_ACTION'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2713402760219666261)
,p_event_id=>wwv_flow_imp.id(2713401718099666258)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ($v(''P11_ACTION'') == ''CHANGE_ACL'') {',
'    $(''#instructions div'').html(''<p>Select the access level that you would like to update all of the selected users to.</p>'');',
'    $(''#P11_NEW_ACCESS_LEVEL_CONTAINER'').show();',
'    $(''#P11_NEW_LOCKED_STATUS_CONTAINER'').hide();',
'    $(''#P11_NEW_COUNTRY_CONTAINER'').hide();',
'    $(''#P11_NEW_TZ_CONTAINER'').hide();',
'    $(''#P11_NEW_BG_CHKS_CONTAINER'').hide();',
'    $(''#P11_NEW_TEAM_GRPS_CONTAINER'').hide();',
'    $(''#P11_NEW_SKILLSETS_CONTAINER'').hide();',
'    $(''#previewBtn'').show();',
'}',
'else if ($v(''P11_ACTION'') == ''CHANGE_LOCKED_STATUS'') {',
'    $(''#instructions div'').html(''<p>Select the locked status that you would like to update all of the selected users to.</p>'');',
'    $(''#P11_NEW_ACCESS_LEVEL_CONTAINER'').hide();',
'    $(''#P11_NEW_LOCKED_STATUS_CONTAINER'').show();',
'    $(''#P11_NEW_COUNTRY_CONTAINER'').hide();',
'    $(''#P11_NEW_TZ_CONTAINER'').hide();',
'    $(''#P11_NEW_BG_CHKS_CONTAINER'').hide();',
'    $(''#P11_NEW_TEAM_GRPS_CONTAINER'').hide();',
'    $(''#P11_NEW_SKILLSETS_CONTAINER'').hide();',
'    $(''#previewBtn'').show();',
'}',
'else if ($v(''P11_ACTION'') == ''CHANGE_COUNTRY'') {',
'    $(''#instructions div'').html(''<p>Select the country that you would like to update all of the selected users to.</p>'');',
'    $(''#P11_NEW_ACCESS_LEVEL_CONTAINER'').hide();',
'    $(''#P11_NEW_LOCKED_STATUS_CONTAINER'').hide();',
'    $(''#P11_NEW_COUNTRY_CONTAINER'').show();',
'    $(''#P11_NEW_TZ_CONTAINER'').hide();',
'    $(''#P11_NEW_BG_CHKS_CONTAINER'').hide();',
'    $(''#P11_NEW_TEAM_GRPS_CONTAINER'').hide();',
'    $(''#P11_NEW_SKILLSETS_CONTAINER'').hide();',
'    $(''#previewBtn'').show();',
'}',
'else if ($v(''P11_ACTION'') == ''CHANGE_TZ'') {',
'    $(''#instructions div'').html(''<p>Select the timezone that you would like to update all of the selected users to.</p>'');',
'    $(''#P11_NEW_ACCESS_LEVEL_CONTAINER'').hide();',
'    $(''#P11_NEW_LOCKED_STATUS_CONTAINER'').hide();',
'    $(''#P11_NEW_COUNTRY_CONTAINER'').hide();',
'    $(''#P11_NEW_TZ_CONTAINER'').show();',
'    $(''#P11_NEW_BG_CHKS_CONTAINER'').hide();',
'    $(''#P11_NEW_TEAM_GRPS_CONTAINER'').hide();',
'    $(''#P11_NEW_SKILLSETS_CONTAINER'').hide();',
'    $(''#previewBtn'').show();',
'}',
'else if ($v(''P11_ACTION'') == ''CHANGE_BG_CHKS'') {',
'    $(''#instructions div'').html(''<p>Enter the background check(s) that you would like to update all of the selected users to.</p>'');',
'    $(''#P11_NEW_ACCESS_LEVEL_CONTAINER'').hide();',
'    $(''#P11_NEW_LOCKED_STATUS_CONTAINER'').hide();',
'    $(''#P11_NEW_COUNTRY_CONTAINER'').hide();',
'    $(''#P11_NEW_TZ_CONTAINER'').hide();',
'    $(''#P11_NEW_BG_CHKS_CONTAINER'').show();',
'    $(''#P11_NEW_TEAM_GRPS_CONTAINER'').hide();',
'    $(''#P11_NEW_SKILLSETS_CONTAINER'').hide();',
'    $(''#previewBtn'').show();',
'}',
'else if ($v(''P11_ACTION'') == ''CHANGE_SKILLSETS'') {',
'    $(''#instructions div'').html(''<p>Enter the skillset(s) that you would like to update all of the selected users to.</p>'');',
'    $(''#P11_NEW_ACCESS_LEVEL_CONTAINER'').hide();',
'    $(''#P11_NEW_LOCKED_STATUS_CONTAINER'').hide();',
'    $(''#P11_NEW_COUNTRY_CONTAINER'').hide();',
'    $(''#P11_NEW_TZ_CONTAINER'').hide();',
'    $(''#P11_NEW_BG_CHKS_CONTAINER'').hide();',
'    $(''#P11_NEW_TEAM_GRPS_CONTAINER'').hide();',
'    $(''#P11_NEW_SKILLSETS_CONTAINER'').show();',
'    $(''#previewBtn'').show();',
'}',
'else if ($v(''P11_ACTION'') == ''CHANGE_TEAM_GRPS'') {',
'    $(''#instructions div'').html(''<p>Enter the team group(s) that you would like to update all of the selected users to.</p>'');',
'    $(''#P11_NEW_ACCESS_LEVEL_CONTAINER'').hide();',
'    $(''#P11_NEW_LOCKED_STATUS_CONTAINER'').hide();',
'    $(''#P11_NEW_COUNTRY_CONTAINER'').hide();',
'    $(''#P11_NEW_TZ_CONTAINER'').hide();',
'    $(''#P11_NEW_BG_CHKS_CONTAINER'').hide();',
'    $(''#P11_NEW_TEAM_GRPS_CONTAINER'').show();',
'    $(''#P11_NEW_SKILLSETS_CONTAINER'').hide();',
'    $(''#previewBtn'').show();',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2713408843113666269)
,p_name=>'Hide Preview Button until it''s time to show'
,p_event_sequence=>70
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$(''li.htmldbStdErr'').html() === undefined'
,p_bind_type=>'live'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2713409325012666269)
,p_event_id=>wwv_flow_imp.id(2713408843113666269)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$(''input:checkbox'').attr(''checked'',false);',
'$(''#instructions div'').html(''<p>Click the "Select All" check box (at the top) or individual check boxes in the report to select the users you would like to update.</p>'');',
'$s(''P11_ACTION'','''');',
'$s(''P11_NEW_ACCESS_LEVEL'','''');',
'$s(''P11_NEW_COUNTRY'','''');',
'$s(''P11_NEW_TZ'','''');',
'$s(''P11_NEW_BG_CHKS'','''');',
'$s(''P11_NEW_TEAM_GRPS'','''');',
'$s(''P11_NEW_SKILLSETS'','''');',
'$(''#P11_ACTION_CONTAINER'').hide();',
'$(''#P11_NEW_ACCESS_LEVEL_CONTAINER'').hide();',
'$(''#P11_NEW_LOCKED_STATUS_CONTAINER'').hide();',
'$(''#P11_NEW_COUNTRY_CONTAINER'').hide();',
'$(''#P11_NEW_TZ_CONTAINER'').hide();',
'$(''#P11_NEW_BG_CHKS_CONTAINER'').hide();',
'$(''#P11_NEW_TEAM_GRPS_CONTAINER'').hide();',
'$(''#P11_NEW_SKILLSETS_CONTAINER'').hide();',
'$(''#previewBtn'').hide();'))
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2713409810607666269)
,p_event_id=>wwv_flow_imp.id(2713408843113666269)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if ( $(''li.htmldbStdErr'').html().indexOf(''P11_NEW_ACCESS_LEVEL'') > 0 ) {',
'    $(''#instructions div'').html(''<p>Select an access level and then click the <strong>Preview Changes</strong> button.</p>'');',
'    $s(''P11_ACTION'',''CHANGE_ACL'');',
'    $(''#P11_ACTION_CONTAINER'').show();',
'    $s(''P11_NEW_ACCESS_LEVEL'','''');',
'    $(''#P11_NEW_ACCESS_LEVEL_CONTAINER'').show();',
'}',
'else if ( $(''li.htmldbStdErr'').html().indexOf(''P11_NEW_LOCKED_STATUS'') > 0 ) {',
'    $(''#instructions div'').html(''<p>Select a country and then click the <strong>Preview Changes</strong> button.</p>'');',
'    $s(''P11_ACTION'',''CHANGE_LOCKED_STATUS'');',
'    $(''#P11_ACTION_CONTAINER'').show();',
'    $s(''P11_NEW_LOCKED_STATUS'','''');',
'    $(''#P11_NEW_LOCKED_STATUS_CONTAINER'').show();',
'}',
'else if ( $(''li.htmldbStdErr'').html().indexOf(''P11_NEW_COUNTRY'') > 0 ) {',
'    $(''#instructions div'').html(''<p>Select a country and then click the <strong>Preview Changes</strong> button.</p>'');',
'    $s(''P11_ACTION'',''CHANGE_COUNTRY'');',
'    $(''#P11_ACTION_CONTAINER'').show();',
'    $s(''P11_NEW_COUNTRY'','''');',
'    $(''#P11_NEW_COUNTRY_CONTAINER'').show();',
'}',
'else if ( $(''li.htmldbStdErr'').html().indexOf(''P11_NEW_TZ'') > 0 ) {',
'    $(''#instructions div'').html(''<p>Select the home timezone that you would like to update all of the selected users to.</p>'');',
'    $(''#P11_ACTION_CONTAINER'').show();',
'    $s(''P11_ACTION'',''CHANGE_TZ'');',
'    $(''#P11_NEW_TZ_CONTAINER'').show();',
'}',
'else if ( $(''li.htmldbStdErr'').html().indexOf(''P11_NEW_BG_CHKS'') > 0 ) {',
'    $(''#instructions div'').html(''<p>Enter the background check(s) that you would like to update all of the selected users to.</p>'');',
'    $(''#P11_ACTION_CONTAINER'').show();',
'    $s(''P11_ACTION'',''CHANGE_BG_CHKS'');',
'    $(''#P11_NEW_BG_CHKS_CONTAINER'').show();',
'}',
'else if ( $(''li.htmldbStdErr'').html().indexOf(''P11_NEW_TEAM_GRPS'') > 0 ) {',
'    $(''#instructions div'').html(''<p>Enter the team group(s) that you would like to update all of the selected users to.</p>'');',
'    $(''#P11_ACTION_CONTAINER'').show();',
'    $s(''P11_ACTION'',''CHANGE_TEAM_GRPS'');',
'    $(''#P11_NEW_TEAM_GRPS_CONTAINER'').show();',
'}',
'else if ( $(''li.htmldbStdErr'').html().indexOf(''P11_NEW_SKILLSETS'') > 0 ) {',
'    $(''#instructions div'').html(''<p>Enter the skillsets that you would like to update all of the selected users to.</p>'');',
'    $(''#P11_ACTION_CONTAINER'').show();',
'    $s(''P11_ACTION'',''CHANGE_SKILLSETS'');',
'    $(''#P11_NEW_SKILLSETS_CONTAINER'').show();',
'}'))
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2721925394342631356)
,p_name=>'Set Value in Session State'
,p_event_sequence=>80
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P11_NEW_LOCKED_STATUS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(2721925446383631357)
,p_event_id=>wwv_flow_imp.id(2721925394342631356)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P11_NEW_LOCKED_STATUS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(2713397678834666251)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Create Preview Collection'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_user_id        number;',
'    l_action         varchar2(30);',
'    l_old_value      varchar2(30);',
'    l_new_value      varchar2(30);',
'    l_username       varchar2(255);',
'begin',
'    apex_collection.create_or_truncate_collection(p_collection_name => ''PREVIEW_USERS'');',
'    l_action := initcap( replace( :P11_ACTION, ''_'', '' '' ) );',
'    for i in 1..apex_application.g_f01.count',
'    loop',
'        l_user_id := apex_application.g_f01(i);',
'        for c1 in',
'        (',
'            select case',
'                       when :P11_ACTION = ''CHANGE_ACL'' then',
'                           (select access_level from eba_proj_status_access_levels where id = u.access_level_id)',
'                       when :P11_ACTION = ''CHANGE_COUNTRY'' then',
'                           (select country_name from eba_proj_countries where id = u.country_id)',
'                       when :P11_ACTION = ''CHANGE_REGION'' then',
'                           (select region_name from eba_proj_regions where id = u.region_id)',
'                       when :P11_ACTION = ''CHANGE_TZ'' then',
'                           u.home_timezone',
'                       when :P11_ACTION = ''CHANGE_BG_CHKS'' then',
'                           u.bg_checks',
'                       when :P11_ACTION = ''CHANGE_SKILLSETS'' then',
'                           u.skillsets',
'                       when :P11_ACTION = ''CHANGE_TEAM_GRPS'' then',
'                           u.team_groups',
'                       when :P11_ACTION = ''CHANGE_LOCKED_STATUS'' then',
'                           u.account_locked',
'                   end as old_value,',
'                   case',
'                       when :P11_ACTION = ''CHANGE_ACL'' then',
'                           (select access_level from eba_proj_status_access_levels where id = :P11_NEW_ACCESS_LEVEL)',
'                       when :P11_ACTION = ''CHANGE_COUNTRY'' then',
'                           (select country_name from eba_proj_countries where id = :P11_NEW_COUNTRY)',
'                       when :P11_ACTION = ''CHANGE_REGION'' then',
'                           (select region_name from eba_proj_regions where id = :P11_NEW_REGION)',
'                       when :P11_ACTION = ''CHANGE_TZ'' then',
'                           :P11_NEW_TZ',
'                       when :P11_ACTION = ''CHANGE_BG_CHKS'' then',
'                           :P11_NEW_BG_CHKS',
'                       when :P11_ACTION = ''CHANGE_SKILLSETS'' then',
'                           :P11_NEW_SKILLSETS',
'                       when :P11_ACTION = ''CHANGE_TEAM_GRPS'' then',
'                           :P11_NEW_TEAM_GRPS',
'                       when :P11_ACTION = ''CHANGE_LOCKED_STATUS'' then',
'                           :P11_NEW_LOCKED_STATUS',
'                   end as new_value,',
'                   u.username',
'              from eba_proj_status_users u',
'             where u.id = l_user_id',
'        )',
'        loop',
'            l_old_value  := c1.old_value;',
'            l_new_value  := c1.new_value;',
'            l_username   := c1.username;',
'        end loop;',
'        apex_collection.add_member (',
'            p_collection_name => ''PREVIEW_USERS'',',
'            p_n001            => l_user_id,',
'            p_c001            => replace(replace(replace(replace(replace(l_action, ''Tz'', ''Timezone'') ,''Bg'', ''Background''), ''Chks'', ''Check(s)''), ''Grps'', ''Group(s)''), ''Acl'', ''Access Level''),',
'            p_c002            => l_old_value,',
'            p_c003            => l_new_value,',
'            p_c004            => l_username',
'        );',
'    end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(20466778735194189931)
,p_internal_uid=>2713397678834666251
);
wwv_flow_imp.component_end;
end;
/
