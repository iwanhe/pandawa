prompt --application/shared_components/user_interface/theme_style
begin
--   Manifest
--     THEME STYLE: 101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(741006334740025803)
,p_theme_id=>42
,p_name=>'Redwood Light'
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#IMAGE_PREFIX#libraries/oracle-fonts/oraclesans-apex#MIN#.css?v=#APEX_VERSION#',
'#THEME_IMAGES#css/Redwood-Light#MIN#.css?v=#APEX_VERSION#'))
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_read_only=>true
,p_component_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Use the following file url to load the local copy of Oracle Sans if needed:',
'#IMAGE_PREFIX#libraries/oracle-fonts/oraclesans-apex#MIN#.css?v=#APEX_VERSION#'))
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(741006763100025803)
,p_theme_id=>42
,p_name=>'Vista'
,p_css_file_urls=>'#THEME_IMAGES#css/Vista#MIN#.css?v=#APEX_VERSION#'
,p_is_public=>false
,p_is_accessible=>false
,p_theme_roller_read_only=>true
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(741007104687025803)
,p_theme_id=>42
,p_name=>'Vita'
,p_is_public=>true
,p_is_accessible=>true
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(741007505268025804)
,p_theme_id=>42
,p_name=>'Vita - Dark'
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Dark.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Dark#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(741007907183025804)
,p_theme_id=>42
,p_name=>'Vita - Red'
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Red.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Red#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
);
wwv_flow_imp_shared.create_theme_style(
 p_id=>wwv_flow_imp.id(741008298315025804)
,p_theme_id=>42
,p_name=>'Vita - Slate'
,p_is_public=>true
,p_is_accessible=>false
,p_theme_roller_input_file_urls=>'#THEME_IMAGES#less/theme/Vita-Slate.less'
,p_theme_roller_output_file_url=>'#THEME_IMAGES#css/Vita-Slate#MIN#.css?v=#APEX_VERSION#'
,p_theme_roller_read_only=>true
);
wwv_flow_imp.component_end;
end;
/
