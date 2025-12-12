prompt --application/shared_components/navigation/lists/p85_child_projects
begin
--   Manifest
--     LIST: p85 child projects
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
 p_id=>wwv_flow_imp.id(7674722979660638551)
,p_name=>'p85 child projects'
,p_list_type=>'SQL_QUERY'
,p_list_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    null      the_level,',
'    project the_label, ',
'    apex_util.prepare_url(''f?p=''||:APP_ID||'':85:''||:APP_SESSION',
'        ||'':::85:P85_ID,PROJECT_CAME_FROM:''||id||'',85'') target,',
'    ''NO'' is_current_list_entry,',
'    null image,',
'    null image_alt_attributes',
'from eba_proj_status',
'where parent_project_id = :P85_ID',
'order by lower(project), id'))
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366590291
);
wwv_flow_imp.component_end;
end;
/
