prompt --application/shared_components/globalization/messages
begin
--   Manifest
--     MESSAGES: 101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3267652973933068200)
,p_name=>'ABOUT_THIS_APPLICATION'
,p_message_text=>'About this Application'
,p_version_scn=>39567690154885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1389294361694459398)
,p_name=>'ABOUT_TO_CREATE'
,p_message_text=>'Please confirm adding the following %0 <strong>%1</strong> user(s) to your access control list.'
,p_version_scn=>39567690154885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1433873649053628920)
,p_name=>'ABOUT_TO_CREATE_WITH_INVALIDS'
,p_message_text=>'Please confirm adding the following %0 <strong>%1</strong> user(s) to your access control list. Note that %2 string(s) were invalid usernames.'
,p_version_scn=>39567690154885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3204241255594140015)
,p_name=>'ACCESS_CONTROL_INFO'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>When Access Control is enabled, Administrators have the ability to restrict access to certain application features, for authenticated users. ',
'Incident Tracking supports the following 3 access levels; Reader, Contributor and Administrator.',
'  <b>Readers</b> have read-only access and can also view reports.',
'  <b>Contributors</b> can create, edit, delete and view reports.',
'  <b>Administrators</b>, in addition to Contributor''s capability, can also perform Incident Tracking administration, including configuration of access control, managing application look-up data and installing or uninstalling sample data.</p> '))
,p_version_scn=>39567690154885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1533718943403983138)
,p_name=>'ACL_DISABLED'
,p_message_text=>'<p>All users are currently <strong>Administrators</strong>. Please enable Access Control to restrict user access to this application.</p>'
,p_version_scn=>39567690154885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1533718746854981540)
,p_name=>'ACL_ENABLED'
,p_message_text=>'<p>Only users defined in the Access Control List have access to this application.</p>'
,p_version_scn=>39567690154885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1533718551814979231)
,p_name=>'ACL_PUBLIC_CONTRIBUTE'
,p_message_text=>'<p>All authenticated users have <strong>Reader</strong> and <strong>Contributor</strong> access.</p><p>Administrators are restricted by the Access Control List.</p>'
,p_version_scn=>39567690154885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1533718355049977684)
,p_name=>'ACL_PUBLIC_READONLY'
,p_message_text=>'<p>All authenticated users have <strong>Reader</strong> access.</p><p>Contributors and Administrators are restricted by the Access Control List.</p>'
,p_version_scn=>39567690154885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3204241460442141412)
,p_name=>'AC_CONFIGURATION_INFO'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p><strong>Enabling Access Control</strong> allows the application and its features to be controlled by the <strong>Access Control List</strong>, as defined by the application administrator. This application has 3 access levels available that can be '
||'granted to a user; Administrator, Contributor and Reader. Please see the Manage Access Control List page for further details on what each level provides.</p>',
'',
'<p>In addition, if you want to make every authenticated user a ''Reader'' of your application, you can select Reader access for any authenticated user from the Access Control Scope configuration option. Similarly, selecting Contributor access for any a'
||'uthenticated user will provide contributor access to any user who can authenticate into your application.</p>',
'',
'<br>',
'<p><b>Disabling Access Control</b> means that access to the application and all of its features including Administration are open to any user who can authenticate to the application.</p>',
'<br>',
'<p>Note: Irrespective of whether Access Control is enabled or disabled, a user still has to authenticate successfully into the application.</p>'))
,p_version_scn=>39567690154885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3267652264583065462)
,p_name=>'ADDITIONAL_INFORMATION'
,p_message_text=>'Additional Information'
,p_version_scn=>39567690154885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2736765754925335676)
,p_name=>'ADMINISTRATION'
,p_message_text=>'Administration'
,p_version_scn=>39567690154885
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1389293967732456663)
,p_name=>'ALREADY_IN_ACL'
,p_message_text=>'User is already in Access Control List'
,p_version_scn=>39567690154896
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1533718158715976055)
,p_name=>'ANY_AUTHENTICATED_USER'
,p_message_text=>'Any Authenticated User'
,p_version_scn=>39567690154914
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1534169768335219232)
,p_name=>'AUTHENTICATION_REQUIRED_PAGES'
,p_message_text=>'Login Required Pages'
,p_version_scn=>39567690154935
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1389292348335450374)
,p_name=>'BAU_EMAIL_INSTRUCTIONS'
,p_message_text=>'Enter or copy and paste email addresses separated by commas, semicolons, or new lines. Note that if you copy and paste email addresses from email messages, extraneous text will be filtered out. All email users provided will be added as the selected r'
||'ole. Existing or duplicate email addresses will be ignored.'
,p_version_scn=>39567690154956
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1389292151355449015)
,p_name=>'BAU_STRING_INSTRUCTIONS'
,p_message_text=>'Enter or copy and paste usernames separated by commas, semicolons, or whitespace. All usernames provided will be added as the selected role. Existing or duplicate usernames will be ignored.'
,p_version_scn=>39567690154965
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1389293770320455462)
,p_name=>'DUPLICATE_USER'
,p_message_text=>'Duplicate user in list'
,p_version_scn=>39567690154983
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1514556059344584880)
,p_name=>'EMAIL_USERNAME_FORMAT_MSG'
,p_message_text=>'This application is currently using an <strong>email address</strong> username format (e.g. xyz@xyz.com). <a href="f?p=%0:%1:%2:">Change Username Format</a>'
,p_version_scn=>39567690155004
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3267652467353066327)
,p_name=>'FEATURES'
,p_message_text=>'Features'
,p_version_scn=>39567690155022
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3267652770816067319)
,p_name=>'GETTING_STARTED'
,p_message_text=>'Getting Started'
,p_version_scn=>39567690155022
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2736757752154334847)
,p_name=>'HELP'
,p_message_text=>'Help'
,p_version_scn=>39567690155023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1457212054925918220)
,p_name=>'HELP_ABOUT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="aboutApp">',
'<h2>About this Application</h2>',
'<p>The Incident Tracking application gives you a complete system for entering and tracking support incidents.  The application allows you to enter customer companies and multiple contacts for each company, specify products and categories and set up v'
||'alues to limit status codes, severity and urgency attributes for an incident.</p>',
'<p>Incident Tracking includes a wizard to enter essential information about an incident and a variety of ways to sort and report on incidents, including a time line based on when incidents were entered into the system.</p>',
'<p>Once a ticket is entered into the system, you can track the progress of the ticket in an update area of the ticket, or add attachments and links to the incident.  You can also use tags to further classify incidents and use the resulting tag cloud '
||'in your reports.</p>',
'<p>The Incident Tracking system includes robust interactive reports, which provide valuable analysis of incidents through an easy-to-use interface, including the ability to create charts.</p>',
'</div>'))
,p_version_scn=>39567690155023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1457212444142923124)
,p_name=>'HELP_FEATURES'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="textRegion">',
'<h2>Features</h2><ul>',
'<li>Track and Analyze Incident Tickets</li>',
'<li>Flexible and updateable incident status</li>',
'<li>Robust Reporting</li>',
'<li>Link, Note, and File Attachments</li>',
'<li>Mobile Interface</li>',
'<li>Flexible Access Control (reader, contributor, administrator model)</li>',
'</div>'))
,p_version_scn=>39567690155023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1457212250181920381)
,p_name=>'HELP_GETTING_STARTED'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="textRegion">',
'<h2>Getting Started</h2>',
'<p>1. Create Incident Ticket</p>',
'<ul>',
'<li>Click the Tickets tab</li>',
'<li>Click the Create Ticket button</li>',
'<li>Add your ticket details</li>',
'<li>Click the Next button</li>',
'<li>Select the Product and Product Version</li>',
'<li>Click the Next button</li>',
'<li>Select the Urgency of the ticket</li>',
'<li>Select the Severity of the ticket</li>',
'<li>Select the Status of the ticket</li>',
'<li>Select the Category of the ticket</li>',
'<li>Enter a summary and description of the incident, and click Create Ticket</li>    ',
'</ul>',
'</div>'))
,p_version_scn=>39567690155023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1457211859454916094)
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
,p_version_scn=>39567690155023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1457212674754924211)
,p_name=>'HELP_SUPPORT'
,p_message_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="textRegion">',
'<h2>Additional Information</h2>',
'<p>If you have questions, ask them on the <a href="%0" target="_blank">%1</a>.',
'</p>',
'</div>'))
,p_version_scn=>39567690155023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1389294164929457958)
,p_name=>'INVALID_USERS_NOT_CREATED'
,p_message_text=>'Note that %0 string(s) were invalid usernames.'
,p_version_scn=>39567690155023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2736769857349336368)
,p_name=>'LOGIN'
,p_message_text=>'Login'
,p_version_scn=>39567690155023
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(2736773959773337104)
,p_name=>'LOGOUT'
,p_message_text=>'Logout'
,p_version_scn=>39567690155028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1389293342728452987)
,p_name=>'MISSING_AT_SIGN'
,p_message_text=>'Missing @ sign'
,p_version_scn=>39567690155028
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1389293145316451792)
,p_name=>'MISSING_DOT'
,p_message_text=>'Missing dot'
,p_version_scn=>39567690155034
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3215296267028454092)
,p_name=>'MOBILE'
,p_message_text=>'Mobile'
,p_version_scn=>39567690155034
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1559340370863246662)
,p_name=>'N_DAY'
,p_message_text=>'%0 Day'
,p_version_scn=>39567690155036
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1559339974098245176)
,p_name=>'N_DAYS'
,p_message_text=>'%0 Days'
,p_version_scn=>39567690155036
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1559340764824249503)
,p_name=>'N_HOUR'
,p_message_text=>'%0 Hour'
,p_version_scn=>39567690155036
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1559339745859243061)
,p_name=>'N_HOURS'
,p_message_text=>'%0 Hours'
,p_version_scn=>39567690155036
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1559339547584242328)
,p_name=>'N_MINUTES'
,p_message_text=>'%0 Minutes'
,p_version_scn=>39567690155036
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1559340566981248495)
,p_name=>'N_WEEK'
,p_message_text=>'%0 Week'
,p_version_scn=>39567690155036
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1559340172804245773)
,p_name=>'N_WEEKS'
,p_message_text=>'%0 Weeks'
,p_version_scn=>39567690155036
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1534169342037216287)
,p_name=>'PAGES_WITH_CUSTOM_AUTH'
,p_message_text=>'Authorization Protected'
,p_version_scn=>39567690155036
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1534169571138217954)
,p_name=>'PUBLIC_PAGES'
,p_message_text=>'Public Pages'
,p_version_scn=>39567690155036
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1514556355031586943)
,p_name=>'STRING_USERNAME_FORMAT_MSG'
,p_message_text=>'This application is currently using a <strong>non-email address</strong> username format (e.g. JOHNDOE). <a href="f?p=%0:%1:%2:">Change Username Format</a>'
,p_version_scn=>39567690155036
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(3202512646342625345)
,p_name=>'USER'
,p_message_text=>'User'
,p_version_scn=>39567690155036
);
wwv_flow_imp_shared.create_message(
 p_id=>wwv_flow_imp.id(1389293572908454263)
,p_name=>'USERNAME_TOO_LONG'
,p_message_text=>'Username too long'
,p_version_scn=>39567690155036
);
wwv_flow_imp.component_end;
end;
/
