prompt --application/shared_components/navigation/lists/p85_links
begin
--   Manifest
--     LIST: p85 links
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(7674732987766705606)
,p_name=>'p85 links'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'SELECT null the_target, ',
'        nvl(link_text, link_target)  label, ',
'       link_target target, ',
'       ''NO'' is_current, ',
'       '''' image, ',
'       '''' image_attrib, ',
'       null image_alt,',
'      null attribute1,',
'      ''target="_blank"'' attribute2',
'FROM  EBA_PROJ_STATUS_LINKS',
'where PROJECT_ID = :P85_ID and link_target is not null ',
'ORDER BY 2'))
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366590291
);
wwv_flow_imp.component_end;
end;
/
