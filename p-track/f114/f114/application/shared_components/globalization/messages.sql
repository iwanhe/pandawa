prompt --application/shared_components/globalization/messages
begin
--   Manifest
--     MESSAGES: 114
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7795308512045483805)
,p_name=>'ABOUT_THIS_APPLICATION'
,p_message_text=>'About this Application'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5909270282480908245)
,p_name=>'ABOUT_TO_CREATE'
,p_message_text=>'Please confirm adding the following %0 <strong>%1</strong> user(s) to your access control list.'
,p_version_scn=>39567366596392
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5961540886268165776)
,p_name=>'ABOUT_TO_CREATE_WITH_INVALIDS'
,p_message_text=>'Please confirm adding the following %0 <strong>%1</strong> user(s) to your access control list. Note that %2 string(s) were invalid usernames.'
,p_version_scn=>39567366596626
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7760467814000844009)
,p_name=>'ACCESS_CONTROL_INFO'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>When Access Control is enabled, Administrators have the ability to restrict access to certain application features, for authenticated users. This application supports the following 4 access levels; Reader, Contributor, Administrator, and Super Adm'
||'in.</p>',
'<ul>',
'  <li><strong>Readers</strong> have read-only access to all project information and can also view reports.</li>',
'  <li><strong>Contributors</strong> can create, edit and delete projects and view reports.</li>',
'  <li><strong>Administrators</strong>, in addition to Contributor''s capability, can also perform configuration of access control, and installing or uninstalling sample data.</li>',
'  <li><strong>Super Admins</strong>, in addition to Administrator''s capability, can view and edit all projects, regardless of their restriction status.</li>',
'</ul>'))
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6192578300935487133)
,p_name=>'ACCESS_CONTROL_IS_DISABLED'
,p_message_text=>'Access control for this application is currently disabled.  All users are currently Administrators. Navigate to <a href="%0">application administration</a> to enable access control.'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6061336713637152485)
,p_name=>'ACL_DISABLED'
,p_message_text=>'<p>All users are currently <strong>Administrators</strong>. Please enable Access Control to restrict user access to this application.</p>'
,p_version_scn=>39567366596648
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6061334987351134245)
,p_name=>'ACL_ENABLED'
,p_message_text=>'<p>Only users defined in the Access Control List have access to this application.</p>'
,p_version_scn=>39567366596647
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6061336012355137868)
,p_name=>'ACL_PUBLIC_CONTRIBUTE'
,p_message_text=>'<p>All authenticated users have <strong>Reader</strong> and <strong>Contributor</strong> access.</p><p>Administrators are restricted by the Access Control List.</p>'
,p_version_scn=>39567366596648
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6061336205454141043)
,p_name=>'ACL_PUBLIC_READONLY'
,p_message_text=>'<p>All authenticated users have <strong>Reader</strong> access.</p><p>Contributors and Administrators are restricted by the Access Control List.</p>'
,p_version_scn=>39567366596648
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6131774389446535514)
,p_name=>'ACTION ITEMS'
,p_message_text=>'Action Items'
,p_version_scn=>39567366596648
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7215984494942333347)
,p_name=>'AC_CONFIGURATION_INFO'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p><strong>Enabling Access Control</strong> allows the application and its features to be controlled by the <strong>Access Control List</strong>, as defined by the application administrator. This application has 4 access levels available that can be '
||'granted to a user; Super Admin, Administrator, Contributor and Reader. Please see the Manage Access Control List page for further details on what each level provides.</p>',
'',
'<p>In addition, if you want to make every authenticated user a ''Reader'' of your application, you can select Reader access for any authenticated user from the Access Control Scope configuration option. Similarly, selecting Contributor access for any a'
||'uthenticated user will provide contributor access to any user who can authenticate into your application.</p>',
'',
'<br>',
'<p><b>Disabling Access Control</b> means that access to the application and all of its features including Administration are open to any user who can authenticate to the application.</p>',
'<br>',
'<p>Note: Irrespective of whether Access Control is enabled or disabled, a user still has to authenticate successfully into the application.</p>'))
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7795309401441490232)
,p_name=>'ADDITIONAL_INFORMATION'
,p_message_text=>'Additional Information'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7742977195884273924)
,p_name=>'ADMINISTRATION'
,p_message_text=>'Administration'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5909270706621912199)
,p_name=>'ALREADY_IN_ACL'
,p_message_text=>'User is already in Access Control List'
,p_version_scn=>39567366596427
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6061328387067952021)
,p_name=>'ANY_AUTHENTICATED_USER'
,p_message_text=>'Any Authenticated User'
,p_version_scn=>39567366596647
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7689215914503539898)
,p_name=>'ATTACHMENTS'
,p_message_text=>'Attachments'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6061812893014470482)
,p_name=>'AUTHENTICATION_REQUIRED_PAGES'
,p_message_text=>'Login Required Pages'
,p_version_scn=>39567366596648
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5909348796760904402)
,p_name=>'BAU_EMAIL_INSTRUCTIONS'
,p_message_text=>'Enter or copy and paste email addresses separated by commas, semicolons, or new lines. Note that if you copy and paste email addresses from email messages, extraneous text will be filtered out. All email users provided will be added as the selected r'
||'ole. Existing or duplicate email addresses will be ignored.'
,p_version_scn=>39567366596605
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5909348989859907581)
,p_name=>'BAU_STRING_INSTRUCTIONS'
,p_message_text=>'Enter or copy and paste usernames separated by commas, semicolons, or whitespace. All usernames provided will be added as the selected role. Existing or duplicate usernames will be ignored.'
,p_version_scn=>39567366596614
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7025111297261457552)
,p_name=>'BORDER RADIUS'
,p_message_text=>'Border Radius (xl8!)'
,p_is_js_message=>true
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5909270902955913929)
,p_name=>'DUPLICATE_USER'
,p_message_text=>'Duplicate user in list'
,p_version_scn=>39567366596454
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6042224693744138405)
,p_name=>'EMAIL_USERNAME_FORMAT_MSG'
,p_message_text=>'This application is currently using an <strong>email address</strong> username format (e.g. xyz@xyz.com) [<a href="f?p=%0:%1:%2:">Change Username Format</a>].'
,p_version_scn=>39567366596647
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7795309096246488730)
,p_name=>'FEATURES'
,p_message_text=>'Features'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7693380152803406244)
,p_name=>'FOLLOWERS'
,p_message_text=>'Followers'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7795308682394484718)
,p_name=>'GETTING_STARTED'
,p_message_text=>'Getting Started'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6131774000445530417)
,p_name=>'GOALS'
,p_message_text=>'Goals'
,p_version_scn=>39567366596648
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7015464892903783341)
,p_name=>'HELP'
,p_message_text=>'Help'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5965770791578628716)
,p_name=>'HELP_ABOUT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="aboutApp">',
'<h2>About this Application</h2>',
'<p>',
'    Track projects, milestones, action items, attach documents, add tags, and comment. This application enhances your project management effectiveness by promoting collaboration, transparency, and information sharing.',
'</p>',
'<p>',
'     A project in this application has a number of attributes, including one or more owners, a status indication, and a set of milestones and action items. You can submit status updates for a project and create status reports based on a selection of '
||'updates. Projects are assigned to a %0, and a project can be the parent of one or more child projects. You can also add tags to a project to allow for more informal groups of projects.',
'</p>',
'<p>',
'     All projects allow you to add annotations, such as links to other resources or files, to the project for consolidated access to all information relating to a project.',
'</p>',
'<p>',
'     Each project has a set of milestones, which can be viewed in a report, a calendar view, or in a Gantt chart format.',
'</p>',
'<p>',
'     Each project has a set of action items, which can be viewed in a report or a calendar view. This application includes a set of high level analysis reports on action items, for a quick review of assigned tasks.',
'</p>',
'<p>',
'     This application also includes built-in integration with email. You can request status updates through an email message, and team members who receive this type of message can directly update status, milestones or action items, as well as add ann'
||'otations to a project.',
'</p>',
'</div>'))
,p_version_scn=>39567366596647
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5965770014870617890)
,p_name=>'HELP_FEATURES'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="textRegion">',
'<h2>Features</h2>',
'<ul>',
'	<li>Track and Manage Projects</li>',
'	<li>Track and Manage Project Milestones</li>',
'	<li>Manage flexible and updateable projects status, items </li>',
'	<li>Flexible and changeable status codes</li>',
'	<li>Robust Reporting</li>',
'	<li>Link, Note, and File Attachments</li>',
'	<li>Mobile Interface</li>',
'	<li>Flexible Access Control (reader, contributor, administrator model)</li>',
'</ul>',
'</div>'))
,p_version_scn=>39567366596647
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5965768884272601687)
,p_name=>'HELP_SIDEBAR'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h1 class="appNameHeader">',
'    <img src="%0f_spacer.gif" class="appIcon %1" alt="" />',
'    %2',
'</h1>',
'<ul class="vapList">',
'    <li>',
'        <span class="vLabel">App Version</span>',
'        <span class="vValue">%3</span>',
'    </li>',
'    <li>',
'        <span class="vLabel">Pages</span>',
'        <span class="vValue">%4</span>',
'    </li>',
'    <li>',
'        <span class="vLabel">Vendor</span>',
'        <span class="vValue">%5 </span>',
'    </li>',
'</ul>'))
,p_version_scn=>39567366596638
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5965770411635619430)
,p_name=>'HELP_SUPPORT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="textRegion">',
'<h2>Additional Information</h2>',
'<p>If you have questions, ask them on the <a href="%0" target="_blank">%1</a>.',
'</p>',
'</div>'))
,p_version_scn=>39567366596647
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6131989086746590817)
,p_name=>'HISTORY'
,p_message_text=>'History'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5909270510935910210)
,p_name=>'INVALID_USERS_NOT_CREATED'
,p_message_text=>'Note that %0 string(s) were invalid usernames.'
,p_version_scn=>39567366596401
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7689367462981746851)
,p_name=>'LINKS'
,p_message_text=>'Links'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7742977397616274487)
,p_name=>'LOGOUT'
,p_message_text=>'Logout'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6132021507649659881)
,p_name=>'METRICS'
,p_message_text=>'Metrics'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6131774198504531312)
,p_name=>'MILESTONES'
,p_message_text=>'Milestones'
,p_version_scn=>39567366596648
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5909271296054917147)
,p_name=>'MISSING_AT_SIGN'
,p_message_text=>'Missing @ sign'
,p_version_scn=>39567366596520
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5909271493250918401)
,p_name=>'MISSING_DOT'
,p_message_text=>'Missing dot'
,p_version_scn=>39567366596564
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7742976993114273220)
,p_name=>'MOBILE'
,p_message_text=>'Mobile'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5769526801941496375)
,p_name=>'N_DAY'
,p_message_text=>'%0 day'
,p_version_scn=>39567366596376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5769526603451495712)
,p_name=>'N_DAYS'
,p_message_text=>'%0 days'
,p_version_scn=>39567366596376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5769526204960494991)
,p_name=>'N_HOUR'
,p_message_text=>'%0 hour'
,p_version_scn=>39567366596376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5769526006254494348)
,p_name=>'N_HOURS'
,p_message_text=>'%0 hours'
,p_version_scn=>39567366596376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5769525808195493480)
,p_name=>'N_MINUTES'
,p_message_text=>'%0 minutes'
,p_version_scn=>39567366596376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5769527199137497691)
,p_name=>'N_WEEK'
,p_message_text=>'%0 week'
,p_version_scn=>39567366596381
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5769527000431497095)
,p_name=>'N_WEEKS'
,p_message_text=>'%0 weeks'
,p_version_scn=>39567366596376
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(7689206522532511343)
,p_name=>'OWNERS'
,p_message_text=>'Owners'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6061812696249468973)
,p_name=>'PAGES_WITH_CUSTOM_AUTH'
,p_message_text=>'Authorization Protected'
,p_version_scn=>39567366596648
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6131774905393543297)
,p_name=>'PARENTPROJECT'
,p_message_text=>'Parent Project'
,p_version_scn=>39567366596648
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6131914100293776447)
,p_name=>'PROJECTOWNERS'
,p_message_text=>'Owners'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11984443783511852279)
,p_name=>'PROJECT_ACL_CLOSED'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>This project is currently in a restricted status. All users with access to the application can see the project''s data, but only users listed here with Edit or Administration access can update it.</p>',
'<p>Note that, in order for a listed user to be able to edit the project, their account in the application must have Contributor or Administrator access.</p>'))
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11984476987014857856)
,p_name=>'PROJECT_ACL_LOCKED'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>This project is currently in a highly restricted status. Only users listed here can see the project''s data, and only ones Edit or Administration access can update it.</p>',
'<p>Note that, in order for a listed user to be able to edit the project, their account in the application must have Contributor or Administrator access.</p>'))
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(11984417777562838237)
,p_name=>'PROJECT_ACL_OPEN'
,p_message_text=>'<p>This project is currently in an open, unrestricted state. All users with access to this application can see it, and all users with edit or administration access can update the project.</p>'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6061813089995471919)
,p_name=>'PUBLIC_PAGES'
,p_message_text=>'Public Pages'
,p_version_scn=>39567366596648
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6131924107213016257)
,p_name=>'STATUS'
,p_message_text=>'Status'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6131774586643536793)
,p_name=>'STATUS REPORTS'
,p_message_text=>'Status Reports'
,p_version_scn=>39567366596648
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6131919087495873505)
,p_name=>'STATUS_AND_VALIDATIONS'
,p_message_text=>'Status and Validations'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6042224889215140484)
,p_name=>'STRING_USERNAME_FORMAT_MSG'
,p_message_text=>'This application is currently using a <strong>non-email address</strong> username format (e.g. JOHNDOE) [<a href="f?p=%0:%1:%2:">Change Username Format</a>].'
,p_version_scn=>39567366596647
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6131775389218550804)
,p_name=>'TOC'
,p_message_text=>'Table of Contents'
,p_version_scn=>39567366596649
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6131775102373544740)
,p_name=>'UPDATES'
,p_message_text=>'Updates'
,p_version_scn=>39567366596648
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(5909271099289915572)
,p_name=>'USERNAME_TOO_LONG'
,p_message_text=>'Username too long'
,p_version_scn=>39567366596476
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(6131777191262686591)
,p_name=>'VALIDATIONS'
,p_message_text=>'Validations'
,p_version_scn=>39567366596649
);
wwv_flow_imp.component_end;
end;
/
