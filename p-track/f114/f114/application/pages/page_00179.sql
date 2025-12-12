prompt --application/pages/page_00179
begin
--   Manifest
--     PAGE: 00179
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
 p_id=>179
,p_name=>'Application Administration'
,p_step_title=>'Application Administration'
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
,p_help_text=>'<p>All functionality discussed on this page is available to application administrators only.</p>'
,p_page_component_map=>'10'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12589473642022687406)
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
 p_id=>wwv_flow_imp.id(12589474016252687406)
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
 p_id=>wwv_flow_imp.id(12397090332859832163)
,p_plug_name=>'Code Tables'
,p_region_name=>'ct'
,p_parent_plug_id=>wwv_flow_imp.id(12589474016252687406)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>The <strong>Code Tables</strong> section of the Administration page contains tools administrators use to provide the values that end-users can choose from in various forms throughout the application. The functionality available in this section inc'
||'ludes:</p>',
'<ul>',
'    <li><strong>Status Codes</strong> - These are the codes used to describe the status of any given project. Only "Active" codes are displayed as selectable options to end-users.</li>',
'    <li><strong>&CAT_TITLE_PL.</strong> - These are the values used to categorize a project. Only "Active" &CAT_TITLE_PL_LC. are displayed as selectable options to end-users.</li>',
'    <li><strong>Status Update Types</strong> - These values are used to categorize what type of status update is being made. Only "Active" types are displayed as selectable options to end-users.</li>',
'    <li><strong>Action Item Types</strong> - These values are used to categorize what type of action item is being created. Only "Active" types are displayed as selectable options to end-users.</li>',
'    <li><strong>Project Roles</strong> - These values are used to describe a person''s role in a project. Project roles also have a default access level assignment which designates what privileges users assigned this role have by default.</li>',
'    <li><strong>Project Sizes</strong> - These values describe the size and scope of the project. The default values are small, medium, large, and extra large.</li>',
'    <li><strong>Involvement Levels</strong> - These values are used to describe the amount of time a person is dedicated to a given project. The default values are full (100%), half (50%), quarter (25%), and partial (10%).</li>',
'    <li><strong>Resource Types</strong> - These values are used to describe various resources that can be assigned to a project. The default values all refer to computer hardware but administrators can add any resource type they feel meets the needs '
||'of their user base.</li>',
'</ul>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12611534165112994304)
,p_plug_name=>'Configuration Settings'
,p_region_name=>'cs'
,p_parent_plug_id=>wwv_flow_imp.id(12589474016252687406)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_fc_val  varchar2(10) := ''Exclude''; -- Flex Columns',
'    l_pt_val  varchar2(10) := ''Exclude''; -- Project Templates',
'begin',
'    -- Get Flex Columns Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Flex Columns''',
'    )',
'    loop',
'        l_fc_val := c1.build_option_status;',
'    end loop;',
'',
'    -- Get Project Templates Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Project Templates''',
'    )',
'    loop',
'        l_pt_val := c1.build_option_status;',
'    end loop;',
'',
'    sys.htp.p(''<p>The <strong>Configuration</strong> section of the Administration page contains many tools for application administrators to control several aspects of the application. The functionality available in this section includes:</p>',
'    <ul>',
'        <li><strong>Notifications</strong> - Administrators can impart important information to their entire user base by creating notifications. When a notification is created, it appears on the home page of the application for all end-users to see.'
||' This tool is great for communicating anticipated down times and outages.</li>',
'        <li><strong>Workdays</strong> - Administrators can define which days are valid workdays for the purposes of calculating template milestones/action items durations and due dates.</li>'');',
'        if l_pt_val = ''Include'' then',
'            sys.htp.p(''<li><strong>Project Templates</strong> - Administrators can define and maintain project templates to simplify the creation of projects having an inordinately large number of milestones and action items. Project templates store '
||'pre-created Milestones and Action Items so an end-user can create a new project based off of a project template and their new project will automatically contain all of the pre-defined Milestones and Action Items. Be sure to set your <strong>Workdays<'
||'/strong> correctly before creating template Milestones and Action Items.</li>'');',
'        end if;',
'        if l_fc_val = ''Include'' then',
'            sys.htp.p(''<li><strong>Flex Columns</strong> - These are columns in the main application tables that can be used to store information that the '' || :APPLICATION_TITLE || '' application doesn''''t normally retain. These re-definable columns a'
||'re only available for projects, milestones and action items. Let''''s say management would like to know how many projects are "cloud-related". An administrator could assign a required "Cloud-Related?" text column that will display as a yes/no select-li'
||'st whenever anyone creates or edits a project. End-users would be forced to provide a value for this flex column assignment and this information can now be tracked and reported on.</li>'');',
'        end if;',
'        sys.htp.p(''<li><strong>Theme Style</strong> - This tool allows the application administrator to change the application''''s theme (look and feel of the application).</li>',
'        <li><strong>Application Settings</strong> - Administrators can assign several different application preferences from this page. These preferences include:</li>',
'        <ul>',
'            <li><strong>Application Name</strong> - Rename the application from '' || :APPLICATION_TITLE || '' to a name of your choosing.</li>',
'            <li><strong>Application Subtitle</strong> - Change the subtitle text that''''s displayed on the home page.</li>',
'            <li><strong>Minimum Project Creation Role</strong> - Select the minimum application role required for an end-user to create a project in this application.</li>',
'            <li><strong>Default Project Access Control Level</strong> - Select the access control level that the majority of projects will use. The value selected here will be used for all new projects'''' access control level value.</li>',
'            <li><strong>Default Project Restrict Changes Value</strong> - Select the "Restrict Changes" value that the majority of projects will use in this application. The value selected here will be used for all new projects'''' "Restrict Changes" v'
||'alue.</li>',
'            <li><strong>Project Breadcrumb Display Options</strong> - This preference determines if a project''''s system-generated unique identifier should be displayed or not. If the "Project Code Names" build option has been enabled and there are ex'
||'isting projects with assigned code names then the "Show Project Code Name" option will also be available for selection here.</li>',
'            <li><strong>Most Important Project Role</strong> - Only the email addresses of project members assigned to the role that''''s selected here will be displayed in the "cards" view of the application home page.</li>',
'            <li><strong>Application Footer</strong> - The text entered here is displayed at the bottom of every page in the application and in all emails sent by this application.</li>',
'            <li><strong>Feedback Recipients</strong> - Provide a comma-separated list of the email addresses you would like feedback submissions emailed to. When feedback is submitted, the feedback will be emailed to the addresses in this list.</li>',
'        </ul>',
'        <li><strong>Build Options</strong> - This is a very powerful tool that enables or disables several areas of application functionality. For example, if the "Project Milestones" build option value were to be changed from "Included" to "Excluded'
||'", all aspects of milestones functionality would no longer be available to any end-user.</li>',
'        <li><strong>Sample Data</strong> - This tool allows administrators to remove or re-apply the sample data that the application ships with.</li>',
'    </ul>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12611567121155010914)
,p_plug_name=>'Management'
,p_region_name=>'mgt'
,p_parent_plug_id=>wwv_flow_imp.id(12589474016252687406)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>50
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_fb_val  varchar2(10) := ''Exclude''; -- Feedback',
'begin',
'    -- Get Feedback Build Option Value',
'    for c1 in',
'    (',
'        select build_option_status from apex_application_build_options where application_id = :APP_ID and build_option_name = ''Feedback''',
'    )',
'    loop',
'        l_fb_val := c1.build_option_status;',
'    end loop;',
'',
'    sys.htp.p(''<p>The <strong>Management</strong> section of the Administration page contains a tool for analyzing all files that have been attached to projects as well as a tool for controlling the access control value for every project in the appli'
||'cation. More information on these tools is listed below.</p>',
'    <ul>',
'        <li><strong>Attachments Dashboard</strong> - View aggregate size of all attachments with ability to purge older attachments.</li>',
'        <li><strong>Project Access Control Status</strong> - This is a report of all projects'''' access control and deleted statuses. Administrators can undelete a deleted project and/or make a restricted project open (and vice-versa).</li>'');',
'        if l_fb_val = ''Include'' then',
'            sys.htp.p(''<li><strong>Manage Feedback</strong> - This is a report of all Feedback submissions. You can also edit each feedback submission''''s status and add response text.</li>'');',
'        end if;',
'        sys.htp.p(''<li><strong>Reassign Action Items</strong> - Use this page to reassign Action Items from one user to another.</li>',
'    </ul>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12611567295250010915)
,p_plug_name=>'Access Control'
,p_region_name=>'acl'
,p_parent_plug_id=>wwv_flow_imp.id(12589474016252687406)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>The <strong>Access Control</strong> section of the Administration page is used to control who can use the application. If access control is disabled then anyone who can log into the application has the privileges of an application administrator. I'
||'f access control is enabled then users will have to sign in to use the application. There are three options to choose from when access control has been enabled:</p>',
'<ol>',
'    <li><strong>Reader access for any authenticated user</strong> - Anyone that can sign in can see application content but cannot edit application content.</li>',
'    <li><strong>Contributor access for any authenticated user</strong> - Anyone that can sign in can view and edit application content.</li>',
'    <li><strong>Restricted to users defined in access control list</strong> - Users that can sign in can interact with the application based on their role and the privileges that come with their role. These application roles are, <strong>Administrato'
||'r</strong> (can read, edit, and administer the application), <strong>Contributor</strong> (can read and edit application content), and <strong>Reader</strong> (can only read application content).</li>',
'</ol>',
'<p>Administrators use the application''s access control list to create new users or to remove (and/or edit) existing users.</p>',
'<p>Administrators can also choose the application''s username format in the <strong>Access Control</strong> section. If the application is using Single Sign On (SSO) authentication, the username format should retain the default "Email Address" value. '
||'If the application has been configured to use the "Application Express" authentication scheme, the username format could be changed to the "Non-Email Address" value.</p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12611567337899010916)
,p_plug_name=>'Emails'
,p_region_name=>'eml'
,p_parent_plug_id=>wwv_flow_imp.id(12589474016252687406)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>90
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>'<p>The <strong>Email</strong> section of the Administration page contains tools for administrators to send past due deliverables, upcoming deliverables, project details, and/or project status emails. The administrator can send any of these emails via'
||' an on-demand process or by enabling a scheduled database job. If the administrator enables the scheduled database job for any of these emails, the job will send an email to every user that has opted-in to receiving the email. The email jobs run ever'
||'y day but emails are only actually sent from the application based on the schedule defined by the end-user''s email schedule preferences.</p>'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12611569673330010939)
,p_plug_name=>'Reports'
,p_region_name=>'rpt'
,p_parent_plug_id=>wwv_flow_imp.id(12589474016252687406)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>'<p>The <strong>Application and Page Authentication and Authorization</strong> and <strong>Activity Reports</strong> sections of the Administration page contain several reports for administrators to gauge the use of the application. More on these admi'
||'nistrative reports can be found in <a href="f?p=&APP_ID.:178:&APP_SESSION.:#addr">Help > Documentation > Reporting > Administrative Reports</a>.</p><!-- '' -->'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12589474455056687407)
,p_plug_name=>'List of Contents'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-LinksList">',
'    <li class="t-LinksList-item"><a href="javascript:scrollIntoView(''#cs'');" class="t-LinksList-link"><span class="t-LinksList-label">Configuration Settings</span></a></li>',
'    <li class="t-LinksList-item"><a href="javascript:scrollIntoView(''#ct'');" class="t-LinksList-link"><span class="t-LinksList-label">Code Tables</span></a></li>',
'    <li class="t-LinksList-item"><a href="javascript:scrollIntoView(''#mgt'');" class="t-LinksList-link"><span class="t-LinksList-label">Management</span></a></li>',
'    <li class="t-LinksList-item"><a href="javascript:scrollIntoView(''#acl'');" class="t-LinksList-link"><span class="t-LinksList-label">Access Control</span></a></li>',
'    <li class="t-LinksList-item"><a href="javascript:scrollIntoView(''#rpt'');" class="t-LinksList-link"><span class="t-LinksList-label">Reports</span></a></li>',
'    <li class="t-LinksList-item"><a href="javascript:scrollIntoView(''#eml'');" class="t-LinksList-link"><span class="t-LinksList-label">Emails</span></a></li>',
'</ul>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12611568955951010932)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12611534165112994304)
,p_button_name=>'TOP_CS'
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
 p_id=>wwv_flow_imp.id(12611569105993010933)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12397090332859832163)
,p_button_name=>'TOP_CT'
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
 p_id=>wwv_flow_imp.id(12611569178396010934)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12611567121155010914)
,p_button_name=>'TOP_MGT'
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
 p_id=>wwv_flow_imp.id(12611569248015010935)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12611567295250010915)
,p_button_name=>'TOP_ACL'
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
 p_id=>wwv_flow_imp.id(12611569377848010936)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12611567337899010916)
,p_button_name=>'TOP_EML'
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
 p_id=>wwv_flow_imp.id(12611569757617010940)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(12611569673330010939)
,p_button_name=>'TOP_RPT'
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
