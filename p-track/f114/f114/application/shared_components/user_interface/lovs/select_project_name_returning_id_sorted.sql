prompt --application/shared_components/user_interface/lovs/select_project_name_returning_id_sorted
begin
--   Manifest
--     SELECT PROJECT NAME RETURNING ID SORTED
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
 p_id=>wwv_flow_imp.id(8910428237246712346)
,p_lov_name=>'SELECT PROJECT NAME RETURNING ID SORTED'
,p_lov_query=>'select project, id from eba_proj_status order by 1'
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567366592912
);
wwv_flow_imp.component_end;
end;
/
