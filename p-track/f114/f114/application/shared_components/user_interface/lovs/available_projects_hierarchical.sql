prompt --application/shared_components/user_interface/lovs/available_projects_hierarchical
begin
--   Manifest
--     AVAILABLE PROJECTS (HIERARCHICAL)
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
 p_id=>wwv_flow_imp.id(8040814539990427487)
,p_lov_name=>'AVAILABLE PROJECTS (HIERARCHICAL)'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with data as (',
'    select parent_project_id, id, project',
'    from eba_proj_status',
'    where project_status not in ( select id',
'                                  from eba_proj_status_codes',
'                                  where is_closed_status = ''Y''',
'                            )',
'        and eba_proj_fw.is_edit_authorized( p_username => ''APP_USER'',',
'                                            p_project_id => id ) = ''Y''',
'',
')',
'select d, r',
'from ( select ltrim(replace(SYS_CONNECT_BY_PATH(project, '':TREESEP:''), '':TREESEP:'','' / ''), ''/ '') d,',
'           id r',
'       from data',
'       start with parent_project_id is null',
'           connect by prior id = parent_project_id',
'           order siblings by project )',
'union all',
'select ps.project d, ps.id r',
'from data ps',
'where ps.parent_project_id is not null',
'    and not exists ( select null',
'                     from data p2',
'                     where p2.id = ps.parent_project_id );'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567366590997
);
wwv_flow_imp.component_end;
end;
/
