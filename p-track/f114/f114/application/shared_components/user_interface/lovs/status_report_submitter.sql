prompt --application/shared_components/user_interface/lovs/status_report_submitter
begin
--   Manifest
--     STATUS REPORT SUBMITTER
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
 p_id=>wwv_flow_imp.id(6072689213770175339)
,p_lov_name=>'STATUS REPORT SUBMITTER'
,p_lov_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'     distinct',
'     case',
'         when instr(u.update_owner,''@'') > 0 then',
'             case',
'                 when instr( replace( substr( u.update_owner, 1, instr(u.update_owner,''@'' ) - 1), ''.'', '' '' ), '' '', 1, 2 ) > 0 then',
'                     substr( replace( substr( initcap(u.update_owner), 1, instr(initcap(u.update_owner),''@'' ) - 1), ''.'', '' '' ), 1, instr( replace( substr( initcap(u.update_owner), 1, instr(initcap(u.update_owner),''@'' ) - 1), ''.'', '' '' ), '' '', 1, 1 ) )'
||' ||',
'                     substr( replace( substr( initcap(u.update_owner), 1, instr(initcap(u.update_owner),''@'' ) - 1), ''.'', '' '' ), instr( replace( substr( initcap(u.update_owner), 1, instr(initcap(u.update_owner),''@'' ) - 1), ''.'', '' '' ), '' '', 1, 2 ) )',
'             else',
'                 replace( substr( initcap(u.update_owner), 1, instr(initcap(u.update_owner),''@'' ) - 1), ''.'', '' '' )',
'             end',
'     else',
'         lower(u.update_owner)',
'     end d,',
'     lower(u.update_owner) r',
'from EBA_PROJ_STATUS_RPTS u,',
'     EBA_PROJ_STATUS p',
'where p.id = u.project_id ',
'order by 1'))
,p_source_type=>'LEGACY_SQL'
,p_location=>'LOCAL'
,p_version_scn=>39567366592925
);
wwv_flow_imp.component_end;
end;
/
