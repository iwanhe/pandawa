prompt --application/pages/page_00219
begin
--   Manifest
--     PAGE: 00219
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
 p_id=>219
,p_name=>'Tag Details'
,p_step_title=>'Tag Details'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486499525077695)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'<p>Click a tag to view the projects that referenced that tag.</p>'
,p_page_component_map=>'18'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(711447356010939480)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1993405599699027906)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(711447755590939484)
,p_plug_name=>'Attachments'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1120070264285054172)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select f.id,',
'       f.tags,',
'       p.id project_id,',
'    ''<span class="t-Icon file-icon fa ''',
'        ||decode(substr(upper(f.filename),-4),',
'            ''.PPT'', ''fa-file-powerpoint-o'',',
'            ''.XLS'', ''fa-file-excel-o'',',
'            ''.DOC'', ''fa-file-word-o'',',
'            ''.PDF'', ''fa-file-pdf-o'',',
'            ''.GIF'', ''fa-file-image-o'',',
'            ''.PNG'', ''fa-file-image-o'',',
'            ''.JPG'', ''fa-file-image-o'',',
'            decode(substr(upper(f.filename),-5),',
'                ''.PPTX'', ''fa-file-powerpoint-o'',',
'                ''.XLSX'', ''fa-file-excel-o'',',
'                ''.DOCX'', ''fa-file-word-o'',',
'                ''.TIFF'', ''fa-file-image-o'',',
'                    ''fa-file-o''))',
'        ||''"></span>'' as icon,',
'    f.filename,',
'    apex_util.prepare_url( eba_proj_fw.profile_url(f.created_by) ) as profile_url,',
'    apex_util.get_blob_file_src(''P43_FILE_BLOB'',f.id) as file_link,',
'    f.file_mimetype,',
'    f.file_charset,',
'    apex_util.filesize_mask(dbms_lob.getlength(file_blob)) file_size,',
'    dbms_lob.getlength(file_blob) f_len,',
'    decode(sign(length(f.file_comments)-100),',
'                1, substr(f.file_comments,1,100)||''...'',',
'                f.file_comments) file_comments,',
'    f.created,',
'    f.updated,',
'    decode( nvl(f.gold_yn, ''N''), ''N'', null, ''Y'', ''<span class="gold-marker"><span class="visuallyhidden">Gold</span></span>'') as gold_yn,',
'    eba_proj_fw.get_name_from_email_address(f.created_by) as created_by,',
'    (   select project',
'        from eba_proj_status s',
'        where s.id = f.project_id ) project,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':106:''||:APP_SESSION||'':::106:P200_ID,P106_ID,P106_PROJECT_ID:''||f.project_id||'',''||f.id||'',''||f.project_id) doc_link,',
'    null edit,',
'    null download_button',
'from eba_proj_status p,',
'     EBA_PROJ_STATUS_FILES f',
'where f.project_id = p.id',
'  and instr(f.tags,nvl(:P219_TAG,'' '')) > 0'))
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
 p_id=>wwv_flow_imp.id(711447821044939485)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No tagged Attachments found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'ALLAN'
,p_internal_uid=>645200816229816944
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(711447920305939486)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(711448049272939487)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Project id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738485983270397451)
,p_db_column_name=>'PROJECT'
,p_display_order=>30
,p_column_identifier=>'P'
,p_column_label=>'Project'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP,200:P200_ID:#PROJECT_ID#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(711448136874939488)
,p_db_column_name=>'ICON'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Icon'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(711448207638939489)
,p_db_column_name=>'FILENAME'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Filename'
,p_column_link=>'#DOC_LINK#'
,p_column_linktext=>'#FILENAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(711448367243939490)
,p_db_column_name=>'PROFILE_URL'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'Profile url'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(711448443963939491)
,p_db_column_name=>'FILE_LINK'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'File link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738485048554397442)
,p_db_column_name=>'FILE_MIMETYPE'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Mimetype'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738485188675397443)
,p_db_column_name=>'FILE_CHARSET'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Character Set'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738485240595397444)
,p_db_column_name=>'FILE_SIZE'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Size'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738485353545397445)
,p_db_column_name=>'F_LEN'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'F len'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738485420789397446)
,p_db_column_name=>'FILE_COMMENTS'
,p_display_order=>120
,p_column_identifier=>'K'
,p_column_label=>'Comments'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738485576706397447)
,p_db_column_name=>'CREATED'
,p_display_order=>130
,p_column_identifier=>'L'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738485654753397448)
,p_db_column_name=>'UPDATED'
,p_display_order=>140
,p_column_identifier=>'M'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738485786876397449)
,p_db_column_name=>'GOLD_YN'
,p_display_order=>150
,p_column_identifier=>'N'
,p_column_label=>'Gold?'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738485821535397450)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>160
,p_column_identifier=>'O'
,p_column_label=>'Created by'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738486010318397452)
,p_db_column_name=>'DOC_LINK'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Doc link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738486175607397453)
,p_db_column_name=>'EDIT'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Edit'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738486223795397454)
,p_db_column_name=>'DOWNLOAD_BUTTON'
,p_display_order=>190
,p_column_identifier=>'S'
,p_column_label=>'Download button'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738486357949397455)
,p_db_column_name=>'TAGS'
,p_display_order=>200
,p_column_identifier=>'T'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(738497156719423483)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6722502'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PROJECT:ICON:FILENAME:FILE_MIMETYPE:FILE_CHARSET:FILE_SIZE:FILE_COMMENTS:TAGS:CREATED:UPDATED:CREATED_BY:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(738486684760397458)
,p_plug_name=>'Updates'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1120070264285054172)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select u.id,',
'    p.id project_id,',
'    t.status_update_type update_type,',
'    eba_proj_fw.conv_txt_html(',
'        regexp_replace(nvl(u.formatted_update,u.status_update),',
'                       ''##BREAK##.*'',''<br />...<a href="''||apex_util.prepare_url(''f?p=''||:APP_ID||'':129:''||:APP_SESSION',
'                                                        ||''::NO:129:P200_ID,P129_ID,P129_PROJECT_ID:''',
'                                                        ||u.project_id||'',''||u.id||'',''||u.project_id)||''">View More</a>'',',
'                      1,0,''n'')',
'    ) || ',
'    decode(u.gold_yn, null, '' '', ''N'', '' '', ''Y'', ''<br><span class="t-Badge t-Badge--orb t-Badge--small is-warning">Gold</span>'') as status_update,',
'    ''f?p=''||:APP_ID||'':129:''||:app_session',
'        ||'':::129:P200_ID,P129_ID,P129_PROJECT_ID:''',
'        ||p.id||'',''||u.id||'',''||p.id link,',
'    lower(u.update_owner) status_owner,',
'    u.updated update_date,',
'    eba_proj_fw.get_name_from_email_address(u.update_owner) as update_owner,',
'    (   select listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '') within group',
'            (order by nvl(rf.acl_status_level,r.default_acl_status_level) desc, lower(u.username))',
'        from eba_proj_user_ref rf,',
'            eba_proj_status_users u,',
'            eba_proj_roles r',
'        where rf.project_id = p.id',
'            and rf.user_id = u.id',
'            and rf.role_id = r.id',
'            and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'' ) as owner,',
'    p.project,',
'    s.status_short_desc status,',
'    decode(s.is_closed_status,''Y'',''black'',col.color_name) color_code,',
'    apex_util.get_since(u.updated) as updated,',
'    u.tags,',
'    u.created,',
'    u.created_by,',
'    nvl(eba_proj_fw.get_project_rowkey(p_project_id => p.id), p.row_key) as row_key,',
'    u.row_key update_key',
'from eba_proj_status_updates u,',
'    eba_proj_status_update_types t,',
'    eba_proj_status p,',
'    eba_proj_status_codes s,',
'    eba_proj_color_codes col',
'where p.id = u.project_id',
'    and p.PROJECT_STATUS = s.id(+)',
'    and col.id(+) = s.color_code_id',
'    and u.update_type = t.id',
'    and instr(u.tags,nvl(:P219_TAG,'' '')) > 0',
'order by',
'    u.created desc, p.project'))
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
 p_id=>wwv_flow_imp.id(738486751070397459)
,p_max_row_count=>'1000000'
,p_no_data_found_message=>'No tagged Updates found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'ALLAN'
,p_internal_uid=>672239746255274918
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738486821328397460)
,p_db_column_name=>'ID'
,p_display_order=>10
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738486957644397461)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>20
,p_column_identifier=>'B'
,p_column_label=>'Project id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738487084312397462)
,p_db_column_name=>'UPDATE_TYPE'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Update Type'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738487130748397463)
,p_db_column_name=>'STATUS_UPDATE'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Status Update'
,p_column_link=>'#LINK#'
,p_column_linktext=>'#STATUS_UPDATE#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738487276772397464)
,p_db_column_name=>'LINK'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Link'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738487327215397465)
,p_db_column_name=>'STATUS_OWNER'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Status Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738487459478397466)
,p_db_column_name=>'UPDATE_DATE'
,p_display_order=>70
,p_column_identifier=>'G'
,p_column_label=>'Update Date'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738487594482397467)
,p_db_column_name=>'UPDATE_OWNER'
,p_display_order=>80
,p_column_identifier=>'H'
,p_column_label=>'Update Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738487619191397468)
,p_db_column_name=>'OWNER'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738487786959397469)
,p_db_column_name=>'PROJECT'
,p_display_order=>100
,p_column_identifier=>'J'
,p_column_label=>'Project'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP,200:P200_ID:#PROJECT_ID#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738487829031397470)
,p_db_column_name=>'STATUS'
,p_display_order=>110
,p_column_identifier=>'K'
,p_column_label=>'Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738487955177397471)
,p_db_column_name=>'COLOR_CODE'
,p_display_order=>120
,p_column_identifier=>'L'
,p_column_label=>'Color Code'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738488021881397472)
,p_db_column_name=>'UPDATED'
,p_display_order=>130
,p_column_identifier=>'M'
,p_column_label=>'Updated'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738488135457397473)
,p_db_column_name=>'CREATED'
,p_display_order=>140
,p_column_identifier=>'N'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_column_alignment=>'CENTER'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738488257006397474)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>150
,p_column_identifier=>'O'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738488401000397475)
,p_db_column_name=>'ROW_KEY'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Row key'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738488472208397476)
,p_db_column_name=>'UPDATE_KEY'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Update key'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738488596110397477)
,p_db_column_name=>'TAGS'
,p_display_order=>180
,p_column_identifier=>'R'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(743223325368675472)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6769764'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'STATUS_UPDATE:UPDATE_TYPE:STATUS_OWNER:PROJECT:OWNER:STATUS:TAGS:CREATED:CREATED_BY:UPDATE_OWNER:UPDATED:'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(738488683770397478)
,p_plug_name=>'RDS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'SESSION')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9535618503543596146)
,p_plug_name=>'Projects'
,p_region_name=>'IR'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1120070264285054172)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    s.ID,',
'    sysdate as curr_date,',
'    s.PROJECT  project,',
'    s.code_name,',
'    s.headline,',
'    s.headline_last_updated,',
'    s.requesting_team,',
'    s.impacted_environment,',
'    s.deal_type_id as deal_type,',
'    decode(s.parent_project_id,null,null,',
'    (select project from eba_proj_status p where p.id = s.parent_project_id)) parent_project,',
'    s.row_key,',
'    (select ''background-color:'' || cc.color_code || '';'' from eba_proj_color_codes cc where cc.id = c.COLOR_CODE_ID) as status_color,',
'    s.project_customer as customer,',
'    decode((select count(*) from EBA_PROJ_STATUS_FAVORITES f where f.content_id = s.id and f.user_name = upper(:APP_USER)),0,''No'',''Yes'') following,',
'    (   select listagg(lower(u.username),'', '') within group',
'                (order by nvl(rf.acl_status_level,r.default_acl_status_level) desc, lower(u.username)) as owners',
'            from eba_proj_user_ref rf,',
'                eba_proj_status_users u,',
'                eba_proj_roles r',
'            where rf.project_id = s.id',
'                and rf.user_id = u.id',
'                and rf.role_id = r.id',
'                and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'' ) as users,',
'    (   select listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '') within group',
'                (order by nvl(rf.acl_status_level,r.default_acl_status_level) desc, lower(u.username)) as owners',
'            from eba_proj_user_ref rf,',
'                eba_proj_status_users u,',
'                eba_proj_roles r',
'            where rf.project_id = s.id',
'                and rf.user_id = u.id',
'                and rf.role_id = r.id',
'                and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'' ) as owner,',
'    (select category from EBA_PROJ_STATUS_CATS pc where s.cat_id = pc.id) category,',
'    s.project_status as status,',
'    (select count(*) from EBA_PROJ_STATUS_UPDATES u where u.project_id = s.id) updates,',
'    (select count(*) from EBA_PROJ_STATUS_UPDATES u where u.project_id = s.id and created > current_date- 7) updates_1w,',
'    (select count(*) from EBA_PROJ_STATUS_AIS a where a.project_id = s.id) action_items,',
'    (select count(*) from EBA_PROJ_STATUS_AIS a where a.project_id = s.id and a.action_status = ''Open'') open_action_items,',
'    (select count(*) from EBA_PROJ_STATUS_AIS a where a.project_id = s.id and a.action_status = ''Open'' and a.due_date < trunc(current_date)) past_due_action_items,',
'    (select count(*) from eba_proj_status_ms m where m.project_id = s.id) milestones,',
'    (select count(*) from eba_proj_status_ms m where m.project_id = s.id and m.milestone_status = ''Open'') open_milestones,',
'    (select count(*) from eba_proj_status_ms m where m.project_id = s.id and m.milestone_status = ''Open'' and m.milestone_date < trunc(current_date)) past_due_milestones,',
'    next_milestones.MILESTONE_NAME as next_milestone,',
'    next_milestones.MILESTONE_DATE as milestone_date,',
'    s.goal,',
'    decode(s.url,null,null,''<a href="''||apex_escape.html(url)||''" target="TOP" alt="open URL">''||',
'         ''<img src="#IMAGE_PREFIX#menu/go_button_16x16.gif"></a>'') url,',
'    s.CREATED,',
'    s.CREATED_BY,',
'    nvl(s.UPDATED,s.created) updated,',
'    s.UPDATED_BY,',
'    decode(eba_proj_stat_ui.is_project_open(s.id), 0, ''Closed'', 1, ''Open'') as open_closed,',
'    apex_util.prepare_url(''f?p=''||:app_id||'':20:''||:app_session||'':::20:P20_ID:''||apex_escape.html(s.id)) email_link,',
'    decode(INCLUDE_BY_DEFAULT_YN,''Y'',''Yes'',''N'',''No'',''No'') inc,',
'    tags,',
'    (select max(CREATED) from EBA_PROJ_STATUS_VERIFICATIONS v ',
'     where v.project_id = s.id) last_verification,',
'    (   select case when dbms_lob.getlength(status_update) > 3950',
'            then dbms_lob.substr(status_update,3950)||''...''',
'            else cast(status_update as varchar2(4000))',
'        end as status_update',
'        from eba_proj_status_updates',
'        where update_date=(select max(update_date)',
'                           from EBA_PROJ_STATUS_UPDATES u',
'                           where u.project_id = s.id)) latest_status_update,',
'    eba_proj_flex_fw.fetch_v(''PROJECT_FLEX_01'',s.project_flex_01) project_flex_01,',
'    eba_proj_flex_fw.fetch_v(''PROJECT_FLEX_02'',s.project_flex_02) project_flex_02,',
'    eba_proj_flex_fw.fetch_v(''PROJECT_FLEX_03'',s.project_flex_03) project_flex_03,',
'    eba_proj_flex_fw.fetch_v(''PROJECT_FLEX_04'',s.project_flex_04) project_flex_04,',
'    eba_proj_flex_fw.fetch_v(''PROJECT_FLEX_05'',s.project_flex_05) project_flex_05,',
'    eba_proj_flex_fw.fetch_v(''PROJECT_FLEX_06'',s.project_flex_06) project_flex_06,',
'    eba_proj_flex_fw.fetch_v(''PROJECT_FLEX_07'',s.project_flex_07) project_flex_07,',
'    eba_proj_flex_fw.fetch_v(''PROJECT_FLEX_08'',s.project_flex_08) project_flex_08,',
'    eba_proj_flex_fw.fetch_n(''PROJECT_FLEX_N01'',s.project_flex_n01) project_flex_n01,',
'    eba_proj_flex_fw.fetch_n(''PROJECT_FLEX_N02'',s.project_flex_n02) project_flex_n02,',
'    eba_proj_flex_fw.fetch_n(''PROJECT_FLEX_N03'',s.project_flex_n03) project_flex_n03,',
'    eba_proj_flex_fw.fetch_n(''PROJECT_FLEX_N04'',s.project_flex_n04) project_flex_n04,',
'    s.project_flex_d01,',
'    s.project_flex_d02,',
'    s.project_flex_d03,',
'    s.project_flex_d04,',
'    s.project_flex_d05,',
'    s.project_flex_d06,',
'    s.project_flex_d07,',
'    s.project_flex_d08,',
'    s.project_flex_d09,',
'    s.project_flex_d10,',
'    s.project_flex_d11,',
'    s.project_flex_d12,',
'    s.project_flex_clob',
'from EBA_PROJ_STATUS s,',
'     eba_proj_status_codes c,',
'    (   select ms.project_id, ms.milestone_date, ms.milestone_name,',
'            row_number() over (partition by ms.project_id',
'            order by ms.milestone_date) rownumber',
'        from eba_proj_status_ms ms',
'        where ms.milestone_status = ''Open'' ) next_milestones',
'where c.id = s.PROJECT_STATUS(+) and s.project is not null',
'    and instr(s.tags,nvl(:P219_TAG,'' '')) > 0',
'    and s.id = next_milestones.project_id(+)',
'    and next_milestones.rownumber(+) = 1',
'',
'',
''))
,p_plug_source_type=>'NATIVE_IR'
,p_prn_output_show_link=>'Y'
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
 p_id=>wwv_flow_imp.id(9535618732251596146)
,p_name=>'Projects'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than 10,000 rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No tagged Projects found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_show_nulls_as=>' '
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_description=>'Projects Report'
,p_owner=>'MIKE'
,p_internal_uid=>9469371727436473605
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738243385050188929)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738243792988188930)
,p_db_column_name=>'PROJECT'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Project'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:200:P200_ID:#ID#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738244140221188931)
,p_db_column_name=>'OWNER'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'People'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738244530158188933)
,p_db_column_name=>'NEXT_MILESTONE'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Next Milestone'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738244984538188936)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738245369875188937)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738245719541188938)
,p_db_column_name=>'CUSTOMER'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Customer'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738246140414188938)
,p_db_column_name=>'ROW_KEY'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Key'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738246597835188938)
,p_db_column_name=>'GOAL'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Goal'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738246921994188939)
,p_db_column_name=>'CATEGORY'
,p_display_order=>15
,p_column_identifier=>'O'
,p_column_label=>'&CAT_TITLE.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738247328113188940)
,p_db_column_name=>'URL'
,p_display_order=>16
,p_column_identifier=>'P'
,p_column_label=>'URL'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738247741968188941)
,p_db_column_name=>'UPDATES'
,p_display_order=>17
,p_column_identifier=>'Q'
,p_column_label=>'Updates'
,p_column_link=>'f?p=&APP_ID.:75:&SESSION.::&DEBUG.:RP,75:P75_PROJECT:#ID#'
,p_column_linktext=>'#UPDATES#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_format_mask=>'999G999G999G999G999G990'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738248175498188942)
,p_db_column_name=>'EMAIL_LINK'
,p_display_order=>18
,p_column_identifier=>'R'
,p_column_label=>'Email'
,p_column_link=>'#EMAIL_LINK#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#htmldb/icons/mail_20x.gif" alt="Email project people for status update">'
,p_column_type=>'STRING'
,p_column_alignment=>'CENTER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738248539082188944)
,p_db_column_name=>'TAGS'
,p_display_order=>20
,p_column_identifier=>'T'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_rpt_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tag',
'  from eba_proj_tags_type_sum',
' where tag_count > 0',
'   and content_type = ''STATUS'''))
,p_rpt_show_filter_lov=>'C'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738248906277188945)
,p_db_column_name=>'OPEN_ACTION_ITEMS'
,p_display_order=>21
,p_column_identifier=>'U'
,p_column_label=>'Open Action Items'
,p_column_link=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,49,CIR:IREQ_PROJECT,IREQ_ACTION_STATUS:\#PROJECT#\,Open'
,p_column_linktext=>'#OPEN_ACTION_ITEMS#'
,p_column_link_attr=>'title="#OPEN_ACTION_ITEMS# open action items"'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738249365471188945)
,p_db_column_name=>'PARENT_PROJECT'
,p_display_order=>22
,p_column_identifier=>'V'
,p_column_label=>'Parent Project'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Allow Parent Projects''',
'   and build_option_status = ''Include'''))
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738249772003188946)
,p_db_column_name=>'UPDATES_1W'
,p_display_order=>23
,p_column_identifier=>'W'
,p_column_label=>'Updates 1w'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738242923635188929)
,p_db_column_name=>'OPEN_CLOSED'
,p_display_order=>25
,p_column_identifier=>'Y'
,p_column_label=>'Project Open Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738232662260188911)
,p_db_column_name=>'PAST_DUE_ACTION_ITEMS'
,p_display_order=>27
,p_column_identifier=>'AA'
,p_column_label=>'Past Due Action Items'
,p_column_link=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,49,CIR:P49_PAST_DUE_YN,IR_PROJECT,IR_ACTION_STATUS,IRLT_DUE_DATE:Y,\#PROJECT#\,Open,#CURR_DATE#'
,p_column_linktext=>'#PAST_DUE_ACTION_ITEMS#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738233021806188911)
,p_db_column_name=>'OPEN_MILESTONES'
,p_display_order=>28
,p_column_identifier=>'AB'
,p_column_label=>'Open Milestones'
,p_column_link=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:RP,63,CIR:IR_MILESTONE_STATUS,IR_PROJECT:Open,\#PROJECT#\'
,p_column_linktext=>'#OPEN_MILESTONES#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738233408853188911)
,p_db_column_name=>'PAST_DUE_MILESTONES'
,p_display_order=>29
,p_column_identifier=>'AC'
,p_column_label=>'Past Due Milestones'
,p_column_link=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:RP,63,CIR:IR_MILESTONE_STATUS,IR_PROJECT,IRLT_MILESTONE_DATE:Open,\#PROJECT#\,#CURR_DATE#'
,p_column_linktext=>'#PAST_DUE_MILESTONES#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738233867029188912)
,p_db_column_name=>'MILESTONE_DATE'
,p_display_order=>30
,p_column_identifier=>'AD'
,p_column_label=>'Milestone Due Date'
,p_column_html_expression=>'<span style="white-space: pre;">#MILESTONE_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738234251594188912)
,p_db_column_name=>'CREATED'
,p_display_order=>31
,p_column_identifier=>'AE'
,p_column_label=>'Project Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'Since'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738234664693188916)
,p_db_column_name=>'UPDATED'
,p_display_order=>32
,p_column_identifier=>'AF'
,p_column_label=>'Project Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'Since'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738235075892188917)
,p_db_column_name=>'LAST_VERIFICATION'
,p_display_order=>33
,p_column_identifier=>'AG'
,p_column_label=>'Last Verification'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738235482539188918)
,p_db_column_name=>'FOLLOWING'
,p_display_order=>34
,p_column_identifier=>'AH'
,p_column_label=>'Following'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738235828400188919)
,p_db_column_name=>'PROJECT_FLEX_D01'
,p_display_order=>47
,p_column_identifier=>'AU'
,p_column_label=>'PROJECT_FLEX_D01'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_D01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738236230405188920)
,p_db_column_name=>'PROJECT_FLEX_D02'
,p_display_order=>48
,p_column_identifier=>'AV'
,p_column_label=>'PROJECT_FLEX_D02'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_D02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738236605823188921)
,p_db_column_name=>'PROJECT_FLEX_D03'
,p_display_order=>49
,p_column_identifier=>'AW'
,p_column_label=>'PROJECT_FLEX_D03'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_D03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738236944497188922)
,p_db_column_name=>'PROJECT_FLEX_D04'
,p_display_order=>50
,p_column_identifier=>'AX'
,p_column_label=>'PROJECT_FLEX_D04'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_D04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738229497330188904)
,p_db_column_name=>'PROJECT_FLEX_D05'
,p_display_order=>60
,p_column_identifier=>'BZ'
,p_column_label=>'Project flex d05'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_D05'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738229849918188905)
,p_db_column_name=>'PROJECT_FLEX_D06'
,p_display_order=>70
,p_column_identifier=>'CA'
,p_column_label=>'Project flex d06'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_D06'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738230261517188906)
,p_db_column_name=>'PROJECT_FLEX_D07'
,p_display_order=>80
,p_column_identifier=>'CB'
,p_column_label=>'Project flex d07'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_D07'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738230645966188906)
,p_db_column_name=>'PROJECT_FLEX_D08'
,p_display_order=>90
,p_column_identifier=>'CC'
,p_column_label=>'Project flex d08'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_D08'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738231076050188906)
,p_db_column_name=>'PROJECT_FLEX_D09'
,p_display_order=>100
,p_column_identifier=>'CD'
,p_column_label=>'Project flex d09'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_D09'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738231480055188908)
,p_db_column_name=>'PROJECT_FLEX_D10'
,p_display_order=>110
,p_column_identifier=>'CE'
,p_column_label=>'Project flex d10'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_D10'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738231860766188909)
,p_db_column_name=>'PROJECT_FLEX_D11'
,p_display_order=>120
,p_column_identifier=>'CF'
,p_column_label=>'Project flex d11'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_D11'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738232209001188910)
,p_db_column_name=>'PROJECT_FLEX_D12'
,p_display_order=>130
,p_column_identifier=>'CG'
,p_column_label=>'Project flex d12'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_D12'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738237375849188922)
,p_db_column_name=>'PROJECT_FLEX_CLOB'
,p_display_order=>140
,p_column_identifier=>'AY'
,p_column_label=>'PROJECT_FLEX_CLOB'
,p_display_in_default_rpt=>'N'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_CLOB'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738237783165188923)
,p_db_column_name=>'LATEST_STATUS_UPDATE'
,p_display_order=>150
,p_column_identifier=>'AZ'
,p_column_label=>'Latest Status Update'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738238106005188923)
,p_db_column_name=>'PROJECT_FLEX_01'
,p_display_order=>160
,p_column_identifier=>'BA'
,p_column_label=>'PROJECT_FLEX_01'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738238574357188924)
,p_db_column_name=>'PROJECT_FLEX_02'
,p_display_order=>170
,p_column_identifier=>'BB'
,p_column_label=>'PROJECT_FLEX_02'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738238918228188924)
,p_db_column_name=>'PROJECT_FLEX_03'
,p_display_order=>180
,p_column_identifier=>'BC'
,p_column_label=>'PROJECT_FLEX_03'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738239349661188925)
,p_db_column_name=>'PROJECT_FLEX_04'
,p_display_order=>190
,p_column_identifier=>'BD'
,p_column_label=>'PROJECT_FLEX_04'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738239716222188925)
,p_db_column_name=>'PROJECT_FLEX_05'
,p_display_order=>200
,p_column_identifier=>'BE'
,p_column_label=>'PROJECT_FLEX_05'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_05'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738240137480188925)
,p_db_column_name=>'PROJECT_FLEX_06'
,p_display_order=>210
,p_column_identifier=>'BF'
,p_column_label=>'PROJECT_FLEX_06'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_06'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738240520335188926)
,p_db_column_name=>'PROJECT_FLEX_07'
,p_display_order=>220
,p_column_identifier=>'BG'
,p_column_label=>'PROJECT_FLEX_07'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_07'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738240943680188926)
,p_db_column_name=>'PROJECT_FLEX_08'
,p_display_order=>230
,p_column_identifier=>'BH'
,p_column_label=>'PROJECT_FLEX_08'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_08'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738241324925188926)
,p_db_column_name=>'PROJECT_FLEX_N01'
,p_display_order=>240
,p_column_identifier=>'BI'
,p_column_label=>'PROJECT_FLEX_N01'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_N01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738241722624188927)
,p_db_column_name=>'PROJECT_FLEX_N02'
,p_display_order=>250
,p_column_identifier=>'BJ'
,p_column_label=>'PROJECT_FLEX_N02'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_N02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738242203367188927)
,p_db_column_name=>'PROJECT_FLEX_N03'
,p_display_order=>260
,p_column_identifier=>'BK'
,p_column_label=>'PROJECT_FLEX_N03'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_N03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738242556073188928)
,p_db_column_name=>'PROJECT_FLEX_N04'
,p_display_order=>270
,p_column_identifier=>'BL'
,p_column_label=>'PROJECT_FLEX_N04'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS'' and flexible_column = ''PROJECT_FLEX_N04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738250154716188946)
,p_db_column_name=>'INC'
,p_display_order=>280
,p_column_identifier=>'BM'
,p_column_label=>'Inc'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738251345048188947)
,p_db_column_name=>'CURR_DATE'
,p_display_order=>290
,p_column_identifier=>'BN'
,p_column_label=>'Curr date'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738250541963188946)
,p_db_column_name=>'CODE_NAME'
,p_display_order=>300
,p_column_identifier=>'BO'
,p_column_label=>'Code Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Project Code Names''',
'   and build_option_status = ''Include'''))
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738250958550188947)
,p_db_column_name=>'DEAL_TYPE'
,p_display_order=>310
,p_column_identifier=>'BP'
,p_column_label=>'Deal Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(19158512130599850300)
,p_rpt_show_filter_lov=>'1'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_proj_status',
' where deal_type_id is not null',
'   and exists (select null ',
'                 from eba_proj_deal_types',
'                where is_active_yn = ''Y'')',
'   and exists (select null',
'                 from apex_application_build_options',
'                where application_id = :APP_ID',
'                  and build_option_name = ''Project Deal Types''',
'                  and build_option_status = ''Include'')'))
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738251748376188947)
,p_db_column_name=>'ACTION_ITEMS'
,p_display_order=>320
,p_column_identifier=>'BQ'
,p_column_label=>'Action Items'
,p_column_link=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:RP,49,CIR:IR_PROJECT:\#PROJECT#\'
,p_column_linktext=>'#ACTION_ITEMS#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738252140056188948)
,p_db_column_name=>'MILESTONES'
,p_display_order=>330
,p_column_identifier=>'BR'
,p_column_label=>'Milestones'
,p_column_link=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:RP,63,CIR:IR_PROJECT:\#PROJECT#\'
,p_column_linktext=>'#MILESTONES#'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738252527976188948)
,p_db_column_name=>'STATUS'
,p_display_order=>340
,p_column_identifier=>'BS'
,p_column_label=>'Project Status'
,p_column_html_expression=>'<span style="#STATUS_COLOR#"> &nbsp;   &nbsp;  </span> &nbsp;  #STATUS#'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(8916964241877251201)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738252988581188949)
,p_db_column_name=>'USERS'
,p_display_order=>350
,p_column_identifier=>'BT'
,p_column_label=>'People (Usernames)'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738227493725188897)
,p_db_column_name=>'STATUS_COLOR'
,p_display_order=>360
,p_column_identifier=>'BU'
,p_column_label=>'Status color'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738227861223188900)
,p_db_column_name=>'HEADLINE'
,p_display_order=>370
,p_column_identifier=>'BV'
,p_column_label=>'Headline'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(2661826592516005471)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738228299411188900)
,p_db_column_name=>'REQUESTING_TEAM'
,p_display_order=>380
,p_column_identifier=>'BW'
,p_column_label=>'Requesting Team(s)'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(2661828693770016772)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738228623591188901)
,p_db_column_name=>'IMPACTED_ENVIRONMENT'
,p_display_order=>390
,p_column_identifier=>'BX'
,p_column_label=>'Impacted Environment(s)'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(2661829296087027741)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738229103698188902)
,p_db_column_name=>'HEADLINE_LAST_UPDATED'
,p_display_order=>400
,p_column_identifier=>'BY'
,p_column_label=>'Headline Last Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(2661826592516005471)
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(4412374605208889111)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Category Projects'
,p_report_seq=>10
,p_report_alias=>'6720063'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PROJECT:OPEN_CLOSED:CATEGORY:ACTION_ITEMS:MILESTONES:USERS:HEADLINE:REQUESTING_TEAM:IMPACTED_ENVIRONMENT:HEADLINE_LAST_UPDATED::PROJECT_FLEX_N01'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'PROJECT'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'UPDATES_1W'
,p_sort_direction_3=>'DESC'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(738253758319188952)
,p_report_id=>wwv_flow_imp.id(4412374605208889111)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'OPEN_CLOSED'
,p_operator=>'='
,p_expr=>'Open'
,p_condition_sql=>'"OPEN_CLOSED" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Open''  '
,p_enabled=>'Y'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9535632018242620268)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6720071'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PROJECT:STATUS:TAGS:MILESTONES:OPEN_MILESTONES:PAST_DUE_MILESTONES:ACTION_ITEMS:OPEN_ACTION_ITEMS:PAST_DUE_ACTION_ITEMS:UPDATED:'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'PROJECT'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'UPDATES_1W'
,p_sort_direction_3=>'DESC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19598146273890732296)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Open Projects'
,p_report_seq=>10
,p_report_alias=>'6720075'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'PROJECT:OPEN_CLOSED:OPEN_PAST_DUE_OPEN_PAST_DUE_UPDATED::ACTION_ITEMS:MILESTONES:USERS:STATUS_COLOR:HEADLINE:REQUESTING_TEAM:IMPACTED_ENVIRONMENT:HEADLINE_LAST_UPDATED:PROJECT_FLEX_N01'
,p_sort_column_1=>'UPDATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'PROJECT'
,p_sort_direction_2=>'ASC'
,p_sort_column_3=>'UPDATES_1W'
,p_sort_direction_3=>'DESC'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(738254977086188957)
,p_report_id=>wwv_flow_imp.id(19598146273890732296)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'OPEN_CLOSED'
,p_operator=>'='
,p_expr=>'Open'
,p_condition_sql=>'"OPEN_CLOSED" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Open''  '
,p_enabled=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9589472128867887880)
,p_plug_name=>'Links'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1120070264285054172)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case',
'           when eba_proj_fw.is_edit_authorized(p_username   => upper(:APP_USER), p_project_id => p.id ) = ''Y'' then',
'               ''<a href="'' || apex_util.prepare_url(''f?p=''||:APP_ID||'':3:''||:APP_SESSION||'':::3:P3_ID,P3_PROJECT_ID:''||l.id||'',''||p.id||'':'') || ''"><img src="#IMAGE_PREFIX#menu/pencil2_16x16.gif" alt="Edit Link" title="Edit Link"></a>''',
'       else',
'           null',
'       end as edit_link,',
'       l.LINK_TARGET,',
'       nvl(l.LINK_TEXT,l.link_target) link_text,',
'       l.updated,',
'       l.link_comments,',
'       nvl(l.gold_yn, ''N'') as gold_yn,',
'       c.CATEGORY,',
'       p.project,',
'       l.tags,',
'       eba_proj_fw.get_name_from_email_address(l.created_by) as created_by,',
'       l.created,',
'       p.id project_id,',
'       l.id link_id,',
'       p.project_status as project_status,',
'       decode(eba_proj_stat_ui.is_project_open(p.id), 0, ''Closed'', 1, ''Open'') as project_open',
'  from eba_proj_status_links l,',
'       eba_proj_status p,',
'       eba_proj_status_cats c',
' where l.project_id = p.id',
'   and p.cat_id = c.id(+)',
'   and instr(l.tags,nvl(:P219_TAG,'' '')) > 0'))
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
 p_id=>wwv_flow_imp.id(9589472229159887880)
,p_name=>'Links'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No tagged Links found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'MIKE'
,p_internal_uid=>9523225224344765339
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(743204763761625023)
,p_db_column_name=>'EDIT_LINK'
,p_display_order=>10
,p_column_identifier=>'L'
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
,p_display_condition_type=>'NEVER'
,p_use_as_row_header=>'N'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(743200895307625020)
,p_db_column_name=>'LINK_TARGET'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Link Target'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(743201285833625020)
,p_db_column_name=>'LINK_TEXT'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Link Text'
,p_column_link=>'#LINK_TARGET#'
,p_column_linktext=>'#LINK_TEXT#'
,p_column_link_attr=>'target="_blank"'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(743201646489625021)
,p_db_column_name=>'UPDATED'
,p_display_order=>40
,p_column_identifier=>'C'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(743202042764625021)
,p_db_column_name=>'LINK_COMMENTS'
,p_display_order=>50
,p_column_identifier=>'D'
,p_column_label=>'Comments'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(743202473762625021)
,p_db_column_name=>'CATEGORY'
,p_display_order=>60
,p_column_identifier=>'E'
,p_column_label=>'&CAT_TITLE.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(743202865301625022)
,p_db_column_name=>'PROJECT'
,p_display_order=>70
,p_column_identifier=>'F'
,p_column_label=>'Project'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP,200:P200_ID:#PROJECT_ID#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(743203184265625022)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(743203588091625022)
,p_db_column_name=>'CREATED'
,p_display_order=>90
,p_column_identifier=>'H'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'SINCE'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(743203918253625023)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>100
,p_column_identifier=>'I'
,p_column_label=>'Project ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(743204311293625023)
,p_db_column_name=>'LINK_ID'
,p_display_order=>110
,p_column_identifier=>'J'
,p_column_label=>'Selected Link'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(743205193918625023)
,p_db_column_name=>'GOLD_YN'
,p_display_order=>120
,p_column_identifier=>'M'
,p_column_label=>'Gold'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_column_alignment=>'CENTER'
,p_rpt_named_lov=>wwv_flow_imp.id(8910494933283350717)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(743205514387625024)
,p_db_column_name=>'PROJECT_STATUS'
,p_display_order=>130
,p_column_identifier=>'N'
,p_column_label=>'Project Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_rpt_named_lov=>wwv_flow_imp.id(6064075290108505768)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(743205951012625024)
,p_db_column_name=>'PROJECT_OPEN'
,p_display_order=>140
,p_column_identifier=>'O'
,p_column_label=>'Project Open Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(743200429211625020)
,p_db_column_name=>'TAGS'
,p_display_order=>150
,p_column_identifier=>'P'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9589473015282888073)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6769593'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'EDIT_LINK:LINK_TEXT:CATEGORY:GOLD_YN:PROJECT:PROJECT_STATUS:CREATED_BY:CREATED:'
,p_sort_column_1=>'CREATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'LINK_TEXT'
,p_sort_direction_2=>'ASC'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19603114246183165356)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Open Projects'
,p_report_seq=>10
,p_report_alias=>'6769597'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>15
,p_report_columns=>'EDIT_LINK:LINK_TEXT:CATEGORY:GOLD_YN:PROJECT:PROJECT_OPEN:PROJECT_STATUS:CREATED_BY:CREATED:'
,p_sort_column_1=>'CREATED'
,p_sort_direction_1=>'DESC'
,p_sort_column_2=>'LINK_TEXT'
,p_sort_direction_2=>'ASC'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(743207177450625028)
,p_report_id=>wwv_flow_imp.id(19603114246183165356)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'PROJECT_OPEN'
,p_operator=>'='
,p_expr=>'Open'
,p_condition_sql=>'"PROJECT_OPEN" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Open''  '
,p_enabled=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9593013850152927700)
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9630209535305884934)
,p_plug_name=>'Milestones'
,p_region_name=>'msIRR'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1120070264285054172)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id,',
'    case when eba_proj_fw.is_edit_authorized( p_username   => upper(:APP_USER), p_project_id => m.project_id ) = ''Y'' then',
'        ''<a href="'' || apex_util.prepare_url(''f?p='' || :APP_ID || '':48:'' || :APP_SESSION || '':::48:P48_ID,P48_PROJECT_ID:'' || m.id || '','' || m.project_id || '':'') || ''"><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pe'
||'ncil" alt="Edit Milestone"></a>''',
'    else',
'        null',
'    end as edit_link,',
'    row_key,',
'    (   select y.project',
'        from eba_proj_status x,',
'            eba_proj_status y',
'        where x.id = m.project_id',
'            and x.parent_project_id = y.id) parent_project,',
'    project_id,',
'    (   select project',
'        from eba_proj_status x',
'        where x.id = m.project_id ) project,',
'    milestone_name,',
'    milestone_name milestone_name_nolink,',
'    milestone_description,',
'    milestone_date,',
'    tags,',
'    milestone_start_date,',
'    case when m.milestone_status = ''Completed'' then',
'        nvl(completed_date, milestone_date)',
'    else',
'        null',
'    end as completed_date,',
'    nvl(original_due_date, milestone_date) as original_due_date,',
'    decode(eba_proj_stat_ui.is_project_open(m.project_id), 0, ''Closed'', 1, ''Open'') as open_closed,',
'    case when milestone_date = nvl(original_due_date, milestone_date) then ''No'' else ''Yes'' end as due_date_changed,',
'    (   select status_short_desc',
'        from eba_proj_status_codes',
'        where id = (select project_status',
'                    from eba_proj_status',
'                    where id = m.project_id)) as status_level,',
'    (   select category',
'        from eba_proj_status_cats',
'        where id = (select cat_id',
'                    from eba_proj_status',
'                    where id = m.project_id)) as category,',
'    milestone_status,',
'    decode(nvl(is_major_yn,''N''),''N'',''No'',''Yes'') major,',
'    created,',
'    created_by,',
'    updated,',
'    updated_by,',
'    case',
'        when (select count(*) from eba_proj_status_ais where project_id = m.project_id and milestone_id = m.id) > 0 then',
'            round(((select count(*) from eba_proj_status_ais where project_id = m.project_id and milestone_id = m.id and action_status = ''Closed'')/(select count(*) from eba_proj_status_ais where project_id = m.project_id and milestone_id = m.id)) * 1'
||'00) || ''%''',
'        else',
'            ''0%''',
'    end as percent_complete,',
'    case',
'        when milestone_status != ''Completed'' and m.milestone_date < current_timestamp then',
'            ''Y''',
'        else',
'            ''N''',
'    end past_due_yn,',
'    nvl(trunc(original_due_date), trunc(milestone_date)) - trunc(completed_date) as original_day_delta,',
'    nvl(trunc(original_due_date), trunc(milestone_date)) - trunc(milestone_date) as original_due_delta,',
'    trunc(milestone_date) - trunc(nvl(completed_date, milestone_date)) as day_delta,',
'    (select listagg(to_char(to_date(substr(new_value,1,11),''DD-MON-YYYY''),''fmDD-MON-YYYY'')||'' ''||',
'        eba_proj_fw.get_name_from_email_address(changed_by),'', '')  within group (order by change_date)',
'     from eba_proj_history',
'     where table_name = ''STATUS_MS''',
'       and column_name = ''MILESTONE_DATE''',
'       and component_id = m.id) as change_history,',
'    (   select code_name',
'        from eba_proj_status x',
'        where x.id = m.project_id ) project_code_name,',
'    (   select deal_type_id',
'        from eba_proj_status x',
'        where x.id = m.project_id ) deal_type,',
'    case when milestone_status = ''Completed'' then',
'        (select nvl(max(change_date), m.milestone_date) from eba_proj_history where table_name = ''STATUS_MS'' and new_value = ''Completed'' and component_id = m.id)',
'    else',
'        null',
'    end as actual_completion_date,',
'    case when owner_role_id is null then',
'        eba_proj_fw.get_name_from_email_address(milestone_owner)',
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
'    end as milestone_owner,',
'    decode(eba_proj_stat_ui.is_project_open(m.project_id), 0, ''Closed'', 1, ''Open'') as project_open,',
'    milestone_flex_01,',
'    milestone_flex_02,',
'    milestone_flex_03,',
'    milestone_flex_04,',
'    milestone_flex_05,',
'    milestone_flex_06,',
'    milestone_flex_07,',
'    milestone_flex_08,',
'    milestone_flex_n01,',
'    milestone_flex_n02,',
'    milestone_flex_n03,',
'    milestone_flex_n04,',
'    milestone_flex_d01,',
'    milestone_flex_d02,',
'    milestone_flex_d03,',
'    milestone_flex_d04,',
'    milestone_flex_clob',
'from eba_proj_status_ms m',
'where instr(m.tags,nvl(:P219_TAG,'' '')) > 0',
'           ',
'           ',
'           '))
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
 p_id=>wwv_flow_imp.id(9630209637350884934)
,p_name=>'Milestones'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No tagged Milestones found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'MIKE'
,p_internal_uid=>9563962632535762393
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738280141517230166)
,p_db_column_name=>'EDIT_LINK'
,p_display_order=>10
,p_column_identifier=>'AN'
,p_column_label=>'<span class="u-VisuallyHidden">Edit</span>'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'NEVER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738276590890230161)
,p_db_column_name=>'ID'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'ID'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738276920123230162)
,p_db_column_name=>'ROW_KEY'
,p_display_order=>30
,p_column_identifier=>'C'
,p_column_label=>'Row Key'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738277363874230162)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Selected Project'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738277801674230163)
,p_db_column_name=>'PROJECT'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Project'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP,200:P200_ID:#PROJECT_ID#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738278174827230164)
,p_db_column_name=>'MILESTONE_NAME'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Milestone'
,p_column_link=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:107:P107_ID,P107_PROJECT_ID,P200_ID:#ID#,#PROJECT_ID#,#PROJECT_ID#'
,p_column_linktext=>'#MILESTONE_NAME#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738274143356230155)
,p_db_column_name=>'MILESTONE_NAME_NOLINK'
,p_display_order=>70
,p_column_identifier=>'Q'
,p_column_label=>'Milestone'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
,p_security_scheme=>'!'||wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738278593773230164)
,p_db_column_name=>'MILESTONE_DESCRIPTION'
,p_display_order=>80
,p_column_identifier=>'G'
,p_column_label=>'Description'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738278922709230165)
,p_db_column_name=>'MILESTONE_STATUS'
,p_display_order=>90
,p_column_identifier=>'I'
,p_column_label=>'Milestone Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738279357170230165)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>100
,p_column_identifier=>'K'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738279723416230165)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>110
,p_column_identifier=>'M'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738275393645230158)
,p_db_column_name=>'MILESTONE_OWNER'
,p_display_order=>120
,p_column_identifier=>'N'
,p_column_label=>'Milestone Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738275738219230158)
,p_db_column_name=>'MAJOR'
,p_display_order=>130
,p_column_identifier=>'O'
,p_column_label=>'Major'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738276117642230159)
,p_db_column_name=>'PARENT_PROJECT'
,p_display_order=>140
,p_column_identifier=>'P'
,p_column_label=>'Parent Project'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Allow Parent Projects''',
'   and build_option_status = ''Include'''))
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738274512219230156)
,p_db_column_name=>'STATUS_LEVEL'
,p_display_order=>150
,p_column_identifier=>'R'
,p_column_label=>'Project Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738274921686230157)
,p_db_column_name=>'CATEGORY'
,p_display_order=>160
,p_column_identifier=>'S'
,p_column_label=>'&CAT_TITLE.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738266144911230137)
,p_db_column_name=>'MILESTONE_DATE'
,p_display_order=>170
,p_column_identifier=>'T'
,p_column_label=>'Due Date'
,p_column_html_expression=>'<span style="white-space: pre;">#MILESTONE_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738280590537230167)
,p_db_column_name=>'ORIGINAL_DUE_DATE'
,p_display_order=>180
,p_column_identifier=>'AO'
,p_column_label=>'Original Due Date'
,p_column_html_expression=>'<span style="white-space: pre;">#ORIGINAL_DUE_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738280931282230167)
,p_db_column_name=>'DUE_DATE_CHANGED'
,p_display_order=>190
,p_column_identifier=>'AP'
,p_column_label=>'Due Date Changed'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738266538567230138)
,p_db_column_name=>'CREATED'
,p_display_order=>200
,p_column_identifier=>'U'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'Since'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738266937628230139)
,p_db_column_name=>'UPDATED'
,p_display_order=>210
,p_column_identifier=>'V'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'Since'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738267318360230140)
,p_db_column_name=>'MILESTONE_FLEX_01'
,p_display_order=>220
,p_column_identifier=>'W'
,p_column_label=>'MILESTONE_FLEX_01'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738267734629230141)
,p_db_column_name=>'MILESTONE_FLEX_02'
,p_display_order=>230
,p_column_identifier=>'X'
,p_column_label=>'MILESTONE_FLEX_02'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738268135617230142)
,p_db_column_name=>'MILESTONE_FLEX_03'
,p_display_order=>240
,p_column_identifier=>'Y'
,p_column_label=>'MILESTONE_FLEX_03'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738268585194230142)
,p_db_column_name=>'MILESTONE_FLEX_04'
,p_display_order=>250
,p_column_identifier=>'Z'
,p_column_label=>'MILESTONE_FLEX_04'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738268946485230144)
,p_db_column_name=>'MILESTONE_FLEX_05'
,p_display_order=>260
,p_column_identifier=>'AA'
,p_column_label=>'MILESTONE_FLEX_05'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_05'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738269335069230145)
,p_db_column_name=>'MILESTONE_FLEX_06'
,p_display_order=>270
,p_column_identifier=>'AB'
,p_column_label=>'MILESTONE_FLEX_06'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_06'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738269731606230147)
,p_db_column_name=>'MILESTONE_FLEX_07'
,p_display_order=>280
,p_column_identifier=>'AC'
,p_column_label=>'MILESTONE_FLEX_07'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_07'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738270130834230148)
,p_db_column_name=>'MILESTONE_FLEX_08'
,p_display_order=>290
,p_column_identifier=>'AD'
,p_column_label=>'MILESTONE_FLEX_08'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_08'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738270546945230148)
,p_db_column_name=>'MILESTONE_FLEX_N01'
,p_display_order=>300
,p_column_identifier=>'AE'
,p_column_label=>'Estimated Cost (in Man Hours)'
,p_column_type=>'NUMBER'
,p_format_mask=>'999G999G999G999G999G999G999'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_N01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738270917864230148)
,p_db_column_name=>'MILESTONE_FLEX_N02'
,p_display_order=>310
,p_column_identifier=>'AF'
,p_column_label=>'MILESTONE_FLEX_N02'
,p_display_in_default_rpt=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_N02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738271324113230149)
,p_db_column_name=>'MILESTONE_FLEX_N03'
,p_display_order=>320
,p_column_identifier=>'AG'
,p_column_label=>'MILESTONE_FLEX_N03'
,p_display_in_default_rpt=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_N03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738271725331230150)
,p_db_column_name=>'MILESTONE_FLEX_N04'
,p_display_order=>330
,p_column_identifier=>'AH'
,p_column_label=>'MILESTONE_FLEX_N04'
,p_display_in_default_rpt=>'N'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_N04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738272159744230150)
,p_db_column_name=>'MILESTONE_FLEX_D01'
,p_display_order=>340
,p_column_identifier=>'AI'
,p_column_label=>'MILESTONE_FLEX_D01'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_D01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738272602405230151)
,p_db_column_name=>'MILESTONE_FLEX_D02'
,p_display_order=>350
,p_column_identifier=>'AJ'
,p_column_label=>'MILESTONE_FLEX_D02'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_D02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738272911682230152)
,p_db_column_name=>'MILESTONE_FLEX_D03'
,p_display_order=>360
,p_column_identifier=>'AK'
,p_column_label=>'MILESTONE_FLEX_D03'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_D03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738273367853230153)
,p_db_column_name=>'MILESTONE_FLEX_D04'
,p_display_order=>370
,p_column_identifier=>'AL'
,p_column_label=>'MILESTONE_FLEX_D04'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_D04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738273745114230154)
,p_db_column_name=>'MILESTONE_FLEX_CLOB'
,p_display_order=>380
,p_column_identifier=>'AM'
,p_column_label=>'MILESTONE_FLEX_CLOB'
,p_display_in_default_rpt=>'N'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_MS'' and flexible_column = ''MILESTONE_FLEX_CLOB'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738281336638230167)
,p_db_column_name=>'PROJECT_OPEN'
,p_display_order=>390
,p_column_identifier=>'AQ'
,p_column_label=>'Project Open Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738281774144230168)
,p_db_column_name=>'MILESTONE_START_DATE'
,p_display_order=>400
,p_column_identifier=>'AR'
,p_column_label=>'Start Date'
,p_column_html_expression=>'<span style="white-space: pre;">#MILESTONE_START_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738282138002230177)
,p_db_column_name=>'COMPLETED_DATE'
,p_display_order=>410
,p_column_identifier=>'AS'
,p_column_label=>'Completion Date'
,p_column_html_expression=>'<span style="white-space: pre;">#COMPLETED_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738282523625230178)
,p_db_column_name=>'PERCENT_COMPLETE'
,p_display_order=>420
,p_column_identifier=>'AT'
,p_column_label=>'Percent Complete'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738282949813230179)
,p_db_column_name=>'PAST_DUE_YN'
,p_display_order=>430
,p_column_identifier=>'AU'
,p_column_label=>'Past Due'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(8910494933283350717)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738283361454230179)
,p_db_column_name=>'DAY_DELTA'
,p_display_order=>440
,p_column_identifier=>'AV'
,p_column_label=>'Due Date to Completion Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738283713517230180)
,p_db_column_name=>'ORIGINAL_DAY_DELTA'
,p_display_order=>450
,p_column_identifier=>'AW'
,p_column_label=>'Original Due to Completion Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738284183740230180)
,p_db_column_name=>'ORIGINAL_DUE_DELTA'
,p_display_order=>460
,p_column_identifier=>'AX'
,p_column_label=>'Original Due to Due Date Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738284557262230181)
,p_db_column_name=>'CHANGE_HISTORY'
,p_display_order=>470
,p_column_identifier=>'AY'
,p_column_label=>'Change History'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738284985608230181)
,p_db_column_name=>'PROJECT_CODE_NAME'
,p_display_order=>480
,p_column_identifier=>'AZ'
,p_column_label=>'Project Code Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Project Code Names''',
'   and build_option_status = ''Include'''))
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738285312587230182)
,p_db_column_name=>'DEAL_TYPE'
,p_display_order=>490
,p_column_identifier=>'BA'
,p_column_label=>'Deal Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(19158512130599850300)
,p_rpt_show_filter_lov=>'1'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_proj_status',
' where deal_type_id is not null',
'   and exists (select null ',
'                 from eba_proj_deal_types',
'                where is_active_yn = ''Y'')',
'   and exists (select null',
'                 from apex_application_build_options',
'                where application_id = :APP_ID',
'                  and build_option_name = ''Project Deal Types''',
'                  and build_option_status = ''Include'')'))
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738285770249230182)
,p_db_column_name=>'ACTUAL_COMPLETION_DATE'
,p_display_order=>500
,p_column_identifier=>'BB'
,p_column_label=>'Marked as Completed On'
,p_column_html_expression=>'<span style="white-space: pre;">#ACTUAL_COMPLETION_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738286187606230183)
,p_db_column_name=>'OPEN_CLOSED'
,p_display_order=>510
,p_column_identifier=>'BC'
,p_column_label=>'Project Open Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738265787459230135)
,p_db_column_name=>'TAGS'
,p_display_order=>520
,p_column_identifier=>'BD'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9630211146332885294)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6720395'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'PROJECT:MILESTONE_NAME:MILESTONE_STATUS:MAJOR:TAGS:MILESTONE_DATE:COMPLETED_DATE:DAY_DELTA:PAST_DUE_YN:PERCENT_COMPLETE:MILESTONE_OWNER:'
,p_sort_column_1=>'MILESTONE_DATE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'CREATED'
,p_sort_direction_2=>'DESC'
,p_break_on=>'PROJECT:0:0:0:0:0'
,p_break_enabled_on=>'PROJECT:0:0:0:0:0'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(738516523432580085)
,p_report_id=>wwv_flow_imp.id(9630211146332885294)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'PROJECT_OPEN'
,p_operator=>'='
,p_expr=>'Open'
,p_condition_sql=>'"PROJECT_OPEN" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Open''  '
,p_enabled=>'Y'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(19604064254634083123)
,p_application_user=>'APXWS_ALTERNATIVE'
,p_name=>'Open Projects'
,p_report_seq=>10
,p_report_alias=>'6720403'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_display_rows=>100
,p_report_columns=>'EDIT_LINK:MILESTONE_NAME:PROJECT:PROJECT_OPEN:ORIGINAL_DUE_DATE:MILESTONE_DATE:DUE_DATE_CHANGED:MILESTONE_OWNER:MILESTONE_STATUS:MAJOR:STATUS_LEVEL:CATEGORY:UPDATED::PERCENT_COMPLETE:PAST_DUE_YN:DAY_DELTA:ORIGINAL_DAY_DELTA:ORIGINAL_DUE_DELTA:CHANGE_'
||'HISTORY:PROJECT_CODE_NAME:DEAL_TYPE:ACTUAL_COMPLETION_DATE:OPEN_CLOSED'
,p_sort_column_1=>'MILESTONE_DATE'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'CREATED'
,p_sort_direction_2=>'DESC'
,p_break_on=>'PROJECT:0:0:0:0:0'
,p_break_enabled_on=>'PROJECT:0:0:0:0:0'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(738287778068230185)
,p_report_id=>wwv_flow_imp.id(19604064254634083123)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'MILESTONE_STATUS'
,p_operator=>'='
,p_expr=>'Open'
,p_condition_sql=>'"MILESTONE_STATUS" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Open''  '
,p_enabled=>'Y'
);
wwv_flow_imp_page.create_worksheet_condition(
 p_id=>wwv_flow_imp.id(738288144539230185)
,p_report_id=>wwv_flow_imp.id(19604064254634083123)
,p_condition_type=>'FILTER'
,p_allow_delete=>'Y'
,p_column_name=>'PROJECT_OPEN'
,p_operator=>'='
,p_expr=>'Open'
,p_condition_sql=>'"PROJECT_OPEN" = #APXWS_EXPR#'
,p_condition_display=>'#APXWS_COL_NAME# = ''Open''  '
,p_enabled=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(9630386878076929151)
,p_plug_name=>'Action Items'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1120070264285054172)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    case when eba_proj_fw.is_edit_authorized( p_username   => upper(:APP_USER), p_project_id => a.project_id ) = ''Y'' then',
'        ''<a href="'' || apex_util.prepare_url(''f?p='' || :APP_ID || '':73:'' || :APP_SESSION || '':::73:P73_ID,P73_PROJECT_ID:'' || a.id || '','' || a.project_id || '':'') || ''" class="AIEditLink"><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" '
||'class="apex-edit-pencil" alt="Edit Action Item"></a>''',
'    else',
'        null',
'    end as edit_link,',
'    case when a.milestone_id is not null then',
'        (select milestone_name from eba_proj_status_ms where id = a.milestone_id)',
'    else',
'        null',
'    end as milestone,',
'    case when a.link_url is not null and a.link_text is not null and exists (select null',
'                 from apex_application_build_options',
'                where application_id = :APP_ID',
'                  and build_option_name = ''Action Item Links''',
'                  and build_option_status = ''Include'') then',
'        ''<small><a href="'' || apex_escape.html(a.link_url) || ''" target="_blank">''',
'            || apex_escape.html(a.link_text) || ''</a></small>''',
'    end as link_text,',
'    dbms_lob.substr(action,200) action,',
'    id,',
'    milestone_id,',
'    tags,',
'    nvl(type_id,-1) as ai_type,',
'    due_date,',
'    completed_date,',
'    resolution,',
'    nvl(original_due_date, due_date) as original_due_date,',
'    case when due_date = nvl(original_due_date, due_date) then ''No'' else ''Yes'' end as due_date_changed,',
'    (   select y.project',
'        from eba_proj_status x,',
'            eba_proj_status y',
'        where x.id = a.project_id',
'            and x.parent_project_id = y.id) parent_project, ',
'    (   select project',
'        from eba_proj_status x',
'        where x.id = a.project_id ) project,',
'    (   select code_name',
'        from eba_proj_status x',
'        where x.id = a.project_id ) project_code_name,',
'    (   select deal_type_id',
'        from eba_proj_status x',
'        where x.id = a.project_id ) deal_type,',
'    case when a.milestone_id is not null then',
'        (select milestone_start_date from eba_proj_status_ms where id = a.milestone_id)',
'    else',
'        a.created',
'    end as start_date,',
'    case when a.milestone_id is not null then',
'        (select eba_proj_fw.get_name_from_email_address(milestone_owner) from eba_proj_status_ms where id = a.milestone_id and owner_role_id is null)',
'    else',
'        nvl((select r.name||'': ''||listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '')',
'                within group (order by lower(u.username)) owner',
'            from eba_proj_user_ref rf,',
'                eba_proj_status_users u,',
'                eba_proj_roles r,',
'                eba_proj_status_ms m',
'            where m.id = a.milestone_id',
'              and m.owner_role_id is not null',
'              and rf.role_id = m.owner_role_id',
'              and rf.project_id = a.project_id',
'              and u.id = rf.user_id',
'              and r.id = rf.role_id',
'            group by r.name',
'        ), (select ''No ''||r.name||'' defined''',
'            from eba_proj_roles r,',
'                 eba_proj_status_ms ms',
'            where ms.id = a.milestone_id',
'              and r.id = ms.owner_role_id)',
'        )',
'    end as milestone_owner,',
'    decode(eba_proj_stat_ui.is_project_open(a.project_id), 0, ''Closed'', 1, ''Open'') as open_closed,',
'    (select listagg(to_char(to_date(substr(new_value,1,11),''DD-MON-YYYY''),''fmDD-MON-YYYY'')||'' ''||',
'        eba_proj_fw.get_name_from_email_address(changed_by),'', '')  within group (order by change_date)',
'     from eba_proj_history',
'     where table_name = ''STATUS_AIS''',
'       and column_name = ''DUE_DATE''',
'       and component_id = a.id) as change_history,',
'    case when a.milestone_id is not null then',
'        (select milestone_status from eba_proj_status_ms where id = a.milestone_id)',
'    else',
'        null',
'    end as milestone_status,',
'    case when action_status = ''Closed'' then',
'        (select nvl( max(change_date), a.due_date ) from eba_proj_history where table_name = ''STATUS_AI'' and new_value = ''Closed'' and component_id = a.id)',
'    else',
'        null',
'    end as actual_completion_date,',
'    project_id,',
'    nvl(trunc(original_due_date), trunc(due_date)) - trunc(completed_date) as original_day_delta,',
'    nvl(trunc(original_due_date), trunc(due_date)) - trunc(due_date) as original_due_delta,',
'    trunc(due_date) - trunc(completed_date) as day_delta,',
'    (select project_status from eba_proj_status where id = a.project_id) project_status,',
'    (   select category',
'        from eba_proj_status_cats',
'        where id = (select cat_id',
'                    from eba_proj_status',
'                    where id = a.project_id) ) as category,',
'    action_status,',
'    decode(action_status,''Open'',decode(greatest(due_date,systimestamp),due_date,''No'',''Yes''),''No'') past_due,',
'    case when owner_role_id is null then',
'        eba_proj_fw.get_name_from_email_address(a.action_owner_01)',
'        || decode(a.action_owner_02,null,null,'', ''|| eba_proj_fw.get_name_from_email_address(a.action_owner_02))',
'        || decode(a.action_owner_03,null,null,'', ''|| eba_proj_fw.get_name_from_email_address(a.action_owner_03))',
'        || decode(a.action_owner_04,null,null,'', ''|| eba_proj_fw.get_name_from_email_address(a.action_owner_04))',
'    else',
'        nvl((select r.name||'': ''||listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '')',
'                within group (order by lower(u.username)) owner',
'            from eba_proj_user_ref rf,',
'                eba_proj_status_users u,',
'                eba_proj_roles r',
'            where rf.role_id = a.owner_role_id',
'                and rf.project_id = a.project_id',
'                and u.id = rf.user_id',
'                and r.id = rf.role_id',
'            group by r.name',
'        ), (select ''No ''||r.name||'' defined''',
'            from eba_proj_roles r',
'            where r.id = a.owner_role_id)',
'        )',
'    end as owner,',
'    created,',
'    created_by,',
'    updated as updated_hidden,',
'    updated,',
'    updated_by,',
'    eba_proj_flex_fw.fetch_v(''ACTION_FLEX_01'',a.action_flex_01) action_flex_01,',
'    eba_proj_flex_fw.fetch_v(''ACTION_FLEX_02'',a.action_flex_02) action_flex_02,',
'    eba_proj_flex_fw.fetch_v(''ACTION_FLEX_03'',a.action_flex_03) action_flex_03,',
'    eba_proj_flex_fw.fetch_v(''ACTION_FLEX_04'',a.action_flex_04) action_flex_04,',
'    eba_proj_flex_fw.fetch_v(''ACTION_FLEX_05'',a.action_flex_05) action_flex_05,',
'    eba_proj_flex_fw.fetch_v(''ACTION_FLEX_06'',a.action_flex_06) action_flex_06,',
'    eba_proj_flex_fw.fetch_v(''ACTION_FLEX_07'',a.action_flex_07) action_flex_07,',
'    eba_proj_flex_fw.fetch_v(''ACTION_FLEX_08'',a.action_flex_08) action_flex_08,',
'    eba_proj_flex_fw.fetch_n(''ACTION_FLEX_N01'',a.action_flex_n01) action_flex_n01,',
'    eba_proj_flex_fw.fetch_n(''ACTION_FLEX_N02'',a.action_flex_n02) action_flex_n02,',
'    eba_proj_flex_fw.fetch_n(''ACTION_FLEX_N03'',a.action_flex_n03) action_flex_n03,',
'    eba_proj_flex_fw.fetch_n(''ACTION_FLEX_N04'',a.action_flex_n04) action_flex_n04,',
'    action_flex_d01,',
'    action_flex_d02,',
'    action_flex_d03,',
'    action_flex_d04,',
'    action_flex_clob',
'from eba_proj_status_ais a',
'where instr(tags,nvl(:P219_TAG,'' '')) > 0'))
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
 p_id=>wwv_flow_imp.id(9630386989458929151)
,p_name=>'Action Items'
,p_max_row_count=>'10000'
,p_max_row_count_message=>'This query returns more than #MAX_ROW_COUNT# rows, please filter your data to ensure complete results.'
,p_no_data_found_message=>'No tagged Action Items found.'
,p_allow_save_rpt_public=>'Y'
,p_allow_report_categories=>'N'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_show_notify=>'Y'
,p_show_calendar=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'MIKE'
,p_internal_uid=>9564139984643806610
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738459450725318435)
,p_db_column_name=>'EDIT_LINK'
,p_display_order=>10
,p_column_identifier=>'AV'
,p_column_label=>'<span class="u-VisuallyHidden">Edit</span>'
,p_allow_sorting=>'N'
,p_allow_filtering=>'N'
,p_allow_highlighting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_allow_hide=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_column_alignment=>'CENTER'
,p_display_condition_type=>'NEVER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738456624511318429)
,p_db_column_name=>'ACTION'
,p_display_order=>20
,p_column_identifier=>'A'
,p_column_label=>'Action Item'
,p_column_link=>'f?p=&APP_ID.:78:&SESSION.::&DEBUG.:78,200:P78_ACTION_ITEM_ID,P200_ID:#ID#,#PROJECT_ID#'
,p_column_linktext=>'#ACTION#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738457097700318430)
,p_db_column_name=>'ID'
,p_display_order=>30
,p_column_identifier=>'B'
,p_column_label=>'Id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738457503772318431)
,p_db_column_name=>'PROJECT'
,p_display_order=>40
,p_column_identifier=>'D'
,p_column_label=>'Project'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:200:P200_ID:#PROJECT_ID#'
,p_column_linktext=>'#PROJECT#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738457840372318431)
,p_db_column_name=>'ACTION_STATUS'
,p_display_order=>50
,p_column_identifier=>'E'
,p_column_label=>'Action Item Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738458251979318433)
,p_db_column_name=>'OWNER'
,p_display_order=>60
,p_column_identifier=>'F'
,p_column_label=>'Action Item Owner(s)'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738458681225318433)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>70
,p_column_identifier=>'H'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738459099983318434)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>80
,p_column_identifier=>'J'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738455877399318428)
,p_db_column_name=>'PARENT_PROJECT'
,p_display_order=>90
,p_column_identifier=>'K'
,p_column_label=>'Parent Project'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Allow Parent Projects''',
'   and build_option_status = ''Include'''))
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738456256233318429)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>100
,p_column_identifier=>'L'
,p_column_label=>'Selected Project'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738455486373318428)
,p_db_column_name=>'CATEGORY'
,p_display_order=>120
,p_column_identifier=>'N'
,p_column_label=>'&CAT_TITLE.'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738452223285318425)
,p_db_column_name=>'DUE_DATE'
,p_display_order=>130
,p_column_identifier=>'O'
,p_column_label=>'Due Date'
,p_column_html_expression=>'<span style="white-space: pre;">#DUE_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738459874535318435)
,p_db_column_name=>'ORIGINAL_DUE_DATE'
,p_display_order=>140
,p_column_identifier=>'AW'
,p_column_label=>'Original Due Date'
,p_column_html_expression=>'<span style="white-space: pre;">#ORIGINAL_DUE_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738460289471318437)
,p_db_column_name=>'DUE_DATE_CHANGED'
,p_display_order=>150
,p_column_identifier=>'AX'
,p_column_label=>'Due Date Changed'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738452665516318426)
,p_db_column_name=>'CREATED'
,p_display_order=>160
,p_column_identifier=>'P'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'Since'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738453030448318426)
,p_db_column_name=>'UPDATED'
,p_display_order=>170
,p_column_identifier=>'Q'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'Since'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738453456591318426)
,p_db_column_name=>'ACTION_FLEX_D01'
,p_display_order=>180
,p_column_identifier=>'AD'
,p_column_label=>'ACTION_FLEX_D01'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_D01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738453854858318427)
,p_db_column_name=>'ACTION_FLEX_D02'
,p_display_order=>190
,p_column_identifier=>'AE'
,p_column_label=>'ACTION_FLEX_D02'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_D02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738454273810318427)
,p_db_column_name=>'ACTION_FLEX_D03'
,p_display_order=>200
,p_column_identifier=>'AF'
,p_column_label=>'ACTION_FLEX_D03'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_D03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738454698523318427)
,p_db_column_name=>'ACTION_FLEX_D04'
,p_display_order=>210
,p_column_identifier=>'AG'
,p_column_label=>'ACTION_FLEX_D04'
,p_display_in_default_rpt=>'N'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_tz_dependent=>'Y'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_D04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738455040158318428)
,p_db_column_name=>'ACTION_FLEX_CLOB'
,p_display_order=>220
,p_column_identifier=>'AH'
,p_column_label=>'ACTION_FLEX_CLOB'
,p_display_in_default_rpt=>'N'
,p_column_type=>'CLOB'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_CLOB'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738447538050318420)
,p_db_column_name=>'ACTION_FLEX_01'
,p_display_order=>230
,p_column_identifier=>'AI'
,p_column_label=>'ACTION_FLEX_01'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738447999204318421)
,p_db_column_name=>'ACTION_FLEX_02'
,p_display_order=>240
,p_column_identifier=>'AJ'
,p_column_label=>'ACTION_FLEX_02'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738448364440318422)
,p_db_column_name=>'ACTION_FLEX_03'
,p_display_order=>250
,p_column_identifier=>'AK'
,p_column_label=>'ACTION_FLEX_03'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738448610047318422)
,p_db_column_name=>'ACTION_FLEX_04'
,p_display_order=>260
,p_column_identifier=>'AL'
,p_column_label=>'ACTION_FLEX_04'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738449014130318422)
,p_db_column_name=>'ACTION_FLEX_05'
,p_display_order=>270
,p_column_identifier=>'AM'
,p_column_label=>'ACTION_FLEX_05'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_05'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738449410178318423)
,p_db_column_name=>'ACTION_FLEX_06'
,p_display_order=>280
,p_column_identifier=>'AN'
,p_column_label=>'ACTION_FLEX_06'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_06'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738449882709318423)
,p_db_column_name=>'ACTION_FLEX_07'
,p_display_order=>290
,p_column_identifier=>'AO'
,p_column_label=>'ACTION_FLEX_07'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_07'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738450241427318424)
,p_db_column_name=>'ACTION_FLEX_08'
,p_display_order=>300
,p_column_identifier=>'AP'
,p_column_label=>'ACTION_FLEX_08'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_08'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738450701589318424)
,p_db_column_name=>'ACTION_FLEX_N01'
,p_display_order=>310
,p_column_identifier=>'AQ'
,p_column_label=>'Estimated Cost (in Man Hours)'
,p_column_type=>'STRING'
,p_format_mask=>'999G999G999G999G999G999G999'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_N01'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738451036496318424)
,p_db_column_name=>'ACTION_FLEX_N02'
,p_display_order=>320
,p_column_identifier=>'AR'
,p_column_label=>'ACTION_FLEX_N02'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_N02'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738451484420318425)
,p_db_column_name=>'ACTION_FLEX_N03'
,p_display_order=>330
,p_column_identifier=>'AS'
,p_column_label=>'ACTION_FLEX_N03'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_N03'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738451870276318425)
,p_db_column_name=>'ACTION_FLEX_N04'
,p_display_order=>340
,p_column_identifier=>'AT'
,p_column_label=>'ACTION_FLEX_N04'
,p_display_in_default_rpt=>'N'
,p_column_type=>'STRING'
,p_display_text_as=>'HIDDEN'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>'select null from eba_proj_flex_registry where flexible_table = ''EBA_PROJ_STATUS_AIS'' and flexible_column = ''ACTION_FLEX_N04'' and active_yn = ''Y'' and assigned_yn = ''Y'''
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738447172882318420)
,p_db_column_name=>'PAST_DUE'
,p_display_order=>350
,p_column_identifier=>'AU'
,p_column_label=>'Past Due'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738460612332318438)
,p_db_column_name=>'RESOLUTION'
,p_display_order=>360
,p_column_identifier=>'AY'
,p_column_label=>'Resolution'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXPRESSION'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.get_build_option_status (',
'    p_application_id => :APP_ID,',
'    p_build_option_name => ''Mandatory Action Item Resolution''',
') = ''INCLUDE'''))
,p_display_condition2=>'PLSQL'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738461411915318441)
,p_db_column_name=>'AI_TYPE'
,p_display_order=>370
,p_column_identifier=>'AZ'
,p_column_label=>'Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(18916316741608990911)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738461838403318443)
,p_db_column_name=>'UPDATED_HIDDEN'
,p_display_order=>380
,p_column_identifier=>'BA'
,p_column_label=>'Updated hidden'
,p_column_type=>'DATE'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738461085420318440)
,p_db_column_name=>'LINK_TEXT'
,p_display_order=>390
,p_column_identifier=>'BB'
,p_column_label=>'Link'
,p_column_type=>'STRING'
,p_display_text_as=>'WITHOUT_MODIFICATION'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738462295229318444)
,p_db_column_name=>'COMPLETED_DATE'
,p_display_order=>400
,p_column_identifier=>'BC'
,p_column_label=>'Completion Date'
,p_column_html_expression=>'<span style="white-space: pre;">#COMPLETED_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738462654872318445)
,p_db_column_name=>'MILESTONE'
,p_display_order=>410
,p_column_identifier=>'BE'
,p_column_label=>'Milestone'
,p_column_link=>'f?p=&APP_ID.:107:&SESSION.::&DEBUG.:RP,107:P107_ID,P107_PROJECT_ID,P200_ID:#MILESTONE_ID#,#PROJECT_ID#,#PROJECT_ID#'
,p_column_linktext=>'#MILESTONE#'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738463042112318445)
,p_db_column_name=>'MILESTONE_ID'
,p_display_order=>420
,p_column_identifier=>'BF'
,p_column_label=>'Milestone id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738463487328318446)
,p_db_column_name=>'DAY_DELTA'
,p_display_order=>440
,p_column_identifier=>'BI'
,p_column_label=>'Due Date to Completion Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738464276940318448)
,p_db_column_name=>'START_DATE'
,p_display_order=>460
,p_column_identifier=>'BK'
,p_column_label=>'Start Date'
,p_column_html_expression=>'<span style="white-space: pre;">#START_DATE#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738464694084318448)
,p_db_column_name=>'ACTUAL_COMPLETION_DATE'
,p_display_order=>470
,p_column_identifier=>'BL'
,p_column_label=>'Marked as Completed On'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738465063891318449)
,p_db_column_name=>'ORIGINAL_DAY_DELTA'
,p_display_order=>480
,p_column_identifier=>'BM'
,p_column_label=>'Original Due to Completion Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738465458080318450)
,p_db_column_name=>'ORIGINAL_DUE_DELTA'
,p_display_order=>490
,p_column_identifier=>'BN'
,p_column_label=>'Original Due to Due Date Delta'
,p_column_type=>'NUMBER'
,p_heading_alignment=>'RIGHT'
,p_column_alignment=>'RIGHT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738465877578318451)
,p_db_column_name=>'MILESTONE_OWNER'
,p_display_order=>500
,p_column_identifier=>'BO'
,p_column_label=>'Milestone Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738466287571318452)
,p_db_column_name=>'CHANGE_HISTORY'
,p_display_order=>510
,p_column_identifier=>'BP'
,p_column_label=>'Change History'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738466613015318452)
,p_db_column_name=>'MILESTONE_STATUS'
,p_display_order=>520
,p_column_identifier=>'BQ'
,p_column_label=>'Milestone Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738463900378318447)
,p_db_column_name=>'PROJECT_CODE_NAME'
,p_display_order=>530
,p_column_identifier=>'BJ'
,p_column_label=>'Project Code Name'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Project Code Names''',
'   and build_option_status = ''Include'''))
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738467099823318453)
,p_db_column_name=>'DEAL_TYPE'
,p_display_order=>540
,p_column_identifier=>'BR'
,p_column_label=>'Deal Type'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(19158512130599850300)
,p_rpt_show_filter_lov=>'1'
,p_display_condition_type=>'EXISTS'
,p_display_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from eba_proj_status',
' where deal_type_id is not null',
'   and exists (select null ',
'                 from eba_proj_deal_types',
'                where is_active_yn = ''Y'')',
'   and exists (select null',
'                 from apex_application_build_options',
'                where application_id = :APP_ID',
'                  and build_option_name = ''Project Deal Types''',
'                  and build_option_status = ''Include'')'))
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738467478673318454)
,p_db_column_name=>'PROJECT_STATUS'
,p_display_order=>550
,p_column_identifier=>'BS'
,p_column_label=>'Project Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(8916964241877251201)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738467826440318454)
,p_db_column_name=>'OPEN_CLOSED'
,p_display_order=>560
,p_column_identifier=>'BT'
,p_column_label=>'Project Open Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738446770598318418)
,p_db_column_name=>'TAGS'
,p_display_order=>570
,p_column_identifier=>'BU'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(9630388206340929376)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6722212'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EDIT_LINK:PROJECT:CATEGORY:MILESTONE:ACTION:ACTION_STATUS:AI_TYPE:TAGS:DUE_DATE:COMPLETED_DATE:DAY_DELTA:PAST_DUE:OWNER:'
,p_sort_column_1=>'DUE_DATE'
,p_sort_direction_1=>'ASC'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(20665141425742853516)
,p_plug_name=>'Issues'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3'
,p_plug_template=>wwv_flow_imp.id(1120070264285054172)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select i.id,',
'       p.cat_id as category,',
'       p.project_status,',
'       case when p.project_status not in (select id from eba_proj_status_codes where is_closed_status = ''Y'') then',
'           ''Open''',
'       else',
'           ''Closed''',
'       end project_open_status,',
'       i.tags,',
'       i.project_id,',
'       i.project_id as prj_id,',
'       i.cat_id as issue_category,',
'       i.issue,',
'       i.resolution,',
'       i.issue_detail,',
'       case when eba_proj_fw.is_edit_authorized(',
'                     p_username   => upper(:APP_USER),',
'                     p_project_id => i.project_id ) = ''Y'' then',
'           ''<a href="'' || apex_util.prepare_url(''f?p='' || :APP_ID || '':24:'' || :APP_SESSION || '':::24:P24_ID,P24_PROJECT_ID:'' || i.id || '','' || i.project_id) || ''"><img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil'
||'" alt="Edit Issue" /></a>''',
'       else',
'           null',
'       end as edit,',
'       case when i.owner_role_id is null then',
'           eba_proj_fw.get_name_from_email_address(i.issue_owner)',
'       else',
'           nvl((select r.name||'': ''||listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '
||''')',
'                   within group (order by lower(u.username)) owner',
'               from eba_proj_user_ref rf,',
'                    eba_proj_status_users u,',
'                    eba_proj_roles r',
'              where rf.role_id = i.owner_role_id',
'                and rf.project_id = i.project_id',
'                and u.id = rf.user_id',
'                and r.id = rf.role_id',
'              group by r.name',
'            ), (select ''No ''||r.name||'' defined''',
'                  from eba_proj_roles r',
'                 where r.id = i.owner_role_id)',
'            )',
'       end as issue_owner,',
'       i.issue_level,',
'       i.is_open,',
'       i.ref_num,',
'       i.resolved_on,',
'       i.created,',
'       lower(i.created_by) created_by,',
'       i.updated,',
'       lower(i.updated_by) updated_by',
'  from eba_proj_status_issues i, eba_proj_status p',
' where i.project_id = p.id',
'   and instr(i.tags,nvl(:P219_TAG,'' '')) > 0'))
,p_plug_source_type=>'NATIVE_IR'
);
wwv_flow_imp_page.create_worksheet(
 p_id=>wwv_flow_imp.id(20665141510140853516)
,p_name=>'Project Issues Report'
,p_max_row_count=>'1000000'
,p_max_row_count_message=>'The maximum row count for this report is #MAX_ROW_COUNT# rows.  Please apply a filter to reduce the number of records in your query.'
,p_no_data_found_message=>'No tagged Issues found.'
,p_show_nulls_as=>'-'
,p_pagination_type=>'ROWS_X_TO_Y'
,p_pagination_display_pos=>'BOTTOM_RIGHT'
,p_report_list_mode=>'TABS'
,p_lazy_loading=>false
,p_show_detail_link=>'N'
,p_download_formats=>'CSV:HTML:XLSX:PDF'
,p_enable_mail_download=>'Y'
,p_owner=>'ALLAN'
,p_internal_uid=>20598894505325730975
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738474665876357160)
,p_db_column_name=>'ID'
,p_display_order=>1
,p_column_identifier=>'A'
,p_column_label=>'Edit'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738475076924357161)
,p_db_column_name=>'PROJECT_ID'
,p_display_order=>2
,p_column_identifier=>'B'
,p_column_label=>'Project'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP,200:P200_ID:#PRJ_ID#'
,p_column_linktext=>'#PROJECT_ID#'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(11568552854773371965)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738475405418357161)
,p_db_column_name=>'ISSUE'
,p_display_order=>3
,p_column_identifier=>'C'
,p_column_label=>'Issue'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738475891184357163)
,p_db_column_name=>'RESOLUTION'
,p_display_order=>4
,p_column_identifier=>'D'
,p_column_label=>'Resolution'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738476209896357164)
,p_db_column_name=>'ISSUE_DETAIL'
,p_display_order=>5
,p_column_identifier=>'E'
,p_column_label=>'Issue Detail'
,p_allow_sorting=>'N'
,p_allow_ctrl_breaks=>'N'
,p_allow_aggregations=>'N'
,p_allow_computations=>'N'
,p_allow_charting=>'N'
,p_allow_group_by=>'N'
,p_allow_pivot=>'N'
,p_column_type=>'CLOB'
,p_heading_alignment=>'LEFT'
,p_rpt_show_filter_lov=>'N'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738476607664357164)
,p_db_column_name=>'ISSUE_OWNER'
,p_display_order=>7
,p_column_identifier=>'G'
,p_column_label=>'Issue Owner'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738477091073357165)
,p_db_column_name=>'ISSUE_LEVEL'
,p_display_order=>8
,p_column_identifier=>'H'
,p_column_label=>'Issue Level'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(7564453797386445777)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738477483544357166)
,p_db_column_name=>'IS_OPEN'
,p_display_order=>9
,p_column_identifier=>'I'
,p_column_label=>'Is Open'
,p_column_type=>'STRING'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(8910494933283350717)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738477824846357166)
,p_db_column_name=>'RESOLVED_ON'
,p_display_order=>10
,p_column_identifier=>'J'
,p_column_label=>'Resolved On'
,p_column_html_expression=>'<span style="white-space:nowrap;">#RESOLVED_ON#</span>'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'fmDD-MON-YYYY'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738478292191357167)
,p_db_column_name=>'CREATED'
,p_display_order=>11
,p_column_identifier=>'K'
,p_column_label=>'Created'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'since'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738478656489357167)
,p_db_column_name=>'CREATED_BY'
,p_display_order=>12
,p_column_identifier=>'L'
,p_column_label=>'Created By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738479094482357168)
,p_db_column_name=>'UPDATED'
,p_display_order=>13
,p_column_identifier=>'M'
,p_column_label=>'Updated'
,p_column_type=>'DATE'
,p_heading_alignment=>'LEFT'
,p_format_mask=>'since'
,p_tz_dependent=>'Y'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738479469834357168)
,p_db_column_name=>'UPDATED_BY'
,p_display_order=>14
,p_column_identifier=>'N'
,p_column_label=>'Updated By'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738474213013357155)
,p_db_column_name=>'EDIT'
,p_display_order=>24
,p_column_identifier=>'P'
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
,p_display_condition_type=>'NEVER'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738472699122357152)
,p_db_column_name=>'CATEGORY'
,p_display_order=>34
,p_column_identifier=>'Q'
,p_column_label=>'Project Category'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(8913363142876358961)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738471861567357149)
,p_db_column_name=>'PROJECT_STATUS'
,p_display_order=>44
,p_column_identifier=>'R'
,p_column_label=>'Project Status'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(8916964241877251201)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738472255163357152)
,p_db_column_name=>'PROJECT_OPEN_STATUS'
,p_display_order=>54
,p_column_identifier=>'S'
,p_column_label=>'Project Open Status'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738473885342357154)
,p_db_column_name=>'REF_NUM'
,p_display_order=>64
,p_column_identifier=>'T'
,p_column_label=>'Reference Number'
,p_column_type=>'STRING'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738473080456357153)
,p_db_column_name=>'PRJ_ID'
,p_display_order=>74
,p_column_identifier=>'U'
,p_column_label=>'Prj id'
,p_column_type=>'NUMBER'
,p_display_text_as=>'HIDDEN'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738473503767357154)
,p_db_column_name=>'ISSUE_CATEGORY'
,p_display_order=>84
,p_column_identifier=>'V'
,p_column_label=>'Issue Category'
,p_column_type=>'NUMBER'
,p_display_text_as=>'LOV_ESCAPE_SC'
,p_heading_alignment=>'LEFT'
,p_rpt_named_lov=>wwv_flow_imp.id(3927737161011692001)
,p_rpt_show_filter_lov=>'1'
,p_use_as_row_header=>'N'
,p_required_patch=>wwv_flow_imp.id(3927734266816599065)
);
wwv_flow_imp_page.create_worksheet_column(
 p_id=>wwv_flow_imp.id(738471449550357148)
,p_db_column_name=>'TAGS'
,p_display_order=>94
,p_column_identifier=>'W'
,p_column_label=>'Tags'
,p_column_type=>'STRING'
,p_heading_alignment=>'LEFT'
,p_use_as_row_header=>'N'
);
wwv_flow_imp_page.create_worksheet_rpt(
 p_id=>wwv_flow_imp.id(20665069696001656992)
,p_application_user=>'APXWS_DEFAULT'
,p_report_seq=>10
,p_report_alias=>'6722328'
,p_status=>'PUBLIC'
,p_is_default=>'Y'
,p_report_columns=>'EDIT:ISSUE:PROJECT_ID:CATEGORY:ISSUE_CATEGORY:TAGS:RESOLUTION:ISSUE_DETAIL:ISSUE_OWNER:ISSUE_LEVEL:IS_OPEN:RESOLVED_ON:UPDATED:'
,p_sort_column_1=>'ISSUE_LEVEL'
,p_sort_direction_1=>'ASC'
,p_sort_column_2=>'UPDATED'
,p_sort_direction_2=>'DESC'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(686454293828304769)
,p_name=>'P219_TAG_DISPLAY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(711447356010939480)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(711447437696939481)
,p_name=>'P219_TAG'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(711447356010939480)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(686454343949304770)
,p_computation_sequence=>10
,p_computation_item=>'P219_TAG_DISPLAY'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'upper(:P219_TAG)'
);
wwv_flow_imp.component_end;
end;
/
