prompt --application/shared_components/user_interface/lovs/opt_in_users_with_past_due_deliverables
begin
--   Manifest
--     OPT-IN USERS WITH PAST DUE DELIVERABLES
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(16960157871061038132)
,p_lov_name=>'OPT-IN USERS WITH PAST DUE DELIVERABLES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct lower(x.owner) d, lower(x.owner) r',
'from (',
'    select  ais.action_owner_01 as owner, nvl(u.past_due_reminders_freq,''DAILY'') as pdrs from eba_proj_status_ais ais, eba_proj_status_users u where upper(ais.action_owner_01) = u.username and ais.owner_role_id is null',
'    union all',
'    select ais.action_owner_02 as owner, nvl(u.past_due_reminders_freq,''DAILY'') as pdrs from eba_proj_status_ais ais, eba_proj_status_users u where upper(ais.action_owner_02) = u.username and ais.owner_role_id is null',
'    union all',
'    select ais.action_owner_03 as owner, nvl(u.past_due_reminders_freq,''DAILY'') as pdrs from eba_proj_status_ais ais, eba_proj_status_users u where upper(ais.action_owner_03) = u.username and ais.owner_role_id is null',
'    union all',
'    select ais.action_owner_04 as owner, nvl(u.past_due_reminders_freq,''DAILY'') as pdrs  from eba_proj_status_ais ais, eba_proj_status_users u where upper(ais.action_owner_04) = u.username and ais.owner_role_id is null',
'    union all',
'    select u.username as owner, nvl(u.past_due_reminders_freq,''DAILY'') as pdrs',
'      from eba_proj_status_users u',
'     where exists (  select null',
'                       from eba_proj_status_ais a,',
'                            eba_proj_user_ref rf',
'                      where rf.role_id = a.owner_role_id',
'                        and rf.project_id = a.project_id',
'                        and rf.user_id = u.id',
'    )',
') x',
'where x.owner is not null',
'  and x.pdrs != ''NEVER''',
'  and exists (select null',
'                from eba_proj_status_ais$ a,',
'                     eba_proj_status$ p,',
'                     eba_proj_status_codes s',
'               where p.id = a.project_id',
'                 and p.project_status = s.id (+)',
'                 and s.is_closed_status != ''Y''',
'                 and p.is_deleted_yn = ''N''',
'                 and a.action_status = ''Open''',
'                 and a.due_date < sysdate',
'                 and ( a.action_owner_01 = x.owner',
'                        or a.action_owner_02 = x.owner',
'                        or a.action_owner_03 = x.owner',
'                        or a.action_owner_04 = x.owner',
'                        or exists ( select null',
'                                    from eba_proj_user_ref rf,',
'                                        eba_proj_status_users u',
'                                    where rf.role_id = a.owner_role_id',
'                                        and rf.project_id = a.project_id',
'                                        and rf.user_id = u.id',
'                                        and u.username = x.owner',
'                                        and nvl(u.past_due_reminders_freq,''NEVER'') != ''NEVER''',
'                        )',
'                    )',
'                union all',
'                select null',
'                from eba_proj_status_ms$ m,',
'                    eba_proj_status$ p,',
'                    eba_proj_status_codes s',
'                where p.id = m.project_id',
'                    and p.project_status = s.id (+)',
'                    and s.is_closed_status != ''Y''',
'                    and m.milestone_status = ''Open''',
'                    and m.milestone_date < sysdate',
'                    and p.is_deleted_yn = ''N''',
'                    and ( m.milestone_owner = x.owner',
'                        or exists ( select null',
'                                    from eba_proj_user_ref rf,',
'                                        eba_proj_status_users u',
'                                    where rf.role_id = m.owner_role_id',
'                                        and rf.project_id = m.project_id',
'                                        and rf.user_id = u.id',
'                                        and u.username = x.owner',
'                                        and nvl(u.past_due_reminders_freq,''NEVER'') != ''NEVER''',
'                        )',
'                    )',
'        )',
'order by 1'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567366591787
);
wwv_flow_imp.component_end;
end;
/
