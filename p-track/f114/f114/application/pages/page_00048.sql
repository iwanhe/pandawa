prompt --application/pages/page_00048
begin
--   Manifest
--     PAGE: 00048
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
 p_id=>48
,p_name=>'Milestone'
,p_page_mode=>'MODAL'
,p_step_title=>'Milestone'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486601256078156)
,p_javascript_code=>'var htmldb_delete_message=''"DELETE_CONFIRM_MSG"'';'
,p_step_template=>wwv_flow_imp.id(6672343678616369853)
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_dialog_resizable=>'Y'
,p_protection_level=>'C'
,p_help_text=>'No help is available for this page.'
,p_page_component_map=>'02'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6674656429892575505)
,p_plug_name=>'button bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noUI'
,p_plug_template=>wwv_flow_imp.id(6672347163384369864)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_03'
,p_plug_query_num_rows=>15
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8956880146146672476)
,p_plug_name=>'Milestone'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noBorder:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>10
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6156728505221859541)
,p_plug_name=>'Additional Data'
,p_parent_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_region_template_options=>'#DEFAULT#:is-expanded:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672353576565369876)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and assigned_yn = ''Y''',
'    and eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P48_PROJECT_ID ) = ''N''',
'    and eba_proj_fw.template_lock_yn( :APP_ID, :APP_USER, p_milestone_id => :P48_ID ) = ''N'''))
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8956883332693672528)
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
 p_id=>wwv_flow_imp.id(19058731096622337557)
,p_plug_name=>'Created and Due Date'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in',
'(',
'    select created, created_by, updated, updated_by, project_id, original_due_date, milestone_date',
'      from eba_proj_status_ms',
'     where id = :P48_ID',
')',
'loop',
'    sys.htp.p(''Created ''||apex_util.get_since(c1.created)||'' by ''||apex_escape.html(eba_proj_fw.get_name_from_email_address(c1.created_by)));',
'    sys.htp.p(''<br>Last updated ''||apex_util.get_since(c1.updated)||'' by ''||apex_escape.html(eba_proj_fw.get_name_from_email_address(c1.updated_by)));',
'    sys.htp.p(''<br><a href="''||apex_util.prepare_url(''f?p=''||:app_id||'':200:''||:app_session||'':::200:P200_ID,P2_ID:''||',
'     c1.project_id||'',''||c1.project_id)||''">View Project</a>'');',
'    if nvl(c1.original_due_date, c1.milestone_date) < c1.milestone_date then',
'        sys.htp.p(''<br><strong>Due On:</strong> '' || ''<span style="text-decoration:line-through;">'' || to_char(c1.original_due_date, ''fmDD-MON-YYYY'') || ''</span> '' || to_char(c1.milestone_date, ''fmDD-MON-YYYY''));',
'    else',
'        sys.htp.p(''<br><strong>Due On:</strong> '' || to_char(c1.milestone_date, ''fmDD-MON-YYYY''));',
'    end if;',
'end loop;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8956880528601672479)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6674656429892575505)
,p_button_name=>'DELETE_REDIRECT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Delete'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:221:&SESSION.::&DEBUG.:221:P221_MS_ID,P221_PRJ_ID:&P48_ID.,&P48_PROJECT_ID.'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P48_ID is not null',
'and eba_proj_fw.template_lock_yn (',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_milestone_id => :P48_ID ) = ''N''',
'and eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P48_PROJECT_ID ) = ''N''',
'and :P48_OPEN_AI_CNT > 0'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(17974139596755003719)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(6674656429892575505)
,p_button_name=>'PUSH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--simple:t-Button--warning'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Adjust Dates'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>':P48_ID is not null and eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P48_PROJECT_ID ) = ''N'''
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8956880438683672479)
,p_button_sequence=>60
,p_button_plug_id=>wwv_flow_imp.id(6674656429892575505)
,p_button_name=>'SAVE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Apply Changes'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>'P48_ID'
,p_button_condition_type=>'ITEM_IS_NOT_NULL'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_database_action=>'UPDATE'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6822507208127623371)
,p_button_sequence=>70
,p_button_plug_id=>wwv_flow_imp.id(6674656429892575505)
,p_button_name=>'CREATE_ANOTHER'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Add and Add Another'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P48_ID is null',
'and eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P48_PROJECT_ID ) = ''N'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8956880331416672479)
,p_button_sequence=>80
,p_button_plug_id=>wwv_flow_imp.id(6674656429892575505)
,p_button_name=>'CREATE'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--gapLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Milestone'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P48_ID is null',
'and eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P48_PROJECT_ID ) = ''N'''))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_database_action=>'INSERT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8956880624064672479)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6674656429892575505)
,p_button_name=>'CANCEL'
,p_button_action=>'DEFINED_BY_DA'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(748029301216196648)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(6674656429892575505)
,p_button_name=>'DELETE'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--danger:t-Button--simple'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Delete'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.confirm(htmldb_delete_message,''DELETE'');'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
':P48_ID is not null',
'and eba_proj_fw.template_lock_yn (',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_milestone_id => :P48_ID ) = ''N''',
'and eba_proj_fw.are_ms_ai_restricted(',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P48_PROJECT_ID ) = ''N''',
'and :P48_OPEN_AI_CNT = 0'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_database_action=>'DELETE'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(13084277568979234145)
,p_branch_name=>'Stay on Page for create another'
,p_branch_action=>'f?p=&APP_ID.:&APP_PAGE_ID.:&SESSION.::&DEBUG.:RP,&APP_PAGE_ID.::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6822507208127623371)
,p_branch_sequence=>10
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(13084277238466234142)
,p_branch_name=>'Go To Page &LAST_VIEW.'
,p_branch_action=>'f?p=&APP_ID.:&LAST_VIEW.:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(8956880528601672479)
,p_branch_sequence=>20
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(3356098446369512989)
,p_branch_name=>'Push Milestones'
,p_branch_action=>'f?p=&APP_ID.:85:&SESSION.::&DEBUG.:RP,85:P85_ID,P85_PROJECT_ID,P85_ORIG_MS_START_DATE,LAST_VIEW,P85_MILESTONE_DATE,P85_MILESTONE_START_DATE,P85_ORIG_MS_DUE_DATE:&P48_ID.,&P48_PROJECT_ID.,&P48_ORIG_MS_START_DATE.,&APP_PAGE_ID.,&P48_MILESTONE_DATE.,&P48_MILESTONE_START_DATE.,&P48_ORIG_MS_DUE_DATE.'
,p_branch_point=>'BEFORE_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(17974139596755003719)
,p_branch_sequence=>30
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4004127651252779583)
,p_name=>'P48_ORIG_MS_START_DATE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare d date;',
'begin',
'for c1 in (',
'select current_date x from dual) loop',
'   d := c1.x;',
'end loop;',
'return d;',
'end;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Select the date by which you would like to start this Milestone. Changing this date only affects this Milestone. If you would like to change the start dates of all other future Milestones in this project and/or their dependent action items, click '
||'the <strong>Push</strong> button at the bottom of this page instead.</p>',
'<p><em>NOTE: The <strong>Push</strong> button is dependent upon an existing Milestone, the project''s access level and prevent changes settings, and the project member''s privileges. This button will never appear when creating a Milestone and may not a'
||'ppear to certain project members when editing an existing Milestone.</em></p>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(4004128237551779589)
,p_name=>'P48_ORIG_MS_DUE_DATE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare d date;',
'begin',
'for c1 in (',
'select current_date x from dual) loop',
'   d := c1.x;',
'end loop;',
'return d;',
'end;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Select the date by which you would like to start this Milestone. Changing this date only affects this Milestone. If you would like to change the start dates of all other future Milestones in this project and/or their dependent action items, click '
||'the <strong>Push</strong> button at the bottom of this page instead.</p>',
'<p><em>NOTE: The <strong>Push</strong> button is dependent upon an existing Milestone, the project''s access level and prevent changes settings, and the project member''s privileges. This button will never appear when creating a Milestone and may not a'
||'ppear to certain project members when editing an existing Milestone.</em></p>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(5985564605036769651)
,p_name=>'P48_TAGS'
,p_item_sequence=>200
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Tags'
,p_source=>'TAGS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.TAGS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select tag',
'  from eba_proj_tags_type_sum',
' where content_type = ''STATUS''',
' order by 1'))
,p_cSize=>75
,p_cMaxlength=>4000
,p_tag_attributes=>'placeholder="Enter tags separated by commas"'
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P48_PROJECT_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_02', 'Tags may not contain the following characters: : ; \ / ? &')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156728685759859542)
,p_name=>'P48_MILESTONE_FLEX_05'
,p_item_sequence=>240
,p_item_plug_id=>wwv_flow_imp.id(6156728505221859541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'MILESTONE Flex 05'
,p_source=>'MILESTONE_FLEX_05'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_05'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156728912091859543)
,p_name=>'P48_MILESTONE_FLEX_06'
,p_item_sequence=>250
,p_item_plug_id=>wwv_flow_imp.id(6156728505221859541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'MILESTONE Flex 06'
,p_source=>'MILESTONE_FLEX_06'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_06'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156729090587859543)
,p_name=>'P48_MILESTONE_FLEX_07'
,p_item_sequence=>260
,p_item_plug_id=>wwv_flow_imp.id(6156728505221859541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'MILESTONE Flex 07'
,p_source=>'MILESTONE_FLEX_07'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_07'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156729303442859543)
,p_name=>'P48_MILESTONE_FLEX_08'
,p_item_sequence=>270
,p_item_plug_id=>wwv_flow_imp.id(6156728505221859541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'MILESTONE Flex 08'
,p_source=>'MILESTONE_FLEX_08'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_08'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156729486664859543)
,p_name=>'P48_MILESTONE_FLEX_N01'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6156728505221859541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Estimated Cost (in Man Hours)'
,p_source=>'MILESTONE_FLEX_N01'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_N01'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156729684861859543)
,p_name=>'P48_MILESTONE_FLEX_N02'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(6156728505221859541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'MILESTONE Flex N02'
,p_source=>'MILESTONE_FLEX_N02'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_N02'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156729901271859543)
,p_name=>'P48_MILESTONE_FLEX_N03'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(6156728505221859541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'MILESTONE Flex N03'
,p_source=>'MILESTONE_FLEX_N03'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_N03'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156730091869859543)
,p_name=>'P48_MILESTONE_FLEX_N04'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6156728505221859541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'MILESTONE Flex N04'
,p_source=>'MILESTONE_FLEX_N04'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_N04'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156730313875859543)
,p_name=>'P48_MILESTONE_FLEX_D01'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6156728505221859541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'MILESTONE Flex D01'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'MILESTONE_FLEX_D01'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_D01'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156730499854859545)
,p_name=>'P48_MILESTONE_FLEX_D02'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(6156728505221859541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'MILESTONE Flex D02'
,p_source=>'MILESTONE_FLEX_D02'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_D02'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156730693715859546)
,p_name=>'P48_MILESTONE_FLEX_D03'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(6156728505221859541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'MILESTONE Flex D03'
,p_source=>'MILESTONE_FLEX_D03'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_D03'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156730910192859546)
,p_name=>'P48_MILESTONE_FLEX_D04'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(6156728505221859541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'MILESTONE Flex D04'
,p_source=>'MILESTONE_FLEX_D04'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_D04'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156731098368859547)
,p_name=>'P48_MILESTONE_FLEX_CLOB'
,p_item_sequence=>280
,p_item_plug_id=>wwv_flow_imp.id(6156728505221859541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'MILESTONE Flex CLOB'
,p_source=>'MILESTONE_FLEX_CLOB'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_CLOB'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156731287961859547)
,p_name=>'P48_MILESTONE_FLEX_01'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(6156728505221859541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'MILESTONE Flex 01'
,p_source=>'MILESTONE_FLEX_01'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_01'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156731484130859547)
,p_name=>'P48_MILESTONE_FLEX_02'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(6156728505221859541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'MILESTONE Flex 02'
,p_source=>'MILESTONE_FLEX_02'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_02'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156731698361859547)
,p_name=>'P48_MILESTONE_FLEX_03'
,p_item_sequence=>220
,p_item_plug_id=>wwv_flow_imp.id(6156728505221859541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'MILESTONE Flex 03'
,p_source=>'MILESTONE_FLEX_03'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_03'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6156731911215859547)
,p_name=>'P48_MILESTONE_FLEX_04'
,p_item_sequence=>230
,p_item_plug_id=>wwv_flow_imp.id(6156728505221859541)
,p_use_cache_before_default=>'NO'
,p_prompt=>'MILESTONE Flex 04'
,p_source=>'MILESTONE_FLEX_04'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_label_alignment=>'RIGHT-CENTER'
,p_field_alignment=>'LEFT-CENTER'
,p_display_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_flex_registry',
'where flexible_table = ''EBA_PROJ_STATUS_MS''',
'    and active_yn = ''Y''',
'    and flexible_column = ''MILESTONE_FLEX_04'''))
,p_display_when_type=>'EXISTS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_encrypt_session_state_yn=>'N'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8029982840090804295)
,p_name=>'P48_MILESTONE_OWNER'
,p_item_sequence=>170
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Owner'
,p_post_element_text=>' <small>[<a href="javascript:$s(''P48_MILESTONE_OWNER'',$v(''P48_CURRENT_USER''));">Me</a>]</small>'
,p_source=>'MILESTONE_OWNER'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct lower(u.username) d',
'from eba_proj_status_users u,',
'    eba_proj_user_ref rf,',
'    eba_proj_status p',
'where rf.user_id = u.id',
'    and rf.project_id = p.id',
'union',
'select distinct lower(milestone_owner) d',
'from EBA_PROJ_STATUS_MS',
'where milestone_owner is not null',
'order by 1'))
,p_cSize=>64
,p_cMaxlength=>255
,p_tag_attributes=>'onchange="htmldb_item_change(this)"'
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P48_PROJECT_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>'Identifies the milestone''s owner. The person assigned here is responsible for seeing the milestone is reached by it''s due date.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'N',
  'match_type', 'CONTAINS_IGNORE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8030247330000879463)
,p_name=>'P48_IS_MAJOR_YN'
,p_item_sequence=>180
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_use_cache_before_default=>'NO'
,p_item_default=>'N'
,p_prompt=>'Is Major Milestone'
,p_source=>'IS_MAJOR_YN'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES NO RETURNS Y N'
,p_lov=>'.'||wwv_flow_imp.id(8910494933283350717)||'.'
,p_cHeight=>1
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.template_lock_yn (',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_milestone_id => :P48_ID ) = ''Y''',
'or',
'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P48_PROJECT_ID ) = ''Y'''))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8956881533504672489)
,p_name=>'P48_ID'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Id'
,p_source=>'ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_label_alignment=>'RIGHT'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8956881746946672513)
,p_name=>'P48_PROJECT_ID'
,p_is_required=>true
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Project'
,p_source=>'PROJECT_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select project d, id r',
'from eba_proj_status',
'order by upper(project)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Select -'
,p_cHeight=>1
,p_read_only_when=>'P48_PROJECT_ID'
,p_read_only_when_type=>'ITEM_IS_NOT_NULL'
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8956881928693672515)
,p_name=>'P48_MILESTONE_NAME'
,p_is_required=>true
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Milestone'
,p_source=>'MILESTONE_NAME'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>255
,p_read_only_when=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.template_lock_yn (',
'    p_application_id => :APP_ID,',
'    p_username   => upper(:APP_USER),',
'    p_milestone_id => :P48_ID ) = ''Y''',
'or',
'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P48_PROJECT_ID ) = ''Y'''))
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8956882123649672515)
,p_name=>'P48_MILESTONE_DESCRIPTION'
,p_item_sequence=>190
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Description'
,p_source=>'MILESTONE_DESCRIPTION'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_TEXTAREA'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>4
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P48_PROJECT_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'auto_height', 'N',
  'character_counter', 'N',
  'resizable', 'N',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8956882339813672516)
,p_name=>'P48_MILESTONE_DATE'
,p_is_required=>true
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare d date;',
'begin',
'for c1 in (',
'select current_date + 7 x from dual) loop',
'   d := c1.x;',
'end loop;',
'return d;',
'end;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Due Date'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'MILESTONE_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>64
,p_cMaxlength=>255
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P48_PROJECT_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Select the date by which you would like to reach this Milestone. Changing this date only affects this Milestone. If you would like to change the due dates of all other future Milestones in this project and/or their dependent action items, click th'
||'e <strong>Push</strong> button at the bottom of this page instead.</p>',
'<p><em>NOTE: The <strong>Push</strong> button is dependent upon an existing Milestone, the project''s access level and prevent changes settings, and the project member''s privileges. This button will never appear when creating a Milestone and may not a'
||'ppear to certain project members when editing an existing Milestone.</em></p>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8956882534119672516)
,p_name=>'P48_MILESTONE_STATUS'
,p_item_sequence=>150
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_use_cache_before_default=>'NO'
,p_item_default=>'Open'
,p_prompt=>'Status'
,p_source=>'MILESTONE_STATUS'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'MILESTONE STATUS VALUES'
,p_lov=>'.'||wwv_flow_imp.id(17589125109761517445)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8959700340223783827)
,p_name=>'P48_MILESTONE_START_DATE'
,p_is_required=>true
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_use_cache_before_default=>'NO'
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare d date;',
'begin',
'for c1 in (',
'select current_date x from dual) loop',
'   d := c1.x;',
'end loop;',
'return d;',
'end;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Milestone Start Date'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'MILESTONE_START_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>64
,p_cMaxlength=>255
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P48_PROJECT_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672377047094369942)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Select the date by which you would like to start this Milestone. Changing this date only affects this Milestone. If you would like to change the start dates of all other future Milestones in this project and/or their dependent action items, click '
||'the <strong>Push</strong> button at the bottom of this page instead.</p>',
'<p><em>NOTE: The <strong>Push</strong> button is dependent upon an existing Milestone, the project''s access level and prevent changes settings, and the project member''s privileges. This button will never appear when creating a Milestone and may not a'
||'ppear to certain project members when editing an existing Milestone.</em></p>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15010740334271268021)
,p_name=>'P48_OWNER_ROLE_ID'
,p_item_sequence=>160
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Assign to Role'
,p_source=>'OWNER_ROLE_ID'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT ROLES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select name as d,',
'       id as r',
'  from eba_proj_roles',
' order by 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- No Role -'
,p_cHeight=>1
,p_read_only_when=>'eba_proj_fw.are_ms_ai_restricted( :APP_ID, :APP_USER, :P48_PROJECT_ID ) = ''Y'''
,p_read_only_when2=>'PLSQL'
,p_read_only_when_type=>'EXPRESSION'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Use this to assign a milestone''s owner based on the roles of the people associated with the project. If a role is selected here, any people with that role for this project will be listed as this milestone''s owner(s).</p>',
'<p>Leave blank to manually assign an owner to the milestone.</p>'))
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19204382572727214133)
,p_name=>'P48_COMPLETED_DATE'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Completed Date'
,p_format_mask=>'DD-MON-YYYY'
,p_source=>'COMPLETED_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_DATE_PICKER'
,p_cSize=>64
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_help_text=>'<p>Enter the date on which the Milestone was reached.</p>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'navigation_list_for', 'NONE',
  'show', 'button',
  'show_other_months', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19865313478779670919)
,p_name=>'P48_CURRENT_USER'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_use_cache_before_default=>'NO'
,p_source=>'lower(:APP_USER)'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20124882086998729626)
,p_name=>'P48_ORIGINAL_DUE_DATE'
,p_item_sequence=>210
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_use_cache_before_default=>'NO'
,p_source=>'ORIGINAL_DUE_DATE'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20124883171798729637)
,p_name=>'P48_OPEN_AI_CNT'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20124883533527729641)
,p_name=>'P48_CLOSE_ASSOC_AIS'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_item_default=>'N'
,p_prompt=>'Close Associated Open Action Item(s)'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_named_lov=>'YES NO RETURNS Y N'
,p_lov=>'.'||wwv_flow_imp.id(8910494933283350717)||'.'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'If "Yes" is selected, any/all open Action Item(s) associated with Milestone will be closed. If "No" is selected, this Milestone and any/all open Action Item(s) associated with Milestone will remain open.'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '2',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(20289566579706214629)
,p_name=>'P48_COMPLETED_BY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_use_cache_before_default=>'NO'
,p_source=>'COMPLETED_BY'
,p_source_type=>'DB_COLUMN'
,p_display_as=>'NATIVE_HIDDEN'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(21048392504196075533)
,p_name=>'P48_OPEN_ACTION_ITEMS'
,p_item_sequence=>140
,p_item_plug_id=>wwv_flow_imp.id(8956880146146672476)
,p_prompt=>'Associated Open Action Item(s)'
,p_display_as=>'NATIVE_RADIOGROUP'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select action d, id r',
'  from eba_proj_status_ais',
' where milestone_id = :P48_ID',
'   and action_status != ''Closed''',
' order by 1'))
,p_tag_css_classes=>'displayOnlyAI'
,p_read_only_when_type=>'ALWAYS'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1',
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(20289566791923214631)
,p_computation_sequence=>10
,p_computation_item=>'P48_COMPLETED_BY'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'null'
,p_compute_when=>'P48_MILESTONE_STATUS'
,p_compute_when_text=>'Completed'
,p_compute_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(20289566884224214632)
,p_computation_sequence=>20
,p_computation_item=>'P48_COMPLETED_DATE'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'null'
,p_compute_when=>'P48_MILESTONE_STATUS'
,p_compute_when_text=>'Completed'
,p_compute_when_type=>'VAL_OF_ITEM_IN_COND_NOT_EQ_COND2'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(1002320027119310268)
,p_computation_sequence=>30
,p_computation_item=>'P48_ORIGINAL_DUE_DATE'
,p_computation_type=>'EXPRESSION'
,p_computation_language=>'PLSQL'
,p_computation=>'substr(:P48_ORIGINAL_DUE_DATE,1,9)'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(20124883229200729638)
,p_computation_sequence=>10
,p_computation_item=>'P48_OPEN_AI_CNT'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'QUERY'
,p_computation=>'select count(*) from eba_proj_status_ais where milestone_id = :P48_ID and project_id = :P48_PROJECT_ID and action_status = ''Open'''
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(4004127761877779584)
,p_computation_sequence=>20
,p_computation_item=>'P48_ORIG_MS_START_DATE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P48_MILESTONE_START_DATE'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(4036790968670725242)
,p_computation_sequence=>30
,p_computation_item=>'P48_ORIG_MS_DUE_DATE'
,p_computation_point=>'BEFORE_BOX_BODY'
,p_computation_type=>'ITEM_VALUE'
,p_computation=>'P48_MILESTONE_DATE'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(7104787793896224571)
,p_validation_name=>'Due after start'
,p_validation_sequence=>10
,p_validation=>'to_date(:P48_MILESTONE_START_DATE) <= to_date(:P48_MILESTONE_DATE)'
,p_validation2=>'SQL'
,p_validation_type=>'EXPRESSION'
,p_error_message=>'Start date must not be after milestone due date.'
,p_associated_item=>wwv_flow_imp.id(8956882339813672516)
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_validation(
 p_id=>wwv_flow_imp.id(20124885315234729658)
,p_validation_name=>'Open Action Items Must Be Closed'
,p_validation_sequence=>20
,p_validation=>'P48_CLOSE_ASSOC_AIS'
,p_validation2=>'Y'
,p_validation_type=>'ITEM_IN_VALIDATION_EQ_STRING2'
,p_error_message=>'Milestones cannot be closed until all associated Action Items have been closed.'
,p_validation_condition=>':P48_OPEN_AI_CNT != ''0'' and :P48_MILESTONE_STATUS = ''Completed'''
,p_validation_condition2=>'PLSQL'
,p_validation_condition_type=>'EXPRESSION'
,p_error_display_location=>'INLINE_WITH_FIELD_AND_NOTIFICATION'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(12179263204112588918)
,p_name=>'Cancel Modal'
,p_event_sequence=>10
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8956880624064672479)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'click'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(12179263283636588919)
,p_event_id=>wwv_flow_imp.id(12179263204112588918)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CANCEL'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15010740460756268022)
,p_name=>'Show/Hide Owner'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P48_OWNER_ROLE_ID'
,p_condition_element=>'P48_OWNER_ROLE_ID'
,p_triggering_condition_type=>'NULL'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15010740553070268023)
,p_event_id=>wwv_flow_imp.id(15010740460756268022)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P48_MILESTONE_OWNER'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15010740673706268024)
,p_event_id=>wwv_flow_imp.id(15010740460756268022)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P48_MILESTONE_OWNER'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18523081185266785148)
,p_name=>'Close Milestone'
,p_event_sequence=>30
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P48_MILESTONE_STATUS'
,p_condition_element=>'P48_MILESTONE_STATUS'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'Completed'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20124883969151729645)
,p_event_id=>wwv_flow_imp.id(18523081185266785148)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P48_MILESTONE_STATUS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20124884041030729646)
,p_event_id=>wwv_flow_imp.id(18523081185266785148)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>'null;'
,p_attribute_02=>'P48_MILESTONE_STATUS'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19204383044584214138)
,p_event_id=>wwv_flow_imp.id(18523081185266785148)
,p_event_result=>'FALSE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P48_COMPLETED_DATE'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'null'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18523081310467785149)
,p_event_id=>wwv_flow_imp.id(18523081185266785148)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P48_COMPLETED_DATE'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>'to_char(trunc(localtimestamp),:APP_DATE_FORMAT)'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19204382781830214135)
,p_event_id=>wwv_flow_imp.id(18523081185266785148)
,p_event_result=>'FALSE'
,p_action_sequence=>30
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P48_COMPLETED_DATE'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20289566667077214630)
,p_event_id=>wwv_flow_imp.id(18523081185266785148)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SET_VALUE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P48_COMPLETED_BY'
,p_attribute_01=>'PLSQL_EXPRESSION'
,p_attribute_04=>':APP_USER'
,p_attribute_08=>'Y'
,p_attribute_09=>'N'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19204382677791214134)
,p_event_id=>wwv_flow_imp.id(18523081185266785148)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P48_COMPLETED_DATE'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(20124884877209729654)
,p_name=>'Show Hide Close Associated Action Items'
,p_event_sequence=>50
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P48_MILESTONE_STATUS'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'$v(''P48_OPEN_AI_CNT'') > 0 && $v(''P48_MILESTONE_STATUS'') == ''Completed'''
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20124885001091729655)
,p_event_id=>wwv_flow_imp.id(20124884877209729654)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P48_CLOSE_ASSOC_AIS,P48_OPEN_ACTION_ITEMS'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(20124885025734729656)
,p_event_id=>wwv_flow_imp.id(20124884877209729654)
,p_event_result=>'FALSE'
,p_action_sequence=>10
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'ITEM'
,p_affected_elements=>'P48_CLOSE_ASSOC_AIS,P48_OPEN_ACTION_ITEMS'
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(21048392700145075535)
,p_event_id=>wwv_flow_imp.id(20124884877209729654)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'$(''.displayOnlyAI input[type=radio]'').remove();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(748029092884196646)
,p_name=>'Close self'
,p_event_sequence=>60
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(8956880528601672479)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(748029160668196647)
,p_event_id=>wwv_flow_imp.id(748029092884196646)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_DIALOG_CLOSE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8956882726762672522)
,p_process_sequence=>10
,p_process_point=>'AFTER_HEADER'
,p_process_type=>'NATIVE_FORM_FETCH'
,p_process_name=>'Fetch Row from EBA_PROJ_STATUS_MS'
,p_attribute_02=>'EBA_PROJ_STATUS_MS'
,p_attribute_03=>'P48_ID'
,p_attribute_04=>'ID'
,p_attribute_11=>'I:U:D'
,p_process_error_message=>'Unable to fetch row.'
,p_internal_uid=>8956882726762672522
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(19130303367263903217)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Delete Milestone'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update eba_proj_status_ms$',
'set is_deleted_yn = ''Y'',',
'    deleted_by = :APP_USER,',
'    deleted_on = localtimestamp',
'where id = :P48_ID;'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8956880528601672479)
,p_process_success_message=>'Milestone deleted.'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_internal_uid=>19130303367263903217
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8956882933010672528)
,p_process_sequence=>20
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_FORM_PROCESS'
,p_process_name=>'Process Row of EBA_PROJ_STATUS_MS'
,p_attribute_02=>'EBA_PROJ_STATUS_MS'
,p_attribute_03=>'P48_ID'
,p_attribute_04=>'ID'
,p_attribute_09=>'P48_ID'
,p_attribute_11=>'I:U'
,p_attribute_12=>'Y'
,p_process_error_message=>'Unable to process row of table EBA_PROJ_STATUS_MS.'
,p_process_when=>'DELETE'
,p_process_when_type=>'REQUEST_NOT_EQUAL_CONDITION'
,p_process_success_message=>'Action Processed.'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_return_key_into_item1=>'P48_ID'
,p_internal_uid=>8956882933010672528
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(20124883801610729643)
,p_process_sequence=>30
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Close Associated Action Items (No Resolution Text Required)'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update eba_proj_status_ais ',
'   set completed_date = nvl(to_date(:P48_COMPLETED_DATE,''DD-MON-YYYY''),to_date(sysdate,''DD-MON-YYYY'')), ',
'       action_status = ''Closed''',
' where milestone_id = :P48_ID',
'   and action_status = ''Open'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8956880438683672479)
,p_process_when=>':P48_CLOSE_ASSOC_AIS = ''Y'' and :P48_MILESTONE_STATUS = ''Completed'' and :P48_OPEN_AI_CNT != ''0'''
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_required_patch=>-wwv_flow_imp.id(18118675022980458324)
,p_internal_uid=>20124883801610729643
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(20124885388831729659)
,p_process_sequence=>40
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Close Associated Action Items with Resolution Text'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update eba_proj_status_ais ',
'   set completed_date = nvl(to_date(:P48_COMPLETED_DATE,''DD-MON-YYYY''),to_date(sysdate,''DD-MON-YYYY'')),',
'       action_status = ''Closed'',',
'       resolution = ''Closed as a result of completing associated Milestone.''',
' where milestone_id = :P48_ID',
'   and action_status = ''Open'';'))
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when_button_id=>wwv_flow_imp.id(8956880438683672479)
,p_process_when=>':P48_CLOSE_ASSOC_AIS = ''Y'' and :P48_MILESTONE_STATUS = ''Completed'' and :P48_OPEN_AI_CNT != ''0'''
,p_process_when_type=>'EXPRESSION'
,p_process_when2=>'PLSQL'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
,p_required_patch=>wwv_flow_imp.id(18118675022980458324)
,p_internal_uid=>20124885388831729659
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(12662975575333699023)
,p_process_sequence=>50
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_CLOSE_WINDOW'
,p_process_name=>'Close Dialog'
,p_attribute_02=>'N'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_process_when=>'CREATE, SAVE'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>12662975575333699023
);
wwv_flow_imp.component_end;
end;
/
