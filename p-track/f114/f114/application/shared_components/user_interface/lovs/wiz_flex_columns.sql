prompt --application/shared_components/user_interface/lovs/wiz_flex_columns
begin
--   Manifest
--     WIZ_FLEX_COLUMNS
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
 p_id=>wwv_flow_imp.id(6143647709869080881)
,p_lov_name=>'WIZ_FLEX_COLUMNS'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'with cols as (',
'    select flexible_column,',
'        case',
'             when flexible_column like ''%FLEX_N%'' then ''Number''',
'             when flexible_column like ''%FLEX_D%'' then ''Date''',
'             when flexible_column like ''%FLEX_CLOB'' then ''Large Text''',
'             else ''Text''',
'        end as col_type',
'    from eba_proj_flex_registry',
'    where flexible_table = :P143_FLEX_TABLE',
'        and assigned_yn = ''N''',
')',
'select col_type as dv,',
'    min( flexible_column ) as rv',
'from cols',
'group by col_type',
'order by col_type'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567366593090
);
wwv_flow_imp.component_end;
end;
/
