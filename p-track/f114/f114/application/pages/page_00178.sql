prompt --application/pages/page_00178
begin
--   Manifest
--     PAGE: 00178
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
 p_id=>178
,p_name=>'Reporting'
,p_step_title=>'Reporting'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847490199618134449)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function scrollIntoView(id) { ',
'  $(id)[0].scrollIntoView(); ',
'  $(document).scrollTop($(document).scrollTop() - apex.theme.defaultStickyTop());',
'}'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'h2.t-Region-title {',
'    -webkit-font-smoothing: antialiased;',
'    font-size: 2.8rem;',
'    box-sizing: border-box;',
'    display: block;',
'    color: #404040;',
'    visibility: visible;',
'}'))
,p_step_template=>wwv_flow_imp.id(6672319528586369818)
,p_page_template_options=>'#DEFAULT#'
,p_protection_level=>'C'
,p_help_text=>'This help text documents the reports available in this application.'
,p_page_component_map=>'10'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12589325942552641084)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>70
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12589326325193641085)
,p_plug_name=>'Help Content Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>10
,p_plug_new_grid_row=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12397090191655832161)
,p_plug_name=>'Additional Reports'
,p_region_name=>'addr'
,p_parent_plug_id=>wwv_flow_imp.id(12589326325193641085)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>50
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p><strong>Additional Reports</strong> provide even more ways of graphically displaying the meta data collected from end-users entering and tracking project data.</p>',
'<p>The <strong>&CAT_TITLE.</strong> report shows a bar chart of projects by status and &CAT_TITLE_LC.. Statuses can be toggled on and off to dynamically change the bar heights representing the number of matching projects in that &CAT_TITLE_LC..</p>',
'<p>The <strong>Status</strong> report shows a bar chart of projects by &CAT_TITLE_LC. and status. &CAT_TITLE_PL. can be toggled on and off to dynamically change the bar heights representing the number of matching projects in that status.</p>',
'<p>The <strong>Tree</strong> report displays all projects in a hierarchial fashion (with child projects displayed under their parent).</p>',
'<p>The <strong>Monthly Calendar by Project Creation Date</strong> displays a calendar. Projects appear in the calendar if they were created in the month being displayed.</p>',
'<p>The <strong>Action Item Summary by Project</strong> report lists all projects sorted by project name. This report displays a project''s status, the total number of action items, the number of open action items, the number of past due action items, '
||'the number of closed action items, the latest verification date, and whether you''re following the project or not. Clicking on a project''s name will take the end-user to the project''s details page.</p>',
'<p>The <strong>Project Followers</strong> report lists all followers of projects and which projects they are following.</p>',
'<p>The <strong>Search Results</strong> report lists all search terms used by end-users, when the terms were searched on, who issued the search, and the number of results returned by the search.</p>',
'<p>The <strong>Projects by Resource</strong> report lists all projects by which resources they are utilizing.</p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12397090292882832162)
,p_plug_name=>'Administrative Reports'
,p_region_name=>'ar'
,p_parent_plug_id=>wwv_flow_imp.id(12589326325193641085)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p><strong>Admistrative Reports</strong> provide even more ways of graphically displaying end-users'' project and meta data. These reports are only available to application administrators (on the Administration page).</p>',
'<p>The <strong>Public Pages</strong> report shows all pages in the application that do not require authentication to view.</p>',
'<p>The <strong>Login Required Pages</strong> report shows all pages in the application that require authentication to view.</p>',
'<p>The <strong>Authorization Protected Pages</strong> report shows all pages in the application that require authorization to view.</p>',
'<p>The <strong>Page Views by Day</strong> report displays a monthly calendar of application activity reporting distinct users and total page views by day.</p>',
'<p>The <strong>Page Views</strong> report is an interactive report of all page views by user. You can limit the results by changing the timeframe select-list value.</p>',
'<p>The <strong>Activity Calendar by User by Day</strong> report lists page views by user summarized by day in a monthly calendar.</p>',
'<p>The <strong>Application Activity by Page</strong> report shows application page performance and popularity. A weighted page performance column multiplies page views by median rendering time. Use this report to validate application performance.</p>',
'<p>The <strong>Search Results</strong> report lists all search terms used by end-users, when the terms were searched on, who issued the search, and the number of results returned by the search.</p>',
'<p>The <strong>Application Error Log</strong> report lists all unexpected errors logged by this application.</p>',
'<p>The <strong>Email Log</strong> report lists all emails sent by this application (except for past due and upcoming deliverables emails).</p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12611400400441031519)
,p_plug_name=>'Project Reports'
,p_region_name=>'pr'
,p_parent_plug_id=>wwv_flow_imp.id(12589326325193641085)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_pi_val  varchar2(10) := ''Exclude''; -- Project Issues',
'    l_pu_val  varchar2(10) := ''Exclude''; -- Project Updates',
'    l_psr_val varchar2(10) := ''Exclude''; -- Project Status Reports',
'    l_pa_val  varchar2(10) := ''Exclude''; -- Project Attachments',
'    l_pl_val  varchar2(10) := ''Exclude''; -- Project Links',
'    l_show_db boolean := false;',
'    l_db_cnt  number := 0;',
'begin',
'    sys.htp.p(''<p>There are many reports available on all projects in the &APPLICATION_TITLE. application.'');',
'',
'    for c1 in',
'    (',
'        select distinct build_option_name, build_option_status',
'          from apex_application_build_options',
'         where application_id = :APP_ID',
'           and build_option_name like ''Dashboard%''',
'         order by 1',
'    )',
'    loop',
'        l_db_cnt := l_db_cnt + 1;',
'        if c1.build_option_name = ''Dashboard'' and c1.build_option_status = ''Include'' then',
'            l_show_db := true;',
'            sys.htp.p(''To see key metrics of all project data at a glance navigate to Reporting > Projects - <strong>Dashboard</strong>. The <strong>Dashboard</strong> report displays project information in the form of charts, graphs, and lists. The '
||'<strong>Dashboard</strong> report shows the following information:</p><ul>'');',
'        elsif l_show_db and c1.build_option_name = ''Dashboard: Show Parent Projects'' and c1.build_option_status = ''Include'' then',
'            sys.htp.p(''<li>Parent Projects</li>'');',
'        elsif l_show_db and c1.build_option_name = ''Dashboard: Show Projects by Category'' and c1.build_option_status = ''Include'' then',
'            sys.htp.p(''<li>Projects by ''||:CAT_TITLE||''</li>'');',
'        elsif l_show_db and c1.build_option_name = ''Dashboard: Show Projects by Status'' and c1.build_option_status = ''Include'' then',
'            sys.htp.p(''<li>Projects by Status</li>'');',
'        elsif l_show_db and c1.build_option_name = ''Dashboard: Show recently edited projects'' and c1.build_option_status = ''Include'' then',
'            sys.htp.p(''<li>Recently Edited Projects</li>'');',
'        elsif l_show_db and c1.build_option_name = ''Dashboard: Show least recently edited'' and c1.build_option_status = ''Include'' then',
'            sys.htp.p(''<li>Least Recently Edited Projects</li>'');',
'        elsif l_show_db and c1.build_option_name = ''Dashboard: Show recently created'' and c1.build_option_status = ''Include'' then',
'            sys.htp.p(''<li>Recently Created Projects</li>'');',
'        elsif l_show_db and c1.build_option_name = ''Dashboard: Show summary'' and c1.build_option_status = ''Include'' then',
'            sys.htp.p(''<li>Projects Summary Information</li>'');',
'        elsif l_show_db and c1.build_option_name = ''Dashboard: Show People Resources'' and c1.build_option_status = ''Include'' then',
'            sys.htp.p(''<li>People Resources</li>'');',
'        end if;',
'    end loop;',
'',
'    -- If Dashboard Build Options were found',
'    if l_db_cnt > 0 then',
'        sys.htp.p(''</ul>''); -- Close the unordered list',
'    else',
'        sys.htp.p(''</p>''); -- Close the first paragraph',
'    end if;',
'',
'    sys.htp.p(''<p>The <strong>Projects</strong> interactive report lists all projects sorted by their last updated date. This report displays a project''''s status, ''||:CAT_TITLE_LC||'', the number of open action items, the project''''s next milestone and'
||' it''''s due date, and when the project was last updated. Clicking on a project''''s name will take the end-user to the project''''s project details page. Clicking on the number of open action items will take the end-user to the project''''s action items rep'
||'ort.</p>'');',
'    sys.htp.p(''<p>The <strong>History</strong> interactive report lists all actions that have transpired in the last 90 days for all projects that the end-user can access.</p>'');',
'',
'    -- Get Project Issues Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Project Issues''',
'    )',
'    loop',
'        l_pi_val := c1.build_option_status;',
'    end loop;',
'',
'    -- Get Project Updates Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Project Updates''',
'    )',
'    loop',
'        l_pu_val := c1.build_option_status;',
'    end loop;',
'',
'    -- Get Project Status Reports Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Project Status Reports''',
'    )',
'    loop',
'        l_psr_val := c1.build_option_status;',
'    end loop;',
'',
'    -- Get Project Attachments Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Project Attachments''',
'    )',
'    loop',
'        l_pa_val := c1.build_option_status;',
'    end loop;',
'',
'    -- Get Project Links Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Project Links''',
'    )',
'    loop',
'        l_pl_val := c1.build_option_status;',
'    end loop;',
'',
'    if l_pi_val = ''Include'' then',
'        sys.htp.p(''<p>The <strong>Issues</strong> report is an interactive report showing all issues in all projects that the end-user can access. This report contains an edit icon in each row (if the end-user has the correct project access privilege'
||'s), so that issue data can be updated directly from this report.</p>'');',
'    end if;',
'',
'    if l_pl_val = ''Include'' then',
'        sys.htp.p(''<p>The <strong>Links</strong> report is an interactive report listing all project links sorted by the date the link was added/created. Click the pencil icon to edit the link.</p>'');',
'    end if;',
'',
'    sys.htp.p(''<p>The <strong>''||:CAT_TITLE||'' Stacked Bar Chart</strong> is a bar chart of projects counts with each bar representing a ''||:CAT_TITLE_LC||''. Each bar is further delineated by project status.</p>'');',
'    sys.htp.p(''<p>The <strong>Status Stacked Bar Chart</strong> is a bar chart of projects counts with each bar representing a project status. Each bar is further delineated by project ''||:CAT_TITLE_LC||''.</p>'');',
'',
'    if l_pu_val = ''Include'' then',
'        sys.htp.p(''<p>The <strong>Updates</strong> timeline is a searchable timeline report of project updates. This report can be filtered by project, contributor, ''||:CAT_TITLE_LC||'', timeframe and type. The end-user can also specify the number of '
||'rows the would like to appear in this report.</p>'');',
'    end if;',
'',
'    if l_pa_val = ''Include'' then',
'        sys.htp.p(''<p>The <strong>Attachments</strong> timeline is a searchable timeline report of the files that have been attched to projects. This report can be filtered by file type, contributor, and ''||:CAT_TITLE_LC||''. The end-user can also spe'
||'cify the number of rows the would like to appear in this report.</p>'');',
'    end if;',
'',
'    if l_psr_val = ''Include'' then',
'        sys.htp.p(''<p>The <strong>Status Reports</strong> timeline is a searchable timeline report of project status reports. This report can be filtered by project, submitter, timeframe and type. The end-user can also specify the number of rows the '
||'would like to appear in this report.</p>'');',
'    end if;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12611417072567036384)
,p_plug_name=>'Action Item Reports'
,p_region_name=>'air'
,p_parent_plug_id=>wwv_flow_imp.id(12589326325193641085)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p><strong>Action Item</strong> reports show many different facets of action item data. They show which users are completing action items on time, action items that are not yet complete, and who is responsible for completing those unfinished action i'
||'tems.</p>',
'<p>The <strong>Past Due Action Items</strong> report lists all projects with open, past due action items. This report displays an action item''s status, due date, status level, owners, &CAT_TITLE_LC., and when the action item was last updated. Clickin'
||'g on an action item''s name will take the end-user to the action item''s details page. Clicking on a project''s name will take the end-user to the project''s details page.</p>',
'<p>The <strong>Action Item By Owners</strong> report displays a searchable timeline report of action items sorted by action item owners. This report can be filtered by action item owner, fiscal quarter, &CAT_TITLE_LC., and status. The end-user can al'
||'so specify the number of rows the would like to appear in this report.</p>',
'<p>The <strong>Action Items Dashboard</strong> report displays several charts, graphs and lists summarizing &APPLICATION_TITLE.''s action item data. The regions you''ll find on this page include:</p>',
'<ul>',
'    <li>Open Action Items</li>',
'    <li>Completed Action Items by Owner (last month)</li>',
'    <li>Action Items by Project</li>',
'    <li>Projects by Type</li>',
'    <li>Projects by Status</li>',
'    <li>Overdue Action Items by Owner</li>',
'</ul>',
'<p>The <strong>Interactive Report</strong> displays a report of all open action items. This report displays an action item''s status, due date, status level, owners, &CAT_TITLE_LC., whether it''s past due or not, and when the action item was last updat'
||'ed. Clicking on an action item''s name will take the end-user to the action item''s details page. Clicking on a project''s name will take the end-user to the project''s details page.</p>',
'<p>The <strong>Change Owner</strong> tool reports the number of action items each application user currently has assigned and allows end-users the ability to reassign action items.</p>'))
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select null from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Project Action Items'' and build_option_status = ''Include'''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12611418896124040744)
,p_plug_name=>'Milestone Reports'
,p_region_name=>'msr'
,p_parent_plug_id=>wwv_flow_imp.id(12589326325193641085)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p><strong>Milestone</strong> reports provide metrics on where projects are in their evolution towards reaching their stated goals. Milestones data is reported in several different ways.</p>',
'<p>The <strong>Milestone Summary by Project</strong> report lists all projects sorted by project name. This report displays a project''s status, the total number of milestones, the number of open milestones, the number of past due milestones, the late'
||'st verification date, and whether you''re following the project or not. Clicking on a project''s name will take the end-user to the project''s details page.</p>',
'<p>The <strong>By Owners</strong> report displays a searchable timeline report of milestones sorted by milestone owners. This report can be filtered by milestone owner, fiscal quarter, &CAT_TITLE_LC., status, and type (major or minor). The end-user c'
||'an also specify the number of rows the would like to appear in this report.</p>',
'<p>The <strong>&CAT_TITLE. Bar Chart</strong> report displays a bar chart of &APPLICATION_TITLE.''s various &CAT_TITLE_PL_LC.. Each &CAT_TITLE_LC. has a bar that is made up of green (completed milestones) and red (unachieved milestones).</p>',
'<p>The <strong>Monthly Calendar</strong> report lists all milestones in a calendar view. Click the milestone''s name to navigate to the project''s milestones.</p>',
'<p>The <strong>Interactive Report</strong> displays a report of all open milestones. This report contains a link to the milestone details page as well as a link to the project''s details page. This report also shows the date the milestone is due, it''s'
||' owner, status, status level, &CAT_TITLE_LC., whether it''s a major milestone or not, and when it was last updated.</p>',
'<p>The <strong>Gantt</strong> chart report lists all milestones in a Gannt chart format. This report can be filtered by milestone owner, period, project person, milestone owner, &CAT_TITLE_LC., status, and type (major, minor, or major and minor).</p>'))
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>'select null from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Project Milestones'' and build_option_status = ''Include'''
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12589326754961641086)
,p_plug_name=>'List of Contents'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_ai_val varchar2(10) := ''Exclude''; -- Project Action Items',
'    l_ms_val varchar2(10) := ''Exclude''; -- Project Milestones',
'begin',
'    -- Get Project Action Items Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Project Action Items''',
'    )',
'    loop',
'        l_ai_val := c1.build_option_status;',
'    end loop;',
'',
'    -- Get Project Milestones Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Project Milestones''',
'    )',
'    loop',
'        l_ms_val := c1.build_option_status;',
'    end loop;',
'',
'    sys.htp.p(''<ul class="t-LinksList">',
'        <li class="t-LinksList-item"><a href="javascript:scrollIntoView(''''#pr'''');" class="t-LinksList-link"><span class="t-LinksList-label">Project Reports</span></a></li>'');',
'    if l_ms_val = ''Include'' then',
'        sys.htp.p(''<li class="t-LinksList-item"><a href="javascript:scrollIntoView(''''#msr'''');" class="t-LinksList-link"><span class="t-LinksList-label">Milestone<sup></sup> Reports</span></a></li>'');',
'    end if;',
'    if l_ai_val = ''Include'' then',
'        sys.htp.p(''<li class="t-LinksList-item"><a href="javascript:scrollIntoView(''''#air'''');" class="t-LinksList-link"><span class="t-LinksList-label">Action Item<sup></sup> Reports</span></a></li>'');',
'    end if;',
'    sys.htp.p(''<li class="t-LinksList-item"><a href="javascript:scrollIntoView(''''#addr'''');" class="t-LinksList-link"><span class="t-LinksList-label">Additional Reports</span></a></li>',
'        <li class="t-LinksList-item"><a href="javascript:scrollIntoView(''''#ar'''');" class="t-LinksList-link"><span class="t-LinksList-label">Administrative Reports<sup></sup></span></a></li>',
'    </ul>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12611568445997010927)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12611400400441031519)
,p_button_name=>'TOP_PR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Top'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'#'
,p_icon_css_classes=>'fa-chevron-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12611568534423010928)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12611418896124040744)
,p_button_name=>'TOP_MR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Top'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'#'
,p_icon_css_classes=>'fa-chevron-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12611568684096010929)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12611417072567036384)
,p_button_name=>'TOP_AIR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Top'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'#'
,p_icon_css_classes=>'fa-chevron-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12611568804506010930)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12397090191655832161)
,p_button_name=>'TOP_ADDR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Top'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'#'
,p_icon_css_classes=>'fa-chevron-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12611568878235010931)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12397090292882832162)
,p_button_name=>'TOP_AR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Top'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'#'
,p_icon_css_classes=>'fa-chevron-up'
);
wwv_flow_imp.component_end;
end;
/
