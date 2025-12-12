prompt --application/pages/page_00010
begin
--   Manifest
--     PAGE: 00010
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
 p_id=>10
,p_name=>'Project Timeline'
,p_step_title=>'Project Timeline'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486499525077695)
,p_javascript_code_onload=>wwv_flow_string.join(wwv_flow_t_varchar2(
'$x(''P10_SEARCH'').focus();',
''))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.t-Timeline-type.is-updated {',
'    background-color: #cd4411;',
'    color: #FFF;',
'}'))
,p_step_template=>wwv_flow_imp.id(6672319528586369818)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'The "Timeline" page shows a history of application transactions. Use the filter controls on the left to change the results displayed on the right.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(5264906563518875432)
,p_name=>'Timeline'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>60
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select r.created SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(r.created_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(r.created_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(r.created_by,1,2),',
'                substr(r.created_by,1,1)||substr(r.created_by,instr(replace(r.created_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    eba_proj_fw.get_name_from_email_address(r.created_by) as user_name,',
'    r.created EVENT_DATE,',
'    ''fa fa-file'' EVENT_ICON,',
'    ''is-new'' EVENT_STATUS,',
'    ''New Status Report'' EVENT_TYPE,',
'    (select project from eba_proj_status s where s.id = r.project_id) EVENT_TITLE,',
'    r.STATUS_TITLE EVENT_DESC,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||r.project_id) event_link',
'from eba_proj_status_rpts r',
'where r.created > (systimestamp - :P10_TIMEFRAME)',
'    and ( :P10_PROJECT is null or r.project_id = :P10_PROJECT )',
'    and ( :P10_UPDATE_BY is null or lower(r.created_by) = lower(:P10_UPDATE_BY) )',
'union all',
'select f.created SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(f.created_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(f.created_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(f.created_by,1,2),',
'                substr(f.created_by,1,1)||substr(f.created_by,instr(replace(f.created_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    eba_proj_fw.get_name_from_email_address(f.created_by) as user_name,',
'    f.created EVENT_DATE,',
'    ''fa fa-paperclip'' EVENT_ICON,',
'    ''is-new'' EVENT_STATUS,',
'    ''New File Attachment'' EVENT_TYPE,',
'    (select project from eba_proj_status s where s.id = f.project_id) EVENT_TITLE,',
'    substr(f.FILENAME,1,255) || '' ''||substr(f.FILE_COMMENTS,1,200) EVENT_DESC,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||f.project_id) event_link',
'from EBA_PROJ_STATUS_FILES f',
'where f.created > (systimestamp - :P10_TIMEFRAME)',
'    and ( :P10_PROJECT is null or f.project_id = :P10_PROJECT )',
'    and ( :P10_UPDATE_BY is null or lower(f.created_by) = lower(:P10_UPDATE_BY) )',
'union all',
'select l.created SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(l.created_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(l.created_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(l.created_by,1,2),',
'                substr(l.created_by,1,1)||substr(l.created_by,instr(replace(l.created_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    eba_proj_fw.get_name_from_email_address(l.created_by) as user_name,',
'    l.created EVENT_DATE,',
'    ''fa fa-external-link'' EVENT_ICON,',
'    ''is-new'' EVENT_STATUS,',
'    ''New Link'' EVENT_TYPE,',
'    (select project from eba_proj_status s where s.id = l.project_id) EVENT_TITLE,',
'    substr(nvl(LINK_TEXT,LINK_TARGET),1,255) || '' ''||substr(link_comments,1,200) EVENT_DESC,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||l.project_id) event_link',
'from EBA_PROJ_STATUS_LINKS l',
'where l.created > (systimestamp - :P10_TIMEFRAME)',
'    and ( :P10_PROJECT is null or l.project_id = :P10_PROJECT )',
'    and ( :P10_UPDATE_BY is null or lower(l.created_by) = lower(:P10_UPDATE_BY) )',
'union all',
'select ms.created SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(ms.created_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(ms.created_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(ms.created_by,1,2),',
'                substr(ms.created_by,1,1)||substr(ms.created_by,instr(replace(ms.created_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    eba_proj_fw.get_name_from_email_address(ms.created_by) as user_name,',
'    ms.created EVENT_DATE,',
'    ''fa fa-calendar'' EVENT_ICON,',
'    ''is-new'' EVENT_STATUS,',
'    ''New Milestone'' EVENT_TYPE,',
'    (   select project',
'        from eba_proj_status s',
'        where s.id = ms.project_id) EVENT_TITLE,',
'    substr(MILESTONE_NAME,1,255) ||'' - status ''||substr(MILESTONE_STATUS,1,255)||'', due ''||apex_util.get_since(ms.milestone_date)||'' ''||trim(to_char(ms.milestone_date,''Day DD-MON-YYYY'')) EVENT_DESC,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||ms.project_id) event_link',
'from EBA_PROJ_STATUS_MS ms',
'where ms.created > (systimestamp - :P10_TIMEFRAME)',
'    and ( :P10_PROJECT is null or ms.project_id = :P10_PROJECT )',
'    and ( :P10_UPDATE_BY is null or lower(ms.created_by) = lower(:P10_UPDATE_BY) )',
'union all',
'select ms.deleted_on SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(ms.deleted_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(ms.deleted_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(ms.deleted_by,1,2),',
'                substr(ms.deleted_by,1,1)||substr(ms.deleted_by,instr(replace(ms.deleted_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    eba_proj_fw.get_name_from_email_address(ms.deleted_by) as user_name,',
'    ms.deleted_on EVENT_DATE,',
'    ''fa fa-calendar'' EVENT_ICON,',
'    ''is-removed'' EVENT_STATUS,',
'    ''Milestone Removed'' EVENT_TYPE,',
'    (   select project',
'        from eba_proj_status s',
'        where s.id = ms.project_id) EVENT_TITLE,',
'    substr(MILESTONE_NAME,1,255) ||'' - status ''||substr(MILESTONE_STATUS,1,255)||'', due ''||apex_util.get_since(ms.milestone_date)||'' ''||trim(to_char(ms.milestone_date,''Day DD-MON-YYYY'')) EVENT_DESC,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||ms.project_id) event_link',
'from EBA_PROJ_STATUS_MS$ ms',
'where ms.is_deleted_yn = ''Y''',
'    and ms.deleted_on > (systimestamp - :P10_TIMEFRAME)',
'    and ( :P10_PROJECT is null or ms.project_id = :P10_PROJECT )',
'    and ( :P10_UPDATE_BY is null or lower(ms.deleted_on) = lower(:P10_UPDATE_BY) )',
'union all',
'select ai.created SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(ai.created_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(ai.created_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(ai.created_by,1,2),',
'                substr(ai.created_by,1,1)||substr(ai.created_by,instr(replace(ai.created_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    eba_proj_fw.get_name_from_email_address(ai.created_by) as user_name,',
'    ai.created EVENT_DATE,',
'    ''fa fa-check-circle-o'' EVENT_ICON,',
'    ''is-new'' EVENT_STATUS,',
'    ''New Action Item'' EVENT_TYPE,',
'    substr((   select substr(project,1,255)',
'        from eba_proj_status s',
'        where s.id = ai.project_id),1,150) EVENT_TITLE,',
'    substr(action,1,255) ||'' due ''||apex_util.get_since(ai.due_date) EVENT_DESC,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||ai.project_id) event_link',
'from eba_proj_status_ais ai',
'where ai.created > (systimestamp - :P10_TIMEFRAME)',
'    and ( :P10_PROJECT is null or ai.project_id = :P10_PROJECT )',
'    and ( :P10_UPDATE_BY is null or lower(ai.created_by) = lower(:P10_UPDATE_BY) )',
'union all',
'select ai.deleted_on SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(ai.deleted_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(ai.deleted_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(ai.deleted_by,1,2),',
'                substr(ai.deleted_by,1,1)||substr(ai.deleted_by,instr(replace(ai.deleted_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    eba_proj_fw.get_name_from_email_address(ai.deleted_by) as user_name,',
'    ai.deleted_on EVENT_DATE,',
'    ''fa fa-check-circle-o'' EVENT_ICON,',
'    ''is-removed'' EVENT_STATUS,',
'    ''Action Item Removed'' EVENT_TYPE,',
'    substr((   select substr(project,1,255)',
'        from eba_proj_status s',
'        where s.id = ai.project_id),1,150) EVENT_TITLE,',
'    substr(action,1,255) ||'' due ''||apex_util.get_since(ai.due_date) EVENT_DESC,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||ai.project_id) event_link',
'from eba_proj_status_ais$ ai',
'where ai.is_deleted_yn = ''Y''',
'    and ai.deleted_on > (systimestamp - :P10_TIMEFRAME)',
'    and ( :P10_PROJECT is null or ai.project_id = :P10_PROJECT )',
'    and ( :P10_UPDATE_BY is null or lower(ai.deleted_by) = lower(:P10_UPDATE_BY) )',
'union all',
'select u.created SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(u.created_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(u.created_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(u.created_by,1,2),',
'                substr(u.created_by,1,1)||substr(u.created_by,instr(replace(u.created_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    eba_proj_fw.get_name_from_email_address(u.created_by) as user_name,',
'    u.created EVENT_DATE,',
'    ''fa fa-comment-o'' EVENT_ICON,',
'    ''is-new'' EVENT_STATUS,',
'    ''New Update'' EVENT_TYPE,',
'    (select substr(project,1,255) from eba_proj_status s where s.id = u.project_id) EVENT_TITLE,',
'    apex_escape.html(dbms_lob.substr(STATUS_UPDATE,500,1)) EVENT_DESC,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||u.project_id) event_link',
'from EBA_PROJ_STATUS_UPDATES u,',
'    EBA_PROJ_STATUS_UPDATE_TYPES t',
'where u.update_type = t.id(+)',
'    and u.created > (systimestamp - :P10_TIMEFRAME)',
'    and ( :P10_PROJECT is null or u.project_id = :P10_PROJECT )',
'    and ( :P10_UPDATE_BY is null or lower(u.created_by) = lower(:P10_UPDATE_BY) )',
'union all',
'select p.created SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(p.created_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(p.created_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(p.created_by,1,2),',
'                substr(p.created_by,1,1)||substr(p.created_by,instr(replace(p.created_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    eba_proj_fw.get_name_from_email_address(p.created_by) as user_name,',
'    p.created EVENT_DATE,',
'    ''fa fa-archive'' EVENT_ICON,',
'    ''is-new'' EVENT_STATUS,',
'    --''is-new is-updated is-removed',
'    ''New Project'' EVENT_TYPE,',
'    substr(p.project,1,255) EVENT_TITLE,',
'    NVL(description,goal) EVENT_DESC,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||p.id) event_link',
'from EBA_PROJ_STATUS p',
'where p.created > (systimestamp - :P10_TIMEFRAME)',
'    and ( :P10_PROJECT is null or p.id = :P10_PROJECT )',
'    and ( :P10_UPDATE_BY is null or lower(p.created_by) = lower(:P10_UPDATE_BY) )',
'union all',
'select p.deleted_on SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(p.deleted_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(p.deleted_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(p.deleted_by,1,2),',
'                substr(p.deleted_by,1,1)||substr(p.deleted_by,instr(replace(p.deleted_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    eba_proj_fw.get_name_from_email_address(p.deleted_by) as user_name,',
'    p.deleted_on EVENT_DATE,',
'    ''fa fa-archive'' EVENT_ICON,',
'    ''is-removed'' EVENT_STATUS,',
'    --''is-new is-updated is-removed',
'    ''Project Removed'' EVENT_TYPE,',
'    substr(p.project,1,255) EVENT_TITLE,',
'    NVL(description,goal) EVENT_DESC,',
'    null event_link',
'from EBA_PROJ_STATUS$ p',
'where p.is_deleted_yn = ''Y''',
'    and p.deleted_on > (systimestamp - :P10_TIMEFRAME)',
'    and ( :P10_PROJECT is null or p.id = :P10_PROJECT )',
'    and ( :P10_UPDATE_BY is null or lower(p.created_by) = lower(:P10_UPDATE_BY) )',
'union all',
'select psi.created SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(psi.created_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(psi.created_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(psi.created_by,1,2),',
'                substr(psi.created_by,1,1)||substr(psi.created_by,instr(replace(psi.created_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    eba_proj_fw.get_name_from_email_address(psi.created_by) as user_name,',
'    psi.created EVENT_DATE,',
'    ''fa fa-check-circle-o'' EVENT_ICON,',
'    ''is-new'' EVENT_STATUS,',
'    ''New Issue'' EVENT_TYPE,',
'    substr((select substr(project,1,255)',
'            from eba_proj_status s',
'            where s.id = psi.project_id),1,150) EVENT_TITLE,',
'    substr(issue,1,255) EVENT_DESC,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||psi.project_id) event_link',
'from eba_proj_status_issues psi',
'where psi.created > (systimestamp - :P10_TIMEFRAME)',
'    and ( :P10_PROJECT is null or psi.project_id = :P10_PROJECT )',
'    and ( :P10_UPDATE_BY is null or lower(psi.created_by) = lower(:P10_UPDATE_BY) )',
'union all',
'select h.change_date SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(p.updated_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(p.updated_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(p.updated_by,1,2),',
'                substr(p.updated_by,1,1)||substr(p.updated_by,instr(replace(p.updated_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    eba_proj_fw.get_name_from_email_address(h.changed_by) as user_name,',
'    h.change_date EVENT_DATE,',
'    ''fa fa-archive'' EVENT_ICON,',
'    ''is-updated'' EVENT_STATUS,',
'    --''is-new is-updated is-removed',
'    ''Updated ''||initcap(replace(replace(h.column_name,''_ID'',null),''_'','' '')) EVENT_TYPE,',
'    p.project EVENT_TITLE,',
'    case',
'        when (substr(h.old_value, 3, 1) = ''-'' and substr(h.old_value, 7, 1) = ''-'' and length(h.old_value) > 11) or',
'             (substr(h.new_value, 3, 1) = ''-'' and substr(h.new_value, 7, 1) = ''-'' and length(h.new_value) > 11) then',
'            ''Changed from <span class="t-Comments-text--prevValue">''||',
'            apex_escape.html(substr(h.old_value, 1, 11))||''</span>'' ||',
'            '' to <span class="t-Comments-text--newValue">''||',
'            apex_escape.html(substr(h.new_value, 1, 11))||''</span>''',
'        else',
'            ''Changed from <span class="t-Comments-text--prevValue">''||',
'            apex_escape.html(substr(h.old_value,1,255))||''</span>'' ||',
'            '' to <span class="t-Comments-text--newValue">''||',
'            apex_escape.html(substr(h.new_value,1,255))||''</span>''',
'    end as event_desc,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||p.id) event_link',
'from EBA_PROJ_STATUS p, eba_proj_history h',
'where h.COMPONENT_ID = p.id',
'    and h.change_date > (systimestamp - :P10_TIMEFRAME)',
'    and ( :P10_PROJECT is null or p.id = :P10_PROJECT )',
'    and ( :P10_UPDATE_BY is null or lower(h.changed_by) = lower(:P10_UPDATE_BY) )',
'union all',
'select h.change_date SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(h.changed_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(h.changed_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(h.changed_by,1,2),',
'                substr(h.changed_by,1,1)||substr(h.changed_by,instr(replace(h.changed_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    eba_proj_fw.get_name_from_email_address(h.changed_by) as user_name,',
'    h.change_date EVENT_DATE,',
'    ''fa fa-calendar'' EVENT_ICON,',
'    ''is-updated'' EVENT_STATUS,',
'    --''is-new is-updated is-removed',
'    ''Updated Milestone'' EVENT_TYPE,',
'    (   select project',
'        from eba_proj_status s',
'        where s.id = ms.project_id) EVENT_TITLE,',
'    case',
'        when (substr(h.old_value, 3, 1) = ''-'' and substr(h.old_value, 7, 1) = ''-'' and length(h.old_value) > 11) or',
'             (substr(h.new_value, 3, 1) = ''-'' and substr(h.new_value, 7, 1) = ''-'' and length(h.new_value) > 11) then',
'            apex_escape.html(substr(MILESTONE_NAME,1,255)/*||'' (''||lower(h.column_name)||'')''*/)||',
'            '' - Changed from <span class="t-Comments-text--prevValue">''||',
'            apex_escape.html(substr(h.old_value, 1, 11))||''</span>'' ||',
'            '' to <span class="t-Comments-text--newValue">''||',
'            apex_escape.html(substr(h.new_value, 1, 11))||''</span>''',
'        else',
'            apex_escape.html(substr(MILESTONE_NAME,1,255)/*||'' (''||lower(h.column_name)||'')''*/)||',
'            '' - Changed from <span class="t-Comments-text--prevValue">''||',
'            apex_escape.html(substr(h.old_value,1,255))||''</span>'' ||',
'            '' to <span class="t-Comments-text--newValue">''||',
'            apex_escape.html(substr(h.new_value,1,255))||''</span>''',
'    end as event_desc,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||ms.project_id) event_link',
'from EBA_PROJ_STATUS_MS ms, eba_proj_history h',
'where h.COMPONENT_ID = ms.id',
'    and h.change_date > (systimestamp - :P10_TIMEFRAME)',
'    and ( :P10_PROJECT is null or ms.project_id = :P10_PROJECT )',
'    and ( :P10_UPDATE_BY is null or lower(h.changed_by) = lower(:P10_UPDATE_BY) )',
'union all',
'select h.change_date SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(h.changed_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(h.changed_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(h.changed_by,1,2),',
'                substr(h.changed_by,1,1)||substr(h.changed_by,instr(replace(h.changed_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    eba_proj_fw.get_name_from_email_address(h.changed_by) as user_name,',
'    h.change_date EVENT_DATE,',
'    ''fa fa-check-circle-o'' EVENT_ICON,',
'    ''is-updated'' EVENT_STATUS,',
'    ''Updated Action Item'' EVENT_TYPE,',
'    (   select project',
'        from eba_proj_status s',
'        where s.id = ai.project_id) EVENT_TITLE,',
'    case',
'        when (substr(h.old_value, 3, 1) = ''-'' and substr(h.old_value, 7, 1) = ''-'' and length(h.old_value) > 11) or',
'             (substr(h.new_value, 3, 1) = ''-'' and substr(h.new_value, 7, 1) = ''-'' and length(h.new_value) > 11) then',
'            action||',
'            '' - Changed from <span class="t-Comments-text--prevValue">''||',
'            apex_escape.html(substr(h.old_value, 1, 11))||''</span>'' ||',
'            '' to <span class="t-Comments-text--newValue">''||',
'            apex_escape.html(substr(h.new_value, 1, 11))||''</span>''',
'        else',
'            action||',
'            '' - Changed from <span class="t-Comments-text--prevValue">''||',
'            apex_escape.html(substr(h.old_value,1,255))||''</span>'' ||',
'            '' to <span class="t-Comments-text--newValue">''||',
'            apex_escape.html(substr(h.new_value,1,255))||''</span>''',
'    end as event_desc,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||ai.project_id) event_link',
'from eba_proj_status_ais ai, eba_proj_history h',
'where h.COMPONENT_ID = ai.id',
'    and h.change_date > (systimestamp - :P10_TIMEFRAME)',
'    and ( :P10_PROJECT is null or ai.project_id = :P10_PROJECT )',
'    and ( :P10_UPDATE_BY is null or lower(h.changed_by) = lower(:P10_UPDATE_BY) )',
'union all',
'select h.change_date sort_column,',
'    null event_attributes,',
'    null event_modifiers,',
'    ''u-color-''||(ora_hash(h.changed_by,44) + 1) user_color,',
'    upper( decode(instr(replace(h.changed_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(h.changed_by,1,2),',
'                substr(h.changed_by,1,1)||substr(h.changed_by,instr(replace(h.changed_by,''.'','' ''),'' '')+1,1)',
'           ))  user_avatar,',
'    eba_proj_fw.get_name_from_email_address(h.changed_by) as user_name,',
'    h.change_date event_date,',
'    ''fa fa-check-circle-o'' event_icon,',
'    ''is-updated'' event_status,',
'    ''Updated Issue'' event_type,',
'    (   select project',
'        from eba_proj_status s',
'        where s.id = i.project_id) event_title,',
'    case',
'        when (substr(h.old_value, 3, 1) = ''-'' and substr(h.old_value, 7, 1) = ''-'' and length(h.old_value) > 11) or',
'             (substr(h.new_value, 3, 1) = ''-'' and substr(h.new_value, 7, 1) = ''-'' and length(h.new_value) > 11) then',
'            i.issue||',
'            '' - Changed from <span class="t-Comments-text--prevValue">''||',
'            apex_escape.html(substr(h.old_value, 1, 11))||''</span>'' ||',
'            '' to <span class="t-Comments-text--newValue">''||',
'            apex_escape.html(substr(h.new_value, 1, 11))||''</span>''',
'        else',
'            i.issue||',
'            '' - Changed from <span class="t-Comments-text--prevValue">''||',
'            apex_escape.html(substr(h.old_value,1,255))||''</span>'' ||',
'            '' to <span class="t-Comments-text--newValue">''||',
'            apex_escape.html(substr(h.new_value,1,255))||''</span>''',
'    end as event_desc,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||i.project_id) event_link',
'from eba_proj_status_issues i, eba_proj_history h',
'where h.component_id = i.id',
'    and h.table_name = ''STATUS_ISSUES''',
'    and h.change_date > (systimestamp - :P10_TIMEFRAME)',
'    and ( :P10_PROJECT is null or i.project_id = :P10_PROJECT )',
'    and ( :P10_UPDATE_BY is null or lower(h.changed_by) = lower(:P10_UPDATE_BY) )',
'union all',
'select rf.updated SORT_COLUMN,',
'    null EVENT_ATTRIBUTES,',
'    null EVENT_MODIFIERS,',
'    ''u-color-''|| (ora_hash(rf.updated_by,44) + 1) USER_COLOR,',
'    upper( decode(instr(replace(rf.updated_by,''.'','' ''),'' ''),',
'                0, ',
'                substr(rf.updated_by,1,2),',
'                substr(rf.updated_by,1,1)||substr(rf.updated_by,instr(replace(rf.updated_by,''.'','' ''),'' '')+1,1)',
'           ))  USER_AVATAR,',
'    eba_proj_fw.get_name_from_email_address(rf.updated_by) as user_name,',
'    rf.updated EVENT_DATE,',
'    ''fa fa-user'' EVENT_ICON,',
'    ''is-new'' EVENT_STATUS,',
'    ''Person Updated'' EVENT_TYPE,',
'    s.project EVENT_TITLE,',
'    lower(u.username)||'' (''||decode(nvl(rf.acl_status_level,r.default_acl_status_level),',
'                                  3,''Full'',2,''Edit'',1,''Read'')||'')'' EVENT_DESC,',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||rf.project_id) event_link',
'from EBA_PROJ_STATUS_users u,',
'    eba_proj_user_ref rf,',
'    eba_proj_roles r,',
'    eba_proj_status s',
'where rf.updated > (systimestamp - :P10_TIMEFRAME)',
'    and rf.user_id = u.id',
'    and rf.role_id = r.id',
'    and rf.project_id = s.id',
'    and ( :P10_PROJECT is null or rf.project_id = :P10_PROJECT )',
'    and ( :P10_UPDATE_BY is null or lower(rf.updated_by) = lower(:P10_UPDATE_BY) )',
'order by 1 desc'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P10_PROJECT,P10_UPDATE_BY,P10_TIMEFRAME'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(5262855943642383379)
,p_query_num_rows=>250
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' - '
,p_query_no_data_found=>'No changes found'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>500
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5264938218945047555)
,p_query_column_id=>1
,p_column_alias=>'SORT_COLUMN'
,p_column_display_sequence=>12
,p_column_heading=>'Sort Column'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5264907107359875446)
,p_query_column_id=>2
,p_column_alias=>'EVENT_ATTRIBUTES'
,p_column_display_sequence=>1
,p_column_heading=>'Event Attributes'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6207388838092043050)
,p_query_column_id=>3
,p_column_alias=>'EVENT_MODIFIERS'
,p_column_display_sequence=>13
,p_column_heading=>'Event Modifiers'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5264907498562875447)
,p_query_column_id=>4
,p_column_alias=>'USER_COLOR'
,p_column_display_sequence=>2
,p_column_heading=>'User Color'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5264907911849875448)
,p_query_column_id=>5
,p_column_alias=>'USER_AVATAR'
,p_column_display_sequence=>3
,p_column_heading=>'User Avatar'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5264908345243875448)
,p_query_column_id=>6
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>4
,p_column_heading=>'User Name'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5264908747216875448)
,p_query_column_id=>7
,p_column_alias=>'EVENT_DATE'
,p_column_display_sequence=>5
,p_column_heading=>'Event Date'
,p_column_format=>'SINCE'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'YES'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5264909106441875448)
,p_query_column_id=>8
,p_column_alias=>'EVENT_ICON'
,p_column_display_sequence=>6
,p_column_heading=>'Event Icon'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5264909562114875449)
,p_query_column_id=>9
,p_column_alias=>'EVENT_STATUS'
,p_column_display_sequence=>7
,p_column_heading=>'Event Status'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5264909882850875449)
,p_query_column_id=>10
,p_column_alias=>'EVENT_TYPE'
,p_column_display_sequence=>8
,p_column_heading=>'Event Type'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5264910378585875450)
,p_query_column_id=>11
,p_column_alias=>'EVENT_TITLE'
,p_column_display_sequence=>9
,p_column_heading=>'Event Title'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5264910745139875450)
,p_query_column_id=>12
,p_column_alias=>'EVENT_DESC'
,p_column_display_sequence=>10
,p_column_heading=>'Event Desc'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(5264930799859976752)
,p_query_column_id=>13
,p_column_alias=>'EVENT_LINK'
,p_column_display_sequence=>11
,p_column_heading=>'Event Link'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8903315819290288568)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>100
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(15010744142603268059)
,p_plug_name=>'Filter Controls'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody:t-Form--stretchInputs'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>10
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_display_point=>'REGION_POSITION_02'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML')).to_clob
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(16952189662984141721)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(15010744142603268059)
,p_button_name=>'P10_RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_image_alt=>'Reset'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:RP,10::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(8904296836174351367)
,p_branch_action=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:RP,10:P8_SEARCH:&P10_SEARCH.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_comment=>'Created 07-OCT-2010 13:32 by MIKE'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15010744290675268060)
,p_name=>'P10_PROJECT'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(15010744142603268059)
,p_prompt=>'Project'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select project d, id r',
'from eba_proj_status',
'order by upper(project)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Projects -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15010744320060268061)
,p_name=>'P10_UPDATE_BY'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(15010744142603268059)
,p_prompt=>'Updated by'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select lower(username) d, lower(username) r',
'from eba_proj_status_users',
'order by lower(username)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- Anyone -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(15010744504144268062)
,p_name=>'P10_TIMEFRAME'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(15010744142603268059)
,p_item_default=>'7'
,p_prompt=>'Timeframe'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC2:Day;1,Week;7,30 Days;30,60 Days;60,Year;365'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(6097087700835306796)
,p_computation_sequence=>30
,p_computation_item=>'APPLICATION_TITLE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'FUNCTION_BODY'
,p_computation_language=>'PLSQL'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_app_name varchar2(255);',
'begin',
'    select nvl(preference_value,:APP_NAME)',
'      into l_app_name',
'      from eba_proj_preferences',
'     where preference_name = ''APPLICATION_TITLE'';',
'    return l_app_name;',
'exception',
'    when others then',
'        return :APP_NAME;',
'end;'))
,p_compute_when=>'APPLICATION_TITLE'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(8906878236192517861)
,p_computation_sequence=>50
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'10'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(13084279296883234162)
,p_computation_sequence=>60
,p_computation_item=>'PROJECT_CAME_FROM'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15010744558834268063)
,p_name=>'Update Filters'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P10_PROJECT,P10_UPDATE_BY,P10_TIMEFRAME'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15711645044579245114)
,p_event_id=>wwv_flow_imp.id(15010744558834268063)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(5264906563518875432)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(6066462301131772255)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_PLSQL'
,p_process_name=>'replace commas'
,p_process_sql_clob=>':P10_SEARCH := replace(:P10_SEARCH,'','',''[comma]'');'
,p_process_clob_language=>'PLSQL'
,p_error_display_location=>'INLINE_IN_NOTIFICATION'
,p_internal_uid=>6066462301131772255
);
wwv_flow_imp.component_end;
end;
/
