prompt --application/deployment/install/upgrade_ms_ai_number_views
begin
--   Manifest
--     INSTALL: UPGRADE-MS/AI Number Views
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
 p_id=>wwv_flow_imp.id(1225453079933455947)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'MS/AI Number Views'
,p_sequence=>820
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tables',
'where table_name = ''EBA_PROJ_STATUS_MS_NO_TBL'';'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- Drop the views from previous versions of P-Track.',
'begin',
'    for c1 in ( select mview_name',
'                from user_mviews',
'                where mview_name in (''EBA_PROJ_STATUS_MS_NO_MV'',''EBA_PROJ_STATUS_AI_NO'',''EBA_PROJ_STATUS_AI_NO_MV'') ) loop',
'        execute immediate ''drop materialized view ''||c1.mview_name;',
'    end loop;',
'    for c1 in ( select view_name',
'                from user_views',
'                where view_name in (''EBA_PROJ_STATUS_MS_NO'',''EBA_PROJ_STATUS_AI_NO'') ) loop',
'        execute immediate ''drop view ''||c1.view_name;',
'    end loop;',
'end;',
'/',
'',
'create table eba_proj_status_ms_no_tbl as',
'select ms.project_id,',
'    ms.id milestone_id,',
'    rank() over (partition by ms.project_id',
'                 order by ms.milestone_start_date, lower(ms.milestone_name)) by_start_date,',
'    rank() over (partition by ms.project_id',
'                 order by ms.milestone_date, lower(ms.milestone_name)) by_end_date',
'from eba_proj_status_ms$ ms;',
'',
'create unique index eba_proj_status_ms_no_tbl_idx on',
'    eba_proj_status_ms_no_tbl ( project_id, milestone_id );',
'',
'create or replace view eba_proj_status_ms_no_v as ',
'  select mn.project_id,',
'    mn.milestone_id,',
'    case when ( select nvl(preference_value,''END'')',
'                from eba_proj_preferences',
'                where preference_name = ''MILESTONE_SORT_ORDER'') = ''START'' then',
'            mn.by_start_date',
'        else',
'            mn.by_end_date',
'    end as milestone_number',
'from eba_proj_status_ms_no_tbl mn;',
'',
'create table eba_proj_status_ai_no_tbl as ',
'  select ai.project_id,',
'    ai.milestone_id,',
'    ai.id action_item_id,',
'    rank() over (partition by ai.project_id, ai.milestone_id order by nvl(ai.completed_date,ai.due_date), lower(ai.action)) action_item_number',
'from eba_proj_status_ais$ ai;',
'',
'create unique index eba_proj_status_ai_no_tbl_idx on',
'    eba_proj_status_ai_no_tbl ( project_id, milestone_id, action_item_id );',
'    ',
'create or replace trigger aiud_eba_proj_status_ms_no',
'    after insert or update or delete on eba_proj_status_ms$',
'--    for each row -- Note: this trigger is a STATEMENT trigger, rather than a ROW trigger.',
'begin',
'    delete from  eba_proj_status_ms_no_tbl;',
'',
'    insert into eba_proj_status_ms_no_tbl ( project_id, milestone_id, by_start_date, by_end_date )',
'    select ms.project_id,',
'        ms.id milestone_id,',
'        rank() over (partition by ms.project_id',
'                     order by ms.milestone_start_date, lower(ms.milestone_name)) by_start_date,',
'        rank() over (partition by ms.project_id',
'                     order by ms.milestone_date, lower(ms.milestone_name)) by_end_date',
'    from eba_proj_status_ms$ ms',
'    where ms.is_deleted_yn = ''N'';',
'end;',
'/',
'',
'create or replace trigger aiud_eba_proj_status_ai_no',
'    after insert or update or delete on eba_proj_status_ais$',
'--    for each row -- Note: this trigger is a STATEMENT trigger, rather than a ROW trigger.',
'begin',
'    delete from  eba_proj_status_ai_no_tbl;',
'',
'    insert into eba_proj_status_ai_no_tbl ( project_id, milestone_id, action_item_id, action_item_number )',
'    select ai.project_id,',
'        ai.milestone_id,',
'        ai.id action_item_id,',
'        rank() over (partition by ai.project_id, ai.milestone_id',
'                     order by nvl(ai.completed_date,ai.due_date), lower(ai.action)) action_item_number',
'    from eba_proj_status_ais$ ai',
'    where ai.is_deleted_yn = ''N'';',
'end;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
