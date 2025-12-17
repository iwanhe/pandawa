prompt --application/pages/page_00061
begin
--   Manifest
--     PAGE: 00061
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
 p_id=>61
,p_name=>'Page Privileges'
,p_page_mode=>'MODAL'
,p_step_title=>'Page Privileges'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(3204235665975067375)
,p_page_template_options=>'#DEFAULT#:ui-dialog--stretch:t-Dialog--noPadding'
,p_required_role=>wwv_flow_imp.id(3204234467922058482)
,p_help_text=>'<p>The Page Privileges report shows the roles required to access each page in this application and which pages do not require authentication (the user to be logged in). It is organized by Page Group which loosely corresponds to the tab to which the p'
||'age is associated. Click the <strong>Reset</strong> button to reset the interactive report. Click the <strong>Actions</strong> button to define the number of rows displayed per page, filter, format, download, and/or save the interactive report.</p>'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(1320023548274027024)
,p_plug_name=>'Application Page Security'
,p_region_template_options=>'#DEFAULT#:t-IRR-region--noBorders'
,p_plug_template=>wwv_flow_imp.id(1609178411209051992)
,p_plug_display_sequence=>10
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select page_id, ',
'       page_id||''. ''||page_name page_title, ',
'       page_group, ',
'       page_function, ',
'       nvl(initcap(replace(authorization_scheme,''_'','' '')),''No Scheme Applied'') authorization_scheme, ',
'       page_requires_authentication requires_auth,',
'       build_option',
'from apex_application_pages',
'where application_id =  :APP_ID',
'    and page_function != ''Global Page'''))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(1320023750784027024)
,p_name=>'Report 1'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
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
,p_internal_uid=>651462208770930605
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1320023860226027025)
,p_db_column_name=>'PAGE_ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Page'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1320023946294027026)
,p_db_column_name=>'PAGE_TITLE'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Page Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1320024050741027026)
,p_db_column_name=>'PAGE_FUNCTION'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Function'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1320024160842027026)
,p_db_column_name=>'AUTHORIZATION_SCHEME'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Role'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1320024270814027026)
,p_db_column_name=>'REQUIRES_AUTH'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Requires Authentication'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1320024344633027027)
,p_db_column_name=>'PAGE_GROUP'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Page Group'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(1320024442487027027)
,p_db_column_name=>'BUILD_OPTION'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Build Option'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(1320024559334027027)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6514631'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'PAGE_GROUP:PAGE_ID:PAGE_TITLE:PAGE_FUNCTION:AUTHORIZATION_SCHEME:REQUIRES_AUTH:BUILD_OPTION'
,p_sort_column_1=>'PAGE_GROUP'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'PAGE_ID'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'0'
,p_sort_direction_3=>'ASC'
,p_sort_column_4=>'0'
,p_sort_direction_4=>'ASC'
,p_sort_column_5=>'0'
,p_sort_direction_5=>'ASC'
,p_sort_column_6=>'0'
,p_sort_direction_6=>'ASC'
);
wwv_flow_imp.component_end;
end;
/
