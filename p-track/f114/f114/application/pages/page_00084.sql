prompt --application/pages/page_00084
begin
--   Manifest
--     PAGE: 00084
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
 p_id=>84
,p_name=>'Heatmap Report'
,p_step_title=>'Heatmap Report'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486499525077695)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.p-HeatMap { list-style: none; margin: 0; padding: 4px; overflow: hidden;}',
'.p-HeatMap-item { width: 72px; height: 72px; box-sizing: border-box; padding: 0; float: left;}',
'.p-HeatMap-link { width: 100%; height: 100%; text-align: center; display: flex; flex-direction: column; align-items: center; justify-content: center; box-shadow: 0 0 0 1px rgba(0, 0, 0, .05) inset; color: #FFF; background-color: #444; text-shadow: 0 '
||'2px 1px rgba(0, 0, 0, .25); text-decoration: none; position: relative;  overflow: hidden; }',
'.p-HeatMap-link:before { content: ''''; position: absolute; left: 0; top: 0; right: 0; bottom: 0; }',
'.p-HeatMap-label,',
'.p-HeatMap-value { display: block; white-space: nowrap; position: relative; line-height: 20px; font-size: 16px; }',
'.p-HeatMap-link:focus,.p-HeatMap-link:hover { outline: none; transform: scale(1.111); z-index: 1; box-shadow: 0 2px 4px rgba(0, 0, 0, .25) }',
'.p-HeatMap-body { transform: scale(0.8) translateY(10px);  opacity: .7; }',
'.p-HeatMap-link:hover .p-HeatMap-body,',
'.p-HeatMap-link:focus .p-HeatMap-body { transform: scale(1); opacity: 1; }',
'.p-HeatMap-value { font-weight: bold; transform: translateY(32px); opacity: 0;  }',
'.p-HeatMap-link:hover .p-HeatMap-value,',
'.p-HeatMap-link:focus .p-HeatMap-value { transform: translateY(0); opacity: 1; }',
'',
'.p-HeatMap-link, .p-HeatMap-body, .p-HeatMap-value {',
'  /* transition:  0.1s 2s ease; */',
'}',
'',
'/* Colors */',
'.p-HeatMap-link.is-up:before { background-color: #64DD17; }',
'.p-HeatMap-link.is-down:before { background-color: #d50000; }',
'.p-HeatMap-link.is-neutral:before { background-color: #444; }',
'',
'/* Percent Modifiers */',
'.pct-10:before { opacity: .1; }',
'.pct-20:before { opacity: .2; }',
'.pct-30:before { opacity: .3; }',
'.pct-40:before { opacity: .4; }',
'.pct-50:before { opacity: .5; }',
'.pct-60:before { opacity: .6; }',
'.pct-70:before { opacity: .7; }',
'.pct-80:before { opacity: .8; }',
'.pct-90:before { opacity: .9; }',
'.pct-100:before { opacity: 1; }'))
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(2756021856878002704)
,p_help_text=>unistr('<p>Use this Interactive Report to view page views aggregated by user. Click the <strong>Reset</strong> button to reset the interactive report. Click the <strong>Actions \00BF</strong> button to define the number of rows displayed per page, filter, format')
||', download, and/or save the interactive report.</p>'
,p_page_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.hour-graph {',
'  display: table;',
'  width: 100%;',
'}',
'',
'span.hour {',
'  display: table-cell;',
'  padding: 0;',
'  font-size: 11px;',
'  text-align: center;',
'  background-color: #a6ffa6;',
'  min-width: 32px;',
'}',
'',
'span.hour.is-over1k {',
'    background-color: #7bdc7b;',
'}',
'',
'span.hour.is-null {',
'  background-color: #E0E0E0;',
'}',
'',
'span.hour-label {opacity: 0.5;}',
'',
'span.hour-value {',
'  display: block;',
'}',
''))
,p_page_component_map=>'10'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(2640322444069965953)
,p_plug_name=>'Heatmap'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'  c             integer := 0;',
'  l_max         number;',
'  l_neutral     number;',
'  l_class       varchar2(30);',
'  l_pct         integer;',
'  l_pct_string  varchar2(30);',
'',
'begin',
'l_neutral := 2; -- default to one page view one user over the period, no other activity',
'',
'sys.htp.p(''<ul class="p-HeatMap">'');',
'for c1 in (',
'select project, ',
'       initials, ',
'       the_link, ',
'       id, ',
'       (milestones + action_items + status_reports + updates + people + attachments + links + issues + resources + project_changes + users_viewing + view_count) activity',
'from (',
'select',
'    s.id,',
'    s.project,',
'    apex_string.get_initials(s.project,4) as initials,',
'    apex_util.prepare_url (''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||id) the_link,',
'    (select count(*) from EBA_PROJ_STATUS_MS$ where project_id = s.id and IS_DELETED_YN = ''N'' and created >= sysdate - to_number(:P84_TIMEFRAME,''9999999990.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) as milestones,',
'    (select count(*) from EBA_PROJ_STATUS_AIS$ where project_id = s.id and IS_DELETED_YN = ''N'' and created >= sysdate - to_number(:P84_TIMEFRAME,''9999999990.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) as action_items,',
'    (select count(*) from EBA_PROJ_STATUS_RPTS where project_id = s.id and created >= sysdate - to_number(:P84_TIMEFRAME,''9999999990.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) as status_reports,',
'    (select count(*) from EBA_PROJ_STATUS_UPDATES where project_id = s.id and created >= sysdate - to_number(:P84_TIMEFRAME,''9999999990.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) as updates,',
'    (select count(*) from EBA_PROJ_USER_REF where project_id = s.id and created >= sysdate - to_number(:P84_TIMEFRAME,''9999999990.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) as people,',
'    (select count(*) from EBA_PROJ_STATUS_FILES where project_id = s.id and created >= sysdate - to_number(:P84_TIMEFRAME,''9999999990.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) as attachments,',
'    (select count(*) from EBA_PROJ_STATUS_LINKS where project_id = s.id and created >= sysdate - to_number(:P84_TIMEFRAME,''9999999990.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) as links,',
'    (select count(*) from EBA_PROJ_STATUS_ISSUES where project_id = s.id and created >= sysdate - to_number(:P84_TIMEFRAME,''9999999990.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) as issues,',
'    (select count(*) from EBA_PROJ_RESOURCES where project_id = s.id and created >= sysdate - to_number(:P84_TIMEFRAME,''9999999990.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) as resources,',
'    (select count(*) from EBA_PROJ_HISTORY_90DAY_V where project_id = s.id and created >= sysdate - to_number(:P84_TIMEFRAME,''9999999990.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) as project_changes,',
'    (select count(distinct app_username) u from eba_proj_status_clicks where project_id = s.id and view_timestamp > sysdate - to_number(:P84_TIMEFRAME,''9999999990.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) as users_viewing,',
'    (select count(*) v from eba_proj_status_clicks where project_id = s.id and view_timestamp > sysdate - to_number(:P84_TIMEFRAME,''9999999990.99999999999'',''NLS_NUMERIC_CHARACTERS=''''.,'''''')) as view_count',
'from EBA_PROJ_STATUS s',
'where eba_proj_stat_ui.is_project_open(s.id) = 1',
') x',
'order by 5 desc) loop',
'c := c + 1;',
'',
'if c = 1 then ',
'    -- first row has the highest value',
'    l_max := c1.activity;',
'end if;',
'',
'if c1.activity > l_neutral then ',
'    l_class := ''is-up'';',
'elsif c1.activity = l_neutral then',
'    l_class := ''is-neutral'';',
'else',
'    l_class := ''is-down'';',
'end if;',
'',
'if c1.activity = 0 or c1.activity = l_max then ',
'   l_pct := 100;',
'else',
'   l_pct := greatest(round((c1.activity/l_max) * 100, -1),10);',
'end if;',
'',
'if l_class = ''is-neutral'' then',
'   l_pct_string := ''null'';',
'else',
'   l_pct_string := ''pct-''||l_pct;',
'end if;',
'',
'if 1 = 0 then',
'htp.p(''<pre>l_class=''||l_class||'', l_max=''||l_max||'', l_class=''||l_class||'', l_pct_string=''||l_pct_string||'', c1.activity=''||c1.activity||'', l_neutral=''||l_neutral||''</pre>'');',
'else',
'sys.htp.p(''<li class="p-HeatMap-item">'');',
'sys.htp.p('' <a href="''||c1.the_link||''" class="p-HeatMap-link ''||l_class||'' ''||l_pct_string||''" title="''||c1.project||''">'');',
'sys.htp.p(''   <span class="p-HeatMap-body">'');',
'sys.htp.p(''   <span class="p-HeatMap-label">''||trim(apex_escape.html(c1.initials))||''</span>'');',
'sys.htp.p(''   <span class="p-HeatMap-value">''||trim(to_char(c1.activity,''999G999G999G999G990''))||''</span>'');',
'sys.htp.p(''   </span>'');',
'sys.htp.p('' </a>'');',
'sys.htp.p(''</li>'');',
'  end if;',
'end loop;',
'sys.htp.p(''</ul>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11596862377102085126)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(11599001298265425495)
,p_plug_name=>'Button Bar'
,p_region_template_options=>'#DEFAULT#:t-ButtonRegion--noPadding:t-ButtonRegion--noUI'
,p_component_template_options=>'#DEFAULT#'
,p_escape_on_http_output=>'Y'
,p_plug_template=>wwv_flow_imp.id(6672347163384369864)
,p_plug_display_sequence=>20
,p_plug_new_grid_column=>false
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(2743854740926019526)
,p_name=>'P84_TIMEFRAME'
,p_is_required=>true
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(11599001298265425495)
,p_item_default=>'7'
,p_prompt=>'Timeframe'
,p_source=>'00001.0000000000'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'TIMEFRAME - LONGER'
,p_lov=>'.'||wwv_flow_imp.id(6072479693769082825)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'REDIRECT_SET_VALUE')).to_clob
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(2743855900090019547)
,p_name=>'Refresh'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P84_TIMEFRAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
,p_display_when_type=>'NEVER'
);
wwv_flow_imp.component_end;
end;
/
