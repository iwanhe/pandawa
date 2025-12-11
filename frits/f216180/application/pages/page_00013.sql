prompt --application/pages/page_00013
begin
--   Manifest
--     PAGE: 00013
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
 p_id=>13
,p_name=>'Task Details'
,p_page_mode=>'MODAL'
,p_step_title=>'Task Details'
,p_allow_duplicate_submissions=>'N'
,p_autocomplete_on_off=>'OFF'
,p_step_template=>wwv_flow_imp.id(30015775364420567640)
,p_page_template_options=>'#DEFAULT#:js-dialog-class-t-Drawer--pullOutEnd'
,p_protection_level=>'C'
,p_page_component_map=>'25'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35328538770723005415)
,p_plug_name=>'Subject'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(30016878494109567695)
,p_plug_display_sequence=>60
,p_function_body_language=>'PLSQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_result clob;',
'begin',
'    select to_clob(replace(replace(replace(''',
'            <div class="a-CardView has-title has-badge">',
'              <div class="a-CardView-header">',
'                <div class="a-CardView-headerBody">',
'                  <h3 class="a-CardView-title">#SUBJECT#</h3>',
'                </div>',
'                <div class="a-CardView-badge #BADGE_CSS_CLASSES#" title="#BADGE_TEXT#">',
'                  <span class="a-CardView-badgeValue">#BADGE_TEXT#</span>',
'                </div>',
'              </div>',
'            </div>'',',
'           ''#SUBJECT#''          , subject          ),',
'           ''#BADGE_TEXT#''       , badge_text       ),',
'           ''#BADGE_CSS_CLASSES#'', badge_css_classes) )',
'      into l_result',
'      from table ( apex_approval.get_tasks (',
'                       p_context => ''SINGLE_TASK'',',
'                       p_task_id => :P13_TASK_ID ) );',
'',
'    return l_result;',
'exception',
'    when no_data_found then',
'        return l_result;',
'end;'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_DYNAMIC_CONTENT'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35328539156464005416)
,p_name=>'Overview'
,p_template=>wwv_flow_imp.id(30016878494109567695)
,p_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--hideHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select task_def_name        as type,',
'       created_on           as initiated,',
'       initiator_lower      as initiator,',
'       actual_owner_lower   as owner,',
'       priority_level       as priority,',
'       due_on               as due,',
'       outcome',
'  from table ( apex_approval.get_tasks (',
'                   p_context => ''SINGLE_TASK'',',
'                   p_task_id => :P13_TASK_ID ) )'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P13_TASK_ID'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(30016920012434567715)
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328539544716005416)
,p_query_column_id=>1
,p_column_alias=>'TYPE'
,p_column_display_sequence=>10
,p_column_heading=>'Type'
,p_use_as_row_header=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328539998577005417)
,p_query_column_id=>2
,p_column_alias=>'INITIATED'
,p_column_display_sequence=>20
,p_column_heading=>'Initiated'
,p_use_as_row_header=>'N'
,p_column_format=>'SINCE'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328540358584005417)
,p_query_column_id=>3
,p_column_alias=>'INITIATOR'
,p_column_display_sequence=>30
,p_column_heading=>'Initiator'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328540722559005417)
,p_query_column_id=>4
,p_column_alias=>'OWNER'
,p_column_display_sequence=>40
,p_column_heading=>'Owner'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328541146675005418)
,p_query_column_id=>5
,p_column_alias=>'PRIORITY'
,p_column_display_sequence=>50
,p_column_heading=>'Priority'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328541571695005418)
,p_query_column_id=>6
,p_column_alias=>'DUE'
,p_column_display_sequence=>60
,p_column_heading=>'Due'
,p_use_as_row_header=>'N'
,p_column_format=>'SINCE'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328541936993005418)
,p_query_column_id=>7
,p_column_alias=>'OUTCOME'
,p_column_display_sequence=>70
,p_column_heading=>'Outcome'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35328542322922005418)
,p_plug_name=>'Edit Task'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_imp.id(30016814479982567666)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35328546381964005421)
,p_plug_name=>'Delegate'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-popup-noOverlay:js-popup-callout:js-dialog-nosize'
,p_region_attributes=>'data-parent-element="#OPEN_DELEGATE_DIALOG"'
,p_plug_template=>wwv_flow_imp.id(30016863291844567689)
,p_plug_display_sequence=>100
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P13_TASK_ID,',
'    p_operation => apex_approval.c_task_op_delegate )'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35328547593182005421)
,p_plug_name=>'Priority'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-popup-noOverlay:js-popup-callout:js-dialog-nosize'
,p_region_attributes=>'data-parent-element="#OPEN_PRIORITY_DIALOG"'
,p_plug_template=>wwv_flow_imp.id(30016863291844567689)
,p_plug_display_sequence=>110
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P13_TASK_ID,',
'    p_operation => apex_approval.c_task_op_set_priority )'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35328548849598005443)
,p_plug_name=>'Due'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-popup-noOverlay:js-popup-callout:js-dialog-nosize'
,p_region_attributes=>'data-parent-element="#OPEN_DUE_DIALOG"'
,p_plug_template=>wwv_flow_imp.id(30016863291844567689)
,p_plug_display_sequence=>120
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P13_TASK_ID,',
'    p_operation => apex_approval.c_task_op_set_due_date )'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35328550063049005443)
,p_plug_name=>'Request Information'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-popup-noOverlay:js-popup-callout:js-dialog-nosize'
,p_region_attributes=>'data-parent-element="#OPEN_REQUEST_INFORMATION_DIALOG"'
,p_plug_template=>wwv_flow_imp.id(30016863291844567689)
,p_plug_display_sequence=>130
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P13_TASK_ID,',
'    p_operation => apex_approval.c_task_op_request_info )'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35328551261556005444)
,p_plug_name=>'Submit Information'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-popup-noOverlay:js-popup-callout:js-dialog-nosize'
,p_region_attributes=>'data-parent-element="#OPEN_SUBMIT_INFORMATION_DIALOG"'
,p_plug_template=>wwv_flow_imp.id(30016863291844567689)
,p_plug_display_sequence=>140
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P13_TASK_ID,',
'    p_operation => apex_approval.c_task_op_submit_info )'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35328552405081005445)
,p_plug_name=>'Invite Participant'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-popup-noOverlay:js-popup-callout:js-dialog-nosize'
,p_region_attributes=>'data-parent-element="#OPEN_INVITE_PARTICIPANT_DIALOG"'
,p_plug_template=>wwv_flow_imp.id(30016863291844567689)
,p_plug_display_sequence=>150
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P13_TASK_ID,',
'    p_operation => apex_approval.c_task_op_add_owner )'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35328553648342005446)
,p_plug_name=>'Cancel Task'
,p_region_template_options=>'#DEFAULT#:js-dialog-autoheight:js-popup-noOverlay:js-popup-callout:js-dialog-nosize'
,p_region_attributes=>'data-parent-element="#OPEN_CANCEL_TASK_DIALOG"'
,p_plug_template=>wwv_flow_imp.id(30016863291844567689)
,p_plug_display_sequence=>160
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Do you really want to cancel this task?</p>',
'<p>This will mark the task as no longer needed.</p>'))
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P13_TASK_ID,',
'    p_operation => apex_approval.c_task_op_cancel )'))
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35328554422208005446)
,p_name=>'Details'
,p_template=>wwv_flow_imp.id(30016840383418567678)
,p_display_sequence=>170
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3:t-ContentBlock--lightBG:margin-top-md'
,p_component_template_options=>'#DEFAULT#:t-AVPList--leftAligned'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select PEMINTA,',
'       JABATAN_PEMINTA,',
'       LOKASI_PEMINTA,',
'       PENGGUNA,',
'       JABATAN_PENGGUNA,',
'       LOKASI_PENGGUNA,',
'       MANDATORY_HD_SOFT,',
'       OPTIONAL_SOFT,',
'       OPTIONAL_HD,',
'       KETERANGAN,',
'       status,',
'       updated_by',
'  from FORM_REQUEST_IT_TRX',
' where req_id = (select param_value ',
'  from apex_task_parameters ',
' where task_id= :P13_TASK_ID ',
'   and param_static_id=''REQ_ID'')',
' union',
'select PEMINTA,',
'       JABATAN_PEMINTA,',
'       LOKASI_PEMINTA,',
'       PENGGUNA,',
'       JABATAN_PENGGUNA,',
'       LOKASI_PENGGUNA,',
'       MANDATORY_HD_SOFT,',
'       OPTIONAL_SOFT,',
'       OPTIONAL_HD,',
'       KETERANGAN,',
'       status,',
'       updated_by',
'  from FORM_REQUEST_IT_TRX ',
' where req_id = :P13_TASK_ID;'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P13_TASK_ID'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(30016920012434567715)
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(34915278844409187650)
,p_query_column_id=>1
,p_column_alias=>'PEMINTA'
,p_column_display_sequence=>10
,p_column_heading=>'Peminta'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35350706347228511701)
,p_query_column_id=>2
,p_column_alias=>'JABATAN_PEMINTA'
,p_column_display_sequence=>20
,p_column_heading=>'Jabatan Peminta'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35350706459379511702)
,p_query_column_id=>3
,p_column_alias=>'LOKASI_PEMINTA'
,p_column_display_sequence=>30
,p_column_heading=>'Lokasi Peminta'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35350706505092511703)
,p_query_column_id=>4
,p_column_alias=>'PENGGUNA'
,p_column_display_sequence=>40
,p_column_heading=>'Pengguna'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35350706661283511704)
,p_query_column_id=>5
,p_column_alias=>'JABATAN_PENGGUNA'
,p_column_display_sequence=>50
,p_column_heading=>'Jabatan Pengguna'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35350706797712511705)
,p_query_column_id=>6
,p_column_alias=>'LOKASI_PENGGUNA'
,p_column_display_sequence=>60
,p_column_heading=>'Lokasi Pengguna'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35350706893166511706)
,p_query_column_id=>7
,p_column_alias=>'MANDATORY_HD_SOFT'
,p_column_display_sequence=>70
,p_column_heading=>'Mandatory Hd Soft'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35350706941891511707)
,p_query_column_id=>8
,p_column_alias=>'OPTIONAL_SOFT'
,p_column_display_sequence=>80
,p_column_heading=>'Optional Soft'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35350707012782511708)
,p_query_column_id=>9
,p_column_alias=>'OPTIONAL_HD'
,p_column_display_sequence=>90
,p_column_heading=>'Optional Hd'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35350707158517511709)
,p_query_column_id=>10
,p_column_alias=>'KETERANGAN'
,p_column_display_sequence=>100
,p_column_heading=>'Keterangan'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35350707291824511710)
,p_query_column_id=>11
,p_column_alias=>'STATUS'
,p_column_display_sequence=>110
,p_column_heading=>'Status'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35350707319539511711)
,p_query_column_id=>12
,p_column_alias=>'UPDATED_BY'
,p_column_display_sequence=>120
,p_column_heading=>'Updated By'
,p_use_as_row_header=>'N'
,p_heading_alignment=>'LEFT'
,p_disable_sort_column=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35328555630931005447)
,p_name=>'Comments'
,p_template=>wwv_flow_imp.id(30016840383418567678)
,p_display_sequence=>180
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-ContentBlock--h3'
,p_component_template_options=>'#DEFAULT#:t-Comments--chat:t-Report--hideNoPagination'
,p_item_display_point=>'BELOW'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select apex_string.get_initials(created_by) as user_icon,',
'       ''u-color-''||ora_hash(created_by,45)  as icon_modifier,',
'       created_by                           as user_name,',
'       text                                 as comment_text,',
'       created_on                           as comment_date,',
'       null                                 as comment_modifiers,',
'       null                                 as actions,',
'       null                                 as attribute_1,',
'       null                                 as attribute_2,',
'       null                                 as attribute_3,',
'       null                                 as attribute_4,',
'       case when task_id != :P13_TASK_ID',
'           then ''u-warning''',
'           else null',
'       end                                  as column_css_class',
'  from apex_task_comments',
' where :P13_ALL_COMMENTS = ''N'' and task_id = :P13_TASK_ID',
'    or :P13_ALL_COMMENTS = ''Y'' and task_id in ( ',
'                       select task_id ',
'                         from apex_tasks',
'                      connect by prior previous_task_id = task_id',
'                        start with task_id = :P13_TASK_ID )'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P13_TASK_ID,P13_ALL_COMMENTS'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(30016908296267567709)
,p_query_num_rows=>1000
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328556086232005447)
,p_query_column_id=>1
,p_column_alias=>'USER_ICON'
,p_column_display_sequence=>10
,p_column_heading=>'User Icon'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328556401933005448)
,p_query_column_id=>2
,p_column_alias=>'ICON_MODIFIER'
,p_column_display_sequence=>20
,p_column_heading=>'Icon Modifier'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328556859832005448)
,p_query_column_id=>3
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>30
,p_column_heading=>'User Name'
,p_use_as_row_header=>'Y'
,p_column_html_expression=>'<span style="text-transform:lowercase">#USER_NAME#</span>'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328557230521005448)
,p_query_column_id=>4
,p_column_alias=>'COMMENT_TEXT'
,p_column_display_sequence=>40
,p_column_heading=>'Comment Text'
,p_use_as_row_header=>'N'
,p_column_css_class=>'#COLUMN_CSS_CLASS#'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328557646192005448)
,p_query_column_id=>5
,p_column_alias=>'COMMENT_DATE'
,p_column_display_sequence=>50
,p_column_heading=>'Comment Date'
,p_use_as_row_header=>'Y'
,p_column_format=>'SINCE'
,p_default_sort_column_sequence=>1
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328558004724005449)
,p_query_column_id=>6
,p_column_alias=>'COMMENT_MODIFIERS'
,p_column_display_sequence=>60
,p_column_heading=>'Comment Modifiers'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328558415186005449)
,p_query_column_id=>7
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>70
,p_column_heading=>'Actions'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328558846002005449)
,p_query_column_id=>8
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>80
,p_column_heading=>'Attribute 1'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328559276416005449)
,p_query_column_id=>9
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>90
,p_column_heading=>'Attribute 2'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328559635736005450)
,p_query_column_id=>10
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>100
,p_column_heading=>'Attribute 3'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328560017007005450)
,p_query_column_id=>11
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>110
,p_column_heading=>'Attribute 4'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328560493019005450)
,p_query_column_id=>12
,p_column_alias=>'COLUMN_CSS_CLASS'
,p_column_display_sequence=>120
,p_column_heading=>'Column Css Class'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35328562073056005452)
,p_plug_name=>'History'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-useLocalStorage:is-collapsed:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(30016830580254567674)
,p_plug_display_sequence=>190
,p_include_in_reg_disp_sel_yn=>'Y'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(35328562850544005453)
,p_name=>'History'
,p_parent_plug_id=>wwv_flow_imp.id(35328562073056005452)
,p_template=>wwv_flow_imp.id(30016830580254567674)
,p_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:t-Region--removeHeader js-removeLandmark:t-Region--noBorder:t-Region--scrollBody:margin-top-none:margin-bottom-none'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--rowHighlight:t-Report--inline:t-Report--hideNoPagination'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select event_type,',
'       event_timestamp,',
'       event_creator_lower,',
'       display_msg',
'  from table ( apex_approval.get_task_history (',
'                   p_task_id     => :P13_TASK_ID,',
'                   p_include_all => :P13_ALL_HISTORY ) )'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P13_TASK_ID,P13_ALL_HISTORY'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(30016917067715567713)
,p_query_num_rows=>20
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_pagination_display_position=>'BOTTOM_LEFT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328563263513005453)
,p_query_column_id=>1
,p_column_alias=>'EVENT_TYPE'
,p_column_display_sequence=>10
,p_column_heading=>'Event'
,p_use_as_row_header=>'Y'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328563630352005453)
,p_query_column_id=>2
,p_column_alias=>'EVENT_TIMESTAMP'
,p_column_display_sequence=>20
,p_column_heading=>'Time '
,p_use_as_row_header=>'Y'
,p_column_format=>'SINCE'
,p_default_sort_column_sequence=>1
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328564013426005453)
,p_query_column_id=>3
,p_column_alias=>'EVENT_CREATOR_LOWER'
,p_column_display_sequence=>30
,p_column_heading=>'User'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(35328564451444005454)
,p_query_column_id=>4
,p_column_alias=>'DISPLAY_MSG'
,p_column_display_sequence=>40
,p_column_heading=>'Message'
,p_use_as_row_header=>'N'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(35328564865188005454)
,p_plug_name=>'Buttons'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--stickToBottom:t-ButtonRegion--slimPadding:margin-bottom-none'
,p_plug_template=>wwv_flow_imp.id(30016814479982567666)
,p_plug_display_sequence=>200
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_03'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328561689321005452)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(35328555630931005447)
,p_button_name=>'ADD_COMMENT'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_image_alt=>'Add Comment'
,p_button_alignment=>'RIGHT'
,p_grid_new_row=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328565298654005454)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(35328564865188005454)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_warn_on_unsaved_changes=>null
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328565664636005454)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(35328564865188005454)
,p_button_name=>'CLAIM'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Claim Task'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P13_TASK_ID,',
'    p_operation => apex_approval.c_task_op_claim )'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328566060150005455)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(35328564865188005454)
,p_button_name=>'REJECT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--link:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(30016952178321567733)
,p_button_image_alt=>'Reject'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P13_TASK_ID,',
'    p_operation => apex_approval.c_task_op_reject )'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-times-circle-o'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328566448250005455)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(35328564865188005454)
,p_button_name=>'APPROVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--success:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(30016952178321567733)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Approve'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P13_TASK_ID,',
'    p_operation => apex_approval.c_task_op_approve )'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_icon_css_classes=>'fa-check'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328547165576005421)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(35328546381964005421)
,p_button_name=>'DELEGATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Delegate'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328548493327005442)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(35328547593182005421)
,p_button_name=>'SET_PRIORITY'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Change Priority'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328549685989005443)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(35328548849598005443)
,p_button_name=>'SET_DUE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Change Due Date'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328550865835005444)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(35328550063049005443)
,p_button_name=>'REQUEST_INFORMATION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Request Information'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328552069127005445)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(35328551261556005444)
,p_button_name=>'SUBMIT_INFORMATION'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Submit Information'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328553221339005446)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(35328552405081005445)
,p_button_name=>'INVITE_PARTICIPANT'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Invite Participant'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328554040249005446)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(35328553648342005446)
,p_button_name=>'CANCEL_TASK'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Cancel Task'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_css_classes=>'u-danger'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328542733448005419)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(35328542322922005418)
,p_button_name=>'RELEASE'
,p_button_static_id=>'RELEASE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_image_alt=>'Release'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P13_TASK_ID,',
'    p_operation => apex_approval.c_task_op_release )'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'u-pullLeft'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328543125600005419)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(35328542322922005418)
,p_button_name=>'OPEN_DELEGATE_DIALOG'
,p_button_static_id=>'OPEN_DELEGATE_DIALOG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_image_alt=>'Delegate'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P13_TASK_ID,',
'    p_operation => apex_approval.c_task_op_delegate )'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'u-pullLeft'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328543562843005419)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(35328542322922005418)
,p_button_name=>'OPEN_PRIORITY_DIALOG'
,p_button_static_id=>'OPEN_PRIORITY_DIALOG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_image_alt=>'Change Priority'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P13_TASK_ID,',
'    p_operation => apex_approval.c_task_op_set_priority )'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'u-pullLeft'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328543928958005420)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(35328542322922005418)
,p_button_name=>'OPEN_DUE_DIALOG'
,p_button_static_id=>'OPEN_DUE_DIALOG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_image_alt=>'Change Due Date'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P13_TASK_ID,',
'    p_operation => apex_approval.c_task_op_set_due_date )'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'u-pullLeft'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328544314020005420)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(35328542322922005418)
,p_button_name=>'OPEN_REQUEST_INFORMATION_DIALOG'
,p_button_static_id=>'OPEN_REQUEST_INFORMATION_DIALOG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_image_alt=>'Request Information'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P13_TASK_ID,',
'    p_operation => apex_approval.c_task_op_request_info )'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'u-pullLeft'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328544722039005420)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(35328542322922005418)
,p_button_name=>'OPEN_SUBMIT_INFORMATION_DIALOG'
,p_button_static_id=>'OPEN_SUBMIT_INFORMATION_DIALOG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_image_alt=>'Submit Information'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P13_TASK_ID,',
'    p_operation => apex_approval.c_task_op_submit_info )'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'u-pullLeft'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328545125828005420)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(35328542322922005418)
,p_button_name=>'OPEN_INVITE_PARTICIPANT_DIALOG'
,p_button_static_id=>'OPEN_INVITE_PARTICIPANT_DIALOG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_image_alt=>'Invite Participant'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P13_TASK_ID,',
'    p_operation => apex_approval.c_task_op_add_owner )'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'u-pullLeft'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328545566629005420)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(35328542322922005418)
,p_button_name=>'OPEN_CANCEL_TASK_DIALOG'
,p_button_static_id=>'OPEN_CANCEL_TASK_DIALOG'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_image_alt=>'Cancel Task'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P13_TASK_ID,',
'    p_operation => apex_approval.c_task_op_cancel )'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'u-pullLeft'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(35328545938448005420)
,p_button_sequence=>90
,p_button_plug_id=>wwv_flow_imp.id(35328542322922005418)
,p_button_name=>'RENEW'
,p_button_static_id=>'RENEW'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(30016952085195567733)
,p_button_image_alt=>'Renew Task'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.is_allowed (',
'    p_task_id   => :P13_TASK_ID,',
'    p_operation => apex_approval.c_task_op_renew )'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'u-pullLeft'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(35328584822483005464)
,p_branch_name=>'Reload Dialog'
,p_branch_action=>'f?p=&APP_ID.:&APP_PAGE_ID.:&APP_SESSION.::&DEBUG.::P13_TASK_ID:&P13_TASK_ID.&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35328537905316005415)
,p_name=>'P13_TASK_ID'
,p_item_sequence=>10
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35328538340840005415)
,p_name=>'P13_SUCCESS_MESSAGE'
,p_item_sequence=>20
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'N'
,p_protection_level=>'I'
,p_encrypt_session_state_yn=>'N'
,p_attribute_01=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35328546733780005421)
,p_name=>'P13_NEW_OWNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35328546381964005421)
,p_prompt=>'New Owner'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select disp,',
'       val',
'  from table ( apex_approval.get_task_delegates ( p_task_id => :P13_TASK_ID ) )'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(30016949596162567731)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attribute_01=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35328547978737005422)
,p_name=>'P13_NEW_PRIORITY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35328547593182005421)
,p_prompt=>'New Priority'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select priority',
'  from apex_tasks',
' where task_id = :P13_TASK_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'UNIFIED_TASK_LIST.LOV.PRIORITY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select disp,',
'       val',
'  from table ( apex_approval.get_lov_priority )',
' order by insert_order'))
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(30016949596162567731)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_lov_display_extra=>'NO'
,p_protection_level=>'S'
,p_attribute_01=>'1'
,p_attribute_02=>'NONE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35328549248766005443)
,p_name=>'P13_NEW_DUE_DATE'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35328548849598005443)
,p_use_cache_before_default=>'NO'
,p_prompt=>'New Due Date'
,p_format_mask=>'YYYY-MM-DD HH24:MI'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select to_char(due_on, ''YYYY-MM-DD HH24:MI'')',
'  from apex_tasks',
' where task_id = :P13_TASK_ID'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_DATE_PICKER_APEX'
,p_cSize=>30
,p_field_template=>wwv_flow_imp.id(30016949596162567731)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_protection_level=>'S'
,p_attribute_01=>'Y'
,p_attribute_02=>'INLINE'
,p_attribute_03=>'NONE'
,p_attribute_06=>'NONE'
,p_attribute_09=>'N'
,p_attribute_11=>'N'
,p_attribute_12=>'MONTH-PICKER:YEAR-PICKER:CLEAR-BUTTON'
,p_attribute_13=>'VISIBLE'
,p_attribute_14=>'5'
,p_attribute_15=>'FOCUS'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35328550449990005444)
,p_name=>'P13_REQUEST_TEXT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35328550063049005443)
,p_prompt=>'Message'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(30016949596162567731)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35328551600536005444)
,p_name=>'P13_SUBMIT_TEXT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35328551261556005444)
,p_prompt=>'Message'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>4000
,p_cHeight=>5
,p_field_template=>wwv_flow_imp.id(30016949596162567731)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35328552862678005445)
,p_name=>'P13_NEW_POTENTIAL_OWNER'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35328552405081005445)
,p_prompt=>'New Potential Owner'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>30
,p_cMaxlength=>100
,p_field_template=>wwv_flow_imp.id(30016950826602567731)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_is_persistent=>'N'
,p_attribute_01=>'N'
,p_attribute_02=>'N'
,p_attribute_04=>'TEXT'
,p_attribute_05=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35328560814463005451)
,p_name=>'P13_ALL_COMMENTS'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35328555630931005447)
,p_prompt=>'Include comments from expired tasks'
,p_source=>'N'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_grid_label_column_span=>0
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select task_id ',
'  from apex_tasks',
' where task_id = :P13_TASK_ID',
'   and previous_task_id is not null'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(30016949381588567731)
,p_item_template_options=>'#DEFAULT#'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35328561213368005451)
,p_name=>'P13_COMMENT_TEXT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(35328555630931005447)
,p_prompt=>'Comment'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>30
,p_cMaxlength=>2000
,p_cHeight=>3
,p_field_template=>wwv_flow_imp.id(30016949596162567731)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--stretchInputs'
,p_is_persistent=>'N'
,p_attribute_01=>'Y'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
,p_attribute_04=>'BOTH'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(35328562406426005452)
,p_name=>'P13_ALL_HISTORY'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(35328562073056005452)
,p_prompt=>'Include history from expired tasks'
,p_source=>'N'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SINGLE_CHECKBOX'
,p_grid_label_column_span=>0
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select task_id ',
'  from apex_tasks',
' where task_id = :P13_TASK_ID',
'   and previous_task_id is not null'))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(30016949381588567731)
,p_item_template_options=>'#DEFAULT#:margin-top-sm:margin-bottom-sm:margin-left-sm'
,p_warn_on_unsaved_changes=>'I'
,p_attribute_01=>'N'
,p_attribute_02=>'Y'
,p_attribute_03=>'N'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(35328578823227005461)
,p_validation_name=>'Invite Participant'
,p_validation_sequence=>10
,p_validation=>'P13_NEW_POTENTIAL_OWNER'
,p_validation_type=>'ITEM_NOT_NULL'
,p_error_message=>'Please provide a new potential owner'
,p_when_button_pressed=>wwv_flow_imp.id(35328553221339005446)
,p_associated_item=>wwv_flow_imp.id(35328552862678005445)
,p_error_display_location=>'INLINE_WITH_FIELD'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35328566824508005455)
,p_name=>'Delegate'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35328543125600005419)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35328567240768005456)
,p_event_id=>wwv_flow_imp.id(35328566824508005455)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35328546381964005421)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35328573208341005459)
,p_name=>'Refresh - Comments'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P13_ALL_COMMENTS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35328573633895005459)
,p_event_id=>wwv_flow_imp.id(35328573208341005459)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35328555630931005447)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35328567709439005456)
,p_name=>'Change Priority'
,p_event_sequence=>20
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35328543562843005419)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35328568111767005456)
,p_event_id=>wwv_flow_imp.id(35328567709439005456)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35328547593182005421)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35328574186220005459)
,p_name=>'Refresh - History'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P13_ALL_HISTORY'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35328574561732005459)
,p_event_id=>wwv_flow_imp.id(35328574186220005459)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35328562850544005453)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35328568652036005456)
,p_name=>'Change Due Date'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35328543928958005420)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35328569008787005457)
,p_event_id=>wwv_flow_imp.id(35328568652036005456)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35328548849598005443)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35328569558943005457)
,p_name=>'Request Information'
,p_event_sequence=>40
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35328544314020005420)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35328569994794005457)
,p_event_id=>wwv_flow_imp.id(35328569558943005457)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35328550063049005443)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35328570432807005457)
,p_name=>'Submit Information'
,p_event_sequence=>50
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35328544722039005420)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35328570851281005457)
,p_event_id=>wwv_flow_imp.id(35328570432807005457)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35328551261556005444)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35328571307973005458)
,p_name=>'Invite Participant'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35328545125828005420)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35328571834061005458)
,p_event_id=>wwv_flow_imp.id(35328571307973005458)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35328552405081005445)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35328572331862005458)
,p_name=>'Open Cancel Task Dialog'
,p_event_sequence=>70
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35328545566629005420)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35328572769739005458)
,p_event_id=>wwv_flow_imp.id(35328572331862005458)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_OPEN_REGION'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35328553648342005446)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35328575094829005459)
,p_name=>'Add Comment'
,p_event_sequence=>210
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35328561689321005452)
,p_condition_element=>'P13_COMMENT_TEXT'
,p_triggering_condition_type=>'NOT_NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35328575415034005460)
,p_event_id=>wwv_flow_imp.id(35328575094829005459)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_approval.add_task_comment(',
'    p_task_id => :P13_TASK_ID,',
'    p_text    => :P13_COMMENT_TEXT);'))
,p_attribute_02=>'P13_TASK_ID,P13_COMMENT_TEXT'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35328575968025005460)
,p_event_id=>wwv_flow_imp.id(35328575094829005459)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35328555630931005447)
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35328576440867005460)
,p_event_id=>wwv_flow_imp.id(35328575094829005459)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CLEAR'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P13_COMMENT_TEXT'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35328576903485005460)
,p_event_id=>wwv_flow_imp.id(35328575094829005459)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SET_FOCUS'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P13_COMMENT_TEXT'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35328577461304005461)
,p_event_id=>wwv_flow_imp.id(35328575094829005459)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(35328562850544005453)
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(35328577903953005461)
,p_name=>'Cancel'
,p_event_sequence=>220
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(35328565298654005454)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(35328578310153005461)
,p_event_id=>wwv_flow_imp.id(35328577903953005461)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35328579237890005462)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Claim'
,p_attribute_01=>'CLAIM_TASK'
,p_attribute_02=>'P13_TASK_ID'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(35328565664636005454)
,p_internal_uid=>35328579237890005462
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35328579627847005462)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Approve'
,p_attribute_01=>'APPROVE_TASK'
,p_attribute_02=>'P13_TASK_ID'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(35328566448250005455)
,p_process_success_message=>'Task approved'
,p_internal_uid=>35328579627847005462
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35328580019412005462)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Reject'
,p_attribute_01=>'REJECT_TASK'
,p_attribute_02=>'P13_TASK_ID'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(35328566060150005455)
,p_process_success_message=>'Task rejected'
,p_internal_uid=>35328580019412005462
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35328580477447005462)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Release'
,p_attribute_01=>'RELEASE_TASK'
,p_attribute_02=>'P13_TASK_ID'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(35328542733448005419)
,p_process_success_message=>'Task released - can now be claimed by others'
,p_internal_uid=>35328580477447005462
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35328580887849005462)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Delegate'
,p_attribute_01=>'DELEGATE_TASK'
,p_attribute_02=>'P13_TASK_ID'
,p_attribute_04=>'P13_NEW_OWNER'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(35328547165576005421)
,p_process_success_message=>'Task delegated to &P13_NEW_OWNER!HTML.'
,p_internal_uid=>35328580887849005462
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35328581260855005463)
,p_process_sequence=>60
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Change Priority'
,p_attribute_01=>'SET_TASK_PRIORITY'
,p_attribute_02=>'P13_TASK_ID'
,p_attribute_05=>'P13_NEW_PRIORITY'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(35328548493327005442)
,p_process_success_message=>'Task priority changed'
,p_internal_uid=>35328581260855005463
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35328581668705005463)
,p_process_sequence=>70
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Change Due Date'
,p_attribute_01=>'SET_DUE_DATE'
,p_attribute_02=>'P13_TASK_ID'
,p_attribute_06=>'P13_NEW_DUE_DATE'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(35328549685989005443)
,p_process_success_message=>'Task due date updated'
,p_internal_uid=>35328581668705005463
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35328582062574005463)
,p_process_sequence=>80
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Request Information'
,p_attribute_01=>'REQUEST_INFO'
,p_attribute_02=>'P13_TASK_ID'
,p_attribute_03=>'&P13_REQUEST_TEXT.'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(35328550865835005444)
,p_process_success_message=>'Information requested'
,p_internal_uid=>35328582062574005463
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35328582468599005463)
,p_process_sequence=>90
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Submit Information'
,p_attribute_01=>'SUBMIT_INFO'
,p_attribute_02=>'P13_TASK_ID'
,p_attribute_03=>'&P13_SUBMIT_TEXT.'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(35328552069127005445)
,p_process_success_message=>'Information submitted'
,p_internal_uid=>35328582468599005463
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35328582863220005464)
,p_process_sequence=>100
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Invite Participant'
,p_attribute_01=>'ADD_TASK_POTENTIAL_OWNER'
,p_attribute_02=>'P13_TASK_ID'
,p_attribute_04=>'P13_NEW_POTENTIAL_OWNER'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(35328553221339005446)
,p_process_success_message=>'Participant &P13_NEW_POTENTIAL_OWNER!HTML. added to task as potential owner'
,p_internal_uid=>35328582863220005464
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35328583256180005464)
,p_process_sequence=>110
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Cancel Task'
,p_attribute_01=>'CANCEL_TASK'
,p_attribute_02=>'P13_TASK_ID'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(35328554040249005446)
,p_process_success_message=>'Task canceled'
,p_internal_uid=>35328583256180005464
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35328583601025005464)
,p_process_sequence=>120
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_MANAGE_TASK'
,p_process_name=>'Renew Task'
,p_attribute_01=>'RENEW_TASK'
,p_attribute_02=>'P13_TASK_ID'
,p_attribute_09=>'P13_TASK_ID'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(35328545938448005420)
,p_process_success_message=>'Task renewed'
,p_internal_uid=>35328583601025005464
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35328584061465005464)
,p_process_sequence=>130
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Set Success Message'
,p_process_sql_clob=>':P13_SUCCESS_MESSAGE := apex_application.g_print_success_message;'
,p_process_clob_language=>'PLSQL'
,p_process_error_message=>'#SQLERRM_TEXT#'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>35328584061465005464
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(35328584427843005464)
,p_process_sequence=>140
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CLAIM,SET_PRIORITY,SET_DUE,INVITE_PARTICIPANT,RENEW'
,p_process_when_type=>'REQUEST_NOT_IN_CONDITION'
,p_process_success_message=>'&P13_SUCCESS_MESSAGE.'
,p_internal_uid=>35328584427843005464
);
wwv_flow_imp.component_end;
end;
/
