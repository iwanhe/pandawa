prompt --application/shared_components/legacy_data_loads/eba_proj_template_ai
begin
--   Manifest
--     EBA_PROJ_TEMPLATE_AI
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_load_table(
 p_id=>wwv_flow_imp.id(13626168290611477748)
,p_name=>'Template Action Items'
,p_owner=>'#OWNER#'
,p_table_name=>'EBA_PROJ_TEMPLATE_AI'
,p_unique_column_1=>'ID'
,p_is_uk1_case_sensitive=>'N'
,p_is_uk2_case_sensitive=>'N'
,p_is_uk3_case_sensitive=>'N'
,p_skip_validation=>'N'
);
wwv_flow_imp_shared.create_load_table_lookup(
 p_id=>wwv_flow_imp.id(13626274482559439403)
,p_load_table_id=>wwv_flow_imp.id(13626168290611477748)
,p_load_column_name=>'MILESTONE_ID'
,p_lookup_owner=>'#OWNER#'
,p_lookup_table_name=>'EBA_PROJ_TEMPLATE_MS'
,p_key_column=>'ID'
,p_display_column=>'NAME'
,p_where_clause=>'template_id = &P190_ID.'
,p_insert_new_value=>'N'
);
wwv_flow_imp_shared.create_load_table_lookup(
 p_id=>wwv_flow_imp.id(15294432518667857622)
,p_load_table_id=>wwv_flow_imp.id(13626168290611477748)
,p_load_column_name=>'OWNER_ROLE_ID'
,p_lookup_owner=>'#OWNER#'
,p_lookup_table_name=>'EBA_PROJ_ROLES'
,p_key_column=>'ID'
,p_display_column=>'NAME'
,p_insert_new_value=>'N'
);
wwv_flow_imp_shared.create_load_table_lookup(
 p_id=>wwv_flow_imp.id(13626264384934485524)
,p_load_table_id=>wwv_flow_imp.id(13626168290611477748)
,p_load_column_name=>'TEMPLATE_ID'
,p_lookup_owner=>'#OWNER#'
,p_lookup_table_name=>'EBA_PROJ_TEMPLATES'
,p_key_column=>'ID'
,p_display_column=>'NAME'
,p_insert_new_value=>'N'
);
wwv_flow_imp_shared.create_load_table_lookup(
 p_id=>wwv_flow_imp.id(13626297784275444309)
,p_load_table_id=>wwv_flow_imp.id(13626168290611477748)
,p_load_column_name=>'TYPE_ID'
,p_lookup_owner=>'#OWNER#'
,p_lookup_table_name=>'EBA_PROJ_STATUS_AIS_TYPES'
,p_key_column=>'ID'
,p_display_column=>'AI_TYPE'
,p_insert_new_value=>'N'
);
wwv_flow_imp_shared.create_load_table_rule(
 p_id=>wwv_flow_imp.id(18065510889898525298)
,p_load_table_id=>wwv_flow_imp.id(13626168290611477748)
,p_load_column_name=>'DUE_DATE_OFFSET'
,p_rule_name=>'Due Date Offset Not Null'
,p_rule_type=>'PLSQL_EXPRESSION'
,p_rule_sequence=>10
,p_rule_expression1=>'replace(:DUE_DATE_OFFSET, null, 1)'
,p_rule_expression2=>':DUE_DATE_OFFSET'
);
wwv_flow_imp.component_end;
end;
/
