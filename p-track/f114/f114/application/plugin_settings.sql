prompt --application/plugin_settings
begin
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(25570526858000188)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_ADFBC'
,p_version_scn=>39567366589436
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(25570670617000189)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SELECT_MANY'
,p_version_scn=>39567366589454
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(25570704300000189)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_DATE_PICKER_APEX'
,p_version_scn=>39567366589472
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(25570891355000190)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_MAP_REGION'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'use_vector_tile_layers', 'N')).to_clob
,p_version_scn=>39567366589493
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(25570989386000190)
,p_plugin_type=>'PROCESS TYPE'
,p_plugin=>'NATIVE_GEOCODING'
,p_attribute_01=>'RELAX_HOUSE_NUMBER'
,p_version_scn=>39567366589493
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(25571083295000191)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_SINGLE_CHECKBOX'
,p_version_scn=>39567366589493
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(25571273736000192)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_STAR_RATING'
,p_version_scn=>39567366589493
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(25571306777000193)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_GEOCODED_ADDRESS'
,p_version_scn=>39567366589493
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(25571533147000194)
,p_plugin_type=>'DYNAMIC ACTION'
,p_plugin=>'NATIVE_OPEN_AI_ASSISTANT'
,p_version_scn=>39567366589493
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(25571652452000194)
,p_plugin_type=>'WEB SOURCE TYPE'
,p_plugin=>'NATIVE_BOSS'
,p_version_scn=>39567366589494
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1898028959947116704)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_IR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'actions_menu_structure', 'IG')).to_clob
,p_version_scn=>39567366590732
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(1983930944147062686)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_COLOR_PICKER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_as', 'POPUP',
  'mode', 'FULL')).to_clob
,p_version_scn=>39567366590732
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(5353258529079059041)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'PLUGIN_COM.ORACLE.APEX.D3.BUBBLE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', '1.333',
  'attribute_02', '3')).to_clob
,p_version_scn=>39567366590732
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(5674819590831454237)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'NATIVE_YES_NO'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'display_style', 'SWITCH',
  'off_value', 'N',
  'on_value', 'Y')).to_clob
,p_version_scn=>39567366590732
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(6144858799043516622)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'PLUGIN_COM.ORACLE.APEX.FLEX_FIELD'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'EBA_PROJ_FLEX_REGISTRY')).to_clob
,p_version_scn=>39567366590732
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(6961308363549328825)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'NATIVE_DISPLAY_SELECTOR'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'include_slider', 'N')).to_clob
,p_version_scn=>39567366590732
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(7468041676824358746)
,p_plugin_type=>'ITEM TYPE'
,p_plugin=>'PLUGIN_COM.ORACLE.APEX.TAGS'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'NONE')).to_clob
,p_version_scn=>39567366590732
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(7569383453003775935)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'PLUGIN_COM.ORACLE.APEX.D3.BUBBLE.TEST'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', '1.333',
  'attribute_02', '3')).to_clob
,p_version_scn=>39567366590732
);
wwv_flow_imp_shared.create_plugin_setting(
 p_id=>wwv_flow_imp.id(7569565656754873469)
,p_plugin_type=>'REGION TYPE'
,p_plugin=>'PLUGIN_COM.ORACLE.APEX.D3.TREEMAP48914'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', '1.33',
  'attribute_02', '3')).to_clob
,p_version_scn=>39567366590732
);
wwv_flow_imp.component_end;
end;
/
