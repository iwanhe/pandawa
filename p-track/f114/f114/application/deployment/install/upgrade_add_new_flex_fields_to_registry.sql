prompt --application/deployment/install/upgrade_add_new_flex_fields_to_registry
begin
--   Manifest
--     INSTALL: UPGRADE-Add New Flex Fields to registry
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
 p_id=>wwv_flow_imp.id(4007910802037886657)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Add New Flex Fields to registry'
,p_sequence=>780
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from EBA_PROJ_FLEX_REGISTRY',
'where FLEXIBLE_TABLE = ''EBA_PROJ_STATUS''',
'    and FLEXIBLE_COLUMN = ''PROJECT_FLEX_D12'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'insert into eba_proj_flex_registry',
'(FLEXIBLE_TABLE, FLEXIBLE_COLUMN, ASSIGNED_YN, ACTIVE_YN, REPORT_CSS_CLASS, TABLE_PREFIX, DISPLAY_NAME_SING, DISPLAY_NAME_PLRL, FORM_LABEL_TEXT, IS_REQUIRED_YN, IS_DISPLAYED_ON_IR, LABEL_TEMPLATE_ID, DISPLAY_AS, WIDTH, MAX_WIDTH, HEIGHT, CONDITION_TY'
||'PE, CONDITION1)',
'values',
'(''EBA_PROJ_STATUS'',''PROJECT_FLEX_D05'', ''N'', ''N'', ''flex_projects'', ''PROJECT'', ''Project'', ''Projects'', ''PROJECT_FLEX_D05'', ''N'', ''N'', 0, ''TEXT'', 30, 4000, 1, ''EXISTS'', ''select null from eba_proj_flex_registry where flexible_table = "EBA_PROJ_STATUS" and '
||'flexible_column = "PROJECT_FLEX_D05" and active_yn = "Y" and assigned_yn = "Y"'');',
'',
'insert into eba_proj_flex_registry',
'(FLEXIBLE_TABLE, FLEXIBLE_COLUMN, ASSIGNED_YN, ACTIVE_YN, REPORT_CSS_CLASS, TABLE_PREFIX, DISPLAY_NAME_SING, DISPLAY_NAME_PLRL, FORM_LABEL_TEXT, IS_REQUIRED_YN, IS_DISPLAYED_ON_IR, LABEL_TEMPLATE_ID, DISPLAY_AS, WIDTH, MAX_WIDTH, HEIGHT, CONDITION_TY'
||'PE, CONDITION1)',
'values',
'(''EBA_PROJ_STATUS'',''PROJECT_FLEX_D06'', ''N'', ''N'', ''flex_projects'', ''PROJECT'', ''Project'', ''Projects'', ''PROJECT_FLEX_D06'', ''N'', ''N'', 0, ''TEXT'', 30, 4000, 1, ''EXISTS'', ''select null from eba_proj_flex_registry where flexible_table = "EBA_PROJ_STATUS" and '
||'flexible_column = "PROJECT_FLEX_D06" and active_yn = "Y" and assigned_yn = "Y"'');',
'',
'insert into eba_proj_flex_registry',
'(FLEXIBLE_TABLE, FLEXIBLE_COLUMN, ASSIGNED_YN, ACTIVE_YN, REPORT_CSS_CLASS, TABLE_PREFIX, DISPLAY_NAME_SING, DISPLAY_NAME_PLRL, FORM_LABEL_TEXT, IS_REQUIRED_YN, IS_DISPLAYED_ON_IR, LABEL_TEMPLATE_ID, DISPLAY_AS, WIDTH, MAX_WIDTH, HEIGHT, CONDITION_TY'
||'PE, CONDITION1)',
'values',
'(''EBA_PROJ_STATUS'',''PROJECT_FLEX_D07'', ''N'', ''N'', ''flex_projects'', ''PROJECT'', ''Project'', ''Projects'', ''PROJECT_FLEX_D07'', ''N'', ''N'', 0, ''TEXT'', 30, 4000, 1, ''EXISTS'', ''select null from eba_proj_flex_registry where flexible_table = "EBA_PROJ_STATUS" and '
||'flexible_column = "PROJECT_FLEX_D07" and active_yn = "Y" and assigned_yn = "Y"'');',
'',
'insert into eba_proj_flex_registry',
'(FLEXIBLE_TABLE, FLEXIBLE_COLUMN, ASSIGNED_YN, ACTIVE_YN, REPORT_CSS_CLASS, TABLE_PREFIX, DISPLAY_NAME_SING, DISPLAY_NAME_PLRL, FORM_LABEL_TEXT, IS_REQUIRED_YN, IS_DISPLAYED_ON_IR, LABEL_TEMPLATE_ID, DISPLAY_AS, WIDTH, MAX_WIDTH, HEIGHT, CONDITION_TY'
||'PE, CONDITION1)',
'values',
'(''EBA_PROJ_STATUS'',''PROJECT_FLEX_D08'', ''N'', ''N'', ''flex_projects'', ''PROJECT'', ''Project'', ''Projects'', ''PROJECT_FLEX_D08'', ''N'', ''N'', 0, ''TEXT'', 30, 4000, 1, ''EXISTS'', ''select null from eba_proj_flex_registry where flexible_table = "EBA_PROJ_STATUS" and '
||'flexible_column = "PROJECT_FLEX_D08" and active_yn = "Y" and assigned_yn = "Y"'');',
'',
'insert into eba_proj_flex_registry',
'(FLEXIBLE_TABLE, FLEXIBLE_COLUMN, ASSIGNED_YN, ACTIVE_YN, REPORT_CSS_CLASS, TABLE_PREFIX, DISPLAY_NAME_SING, DISPLAY_NAME_PLRL, FORM_LABEL_TEXT, IS_REQUIRED_YN, IS_DISPLAYED_ON_IR, LABEL_TEMPLATE_ID, DISPLAY_AS, WIDTH, MAX_WIDTH, HEIGHT, CONDITION_TY'
||'PE, CONDITION1)',
'values',
'(''EBA_PROJ_STATUS'',''PROJECT_FLEX_D09'', ''N'', ''N'', ''flex_projects'', ''PROJECT'', ''Project'', ''Projects'', ''PROJECT_FLEX_D09'', ''N'', ''N'', 0, ''TEXT'', 30, 4000, 1, ''EXISTS'', ''select null from eba_proj_flex_registry where flexible_table = "EBA_PROJ_STATUS" and '
||'flexible_column = "PROJECT_FLEX_D09" and active_yn = "Y" and assigned_yn = "Y"'');',
'',
'insert into eba_proj_flex_registry',
'(FLEXIBLE_TABLE, FLEXIBLE_COLUMN, ASSIGNED_YN, ACTIVE_YN, REPORT_CSS_CLASS, TABLE_PREFIX, DISPLAY_NAME_SING, DISPLAY_NAME_PLRL, FORM_LABEL_TEXT, IS_REQUIRED_YN, IS_DISPLAYED_ON_IR, LABEL_TEMPLATE_ID, DISPLAY_AS, WIDTH, MAX_WIDTH, HEIGHT, CONDITION_TY'
||'PE, CONDITION1)',
'values',
'(''EBA_PROJ_STATUS'',''PROJECT_FLEX_D10'', ''N'', ''N'', ''flex_projects'', ''PROJECT'', ''Project'', ''Projects'', ''PROJECT_FLEX_D10'', ''N'', ''N'', 0, ''TEXT'', 30, 4000, 1, ''EXISTS'', ''select null from eba_proj_flex_registry where flexible_table = "EBA_PROJ_STATUS" and '
||'flexible_column = "PROJECT_FLEX_D10" and active_yn = "Y" and assigned_yn = "Y"'');',
'',
'insert into eba_proj_flex_registry',
'(FLEXIBLE_TABLE, FLEXIBLE_COLUMN, ASSIGNED_YN, ACTIVE_YN, REPORT_CSS_CLASS, TABLE_PREFIX, DISPLAY_NAME_SING, DISPLAY_NAME_PLRL, FORM_LABEL_TEXT, IS_REQUIRED_YN, IS_DISPLAYED_ON_IR, LABEL_TEMPLATE_ID, DISPLAY_AS, WIDTH, MAX_WIDTH, HEIGHT, CONDITION_TY'
||'PE, CONDITION1)',
'values',
'(''EBA_PROJ_STATUS'',''PROJECT_FLEX_D11'', ''N'', ''N'', ''flex_projects'', ''PROJECT'', ''Project'', ''Projects'', ''PROJECT_FLEX_D11'', ''N'', ''N'', 0, ''TEXT'', 30, 4000, 1, ''EXISTS'', ''select null from eba_proj_flex_registry where flexible_table = "EBA_PROJ_STATUS" and '
||'flexible_column = "PROJECT_FLEX_D11" and active_yn = "Y" and assigned_yn = "Y"'');',
'',
'insert into eba_proj_flex_registry',
'(FLEXIBLE_TABLE, FLEXIBLE_COLUMN, ASSIGNED_YN, ACTIVE_YN, REPORT_CSS_CLASS, TABLE_PREFIX, DISPLAY_NAME_SING, DISPLAY_NAME_PLRL, FORM_LABEL_TEXT, IS_REQUIRED_YN, IS_DISPLAYED_ON_IR, LABEL_TEMPLATE_ID, DISPLAY_AS, WIDTH, MAX_WIDTH, HEIGHT, CONDITION_TY'
||'PE, CONDITION1)',
'values',
'(''EBA_PROJ_STATUS'',''PROJECT_FLEX_D12'', ''N'', ''N'', ''flex_projects'', ''PROJECT'', ''Project'', ''Projects'', ''PROJECT_FLEX_D12'', ''N'', ''N'', 0, ''TEXT'', 30, 4000, 1, ''EXISTS'', ''select null from eba_proj_flex_registry where flexible_table = "EBA_PROJ_STATUS" and '
||'flexible_column = "PROJECT_FLEX_D12" and active_yn = "Y" and assigned_yn = "Y"'');'))
);
wwv_flow_imp.component_end;
end;
/
