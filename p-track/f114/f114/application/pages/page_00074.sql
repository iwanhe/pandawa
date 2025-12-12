prompt --application/pages/page_00074
begin
--   Manifest
--     PAGE: 00074
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
 p_id=>74
,p_name=>'Merge Projects'
,p_step_title=>'Merge Projects'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486190175074984)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'.permalink { padding: 0 10px 10px 10px; text-align: center;}',
'.permalink a {color: #707070; font: 11px/12px Arial, sans-serif;}',
'</style>',
'',
'<style type="text/css" media="all">',
'',
'',
'#MILESTONES .rc-body-r{height:500px !important;}',
'#TO .rc-body-r{height:280px !important;}',
'',
'</style>'))
,p_page_template_options=>'#DEFAULT#'
,p_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_help_text=>'Verify these are the two projects that you want to merge. Remember the project on the bottom will become merged into the project listed on top and then removed. If everything looks good to you, click the <strong>Merge Projects</strong> button to comp'
||'lete the merge process. You can also go back a step by clicking the <strong><</strong> button or click the <strong>Cancel</strong> button to return to the project details page.'
,p_page_component_map=>'10'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8039722019979236160)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8039726233481474251)
,p_plug_name=>'Merge'
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>40
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
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8039725418534365914)
,p_plug_name=>'Merge To Project'
,p_parent_plug_id=>wwv_flow_imp.id(8039726233481474251)
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>20
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sys.htp.p(''<p>Primary Project - Merge Into this Project</p>'');',
'eba_proj_status_show_detail (',
'  p_project_id => :P54_PRIMARY_PROJECT,',
'  p_app_id => :APP_ID,',
'  p_app_session => :APP_SESSION);'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style type="text/css" media="all">',
'div.ctPDetails{border-bottom:1px solid #DDD;clear:both;position:relative;padding: 10px 0 5px 0}',
'div.ctPDetails:last-child{border-bottom:none;}',
'div.ctPDetails h3{font:bold 12px/16px Arial,sans-serif;margin:0;padding:7px 10px;width:200px;color:#333;position:absolute;top:0;left:0;}',
'div.ctPDetails h3 a {color: #333; text-decoration: none; border-bottom: 1px solid #CCC}',
'div.ctPDetails h3 + ul{margin:0;list-style:none;padding:0;margin:0 0 0 220px;}',
'div.ctPDetails ul li{display:table;width:100%;}',
'div.ctPDetails ul li a.accountName{font:bold 11px/14px Arial,sans-serif;display:inline-block;padding:7px 0;color:#333;text-decoration:underline;}',
'div.ctPDetails ul li table a{color:#333;text-decoration:underline;}',
'div.ctPDetails ul li table{width:100%;}',
'div.ctPDetails ul li table th,',
'div.ctPDetails ul li table td{padding:0 0 5px 0;font:normal 11px/16px Arial,sans-serif;color:#666;vertical-align: top}',
'div.ctPDetails ul li table th{font-weight:bold;text-align:left;width:120px;vertical-align: top}',
'</style>'))
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8039725718665375388)
,p_plug_name=>'Merge From Project'
,p_parent_plug_id=>wwv_flow_imp.id(8039726233481474251)
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>30
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'sys.htp.p(''<p>Project to be merged - this project will no longer exist after the merge</p>'');',
'eba_proj_status_show_detail (',
'  p_project_id => :P54_MERGE_PROJECT,',
'  p_app_id => :APP_ID,',
'  p_app_session => :APP_SESSION);'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_plug_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style type="text/css" media="all">',
'div.ctPDetails{border-bottom:1px solid #DDD;clear:both;position:relative;padding: 10px 0 5px 0}',
'div.ctPDetails:last-child{border-bottom:none;}',
'div.ctPDetails h3{font:bold 12px/16px Arial,sans-serif;margin:0;padding:7px 10px;width:200px;color:#333;position:absolute;top:0;left:0;}',
'div.ctPDetails h3 a {color: #333; text-decoration: none; border-bottom: 1px solid #CCC}',
'div.ctPDetails h3 + ul{margin:0;list-style:none;padding:0;margin:0 0 0 220px;}',
'div.ctPDetails ul li{display:table;width:100%;}',
'div.ctPDetails ul li a.accountName{font:bold 11px/14px Arial,sans-serif;display:inline-block;padding:7px 0;color:#333;text-decoration:underline;}',
'div.ctPDetails ul li table a{color:#333;text-decoration:underline;}',
'div.ctPDetails ul li table{width:100%;}',
'div.ctPDetails ul li table th,',
'div.ctPDetails ul li table td{padding:0 0 5px 0;font:normal 11px/16px Arial,sans-serif;color:#666;vertical-align: top}',
'div.ctPDetails ul li table th{font-weight:bold;text-align:left;width:120px;vertical-align: top}',
'</style>'))
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8039728839818608607)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'CANCEL'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Cancel'
,p_button_position=>'CLOSE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:&LAST_VIEW.:&SESSION.::&DEBUG.:::'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8039729229411608607)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'Merge'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Merge Projects'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8039729029356608607)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'PREVIOUS'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Previous'
,p_button_position=>'PREVIOUS'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.:::'
,p_icon_css_classes=>'fa-chevron-left'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(8039729635793616900)
,p_branch_action=>'f?p=&APP_ID.:&LAST_VIEW.:&SESSION.::&DEBUG.:::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 02-JUL-2011 19:38 by MIKE'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8039729744797619435)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'Merge Projects'
,p_process_sql_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_sql_stmt varchar2(500);',
'    cursor act_csr is',
'        -- Two different children can be merged.',
'        select ''MERGE_2C'' action',
'        from eba_proj_status eps_pri,',
'            eba_proj_status eps_sec',
'        where eps_pri.id = :P54_PRIMARY_PROJECT',
'            and eps_sec.id = :P54_MERGE_PROJECT',
'            and eps_pri.parent_project_id is not null',
'            and eps_sec.parent_project_id is not null',
'            and eps_sec.id != eps_pri.id',
'        -- Two different parents can be merged.',
'        union all',
'        select ''MERGE_2P'' action',
'        from eba_proj_status eps_pri,',
'            eba_proj_status eps_sec',
'        where eps_pri.id = :P54_PRIMARY_PROJECT',
'            and eps_sec.id = :P54_MERGE_PROJECT',
'            and eps_pri.parent_project_id is null',
'            and eps_sec.parent_project_id is null',
'            and eps_sec.id != eps_pri.id',
'        -- A child of another project can be reparented into a different parent',
'        union all',
'        select ''REPARENT'' action',
'        from eba_proj_status eps_pri,',
'            eba_proj_status eps_sec',
'        where eps_pri.id = :P54_PRIMARY_PROJECT',
'            and eps_sec.id = :P54_MERGE_PROJECT',
'            and eps_pri.parent_project_id is null',
'            and eps_sec.parent_project_id is not null',
'            and eps_pri.id != eps_sec.parent_project_id',
'        -- A child can be merged into its own parent, perhaps?',
'        union all',
'        select ''MERGE_CP'' action',
'        from eba_proj_status eps_sec',
'        where eps_sec.parent_project_id = :P54_PRIMARY_PROJECT',
'            and eps_sec.id = :P54_MERGE_PROJECT;',
'    act_rec act_csr%ROWTYPE;',
'begin',
'    for act_rec in act_csr loop',
'        -- Reparenting',
'        if act_rec.action in (''REPARENT'') then',
'            update eba_proj_status',
'            set parent_project_id = :P54_PRIMARY_PROJECT',
'            where id = :P54_MERGE_PROJECT;',
'        end if;',
'        -- Action Items',
'        if act_rec.action in (''MERGE_2C'', ''MERGE_2P'', ''MERGE_CP'') then',
'            update eba_proj_status_ais',
'            set project_id = :P54_PRIMARY_PROJECT',
'            where project_id = :P54_MERGE_PROJECT;',
'            commit;',
'        end if;',
'        -- Status Updates',
'        if act_rec.action in (''MERGE_2C'', ''MERGE_2P'', ''MERGE_CP'') then',
'            update eba_proj_status_updates',
'            set project_id = :P54_PRIMARY_PROJECT',
'            where project_id = :P54_MERGE_PROJECT;',
'            commit;',
'        end if;',
'        -- Milestones',
'        if act_rec.action in (''MERGE_2C'', ''MERGE_2P'', ''MERGE_CP'') then',
'            update eba_proj_status_ms',
'            set project_id = :P54_PRIMARY_PROJECT',
'            where project_id = :P54_MERGE_PROJECT;',
'            commit;',
'        end if;',
'        -- Child Projects',
'        if act_rec.action in (''MERGE_2P'') then',
'            update eba_proj_status',
'            set parent_project_id = :P54_PRIMARY_PROJECT',
'            where parent_project_id = :P54_MERGE_PROJECT;',
'            commit;',
'        end if;',
'        -- Files',
'        if act_rec.action in (''MERGE_2C'', ''MERGE_2P'', ''MERGE_CP'') then',
'            update eba_proj_status_files',
'            set project_id = :P54_PRIMARY_PROJECT',
'            where project_id = :P54_MERGE_PROJECT;',
'            commit;',
'        end if;',
'        -- Links',
'        if act_rec.action in (''MERGE_2C'', ''MERGE_2P'', ''MERGE_CP'') then',
'            update eba_proj_status_links',
'            set project_id = :P54_PRIMARY_PROJECT',
'            where project_id = :P54_MERGE_PROJECT;',
'            commit;',
'        end if;',
'        -- Delete old project if appropriate.',
'        if act_rec.action in (''MERGE_2C'', ''MERGE_2P'', ''MERGE_CP'') then',
'            update eba_proj_status$ set is_deleted_yn = ''Y'' where id = :P54_MERGE_PROJECT;',
'            commit;',
'        end if;',
'    end loop;',
'end;'))
,p_process_clob_language=>'PLSQL'
,p_process_success_message=>'Projects merged.'
,p_internal_uid=>8039729744797619435
);
wwv_flow_imp.component_end;
end;
/
