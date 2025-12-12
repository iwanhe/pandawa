prompt --application/pages/page_00000
begin
--   Manifest
--     PAGE: 00000
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
 p_id=>0
,p_name=>'0'
,p_step_title=>'0'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5849761210133065838)
,p_page_template_options=>'#DEFAULT#'
,p_nav_list_template_options=>'#DEFAULT#'
,p_protection_level=>'D'
,p_page_component_map=>'14'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6103702204286064592)
,p_plug_name=>'Dynamic Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>5
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_rowkey_pref varchar2(255) := eba_proj_fw.get_preference_value(p_preference_name => ''PROJECT_ROWKEY_OPTION'');',
'    cursor bc_csr is',
'        select apex_application.do_substitutions(be.url) url,',
'            apex_application.do_substitutions(be.entry_label) entry_label,',
'            be.defined_for_page page_id',
'        from apex_application_bc_entries be',
'        start with be.defined_for_page = :APP_PAGE_ID',
'            and be.application_id = :APP_ID',
'        connect by prior parent_breadcrumb_id = breadcrumb_entry_id',
'            and prior be.application_id = be.application_id',
'        order by level desc;',
'    bc_rec bc_csr%ROWTYPE;',
'    --',
'    cursor pj_csr( p_project_id in number ) is',
'        select ps.id, ps.project, ps.acl_status_level, ps.row_key, ps.code_name',
'        from eba_proj_status ps',
'        start with ps.id = p_project_id',
'        connect by prior parent_project_id = id',
'        order by level desc;',
'    pj_rec pj_csr%ROWTYPE;',
'begin',
'    sys.htp.p(''<ul class="t-Breadcrumb">'');',
'    for bc_rec in bc_csr loop',
'        if bc_rec.page_id = 200 then',
'            for pj_rec in pj_csr( :P200_ID ) loop',
'                if :APP_PAGE_ID = 200 and pj_rec.id = :P200_ID then',
'                    sys.htp.p(''<li class="t-Breadcrumb-item is-active"><span class="t-Breadcrumb-label">'');',
'                    if pj_rec.acl_status_level = 3 then',
'                        sys.htp.p(''<span class="fa fa-lock"></span>'');',
'                    end if;',
'                    if l_rowkey_pref = ''ROWKEY'' then',
'                        sys.htp.p(apex_escape.html(pj_rec.project)||'' <span class="project-key-badge">''||pj_rec.row_key||''</span></span></li>'');',
'                    elsif l_rowkey_pref = ''CODE_NAME'' then',
'                        sys.htp.p(apex_escape.html(pj_rec.project)||'' <span class="project-key-badge">''||nvl(pj_rec.code_name,pj_rec.row_key)||''</span></span></li>'');',
'                    elsif l_rowkey_pref = ''DO_NOT_DISPLAY'' then',
'                        sys.htp.p(apex_escape.html(pj_rec.project)||''</span></li>'');',
'                    else',
'                        sys.htp.p(apex_escape.html(pj_rec.project)||'' <span class="project-key-badge">''||pj_rec.row_key||''</span></span></li>'');',
'                    end if;',
'                else',
'                    sys.htp.p(''<li class="t-Breadcrumb-item"><a href="''',
'                        ||apex_util.prepare_url(''f?p=''',
'                            ||:APP_ID||'':200:''||:APP_SESSION',
'                            ||'':::200:P200_ID:''',
'                            ||pj_rec.id)',
'                        ||''" class="t-Breadcrumb-label">'');',
'                    if pj_rec.acl_status_level = 3 then',
'                        sys.htp.p(''<span class="fa fa-lock"></span>'');',
'                    end if;',
'                    sys.htp.p(apex_escape.html(pj_rec.project)||''</a></li>'');',
'                end if;',
'            end loop;',
'        else',
'            if bc_rec.page_id = :APP_PAGE_ID then',
'                sys.htp.p(''<li class="t-Breadcrumb-item is-active"><span class="t-Breadcrumb-label">''',
'                    ||apex_escape.html(bc_rec.entry_label)||''</span></li>'');',
'            else',
'                sys.htp.p(''<li class="t-Breadcrumb-item"><a href="''',
'                    ||bc_rec.url||''" class="t-Breadcrumb-label">''||apex_escape.html(bc_rec.entry_label)||''</a></li>'');',
'            end if;',
'        end if;',
'    end loop;',
'    sys.htp.p(''</ul>'');',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
,p_list_template_id=>wwv_flow_imp.id(8263149629522625054)
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'EXISTS'
,p_plug_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from apex_application_bc_entries be,',
'    apex_application_pages p',
'where be.application_id = :APP_ID',
'    and be.defined_for_page = :APP_PAGE_ID',
'    and p.application_id = be.application_id',
'    and p.page_id = be.defined_for_page',
'    and p.page_mode <> ''Modal Dialog''',
'    and be.defined_for_page not in (1,64,51,52,48,73,85)'))
,p_pagination_display_position=>'BOTTOM_RIGHT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6728076008108933627)
,p_plug_name=>'CSS Links'
,p_component_template_options=>'#DEFAULT#'
,p_plug_display_sequence=>40
,p_plug_display_point=>'AFTER_HEADER'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'.ebaSearchContainer { margin: 0px 20px; }',
'div.uAPEXNavBar {display: none;}',
'#apexir_DATA_PANEL > table .apexir_WORKSHEET_DATA td, #apexir_GROUP_BY > table .apexir_WORKSHEET_DATA td {background: none transparent}',
'div.uButtonRegionContent table.formlayout td { padding-right: 8px !important; padding-left: 0 !important;}',
'div.uButtonRegionContent table.formlayout td input.text_field {margin-right: 16px;}',
'div.uButtonRegionContent table.formlayout tr.rowHighlight > td {background-color: transparent !important;}',
'a.uButtonLarge.uHotButton span { height: auto; }',
'div.ebaSearchFilterButtons { padding: 4px 16px !important ; }',
'div.ebaStatusListLegend { padding: 0px 30px; }',
'body {background-image: none !important;}',
'.uSearchContainer table.tbl-body td.tbl-sidebar {border-right: none; background: none transparent;}',
'body .gold-marker {',
'    height: 12px;',
'    width: 12px;',
'    margin: 0 4px;',
'    vertical-align: middle;',
'}',
'.gold-marker {',
'    display: inline-block;',
'    padding: 0;',
'    background: #FFD600;',
'    color: #404040;',
'    border-radius: 100%;',
'    vertical-align: top;',
'    height: 16px;',
'    width: 16px;',
'    margin-left: 4px;',
'}',
'</style>'))
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_plug_display_condition_type=>'CURRENT_PAGE_NOT_IN_CONDITION'
,p_plug_display_when_condition=>'101'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15711647121972245135)
,p_plug_name=>'Disclaimer'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>10
,p_plug_display_point=>'REGION_POSITION_05'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_str varchar2(4000);',
'begin',
'    l_str := eba_proj_fw.get_preference_value(''DISCLAIMER_TEXT'');',
'    if l_str <> ''Preference does not exist'' then',
'        sys.htp.p(''<p>''||eba_proj_fw.selective_escape(l_str)||''</p>'');',
'    end if;',
'end;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp.component_end;
end;
/
