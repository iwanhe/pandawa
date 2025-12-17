prompt --application/pages/page_00031
begin
--   Manifest
--     PAGE: 00031
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_page.create_page(
 p_id=>31
,p_name=>'Access Control List'
,p_page_mode=>'MODAL'
,p_step_title=>'Access Control List'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320025862308027790)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_role=>wwv_flow_imp.id(3204234467922058482)
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>When Access Control is enabled, Administrators have the ability to restrict access to certain application features, for authenticated users. Incident Tracking supports the following 3 access levels; Reader, Contributor and Administrator. <b>Reader'
||'s</b> have read-only access and can also view reports. <b>Contributors</b> can create, edit, delete and view reports. <b>Administrators</b>, in addition to Contributor''s capability, can also perform Incident Tracking administration, including configu'
||'ration of access control, managing application look-up data and installing or uninstalling sample data.</p>',
'<p>Click the <strong>Add Multiple Users</strong> button to add multiple users. Click the <strong>Add User</strong> button to add a one user at a time.</p>'))
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2778629246060744391)
,p_plug_name=>'Manage Access Control List'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609178411209051992)
,p_plug_display_sequence=>40
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id,',
'    username,',
'    access_level_id,',
'    case when account_locked = ''Y'' then ''Yes'' else ''No'' end account_locked,',
'    created_by,',
'    created',
'from eba_intrack_users u'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(2778629448928744392)
,p_name=>'Users'
,p_max_row_count=>'100000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No data found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML'
,p_enable_mail_download=>'Y'
,p_owner=>'MIKE'
,p_internal_uid=>2110067906915647973
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2778629665560744399)
,p_db_column_name=>'ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2778629742284744399)
,p_db_column_name=>'USERNAME'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Username'
,p_column_link=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:RP:P32_ID:#ID#'
,p_column_linktext=>'#USERNAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2778629844216744399)
,p_db_column_name=>'ACCESS_LEVEL_ID'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Access Level'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_rpt_named_lov=>wwv_flow_imp.id(3204240753141134935)
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2778629963490744400)
,p_db_column_name=>'ACCOUNT_LOCKED'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Account Locked'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2778630146473744400)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(2778630242123744400)
,p_db_column_name=>'CREATED'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(2778635466683744627)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'21100740'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'USERNAME:ACCESS_LEVEL_ID:ACCOUNT_LOCKED:CREATED_BY:CREATED:'
,p_sort_column_1=>'CREATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'USERNAME'
,p_sort_direction_2=>'ASC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1348360372891106888)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(2778629246060744391)
,p_button_name=>'RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_button_image_alt=>'Reset'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.,RIR::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(1436222774112547553)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(2778629246060744391)
,p_button_name=>'BULK_ADD_USERS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_image_alt=>'Add Multiple Users'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:73,74::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2778630652316744401)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(2778629246060744391)
,p_button_name=>'CREATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add User'
,p_button_position=>'RIGHT_OF_IR_SEARCH_BAR'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:32::'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(1518753850985425194)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(1728651583150955845)
,p_name=>'Refresh Report'
,p_event_sequence=>10
,p_triggering_element_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_element=>'window'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1728652046158955846)
,p_event_id=>wwv_flow_imp.id(1728651583150955845)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(2778629246060744391)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(1728652538278955847)
,p_event_id=>wwv_flow_imp.id(1728651583150955845)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'apex.message.showPageSuccess(''Action Processed.'');'
);
wwv_flow_imp.component_end;
end;
/
