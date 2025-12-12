prompt --application/shared_components/user_interface/lovs/users_with_past_due_deliverables
begin
--   Manifest
--     USERS WITH PAST DUE DELIVERABLES
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
 p_id=>wwv_flow_imp.id(11879446140398963745)
,p_lov_name=>'USERS WITH PAST DUE DELIVERABLES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct lower(x.owner) d, lower(x.owner) r',
'from (',
'    select action_owner_01 owner from eba_proj_status_ais where owner_role_id is null',
'    union all',
'    select action_owner_02 owner from eba_proj_status_ais where owner_role_id is null',
'    union all',
'    select action_owner_03 owner from eba_proj_status_ais where owner_role_id is null',
'    union all',
'    select action_owner_04 owner from eba_proj_status_ais where owner_role_id is null',
'    union all',
'    select u.username owner',
'    from eba_proj_status_users u',
'    where exists (  select null',
'                    from eba_proj_status_ais a,',
'                        eba_proj_user_ref rf',
'                    where rf.role_id = a.owner_role_id',
'                        and rf.project_id = a.project_id',
'                        and rf.user_id = u.id',
'    )',
') x',
'where x.owner is not null',
'    and exists (select null',
'                from eba_proj_status_ais$ a,',
'                    eba_proj_status$ p,',
'                    eba_proj_status_codes s',
'                where p.id = a.project_id',
'                    and p.project_status = s.id (+)',
'                    and p.is_deleted_yn = ''N''',
'                    and a.action_status = ''Open''',
'                    and a.due_date < sysdate',
'                    and ( a.action_owner_01 = x.owner',
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
'                        )',
'                    )',
'                union all',
'                select null',
'                from eba_proj_status_ms$ m,',
'                    eba_proj_status$ p,',
'                    eba_proj_status_codes s',
'                where p.id = m.project_id',
'                    and p.project_status = s.id (+)',
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
'                        )',
'                    )',
'        )',
'order by 1'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567366593090
);
wwv_flow_imp.component_end;
end;
/
