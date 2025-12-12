prompt --application/shared_components/user_interface/lovs/p182_template_milestones
begin
--   Manifest
--     P182 TEMPLATE MILESTONES
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
 p_id=>wwv_flow_imp.id(13522937200705858981)
,p_lov_name=>'P182 TEMPLATE MILESTONES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select m.name d, m.id r',
'from eba_proj_template_ms m',
'where m.template_id = :P182_TEMPLATE_ID',
'order by m.start_date_offset + m.due_date_offset, lower(m.name)'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567366591829
);
wwv_flow_imp.component_end;
end;
/
