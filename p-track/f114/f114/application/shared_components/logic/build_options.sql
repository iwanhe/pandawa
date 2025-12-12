prompt --application/shared_components/logic/build_options
begin
--   Manifest
--     BUILD OPTIONS: 114
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(2661826592516005471)
,p_build_option_name=>'Headlines'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366595938
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'When this option is enabled, end-users can assign "Headline" text to a project.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(2661828693770016772)
,p_build_option_name=>'Requesting Teams'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366595938
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'When this option is enabled, end-users can define the team (or teams) that requested the project.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(2661829296087027741)
,p_build_option_name=>'Impacted Environments'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366595938
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'When this option is enabled, end-users can define the impacted environment (or environments) associated with the project.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(2661829695961054886)
,p_build_option_name=>'Team Groups'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366595938
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'When this option is enabled, end-users can define the team group (or groups) they are associated with. Application administrators can also update this field.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(2661829854737059914)
,p_build_option_name=>'Skillsets'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366595938
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'When this option is enabled, end-users can define the skillset (or skillsets) they are associated with. Application administrators can also update this field.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(2661830040094079007)
,p_build_option_name=>'Background Checks'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366595938
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'When this option is enabled, end-users can define their background check information. Application administrators can also update this field.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(2661830257654087551)
,p_build_option_name=>'HIPPA Certification Date'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366595938
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'When this option is enabled, end-users can define the the date on which they achieved their HIPPA certification. Application administrators can also update this field.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(2705749400803732907)
,p_build_option_name=>'Assistant'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366595938
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'When this option is enabled, end-users (or app administrators) can update their profile information with an assistant''s name and phone number.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(2756021856878002704)
,p_build_option_name=>'Heat Map Reporting'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366595938
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Provide heat map report as an option.  Heat may shows projects by activity from hot to cold.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(3927734266816599065)
,p_build_option_name=>'Project Issues Categories'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366595938
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'When this feature is enabled, project issues can be assigned to categories that are managed by the application administrator.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(3927734495895610134)
,p_build_option_name=>'Project Issues Reference Identifier'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366595938
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'When this feature is enabled, project issues can have a reference identifier assigned (e.g. a bug number from a different system).'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(6064815400599095991)
,p_build_option_name=>'Content complete "fish bowl"'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366595938
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Show content complete "fish bowl" control on project detail page side bar with model region to display detail.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(6064816709620137382)
,p_build_option_name=>'Project Validations'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366595938
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Allow project contributors to validate project status.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(6086979797456591004)
,p_build_option_name=>'Project Status Reports'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366595938
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable or disable the status reporting functionality of this application.  Project status reports are formal project update.  Typically if status reports are enabled project updates are disabled.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(6143688812531166465)
,p_build_option_name=>'Flex Columns'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366595938
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Allows flex columns to be named and used to extend projects with specific functionality.  Enable if you wish to allow administrators the ability to configure flex columns.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(6855415494149142740)
,p_build_option_name=>'Include E-Mail Ingest'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366595942
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Reserved for future functionality.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(7563953019503314303)
,p_build_option_name=>'Project Issues'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366595954
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Projects allow any number of issues to be defined for a given project.   '
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(11756681878669227855)
,p_build_option_name=>'Project Milestones'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366595967
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Any number of milestones can be defined or a given project.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(11756682088337229718)
,p_build_option_name=>'Project Attachments'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366595997
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Projects allow for one or more attachment to be added.  Enable if you want to allow projects to include attachments.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(11756699376794143132)
,p_build_option_name=>'Project Action Items'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596009
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'If enabled each project will allow the definition of action items.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(11756704262311161627)
,p_build_option_name=>'Project Updates'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596024
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Projects allow simple text updates, choose to enable or disable this capability.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(11756752007201202936)
,p_build_option_name=>'Project Links'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596035
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'If enabled allows any number of links (URLs) to be named and associated with a project.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(11807188174522150938)
,p_build_option_name=>'Dashboard: Show Projects by Status'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596047
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'On the projects dashboard page show the projects by status region.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(11807253788358069590)
,p_build_option_name=>'Dashboard: Show Projects by Category'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596060
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'On the projects dashboard page show projects by category region.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(11807261022514082535)
,p_build_option_name=>'Dashboard: Show People Resources'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596075
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'On the projects dashboard page show the people resources region.  This widget identifies who owns the most projects.  This widget shows recently created projects so that you can see at a glance which projects are new.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(11807268263133163627)
,p_build_option_name=>'Dashboard: Show recently created'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596087
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'On the projects dashboard page show the recently created region.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(11807318653379106581)
,p_build_option_name=>'Dashboard: Show recently edited projects'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596096
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'On the projects dashboard page show the recently edited projects region.  This dashboard widget shows which projects have been recently edited.  Allows you to see at a glance which projects were updated most recently.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(11807336118869114840)
,p_build_option_name=>'Dashboard'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596096
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Exposes a dashboard link in the Projects list of the "Reporting" page.  Disabling dashboard turns off the entire dashboard page.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(11807405791719136918)
,p_build_option_name=>'Dashboard: Show Parent Projects'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596096
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'On the dashboard page, show the parent projects region. '
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(11807410330259142584)
,p_build_option_name=>'Dashboard: Show least recently edited'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596097
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'On the dashboard region show the least recently edited widget.  This widget highlights projects that may be neglected or in need of an update.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(11807420439347234598)
,p_build_option_name=>'Dashboard: Show summary'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596097
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'On the dashboard page, show the summary region with counts of projects and milestones and action items.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(11876370140123189618)
,p_build_option_name=>'Email Past Due Deliverables'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596097
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'This is an administrative option that emails all (or specific individual) users having past due deliverables. It can be run on demand or via a database job. When enabled as a database job, all users having past due deliverables are emailed.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(11888600020324608728)
,p_build_option_name=>'Email Upcoming Deliverables'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596097
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'This is an administrative option that emails all (or specific individual) users having upcoming deliverables that are due. It can be run on demand or via a database job. When enabled as a database job, all users having upcoming deliverables are email'
||'ed.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(12021369465070232745)
,p_build_option_name=>'Project Resources'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366596097
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Allow tracking of miscellaneous resources by project.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(12124281749376450905)
,p_build_option_name=>'Project User Involvement'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596101
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Track the involvement level of each person assigned to a project.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(12131994237014236636)
,p_build_option_name=>'Project Sizes'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596101
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Classify projects according to their size / complexity.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(12539864623145401807)
,p_build_option_name=>'Perma Link'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366596103
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'On the project details page, displays a "Perma Link" project action button.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(12539867860766490810)
,p_build_option_name=>'Merge'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366596143
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'On the project details page, displays a "Merge" project action button.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(13510291845500699844)
,p_build_option_name=>'Project Templates'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596143
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Administrators can create project templates which can then be selected by end-users in the create project wizard to create a project with pre-defined milestones and action items.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(15764621210683200192)
,p_build_option_name=>'Email Project Details'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596144
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'This is an administrative option that sends job-driven project details emails to users that have opted into receiving these emails. The job runs daily but users get these emails based on their "Project Details Schedule" email preference setting.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(16868356519761892930)
,p_build_option_name=>'Restrict Changes'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366596150
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'When set, this prevents non administrators from altering most details of Milestones and Action Items.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(16894992821762030465)
,p_build_option_name=>'Feedback'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596153
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Allows application users the ability to send comments, enhancement requests, and bugs to application administrators.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(17222556262296952524)
,p_build_option_name=>'Edit Closed Projects'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596153
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'If enabled, closed projects can be edited by anyone with the appropriate permissions. If disabled, closed projects can only be edited by users with the Super Admin access level.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(17593712083245723899)
,p_build_option_name=>'Restrict Changes (Template)'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596157
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'If set, project templates will include the option of making the template milestones and action items "mandatory". Users who do not have Super Admin access will not be able to edit most details of milestones and action items created from such a templa'
||'te.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(18118675022980458324)
,p_build_option_name=>'Mandatory Action Item Resolution'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596179
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Ensure resolution text is added to any Action Item that is having it''s status changed to "Closed / Complete" .'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(18524168470145109483)
,p_build_option_name=>'Email Project Statuses'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596188
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'This is an administrative option that sends job-driven project status emails to users that have opted into receiving these emails. The job runs daily but users get these emails based on their "Project Status Schedule" email preference setting.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(18882216890018093962)
,p_build_option_name=>'Project Countries'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366596194
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Enable associating projects with specific regions and countries.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(19136678749050950256)
,p_build_option_name=>'Project Code Names'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366596195
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Allows tracking of projects by "Code Names"'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(19136688366517761209)
,p_build_option_name=>'Project Deal Types'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366596199
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Allows the ability to define deal types to various projects.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(19136719722975969919)
,p_build_option_name=>'Action Item Links'
,p_build_option_status=>'EXCLUDE'
,p_version_scn=>39567366596206
,p_default_on_export=>'EXCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Allows the ability to assign a link to an Action Item.'
);
wwv_flow_imp_shared.create_build_option(
 p_id=>wwv_flow_imp.id(19782202788559795354)
,p_build_option_name=>'Allow Parent Projects'
,p_build_option_status=>'INCLUDE'
,p_version_scn=>39567366596243
,p_default_on_export=>'INCLUDE'
,p_on_upgrade_keep_status=>true
,p_build_option_comment=>'Allows end-users to define an existing project as a parent project when creating a new project or editing an existing project.'
);
wwv_flow_imp.component_end;
end;
/
