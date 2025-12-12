prompt --application/deployment/install/upgrade_add_label_template_name_to_flex_registry
begin
--   Manifest
--     INSTALL: UPGRADE-Add label_template_name to flex registry
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
 p_id=>wwv_flow_imp.id(4235355113288519687)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Add label_template_name to flex registry'
,p_sequence=>1340
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tab_cols',
'where table_name = ''EBA_PROJ_FLEX_REGISTRY''',
'    and column_name = ''LABEL_TEMPLATE_NAME'''))
,p_script_clob=>'alter table eba_proj_flex_registry add label_template_name varchar2(255);'
);
wwv_flow_imp.component_end;
end;
/
