prompt --application/pages/page_00089
begin
--   Manifest
--     PAGE: 00089
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
 p_id=>89
,p_name=>'Access Control List'
,p_page_mode=>'MODAL'
,p_step_title=>'Access Control List'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847526696754426930)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_role=>wwv_flow_imp.id(7197408082264470529)
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>When Access Control is enabled, Administrators have the ability to restrict access to certain application features, for authenticated users. This application supports the following 4 access levels; Reader, Contributor, Administrator, and Super Adm'
||'in.</p>',
'<ul>',
'  <li><strong>Readers</strong> have read-only access to all project information and can also view reports.</li>',
'  <li><strong>Contributors</strong> can create, edit and delete projects and view reports.</li>',
'  <li><strong>Administrators</strong>, in addition to Contributor''s capability, can also perform configuration of access control, and installing or uninstalling sample data.</li>',
'  <li><strong>Super Admins</strong>, in addition to Administrator''s capability, can view and edit all projects, regardless of their restriction status.</li>',
'</ul>'))
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2713430837764930142)
,p_plug_name=>'Username Format & Mass Update Link'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_muut_text varchar2(1000) := '' You can update selected attributes for multiple users using the <a href="f?p=&APP_ID.:11:&APP_SESSION.:">Mass Update Users</a> tool.'';',
'begin',
'    if eba_proj_fw.get_preference_value (''USERNAME_FORMAT'') = ''EMAIL'' then',
'        sys.htp.prn(',
'            replace(',
'                apex_lang.message(''EMAIL_USERNAME_FORMAT_MSG'',:APP_ID,43,:APP_SESSION),',
'                ''#IMAGE_PREFIX''||''#'',',
'                :image_prefix',
'            ) || l_muut_text',
'        );',
'    else',
'        sys.htp.prn(',
'            replace(',
'                apex_lang.message(''STRING_USERNAME_FORMAT_MSG'',:APP_ID,43,:APP_SESSION),',
'                ''#IMAGE_PREFIX''||''#'',',
'                :image_prefix',
'            ) || l_muut_text',
'        );',
'    end if;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7759569204802663431)
,p_plug_name=>'Manage Access Control List'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672356271346369882)
,p_plug_display_sequence=>40
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id, lower(username) username,',
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
'    email_address,',
'    null actions,',
'    decode(access_level_id,0,''<a href="''||',
'           apex_util.prepare_url(''f?p=''||:APP_ID||'':90:''||:APP_SESSION||''::NO::P90_ID:''||id)',
'           ||''" class="t-Button t-Button--small t-Button--padLeft">Grant Access</a>'') grant_access',
'from eba_proj_status_users '))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_content_disposition=>'ATTACHMENT'
,p_prn_units=>'INCHES'
,p_prn_paper_size=>'LETTER'
,p_prn_width=>8.5
,p_prn_height=>11
,p_prn_orientation=>'HORIZONTAL'
,p_prn_page_header_font_color=>'#000000'
,p_prn_page_header_font_family=>'Helvetica'
,p_prn_page_header_font_weight=>'normal'
,p_prn_page_header_font_size=>'12'
,p_prn_page_footer_font_color=>'#000000'
,p_prn_page_footer_font_family=>'Helvetica'
,p_prn_page_footer_font_weight=>'normal'
,p_prn_page_footer_font_size=>'12'
,p_prn_header_bg_color=>'#9bafde'
,p_prn_header_font_color=>'#000000'
,p_prn_header_font_family=>'Helvetica'
,p_prn_header_font_weight=>'normal'
,p_prn_header_font_size=>'10'
,p_prn_body_bg_color=>'#efefef'
,p_prn_body_font_color=>'#000000'
,p_prn_body_font_family=>'Helvetica'
,p_prn_body_font_weight=>'normal'
,p_prn_body_font_size=>'10'
,p_prn_border_width=>.5
,p_prn_page_header_alignment=>'CENTER'
,p_prn_page_footer_alignment=>'CENTER'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(7759569409556663432)
,p_name=>'Users'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>' '
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'C'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link=>'f?p=&APP_ID.:90:&SESSION.::&DEBUG.::P90_ID:#ID#'
,p_detail_link_text=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_owner=>'PMANIRAHO'
,p_internal_uid=>2563342727297046674
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7759569505930663435)
,p_db_column_name=>'USERNAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Username'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7759569601927663437)
,p_db_column_name=>'ACCESS_LEVEL_ID'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Access Level'
,p_column_html_expression=>'#ACCESS_LEVEL_ID# #GRANT_ACCESS#'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_static_id=>'col_access_level'
,p_rpt_named_lov=>wwv_flow_imp.id(6973296698397799216)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7759569689439663438)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7759569812042663438)
,p_db_column_name=>'CREATED'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7759569901894663438)
,p_db_column_name=>'ID'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(7759570008460663438)
,p_db_column_name=>'ACCOUNT_LOCKED'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Account Locked'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8223042056260552057)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>20
,p_column_identifier=>'K'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8223042162760552058)
,p_db_column_name=>'UPDATED'
,p_display_order=>30
,p_column_identifier=>'L'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'Since'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8223042216778552059)
,p_db_column_name=>'PHONE_01'
,p_display_order=>40
,p_column_identifier=>'M'
,p_column_label=>'Primary Phone'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8223042397716552060)
,p_db_column_name=>'PHONE_02'
,p_display_order=>50
,p_column_identifier=>'N'
,p_column_label=>'Alternate Phone'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8223042507689552061)
,p_db_column_name=>'TITLE'
,p_display_order=>60
,p_column_identifier=>'O'
,p_column_label=>'Title'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8223042534361552062)
,p_db_column_name=>'ADDRESS'
,p_display_order=>70
,p_column_identifier=>'P'
,p_column_label=>'Address'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(8223042629290552063)
,p_db_column_name=>'NOTE'
,p_display_order=>80
,p_column_identifier=>'Q'
,p_column_label=>'Note'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11466362434727344414)
,p_db_column_name=>'ASSISTANT_NAME'
,p_display_order=>90
,p_column_identifier=>'R'
,p_column_label=>'Assistant'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(2705749400803732907)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11466362568334344415)
,p_db_column_name=>'ASSISTANT_PHONE'
,p_display_order=>100
,p_column_identifier=>'S'
,p_column_label=>'Assistant Phone'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(2705749400803732907)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(11466362653960344416)
,p_db_column_name=>'EMAIL_ADDRESS'
,p_display_order=>110
,p_column_identifier=>'T'
,p_column_label=>'Email'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15063041026483143538)
,p_db_column_name=>'ACTIONS'
,p_display_order=>120
,p_column_identifier=>'U'
,p_column_label=>'<span class="u-VisuallyHidden">Actions</span>'
,p_column_html_expression=>'#GRANT_ACCESS#'
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
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'NEVER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(15063041149115143539)
,p_db_column_name=>'GRANT_ACCESS'
,p_display_order=>130
,p_column_identifier=>'V'
,p_column_label=>'Grant access'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2661937409585730473)
,p_db_column_name=>'COUNTRY_ID'
,p_display_order=>140
,p_column_identifier=>'W'
,p_column_label=>'Country'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(18879629845899629495)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2661937584719730474)
,p_db_column_name=>'REGION_ID'
,p_display_order=>150
,p_column_identifier=>'X'
,p_column_label=>'Region'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(18874496462088660444)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2661937624518730475)
,p_db_column_name=>'HOME_TIMEZONE'
,p_display_order=>160
,p_column_identifier=>'Y'
,p_column_label=>'Timezone'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2661937738203730476)
,p_db_column_name=>'TEAM_GROUPS'
,p_display_order=>170
,p_column_identifier=>'Z'
,p_column_label=>'Team Group(s)'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(2661829695961054886)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2661937904724730477)
,p_db_column_name=>'SKILLSETS'
,p_display_order=>180
,p_column_identifier=>'AA'
,p_column_label=>'Skillset(s)'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(2661829854737059914)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2661937942950730478)
,p_db_column_name=>'BG_CHECKS'
,p_display_order=>190
,p_column_identifier=>'AB'
,p_column_label=>'Background Checks'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(2661830040094079007)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2661938095073730479)
,p_db_column_name=>'HIPPA_CERT_DATE'
,p_display_order=>200
,p_column_identifier=>'AC'
,p_column_label=>'HIPPA Certified On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'DD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(2661830257654087551)
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(7759570094207663439)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'25633435'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'USERNAME:ACCESS_LEVEL_ID:ACCOUNT_LOCKED:CREATED_BY:UPDATED_BY:ACTIONS:UPDATED:'
,p_sort_column_1=>'USERNAME'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'CREATED'
,p_sort_direction_2=>'DESC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(7773308990933609412)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7795300394842336967)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(7759569204802663431)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.:89,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5909266792979835461)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(7759569204802663431)
,p_button_name=>'BULK_ADD_USERS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Add Multiple Users'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:103:&SESSION.::&DEBUG.:103,104::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(7759570289232663440)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(7759569204802663431)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add User'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:90:&SESSION.::&DEBUG.:90::'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(6046435484694298044)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(417230938384456676)
,p_name=>'Refresh on Add'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(7759570289232663440)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(417231007870456677)
,p_event_id=>wwv_flow_imp.id(417230938384456676)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7759569204802663431)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(417231146843456678)
,p_name=>'Refresh on Bulk Add'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(5909266792979835461)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(417231235314456679)
,p_event_id=>wwv_flow_imp.id(417231146843456678)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7759569204802663431)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(417231390516456680)
,p_name=>'Refresh on Edit'
,p_event_sequence=>30
,p_triggering_element_type=>'REGION'
,p_triggering_region_id=>wwv_flow_imp.id(7759569204802663431)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(417231405961456681)
,p_event_id=>wwv_flow_imp.id(417231390516456680)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(7759569204802663431)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
