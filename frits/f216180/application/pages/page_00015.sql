prompt --application/pages/page_00015
begin
--   Manifest
--     PAGE: 00015
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.5'
,p_default_workspace_id=>30014105435788499543
,p_default_application_id=>216180
,p_default_id_offset=>0
,p_default_owner=>'WKSP_NTIAPPS'
);
wwv_flow_imp_page.create_page(
 p_id=>15
,p_name=>'Master Data Employee'
,p_alias=>'MASTER-DATA-EMPLOYEE'
,p_step_title=>'Master Data Employee'
,p_autocomplete_on_off=>'OFF'
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38409410177183619412)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(30016890816650567701)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(30015774598384567639)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(30016953640354567734)
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(38409410762857619412)
,p_plug_name=>'Master Data Employee'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(30016868628684567691)
,p_plug_display_sequence=>10
,p_query_type=>'TABLE'
,p_query_table=>'EMP_1'
,p_include_rowid_column=>false
,p_plug_source_type=>'NATIVE_IR'
,p_prn_page_header=>'Master Data Employee'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(38409410871322619412)
,p_name=>'Master Data Employee'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No data found.'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_detail_link_text=>'<img src="#APEX_FILES#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_allow_exclude_null_values=>'N'
,p_allow_hide_extra_columns=>'N'
,p_owner=>'IWAN.HERDIAN.ERP@GMAIL.COM'
,p_internal_uid=>38409410871322619412
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38409411606479619460)
,p_db_column_name=>'EMPNO'
,p_display_order=>0
,p_is_primary_key=>'Y'
,p_column_identifier=>'A'
,p_column_label=>'Empno'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38409412058892619461)
,p_db_column_name=>'EMP_NAME'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Employee Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38409412420177619461)
,p_db_column_name=>'MGR'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'MGR'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38409412888434619461)
,p_db_column_name=>'NAMA_KARYAWAN'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Nama Karyawan'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38409413218069619461)
,p_db_column_name=>'NIK_KARYAWAN'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'NIK Karyawan'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38409413630623619461)
,p_db_column_name=>'NAMA_SUPERVISOR'
,p_display_order=>6
,p_column_identifier=>'F'
,p_column_label=>'Nama Supervisor'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38409414055443619462)
,p_db_column_name=>'NIK_SUPERVISOR'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'NIK Supervisor'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(38409414450499619462)
,p_db_column_name=>'PATH_IT'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Path IT'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(38409424611466622021)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'384094247'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EMPNO:EMP_NAME:MGR:NAMA_KARYAWAN:NIK_KARYAWAN:NAMA_SUPERVISOR:NIK_SUPERVISOR:PATH_IT'
);
wwv_flow_imp.component_end;
end;
/
