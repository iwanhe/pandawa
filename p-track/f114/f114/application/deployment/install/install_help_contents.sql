prompt --application/deployment/install/install_help_contents
begin
--   Manifest
--     INSTALL: INSTALL-Help contents
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(7790848386142132229)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Help contents'
,p_sequence=>610
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'delete from eba_proj_help_page;',
'insert into eba_proj_help_page (',
'    language_code,',
'    sprite,',
'    show_app_version_yn,',
'    show_page_count_yn,',
'    use_app_title_yn,',
'    show_icon,',
'    SUPPORT_LINK_TEXT,',
'    SUPPORT_LINK,    ',
'    vendor,',
'    about_app,',
'    getting_started,',
'    PUBLIC_HELP,',
'    features,',
'    support',
') values (',
'    ''EN'',',
'    ''project_tracking'',',
'    ''Y'',',
'    ''Y'',',
'    ''Y'',',
'    ''SPRITE'',',
'    ''OTN Forum'',',
'    ''https://forums.oracle.com/forums/forum.jspa?forumID=137'',    ',
'    ''Oracle'',',
'    q''!<h2>About this Application</h2>',
'<p>Track projects, milestones, action items, attach documents, add tags, and comment. P-Track enhances your project management effectiveness by promoting collaboration, transparency, and information sharing..</p>',
'<p> A project in P-Track has a number of attributes, including one or more owners, a status indication, and a set of milestones and action items. You can submit status updates for a project and create status reports based on a selection of updates. P'
||'rojects are assigned to a category, and a project can be the parent of one or more child projects. You can also add tags to a project to allow for more informal groups of projects.</p>',
'<p> All projects allow you to add annotations, such as links to other resources or files, to the project for consolidated access to all information relating to a project.</p>',
'<p> Each project has a set of milestones, which can be viewed in a report, a calendar view, or in a Gantt chart format.</p>',
'<p> Each project has a set of action items, which can be viewed in a report or a calendar view. P-Track includes a set of high level analysis reports on action items, for a quick review of assigned tasks.</p>',
'<p> P-Track also includes built-in integration with email. You can request status updates through an email message, and team members who receive this type of message can directly update status, milestones or action items, as well as add annotations t'
||'o a project.</p>!'',',
'    q''!<h2>Getting Started</h2>',
'<p>1.Defining Projects</p>',
'<ul>',
'  <li>Click on the Projects tab.</li>',
'  <li>Click on the Create Project button under Tasks.</li>',
'  <li>Add new project data.</li>',
'</ul>',
'<p>2. Editing Projects</p>',
'<ul>',
'  <li>Click on the Projects tab.</li>',
'  <li>Click on the project to edit.</li>',
'  <li>Edit project data and click on Apply Changes.</li>',
'</ul>!'',',
''''',',
'''<h2>Features</h2><ul>',
'<li>Track and Manage Projects</li>',
'<li>Track and Manage Project Milestones</li>',
'<li>Manage flexible and updateable projects status, items </li>',
'<li>Flexible and changeable status codes</li>',
'<li>Robust Reporting</li>',
'<li>Link, Note, and File Attachments</li>',
'<li>Mobile Interface</li>',
'<li>Flexible Access Control (reader, contributor, administrator model)</li>'',',
'''<h2>Additional Information</h2>',
'<p>If you have questions, ask them on the #SUPPORT_LINK#<p>''',
');',
'/',
'',
'commit;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
