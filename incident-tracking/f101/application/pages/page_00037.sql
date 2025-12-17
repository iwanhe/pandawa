prompt --application/pages/page_00037
begin
--   Manifest
--     PAGE: 00037
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
 p_id=>37
,p_name=>'Search Results'
,p_alias=>'SEARCH'
,p_step_title=>'Search Results'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(1320026850665033934)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'ul.sSearchResultsReport span.title span.highlight {',
'  background-color: #FFEA87;',
'  text-decoration: underline',
'  }',
'ul.sSearchResultsReport span.highlight {',
'  background-color: #FFEA87;',
'  }',
'</style>'))
,p_inline_css=>'.highlight {background-color:#ffecb4;}'
,p_step_template=>wwv_flow_imp.id(1609136515118051906)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This page displays all of the incidents that match the search terms entered on the app''s home page. Use the filters on the left to reduce your result set.'
,p_page_component_map=>'10'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2783954861782011628)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--hiddenOverflow:t-Form--stretchInputs:t-Form--labelsAbove'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_02'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2783956257404011639)
,p_plug_name=>'Search Results'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--hiddenOverflow'
,p_plug_template=>wwv_flow_imp.id(1609179910711051998)
,p_plug_display_sequence=>10
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'   c             pls_integer := 0;',
'   l_detail      varchar2(32767);',
'   i             pls_integer;',
'   l             pls_integer;',
'   l_max_rows    integer;',
'begin',
'l_max_rows := nvl(:P37_ROWS,10);',
'if :P37_SEARCH is null',
'and :P37_ASSIGNEE is null ',
'and :P37_STATUS is null ',
'and :P37_OPEN is null ',
'and :P37_SEVERITY is null ',
'and nvl(:P37_OPEN,''0'') = ''0'' ',
'then',
'   sys.htp.p(''<p>Please enter at least one search condition.</p>'');',
'else',
'  for c1 in (',
'select',
'     "PRODUCT_NAME",',
'     "STATUS_NAME",',
'   status_code||''. ''||status_name status,',
'     "SEVERITY_NAME",',
'   id,',
'     "INCIDENT_NUMBER",',
'     "SUBJECT",',
'     "BUG_NUMBER",',
'     "CATEGORY_ID",',
'     "ASSIGNED_TO_ID",',
'     "ASSIGNED_ON",',
'     "DATE_CLOSED",',
'     "DESCRIPTION",',
'     "PRODUCT_ID",',
'     "PRODUCT_VERSION_ID",',
'     "ADDITIONAL_PRODUCT_INFO",',
'     "CUSTOMER_ID",',
'     "CUSTOMER_DEPARTMENT",',
'     "CUSTOMER",',
'     "SEVERITY_ID",',
'     "STATUS_ID",',
'   status_code,',
'   status_type,',
'     "URGENCY_ID",',
'     "ASSIGNED_TO_GROUP_ID",',
'     "TAGS",',
'    "CREATED",',
'    "CREATED_BY",',
'    "UPDATED",',
'    "UPDATED_BY",',
'    "URGENCY_NAME",',
'    follow_ups,',
'    assignee,',
'    SEVERITY_CODE',
' from eba_intrack_incidents_view',
'  where (   instr(upper(assignee),upper(:P37_ASSIGNEE)) > 0 ',
'         or :P37_ASSIGNEE is null)',
'  and (   status_id= :P37_STATUS or :P37_STATUS is null)',
'  and (',
'    (nvl(:P37_OPEN,''0'') = ''Y'' and status_type = ''OPEN'')',
'     or (nvl(:P37_OPEN,''0'') = ''N'' and status_type = ''CLOSED'')',
'     or (nvl(:P37_OPEN,''0'') = ''0''))',
'  and (nvl(:P37_URGENCY,0) = urgency_id or nvl(:P37_URGENCY,0) = 0)',
'  and (nvl(:P37_SEVERITY,0) = severity_id or nvl(:P37_SEVERITY,0) = 0)',
'  and (   instr(upper(subject),upper(:P37_SEARCH)) > 0 ',
'       or instr(upper(dbms_lob.substr(DESCRIPTION,2000,1)),upper(:P37_SEARCH)) > 0 ',
'       or instr(upper(dbms_lob.substr(DESCRIPTION,2000,1980)),upper(:P37_SEARCH)) > 0 ',
'       or instr(upper(status_name),upper(:P37_SEARCH)) > 0 ',
'       or instr(upper(incident_number),upper(:P37_SEARCH)) > 0 ',
'       or instr(upper(status_code),upper(:P37_SEARCH)) > 0 ',
'       or instr(upper(product_name),upper(:P37_SEARCH)) > 0 ',
'       or instr(upper(tags),upper(:P37_SEARCH)) > 0 ',
'       or instr(upper(assignee),upper(:P37_SEARCH)) > 0',
'       or instr(upper(customer),upper(:P37_SEARCH)) > 0 ',
'       or :P37_SEARCH is null',
'      )',
'  order by created desc',
'  ) ',
'  loop',
'    c := c + 1;',
'    if c = 1 then',
'        --sys.htp.p(''<ul class="sSearchResultsReport">'');',
'        sys.htp.p(''<div class="t-SearchResults">'');',
'        sys.htp.p(''<ul class="t-SearchResults-list">'');',
'    end if;',
'    sys.htp.p(''<li class="t-SearchResults-item">'');',
'    sys.htp.prn(''<h3 class="t-SearchResults-title"><a href="''||apex_util.prepare_url(''f?p=''||:APP_ID||'':28:''||:APP_SESSION||',
'        '':::28:P28_ID:''||apex_escape.html(c1.id))||''">'');',
'    --',
'    --',
'    --',
'    l_detail := c1.SUBJECT;',
'    i := instr(upper(l_detail),upper(:P37_SEARCH));',
'    if  i > 0 then',
'       l := length(:P37_SEARCH);',
'       l_detail := apex_escape.html(substr(l_detail,1,i-1))||',
'          ''<span class="highlight">''||',
'          apex_escape.html(substr(l_detail,i,l))||''</span>''||',
'          apex_escape.html(substr(l_detail,i+l));',
'    else',
'        l_detail := apex_escape.html(l_detail);',
'    end if;',
'    sys.htp.prn(l_detail);                ',
'    sys.htp.prn(''</a></h3>'');',
'    sys.htp.prn(''<div class="t-SearchResults-info">'');',
'    sys.htp.prn(''<p class="t-SearchResults-desc">'');',
'    --',
'    --',
'    --',
'    l_detail := c1.product_name;',
'    i := instr(upper(l_detail),upper(:P37_SEARCH));',
'    if  i > 0 then',
'       l := length(:P37_SEARCH);',
'       l_detail := apex_escape.html(substr(l_detail,1,i-1))||',
'          ''<span class="highlight">''||',
'          apex_escape.html(substr(l_detail,i,l))||''</span>''||',
'          apex_escape.html(substr(l_detail,i+l));',
'    else',
'        l_detail := apex_escape.html(l_detail);',
'    end if;',
'    sys.htp.prn(l_detail);',
'    sys.htp.prn(''</p>'');',
'    --',
'    --',
'    --',
'    sys.htp.prn(''<span class="t-SearchResults-misc">Incident: '');',
'    sys.htp.prn(apex_escape.html(c1.incident_number));',
'    sys.htp.prn(''</span>'');',
'    --',
'    --',
'    --',
'    sys.htp.prn(''<span class="t-SearchResults-misc">Customer: '');',
'    sys.htp.prn(apex_escape.html(c1.customer));',
'    sys.htp.prn(''</span>'');',
'    --',
'    --',
'    --',
'    sys.htp.prn(''<span class="t-SearchResults-misc">Assigned to: '');',
'    sys.htp.prn(apex_escape.html(c1.assignee));',
'    sys.htp.prn(''</span>'');',
'    --',
'    --',
'    --',
'    sys.htp.prn(''<span class="t-SearchResults-misc">Status: '');',
'    sys.htp.prn(apex_escape.html(c1.status));',
'    sys.htp.prn(''</span>'');',
'    --',
'    --',
'    --',
'    sys.htp.prn(''<span class="t-SearchResults-misc">Urgency: '');',
'    sys.htp.prn(apex_escape.html(c1.urgency_name));',
'    sys.htp.prn(''</span>'');',
'    --',
'    --',
'    --',
'    sys.htp.prn(''<span class="t-SearchResults-misc">Severity: '');',
'    sys.htp.prn(apex_escape.html(c1.SEVERITY_CODE)||''. ''||apex_escape.html(c1.severity_name));',
'    sys.htp.prn(''</span>'');',
'    --',
'    --',
'    --',
'    sys.htp.prn(''<span class="t-SearchResults-misc">Tags: '');',
'    sys.htp.prn(apex_escape.html(c1.tags));',
'    sys.htp.prn(''</span>'');',
'    --',
'    --',
'    --',
'    sys.htp.prn(''<span class="t-SearchResults-misc">Created: '');',
'    sys.htp.prn(apex_escape.html(apex_util.get_since(c1.created))||'' by ''||lower(apex_escape.html(c1.created_by)));',
'    sys.htp.prn(''</span>'');',
'    --',
'    --',
'    --',
'    sys.htp.p(''</div>'');',
'    sys.htp.p(''</li>'');',
'    --',
'    --',
'    --',
'    if c = l_max_rows then',
'       exit;',
'    end if;',
'',
'  end loop;',
'  if c > 0 then',
'    sys.htp.p(''</ul>'');',
'    sys.htp.p(''</div>'');',
'    sys.htp.p(''<p>''||c||'' results found.</p>'');',
'  else ',
'    sys.htp.p(''<p>No search results.</p>'');',
'  end if;',
'end if;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2783956451814011639)
,p_plug_name=>'Search Results'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(1609182514379052001)
,p_plug_display_sequence=>20
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(4401191629352118234)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(1609203084083052074)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2783955242643011631)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(2783954861782011628)
,p_button_name=>'RESET_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(1609202304669052069)
,p_button_image_alt=>'Reset'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:37,1::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2783955074086011629)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(2783954861782011628)
,p_button_name=>'SEARCH'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(1609202887990052072)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Search'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(2783957043255011649)
,p_branch_action=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:::'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_comment=>'Created 14-DEC-2011 09:16 by SHAKEEB'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2783955465773011632)
,p_name=>'P37_ROWS'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(2783954861782011628)
,p_item_default=>'10'
,p_prompt=>'Rows'
,p_source=>'10'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'ROWS'
,p_lov=>'.'||wwv_flow_imp.id(2783957167318011650)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'REDIRECT_SET_VALUE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2783955658049011633)
,p_name=>'P37_ASSIGNEE'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(2783954861782011628)
,p_prompt=>'Assigned to'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'Y',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2783955867531011638)
,p_name=>'P37_SEARCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(2783954861782011628)
,p_prompt=>'Search'
,p_placeholder=>'Search'
,p_source=>'&P1_SEARCH.'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(1609201949677052061)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'Y',
  'subtype', 'TEXT',
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2783956050770011638)
,p_name=>'P37_STATUS'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(2783954861782011628)
,p_prompt=>'Status'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'STATUS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select status_code||''. ''||STATUS_NAME as display_value, ID as return_value ',
'  from EBA_INTRACK_STATUS',
' order by display_sequence'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Codes -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'REDIRECT_SET_VALUE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2785070568439422939)
,p_name=>'P37_SEVERITY'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(2783954861782011628)
,p_prompt=>'Severity'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'SEVERITY WITHOUT CODE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select SEVERITY_NAME as display_value, ID as return_value ',
'  from EBA_INTRACK_SEVERITY',
' order by sequence_number'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Codes -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2785123651947427610)
,p_name=>'P37_URGENCY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(2783954861782011628)
,p_prompt=>'Urgency'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'URGENCY'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select URGENCY_NAME as display_value, ID as return_value ',
'  from EBA_INTRACK_URGENCY',
' order by display_sequence'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Codes -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2785161462336430624)
,p_name=>'P37_OPEN'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(2783954861782011628)
,p_prompt=>'Open'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov_language=>'PLSQL'
,p_lov=>'.'||wwv_flow_imp.id(2754272554244105957)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(1609201974266052063)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_restricted_characters=>'WEB_SAFE'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'execute_validations', 'Y',
  'page_action_on_selection', 'SUBMIT')).to_clob
);
wwv_flow_imp.component_end;
end;
/
