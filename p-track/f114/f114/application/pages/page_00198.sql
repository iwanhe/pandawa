prompt --application/pages/page_00198
begin
--   Manifest
--     PAGE: 00198
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
 p_id=>198
,p_name=>'Access Control'
,p_step_title=>'Access Control'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847490199618134449)
,p_javascript_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'function scrollIntoView(id) { ',
'  $(id)[0].scrollIntoView();',
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
,p_help_text=>'This page documents this application''s access control mechanisms.'
,p_page_component_map=>'11'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16842268857369943615)
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
 p_id=>wwv_flow_imp.id(16842269257958943622)
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
 p_id=>wwv_flow_imp.id(16842270483170943626)
,p_plug_name=>'Project Level Access'
,p_region_name=>'proj_acl'
,p_parent_plug_id=>wwv_flow_imp.id(16842269257958943622)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>60
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>The &APPLICATION_TITLE. application has two types of project level access. They are:</p>',
'<ol>',
'    <li><strong>Open</strong> - This project access level allows all application users access to the project. Users with an application access level/role of "Reader" will not be able to modify project content. Users with an application access level/r'
||'ole of "Contributor", "Administrator", or "Super Admin" will be able to modify project content.</li>',
'    <li><strong>Restricted</strong> - This project access level restricts access to the project to just the people that are added as project members.</li>',
'</ol>',
'<p>There are only three project member access levels and they only pertain to restricted projects. These are the project member access levels that can be assigned to project members of a restricted project:</p>',
'<ul>',
'    <li><strong>Read / Write (with Admin)</strong> - This access level must be maintained by at least one project member in a restricted project as only project members with this access level can add, remove, and update other project members and thei'
||'r details.</li>',
'    <li><strong>Read / Write</strong> - This access level should be given to project members that are expected to update project content in a restricted project.</li>',
'    <li><strong>Read</strong> - This access level should be given to project members that are allowed to view but are not allowed to edit project content in a restricted project.</li>',
'</ul>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16842272026793943630)
,p_plug_name=>'Application Level Access'
,p_region_name=>'app_acl'
,p_parent_plug_id=>wwv_flow_imp.id(16842269257958943622)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>40
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>The &APPLICATION_TITLE. application has the following six user roles:</p>',
'<ul>',
'    <li><strong>Super Admin</strong> - This role can manage the application, view, and edit any/all project content (regardless of whether the project is open or restricted).</li>',
'    <li><strong>Administrator</strong> - This role can manage the application, view, and edit project content for any/all open projects. This role can also view and edit restricted projects where they are a member of the project and they have been gr'
||'anted read/write access.</li>',
'    <li><strong>Contributor</strong> - This role can view and edit project content for any/all open projects. This role can also view and edit restricted projects where they are a member of the project and they have been granted read/write access.</l'
||'i>',
'    <li><strong>Reader</strong> - This role can view project content for any/all open projects. This role can also view and edit restricted projects where they are a member of the project and they have been granted read/write access.</li>',
'    <li><strong>Pending Approval</strong> - This role has no application access until one of the four roles (listed above) has been assigned.</li>',
'    <li><strong>No Access</strong> - This role has no application access (as its name implies).</li>',
'</ul>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16890198297917955520)
,p_plug_name=>'Access Level Contention'
,p_region_name=>'acl_con'
,p_parent_plug_id=>wwv_flow_imp.id(16842269257958943622)
,p_region_template_options=>'#DEFAULT#:t-Region--noBorder:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>70
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>A user''s application level access/role will always trump whatever project level access has been assigned in a restricted project.</p>',
'<p>If a project administrator in a restricted project adds a new member that has an application access level/role of "Reader" and tries to give that new member a project access level of "Read /Write" or "Read / Write (with Admin)", the new project me'
||'mber will only be able to view project content. The "People" region of the project details page will also display this new user''s access level as "Read" and this text will be a link. When the link is clicked, a modal page will appear telling the end-'
||'user that this project member''s application access level/role should be upgraded to "Contributor" to match the assigned project level access that has been assigned.</p>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(16842274087817943635)
,p_plug_name=>'List of Contents'
,p_region_template_options=>'#DEFAULT#:t-Region--removeHeader:t-Region--noUI:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<ul class="t-LinksList">',
'    <li class="t-LinksList-item"><a href="javascript:scrollIntoView(''#app_acl'');" class="t-LinksList-link"><span class="t-LinksList-label">Application Level Access</span></a></li>',
'    <li class="t-LinksList-item"><a href="javascript:scrollIntoView(''#proj_acl'');" class="t-LinksList-link"><span class="t-LinksList-label">Project Level Access</span></a></li>',
'    <li class="t-LinksList-item"><a href="javascript:scrollIntoView(''#acl_con'');" class="t-LinksList-link"><span class="t-LinksList-label">Access Level Contention</span></a></li>',
'</ul>'))
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(16890198348473955521)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(16890198297917955520)
,p_button_name=>'TOP_ACL_CON'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Top'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'#'
,p_icon_css_classes=>'fa-chevron-up'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(16842270859086943628)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(16842270483170943626)
,p_button_name=>'TOP_PROJ_ACL'
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
 p_id=>wwv_flow_imp.id(16842272452685943631)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(16842272026793943630)
,p_button_name=>'TOP_APP_ACL'
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
