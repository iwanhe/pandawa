prompt --application/shared_components/user_interface/lovs/users
begin
--   Manifest
--     USERS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(2780290153907043674)
,p_lov_name=>'USERS'
,p_lov_query=>'select username, id from EBA_INTRACK_USERS order by 1'
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567690152430
);
wwv_flow_imp.component_end;
end;
/
