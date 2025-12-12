prompt --application/shared_components/user_interface/lovs/count_of_project_updates_owners
begin
--   Manifest
--     COUNT OF PROJECT UPDATES OWNERS
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
 p_id=>wwv_flow_imp.id(6086626885991937933)
,p_lov_name=>'COUNT OF PROJECT UPDATES OWNERS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select eba_proj_fw.get_name_from_email_address(u.update_owner) || '' (''||count(*)||'')'' d,',
'       lower(u.update_owner) r',
'from eba_proj_status_updates u',
'where u.update_owner is not null ',
'group by eba_proj_fw.get_name_from_email_address(u.update_owner), lower(u.update_owner)',
'order by 1'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567366590998
);
wwv_flow_imp.component_end;
end;
/
