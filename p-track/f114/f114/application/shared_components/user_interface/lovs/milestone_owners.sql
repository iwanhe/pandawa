prompt --application/shared_components/user_interface/lovs/milestone_owners
begin
--   Manifest
--     MILESTONE OWNERS
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
 p_id=>wwv_flow_imp.id(15294862243326997855)
,p_lov_name=>'MILESTONE OWNERS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct owner d, owner r',
'from (',
'    select lower(x.milestone_owner) owner',
'    from eba_proj_status_ms x',
'    where x.owner_role_id is null',
'    union all',
'    select lower(u.username) owner',
'    from eba_proj_status_ms x,',
'        eba_proj_user_ref rf,',
'        eba_proj_status_users u',
'    where rf.role_id = x.owner_role_id',
'        and rf.project_id = x.project_id',
'        and u.id = rf.user_id',
')',
'where owner is not null',
'order by owner'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567366591462
);
wwv_flow_imp.component_end;
end;
/
