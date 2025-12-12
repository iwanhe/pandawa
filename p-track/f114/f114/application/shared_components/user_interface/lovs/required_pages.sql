prompt --application/shared_components/user_interface/lovs/required_pages
begin
--   Manifest
--     REQUIRED PAGES
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
 p_id=>wwv_flow_imp.id(628409035579548121)
,p_lov_name=>'REQUIRED PAGES'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select distinct page_id || '' - '' || apex_escape.html(page_name) d, page_id r',
'  from  apex_application_page_items',
' where application_id = :APP_ID',
'   and is_required = ''No''',
'  and item_label_template not in (''Hidden'',''Required'')',
'order by page_id asc;'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567366592767
);
wwv_flow_imp.component_end;
end;
/
