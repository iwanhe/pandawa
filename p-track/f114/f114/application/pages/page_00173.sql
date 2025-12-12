prompt --application/pages/page_00173
begin
--   Manifest
--     PAGE: 00173
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
 p_id=>173
,p_name=>'Managing Projects'
,p_step_title=>'Managing Projects'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847490199618134449)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function scrollIntoView(id) { ',
'  $(id)[0].scrollIntoView(); ',
'  $(document).scrollTop($(document).scrollTop() - apex.theme.defaultStickyTop());',
'}'))
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'if (location.hash) {',
'    scrollIntoView(location.hash);',
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
,p_help_text=>'This help text documents how to manage projects in this application.'
,p_page_component_map=>'10'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12062287114500425634)
,p_plug_name=>'RDS'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>15
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source_type=>'NATIVE_DISPLAY_SELECTOR'
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_region_icons', 'N',
  'include_show_all', 'Y',
  'rds_mode', 'STANDARD',
  'remember_selection', 'SESSION')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12587727734596473319)
,p_plug_name=>'Help Content Container'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>20
,p_plug_new_grid_row=>false
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12062287191891425635)
,p_plug_name=>'Tools and Widgets'
,p_region_name=>'tw'
,p_parent_plug_id=>wwv_flow_imp.id(12587727734596473319)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>130
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_pl_val  varchar2(10) := ''Exclude'';',
'    l_mrg_val varchar2(10) := ''Exclude'';',
'    l_vld_val varchar2(10) := ''Exclude'';',
'    l_cc_val  varchar2(10) := ''Exclude'';',
'begin',
'    -- Get Perma Link Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Perma Link''',
'    )',
'    loop',
'        l_pl_val := c1.build_option_status;',
'    end loop;',
'',
'    -- Get Merge Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Merge''',
'    )',
'    loop',
'        l_mrg_val := c1.build_option_status;',
'    end loop;',
'',
'    -- Get Project Validations Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Project Validations''',
'    )',
'    loop',
'        l_vld_val := c1.build_option_status;',
'    end loop;',
'',
'    -- Get Content Complete Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Content complete "fish bowl"''',
'    )',
'    loop',
'        l_cc_val := c1.build_option_status;',
'    end loop;',
'',
'    sys.htp.p(''<p>Some useful project tools include:</p>',
'    <ul>',
'        <li><strong>Email</strong> - Emails a project details email or a project status email. You can also specify your own message text at the beginning of the email.</li>'');',
'        if l_pl_val = ''Include'' then',
'            sys.htp.p(''<li><strong>Perma Link</strong> - Provides a project URL that can be shared with others.</li>'');',
'        end if;',
'        if l_mrg_val = ''Include'' then',
'            sys.htp.p(''<li><strong>Merge</strong> - Provides the ability to merge one project with another.</li>'');',
'        end if;',
'        if l_vld_val = ''Include'' then',
'            sys.htp.p(''<li><strong>Validations</strong> - This tool allows an end-user to validate that the project is still actively being worked on. The more validations a project has, the higher the project''''s <strong>Content Completeness</strong>'
||' rating.</li>'');',
'        end if;',
'    sys.htp.p(''</ul>',
'    <p>Some useful project widgets include:</p>',
'    <ul>'');',
'        if l_cc_val = ''Include'' then',
'            sys.htp.p(''<li><strong>Content Completeness</strong> - This weighs a number of factors to display a percentage graph of how "complete" the project is. Click the graph to see which factors are being weighed.</li>'');',
'        end if;',
'        sys.htp.p(''<li><strong>Last 90 Days Usage Numbers</strong> - This widget displays two numbers. The number of page views and the number of distinct visitors over the last 90 days. Click either number for more details.</li>',
'    </ul>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12397088459775832144)
,p_plug_name=>'Projects'
,p_region_name=>'cp'
,p_parent_plug_id=>wwv_flow_imp.id(12587727734596473319)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>20
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_pp_val varchar2(10) := ''Exclude''; -- Allow Parent Projects',
'    l_ps_val varchar2(10) := ''Exclude''; -- Project Sizes',
'    l_cn_val varchar2(10) := ''Exclude''; -- Project Code Names',
'    l_dt_val varchar2(10) := ''Exclude''; -- Project Deal Types',
'    l_rc_val varchar2(10) := ''Exclude''; -- Restrict Changes',
'begin',
'    -- Get Parent Projects Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Allow Parent Projects''',
'    )',
'    loop',
'        l_pp_val := c1.build_option_status;',
'    end loop;',
'',
'    -- Get Project Sizes Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Project Sizes''',
'    )',
'    loop',
'        l_ps_val := c1.build_option_status;',
'    end loop;',
'',
'    -- Get Project Code Names Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Project Code Names''',
'    )',
'    loop',
'        l_cn_val := c1.build_option_status;',
'    end loop;',
'',
'    -- Get Project Deal Types Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Project Deal Types''',
'    )',
'    loop',
'        l_dt_val := c1.build_option_status;',
'    end loop;',
'',
'    -- Get Restrict Changes Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Restrict Changes''',
'    )',
'    loop',
'        l_rc_val := c1.build_option_status;',
'    end loop;',
'',
'    -- Show Content',
'    sys.htp.p(''<h3>Creating Projects</h3><p>To create a new project click the <strong>Create Project</strong> button on '' || :APPLICATION_TITLE || ''''''s home page (the "Projects" page).</p>',
'    <p>When you create a new project, the following attributes are required:</p>',
'    <ul>',
'        <li><strong>Name</strong> - The project''''s name.</li>',
'        <li><strong>Status</strong> - The progress or priority of the project. To add a new status optionto the list, contact your application administrator.</li>',
'        <li><strong>Access Control</strong> - Projects can have "Open" or "Restricted" membership (learn more on the <a href="f?p=&APP_ID.:198:&APP_SESSION.:">Access Control help page</a>).</li>'');',
'        if l_rc_val = ''Include'' then',
'            sys.htp.p(''<li><strong>Prevent Changes</strong> - In a restricted project, setting this attribute to "Yes" prevents users who only have Edit privileges in the project (either explicitly or through their assigned role) from editing project'
||' details and most aspects of milestones and action items. In an open project, setting this attribute to "Yes" allows application administrators to edit project details and most aspects of the project''''s milestones and action items.</li>'');',
'        end if;',
'        sys.htp.p(''<li><strong>A Person</strong> - This attribute is an object comprised of other attributes. In an open project, the required attributes are username and role. In a restricted project, the required attributes are username, role, and '
||'access level. The username attribute is the project creator''''s username by default (learn more on the <a href="f?p=&APP_ID.:198:&APP_SESSION.:">Access Control help page</a>).</li>',
'    </ul>',
'    <p>These project attributes are optional:</p>',
'    <ul>'');',
'        if l_pp_val = ''Include'' then',
'            sys.htp.p(''<li><strong>Parent Project</strong> - The project that this project is grouped beneath (unavailable if the "Allow Parent Projects" build option is disabled).</li>'');',
'        end if;',
'        if l_ps_val = ''Include'' then',
'            sys.htp.p(''<li><strong>Project Size</strong> - How large the project is anticipated to become.</li>'');',
'        end if;',
'        if l_dt_val = ''Include'' then',
'            sys.htp.p(''<li><strong>Deal Type</strong> - The type of "deal" this project is associated with (such as public or private).</li>'');',
'        end if;',
'        if l_cn_val = ''Include'' then',
'            sys.htp.p(''<li><strong>Code Name</strong> - The project alias.</li>'');',
'        end if;',
'        sys.htp.p(''<li><strong>''||:CAT_TITLE||''</strong> - How the project is categorized (such as a specific product, team, or division). To create a new ''||:CAT_TITLE_LC||'', choose the "- New ''||:CAT_TITLE||'' -" option and enter the new ''||:CAT_TIT'
||'LE_LC||''''''s name in the "New ''||:CAT_TITLE||''" text field.</li>',
'        <li><strong>Description</strong> - Brief explanation of the project.</li>',
'        <li><strong>Goal</strong> - Project goal. Identifying the goal of a project promotes a common focus and understanding.</li>',
'        <li><strong>Customer</strong> - Name of the associated customer.</li>',
'        <li><strong>Tags</strong> - Short, comma-separated lists of words that can aid in searching for particular projects later.</li>',
'        <li><strong>Primary URL</strong> - An external web site that is considered the primary URL for this project such as a link to an external system or cloud service, or a link to an external marketing page that describes your project.</li>',
'    </ul>'');',
'',
'    -- Show Content',
'    sys.htp.p(''<h3>Editing Projects</h3><p>To edit a project, click the <strong>Edit Project</strong> button on the project details page.</p>',
'    <p>When editing a project, the following attributes are required:</p>',
'    <ul>',
'        <li><strong>Name</strong> - The project''''s name.</li>',
'        <li><strong>Status</strong> - The progress or priority of the project. To add a new status optionto the list, contact your application administrator.</li>',
'        <li><strong>Access Control</strong> - See the <a href="f?p=&APP_ID.:198:&APP_SESSION.:">Access Control help page</a>.</li>'');',
'        if l_rc_val = ''Include'' then',
'            sys.htp.p(''<li><strong>Prevent Changes</strong> - In a restricted project, setting this attribute to "Yes" prevents users who only have Edit privileges in the project (either explicitly or through their assigned role) from editing project'
||' details and most aspects of milestones and action items. In an open project, setting this attribute to "Yes" allows application administrators to edit project details and most aspects of the project''''s milestones and action items.</li>'');',
'        end if;',
'    sys.htp.p(''</ul>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12397088626819832146)
,p_plug_name=>'Milestones'
,p_region_name=>'ms'
,p_parent_plug_id=>wwv_flow_imp.id(12587727734596473319)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Track a project''s progress with Milestones. Defining and reaching milestones when (or before) they''re due helps achieve the project''s stated goal.</p>',
'<p>When you create a project milestone, the following attributes are required:</p>',
'<ul>',
'    <li><strong>Milestone</strong> - The name of the milestone.</li>',
'    <li><strong>Start Date</strong> - The date that work on the milestone begins.</li>',
'    <li><strong>Due Date</strong> - The date the milestone should be completed.</li>',
'    <li><strong>Status</strong> - Whether the milestone is <strong>Open</strong> or <strong>Completed</strong>.</li>',
'</ul>',
'<p>The following milestone attributes are optional:</p>',
'<ul>',
'    <li><strong>Owner</strong> - Who is responsible for seeing the milestone is reached.</li>',
'    <li><strong>Is Major Milestone</strong> - Whether the milestone is a major milestone.</li>',
'    <li><strong>Description</strong> - A brief explanation about the milestone.</li>',
'    <li><strong>Tags</strong> - Short, comma-separated lists of words that can aid in searching for particular milestones later.</li>',
'</ul>'))
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Project Milestones''',
'   and build_option_status = ''Include'''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12397088749465832147)
,p_plug_name=>'Action Items'
,p_region_name=>'ai'
,p_parent_plug_id=>wwv_flow_imp.id(12587727734596473319)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_ail_val varchar2(10) := ''Exclude'';',
'    l_mr_val  varchar2(10) := ''Exclude'';',
'begin',
'    -- Get Action Item Links Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Action Item Links''',
'    )',
'    loop',
'        l_ail_val := c1.build_option_status;',
'    end loop;',
'',
'    -- Get Mandatory Action Item Resolution Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Mandatory Action Item Resolution''',
'    )',
'    loop',
'        l_mr_val := c1.build_option_status;',
'    end loop;',
'',
'    -- Show Content',
'    sys.htp.p(''<p>Action Items are helpful in defining the itemized steps that need to be accomplished in order to reach a project milestone. Action items can also be emailed (see <a href="f?p=&APP_ID.:174:&APP_SESSION.:#ps">Help > Documentation > Em'
||'ails > Action Items</a> for more details).</p>',
'    <p>When creating a project action item, the following attributes are mandatory:</p>',
'    <ul>',
'        <li><strong>Action</strong> - This attribute defines the action item''''s name.</li>',
'        <li><strong>Type</strong> - This attribute defines whether the action item is a bug, enhancement request, reminder, risk, or to do. The types listed here are the default types. The application administrator can add, remove and/or change these'
||' types.</li>',
'        <li><strong>Due Date</strong> - This attribute defines the date the action item should be completed by.</li>',
'        <li><strong>Status</strong> - This attribute can have a value of "Open" or "Closed / Complete".</li>'');',
'        if l_mr_val = ''Include'' then',
'            sys.htp.p(''<li><strong>Resolution</strong> - This attribute will contain text that describes what action was taken to resolve the Action Item.</li>'');',
'        end if;',
'    sys.htp.p(''</ul>',
'    <p>These action item attributes are optional:</p>',
'    <ul>',
'        <li><strong>Milestone</strong> - This attribute identifies the Milestone that this action item is associated with.</li>',
'        <li><strong>Owners</strong> - This attribute identifies up to 3 end-users that are responsible for seeing the action item gets addressed/resolved.</li>',
'        <li><strong>Description</strong> - A brief explanation about the action item.</li>',
'        <li><strong>Tags</strong> - Short comma-separated lists of words that can aid in searching for particular action items later.</li>'');',
'        if l_ail_val = ''Include'' then',
'            sys.htp.p(''<li><strong>Links</strong> - A URL that will open in another window when clicked. Typically, this URL will take the end-user to a page that further documents the Action Item.</li>'');',
'        end if;',
'        if l_mr_val = ''Exclude'' then',
'            sys.htp.p(''<li><strong>Resolution</strong> - This attribute can contain text that describes what action was taken to resolve the Action Item.</li>'');',
'        end if;',
'    sys.htp.p(''</ul>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Project Action Items''',
'   and build_option_status = ''Include'''))
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12397088873696832148)
,p_plug_name=>'Issues'
,p_region_name=>'iss'
,p_parent_plug_id=>wwv_flow_imp.id(12587727734596473319)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>When a project member runs into a problem they can log an issue. Issues communicate to the entire project team the need for help and/or a possible delay in reaching a particular milestone or completing a given action item. </p>',
'<p>When creating a project issue, the following attributes are mandatory:</p>',
'<ul>',
'    <li><strong>Project</strong> - This attribute identifies the Project that this issue is associated with.</li>',
'    <li><strong>Issue</strong> - This attribute defines the action item''s name.</li>',
'    <li><strong>Open</strong> - This attribute can have a value of "Yes" or "No".</li>',
'    <li><strong>Level</strong> - This attribute can have a value of "1 - Critical", "2 - Elevated", "3 - Important", or "4 - Tracking".</li>',
'</ul>',
'<p>These issue attributes are optional:</p>',
'<ul>',
'    <li><strong>Issue Owner</strong> - This attribute can either identify the end-user who found/reported the issue or the person responsible for seeing the issue gets addressed/resolved. It defaults to the username of the issue creator.</li>',
'    <li><strong>Detail</strong> - This attribute is a brief description of the issue needing resolution.</li>',
'    <li><strong>URL</strong> - A URL that will redirect to content related to the issue.</li>',
'</ul>'))
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Project Issues''',
'   and build_option_status = ''Include'''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12397088998429832149)
,p_plug_name=>'Updates'
,p_region_name=>'upd'
,p_parent_plug_id=>wwv_flow_imp.id(12587727734596473319)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>80
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Project updates can be direct or indirect. Indirect updates are automatically created whenever an end-user changes an attribute of the project. Indirect updates show which attribute was changed, who made the change and when, what the old value was'
||', and the new value that has been set. Direct updates are used to keep all project team members in-the-loop on a myriad of project-related items/issues. Direct updates (or just "Updates") are manually entered by end-users.</p>',
'<p>When creating a project update, the following attributes are mandatory:</p>',
'<ul>',
'    <!-- <li><strong>Project</strong> - This attribute identifies the Project that this update is associated with.</li> -->',
'    <li><strong>Update</strong> - This attribute defines the update. This is the update text that other team members will see.</li>',
'    <li><strong>Type</strong> - This attribute defines the type of update text being provided. By default this can have a value of "Status", "Accomplishment", "Question", "Decision", or "Note". Your application administrator can add, remove and/or ch'
||'ange these values.</li>',
'</ul>',
'<p>These update attributes are optional:</p>',
'<ul>',
'    <li><strong>Mark As Gold</strong> - This attribute defines whether the update is a "Gold" update or not. Updates marked as "Gold" will always appear at the top of the Updates region on the project details page.</li>',
'</ul>'))
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Project Updates''',
'   and build_option_status = ''Include'''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12397089090321832150)
,p_plug_name=>'People'
,p_region_name=>'ppl'
,p_parent_plug_id=>wwv_flow_imp.id(12587727734596473319)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_il_val varchar2(10) := ''Exclude'';',
'begin',
'    -- Get Involvement Level Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Project User Involvement''',
'    )',
'    loop',
'        l_il_val := c1.build_option_status;',
'    end loop;',
'',
'    -- Show Content',
'    sys.htp.p(''<p>Define people as team members on a project to assign them roles on the project. For Restricted projects, you must set the Access Level of team members.</p>',
'    <p>When you add a new member to a project, the following attributes are required:</p>',
'    <ul>',
'        <li><strong>User</strong> - The username of the new member.</li>',
'        <li><strong>Project Role</strong> - The role of the new member. To add a role to the list, select <strong>Add New Role</strong>.</li>',
'        <li><strong>Access Level</strong> - (Restricted projects only.) Assign one of the following values to assign to the new person:</li>',
'              <ul>',
'                  <li><strong>Read Only</strong> - The project member can only view project data.</li>',
'                  <li><strong>Read / Write</strong> - The project member can view and edit project data.</li>',
'                  <li><strong>Read / Write (with Admin)</strong> - The project member can view and edit project data and manage project members.</li>',
'              </ul>',
'    </ul>',
'    <p>The following person attributes are optional:</p>',
'    <ul>'');',
'        if l_il_val = ''Include'' then',
'            sys.htp.p(''<li><strong>Involvement Level</strong> - The amount of time and level of effort that the new person provides to the project. You can choose from the default values of <strong>Full</strong>, <strong>Half</strong>, <strong>Quarte'
||'r</strong>, or <strong>Partial</strong>. To add more Involvement Level options to this list, contact your application administrator.</li>'');',
'        end if;',
'        sys.htp.p(''<li><strong>Notes</strong> - Other information about the person being added that may be of interest to other members.</li>',
'    </ul>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12397089202788832151)
,p_plug_name=>'Resources'
,p_region_name=>'rcs'
,p_parent_plug_id=>wwv_flow_imp.id(12587727734596473319)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Defining project resources ensures all project members are aware of what resources are involved with the project. The list of resources can serve as an inventory of what''s needed to accomplish the goals of the project and similar projects.</p>',
'<p>When adding a resource, the following attributes are mandatory:</p>',
'<ul>',
'    <li><strong>Resource</strong> - This attribute defines the name of the new resource.</li>',
'    <li><strong>Resource Type</strong> - This attribute defines what type of resource is being added. If the appropriate resource type is not in the list of options, ask your application administrator to add the resource type you would like added.</l'
||'i>',
'</ul>',
'<p>These resource attributes are optional:</p>',
'<ul>',
'    <li><strong>Notes</strong> - This attribute contains any other information about the resource being added.</li>',
'</ul>'))
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Project Resources''',
'   and build_option_status = ''Include'''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12397089222204832152)
,p_plug_name=>'Links'
,p_region_name=>'lnk'
,p_parent_plug_id=>wwv_flow_imp.id(12587727734596473319)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>100
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Having the ability to add important links to  a project is very useful. You can add as many links as you wish to project-related web content.</p>',
'<p>When adding a link, the following attributes are mandatory:</p>',
'<ul>',
'    <li><strong>Project</strong> - This attribute identifies the Project that this link is associated with.</li>',
'    <li><strong>Link Target</strong> - This attribute defines the URL that the link will redirect to.</li>',
'</ul>',
'<p>These link attributes are optional:</p>',
'<ul>',
'    <li><strong>Name</strong> - This attribute contains the link text.</li>',
'    <li><strong>Description</strong> - This attribute contains any other information about the link being added.</li>',
'    <li><strong>Mark As Gold</strong> - This attribute defines whether the link is a "Gold" link or not. Links marked as "Gold" will always appear at the top of the Links region on the project details page.</li>',
'</ul>'))
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Project Links''',
'   and build_option_status = ''Include'''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12397089337882832153)
,p_plug_name=>'Attachments'
,p_region_name=>'atch'
,p_parent_plug_id=>wwv_flow_imp.id(12587727734596473319)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>110
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Having the ability to attach files to a project is very useful. Team members can upload white papers, presentations, sql scripts, etc... Each file must be 25mb or less in size.</p>',
'<p>When adding an attachment, the following attributes are mandatory:</p>',
'<ul>',
'    <li><strong>Project</strong> - This attribute identifies the Project that this attachment is associated with.</li>',
'    <li><strong>File</strong> - This attribute defines the file being attached.</li>',
'</ul>',
'<p>These attachment attributes are optional:</p>',
'<ul>',
'    <li><strong>Description</strong> - This attribute contains pertinent information about the attachment being added.</li>',
'    <li><strong>Tags</strong> - This attribute contains a short comma-separated list of words that can aid in searching for particular attachments later.</li>',
'    <li><strong>Mark As Gold</strong> - This attribute defines whether the attachment is a "Gold" attachment or not. Attachment marked as "Gold" will always appear at the top of the Attachments region on the project details page.</li>',
'</ul>'))
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Project Attachments''',
'   and build_option_status = ''Include'''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12397089418620832154)
,p_plug_name=>'Status Reports'
,p_region_name=>'sr'
,p_parent_plug_id=>wwv_flow_imp.id(12587727734596473319)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>120
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Status reports are very similar to project updates. Both features display the status report (or update) information on the project''s details page but a status report can be emailed and an update cannot. ',
'The ability to email a status report can be leveraged to potentially bring attention to a situation/issue sooner than if you had relied on the recipient to check the project''s status reports (or updates) in the &APPLICATION_TITLE. application.</p>',
'<p>When creating a status report, all attributes are mandatory. These attributes include:</p>',
'<ul>',
'    <li><strong>Project</strong> - This attribute identifies the Project that this status report is associated with.</li>',
'    <li><strong>Title</strong> - This attribute defines the the name/title of the status report.</li>',
'    <li><strong>Status Report</strong> - This attribute defines the actual status report text. You can add up to 32,000 characters into this text area field.</li>',
'    <li><strong>Viewable By</strong> - This attribute defines who can see the status report. The options for this attribute are, "Submitter", "Submitter and Project Members", and "All".</li>',
'    <li><strong>Editable By</strong> - This attribute defines who can edit the status report. The options for this attribute are, "Submitter", "Submitter and Project Members", and "All Contributors".</li>',
'    <li><strong>Submission Date</strong> - This attribute defines the date the creator would like to annotate as being the status report''s official submission. This field is defaulted to today''s date but the end-user can select another date in the pa'
||'st or future if they so choose.</li>',
'</ul>'))
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Project Status Reports''',
'   and build_option_status = ''Include'''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(21048391508141075523)
,p_plug_name=>'Countries'
,p_region_name=>'countries'
,p_parent_plug_id=>wwv_flow_imp.id(12587727734596473319)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Projects can be assigned to one or many countries. You can define one country to a project in the create project wizard. Use the <strong>Add Country</strong> button on the project details page to add more countries to a project.</p>',
'<p>When assigning a country to a project, the following attributes are required:</p>',
'<ul>',
'    <li><strong>Country</strong> - The country being assigned to the project.</li>',
'</ul>',
'<p>The following milestone attributes are optional:</p>',
'<ul>',
'    <li><strong>Region</strong> - The region the country is a part of. The default regions are Asia Pacific, EMEA (Europe, Middle East, and Africa), Japan, North America, and South America. Countries can be re-assigned to different regions. Region na'
||'mes can be changed by application administrators.</li>',
'</ul>'))
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from apex_application_build_options',
' where application_id = :APP_ID',
'   and build_option_name = ''Project Countries''',
'   and build_option_status = ''Include'''))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12587728192002473324)
,p_plug_name=>'List of Contents'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'begin',
'    sys.htp.p(''<ul class="t-LinksList">'');',
'    sys.htp.p(''<li class="t-LinksList-item"><a href="javascript:scrollIntoView(''''#cp'''');" class="t-LinksList-link">',
'        <span class="t-LinksList-label">Projects</span></a>',
'    </li>',
'    <li class="t-LinksList-item"><a href="javascript:scrollIntoView(''''#ppl'''');" class="t-LinksList-link">',
'        <span class="t-LinksList-label">People</span></a>',
'    </li>'');',
'    for c1 in',
'    (',
'        select distinct build_option_name, build_option_status',
'          from apex_application_build_options',
'         where application_id = :APP_ID',
'         order by 1',
'    )',
'    loop',
'        if c1.build_option_name = ''Project Countries'' and c1.build_option_status = ''Include'' then',
'            sys.htp.p(''<li class="t-LinksList-item"><a href="javascript:scrollIntoView(''''#countries'''');" class="t-LinksList-link">',
'                <span class="t-LinksList-label">Countries</span></a>',
'            </li>'');',
'        elsif c1.build_option_name = ''Project Milestones'' and c1.build_option_status = ''Include'' then',
'            sys.htp.p(''<li class="t-LinksList-item"><a href="javascript:scrollIntoView(''''#ms'''');" class="t-LinksList-link">',
'                <span class="t-LinksList-label">Milestones</span></a>',
'            </li>'');',
'        elsif c1.build_option_name = ''Project Action Items'' and c1.build_option_status = ''Include'' then',
'            sys.htp.p(''<li class="t-LinksList-item"><a href="javascript:scrollIntoView(''''#ai'''');" class="t-LinksList-link">',
'                <span class="t-LinksList-label">Action Items</span></a>',
'            </li>'');',
'        elsif c1.build_option_name = ''Project Issues'' and c1.build_option_status = ''Include'' then',
'            sys.htp.p(''<li class="t-LinksList-item"><a href="javascript:scrollIntoView(''''#iss'''');" class="t-LinksList-link">',
'                <span class="t-LinksList-label">Issues</span></a>',
'            </li>'');',
'        elsif c1.build_option_name = ''Project Updates'' and c1.build_option_status = ''Include'' then',
'            sys.htp.p(''<li class="t-LinksList-item"><a href="javascript:scrollIntoView(''''#upd'''');" class="t-LinksList-link">',
'                <span class="t-LinksList-label">Updates</span></a>',
'            </li>'');',
'        elsif c1.build_option_name = ''Project Resources'' and c1.build_option_status = ''Include'' then',
'            sys.htp.p(''<li class="t-LinksList-item"><a href="javascript:scrollIntoView(''''#rcs'''');" class="t-LinksList-link">',
'                <span class="t-LinksList-label">Resources</span></a>',
'            </li>'');',
'        elsif c1.build_option_name = ''Project Links'' and c1.build_option_status = ''Include'' then',
'            sys.htp.p(''<li class="t-LinksList-item"><a href="javascript:scrollIntoView(''''#lnk'''');" class="t-LinksList-link">',
'                <span class="t-LinksList-label">Links</span></a>',
'            </li>'');',
'        elsif c1.build_option_name = ''Project Attachments'' and c1.build_option_status = ''Include'' then',
'            sys.htp.p(''<li class="t-LinksList-item"><a href="javascript:scrollIntoView(''''#atch'''');" class="t-LinksList-link">',
'                <span class="t-LinksList-label">Attachments</span></a>',
'            </li>'');',
'        elsif c1.build_option_name = ''Project Status Reports'' and c1.build_option_status = ''Include'' then',
'            sys.htp.p(''<li class="t-LinksList-item"><a href="javascript:scrollIntoView(''''#sr'''');" class="t-LinksList-link">',
'                <span class="t-LinksList-label">Status Reports</span></a>',
'            </li>'');',
'        end if;',
'    end loop;',
'    sys.htp.p(''<li class="t-LinksList-item"><a href="javascript:scrollIntoView(''''#tw'''');" class="t-LinksList-link">',
'        <span class="t-LinksList-label">Tools and Widgets</span></a>',
'    </li>'');',
'    sys.htp.p(''</ul>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12587731681406473332)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>25
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12062286006625425623)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12397088459775832144)
,p_button_name=>'TOP_CP'
,p_button_static_id=>'cp'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Back to Top'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'#'
,p_icon_css_classes=>'fa-chevron-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12062286109200425624)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12397088626819832146)
,p_button_name=>'TOP_MS'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Back to Top'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'#'
,p_icon_css_classes=>'fa-chevron-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12062286192490425625)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12397088749465832147)
,p_button_name=>'TOP_AI'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Back to Top'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'#'
,p_icon_css_classes=>'fa-chevron-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12062286219460425626)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12397088873696832148)
,p_button_name=>'TOP_ISS'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Back to Top'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'#'
,p_icon_css_classes=>'fa-chevron-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12062286386687425627)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12397088998429832149)
,p_button_name=>'TOP_UPD'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Back to Top'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'#'
,p_icon_css_classes=>'fa-chevron-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12062286419011425628)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12397089090321832150)
,p_button_name=>'TOP_PPL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Back to Top'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'#'
,p_icon_css_classes=>'fa-chevron-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12062286609771425629)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12397089202788832151)
,p_button_name=>'TOP_RCS'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Back to Top'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'#'
,p_icon_css_classes=>'fa-chevron-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12062286642741425630)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12397089222204832152)
,p_button_name=>'TOP_LNK'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Back to Top'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'#'
,p_icon_css_classes=>'fa-chevron-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12062286716085425631)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12397089337882832153)
,p_button_name=>'TOP_ATCH'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Back to Top'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'#'
,p_icon_css_classes=>'fa-chevron-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12062286874137425632)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12397089418620832154)
,p_button_name=>'TOP_SR'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Back to Top'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'#'
,p_icon_css_classes=>'fa-chevron-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12062287301321425636)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12062287191891425635)
,p_button_name=>'TOP_TW'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Back to Top'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'#'
,p_icon_css_classes=>'fa-chevron-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(21048391522258075524)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(21048391508141075523)
,p_button_name=>'TOP_COUNTRIES'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Back to Top'
,p_button_position=>'EDIT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'#'
,p_icon_css_classes=>'fa-chevron-up'
);
wwv_flow_imp.component_end;
end;
/
