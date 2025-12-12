prompt --application/deployment/install/upgrade_fix_flex_columns_missing_label_templates
begin
--   Manifest
--     INSTALL: UPGRADE-Fix Flex Columns Missing Label Templates
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(4233958793764951470)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Fix Flex Columns Missing Label Templates'
,p_sequence=>1350
,p_script_type=>'UPGRADE'
,p_condition_type=>'FUNCTION_BODY'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    l_tmplt_missing_yn varchar2(1) := ''N'';',
'begin',
'    for c in',
'    (select label_template_id from eba_proj_flex_registry)',
'    loop',
'        begin',
'            select ''N'' into l_tmplt_missing_yn from apex_application_templates where template_id = c.label_template_id and template_type = ''Item Label'';',
'        exception',
'            when no_data_found then',
'                l_tmplt_missing_yn := ''Y'';',
'        end;',
'        if l_tmplt_missing_yn = ''Y'' then',
'            return true;',
'        end if;',
'    end loop;',
'    return false;',
'end;'))
,p_condition2=>'PLSQL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update eba_proj_flex_registry',
'   set label_template_id = (select template_id from apex_application_templates where template_name = nvl(label_template_name,''Optional'') and template_type = ''Item Label'' and application_id = (select max(application_id) from apex_applications where ap'
||'plication_name like ''P-Track%''))',
' where is_required_yn = ''N''',
'   and active_yn = ''Y'';',
'',
'update eba_proj_flex_registry',
'   set label_template_id = (select template_id from apex_application_templates where template_name = nvl(label_template_name,''Required'') and template_type = ''Item Label'' and application_id = (select max(application_id) from apex_applications where ap'
||'plication_name like ''P-Track%''))',
' where is_required_yn = ''Y''',
'   and active_yn = ''Y'';'))
);
wwv_flow_imp.component_end;
end;
/
