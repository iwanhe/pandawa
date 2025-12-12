prompt --application/shared_components/user_interface/lovs/users
begin
--   Manifest
--     USERS
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
 p_id=>wwv_flow_imp.id(11568550043665369916)
,p_lov_name=>'USERS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select u.username d, u.id r',
'from eba_proj_status_users u',
'order by upper(u.username)'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567366593090
);
wwv_flow_imp.component_end;
end;
/
