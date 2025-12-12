prompt --application/pages/page_00072
begin
--   Manifest
--     PAGE: 00072
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_page.create_page(
 p_id=>72
,p_name=>'Projects Tree View'
,p_step_title=>'Projects Tree View'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_first_item=>'AUTO_FIRST_ITEM'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486190175074984)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'body .tree-region > .uRegionContent {background:#fff url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAA0AQMAAAD2XSnSAAAABlBMVEX///8AAABVwtN+AAAAAnRSTlMABQb5ObcAAAARSURBVBhXY/gPBgxDjBqSAADAu5tlDu+LxwAAAABJRU5ErkJggg==) 0 8px}',
'body .tree ul ins{display:none}',
'body .tree ul {',
'  margin: 0 !important;',
'}',
'body .tree li{padding-left:16px}',
'body .tree-classic li a.clicked,',
'body .tree-classic li a.clicked:hover,',
'body .tree-classic li span.clicked{background:#F0F0F0;color:#4B66A7;font-weight:bold;border-color:#E0E0E0;padding:4px 8px}',
'body .tree li a,',
'body .tree li span{padding:4px;color:#4B66A7;border-radius:2px;border:1px solid transparent; margin-left: 16px;}',
'body .tree-classic ul,',
'body .tree-classic li.leaf{background:none}',
'body .a-TreeView li a:hover,',
'body .a-TreeView li span:hover{background:#E8F3FC;border-color:#D3EAFC;}',
'span.fa-folder {cursor:pointer;}',
'a.a-TreeView-label {cursor:pointer;}',
'body .tree-classic li.open{background-position:-28px -24px}',
'body .tree-classic li.closed{background-position:-4px 0}',
'body .tree-classic li.open,',
'body .tree-classic li.closed{background-image:url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAADAAAAAwCAYAAABXAvmHAAABk0lEQVRo3u2YMUvDUBDHQ4l1EXTJ6lKFThIc1E0Hx2a0+ClcTHBtLS1J0SZVJEihULWIgwUJrV8iaz5B946FTvV/9gQHP0BO7g8/8rj3hrvk3nu5MwyVSqXKu4qivS8UCj'
||'d47EuO4QF0wQXYlhhABALgg1twDjYkBRCCFrgGTdBGWlEwp8CUEgA5XgN10OCvESIQsu2JDaBcLj96nncmLoUsy7rv9Xrvi8XieblcHojZxEiZDt74cDabfcDxKhCxB76PUcdx+lmWfcLpS7Ap5ggqlUqDyWSSwOkQ7Iq7BObz+RscPxZ7DcP5df0dVKlUKpVKpVL9O61RecoFU8Sl628ingt4be5+04uj0ejFWDXNAq67m0yLbV2sobo7'
||'n+1NOHZSqVT6xqrLQU2DGkNjn+ZoTa7zKE3TO9M0O/zm60yTbDQnoeLbcV13yPuhwbTJRnMidvN0Or2iXhOnkk9jskmqu7fiOH79OYFoTDZRZyq6H1XbtvsEjcVdCtTlG4/HgyRJnqR0/P4K4hAc6R2vUqnk6At217X2O08aGgAAAABJRU5ErkJggg==);background-repeat:no-repeat}',
'body .tree li.closed>a,',
'body .tree li.open>a{font-weight:bold}'))
,p_step_template=>wwv_flow_imp.id(6672316913709369812)
,p_page_template_options=>'#DEFAULT#'
,p_required_patch=>wwv_flow_imp.id(19782202788559795354)
,p_help_text=>'This report just shows all projects in a "tree" view, where different "branches" (children projects) can be expanded and collapsed. Click the <strong>Collapse All</strong> button to return to the default view (all folders collapsed). Click the <stron'
||'g>Expand All</strong> button to open all folders (display all child projects).'
,p_page_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.xtree > .ltr > li {display: block !important;}',
'.uRegionContent .tree li a, .tree li span {',
'padding: 4px;',
'border: 1px solid transparent;',
'}',
'.uRegionContent .tree-default li a:hover, .tree-default li a.hover, .tree-default li span {',
'padding: 4px;',
'}',
'.uRegionContent .tree ins {background: none transparent;}',
''))
,p_page_component_map=>'20'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5847563202149219086)
,p_plug_name=>'Parent and Child Projects Tree'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--scrollBody'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>20
,p_query_type=>'SQL'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select case when connect_by_isleaf = 1 then 0',
'            when level = 1             then 1',
'            else                           -1',
'       end as status, ',
'       level, ',
'       project as title, ',
'       ''fa-folder'' as icon, ',
'       id as value, ',
'       null as tooltip, ',
'       apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||id) as link ',
'from eba_proj_status p',
'start with parent_project_id is null',
'connect by prior id = parent_project_id',
'order siblings by project'))
,p_lazy_loading=>false
,p_plug_source_type=>'NATIVE_JSTREE'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'activate_node_link_with', 'S',
  'hierarchy_level_column', 'LEVEL',
  'icon_css_class_column', 'ICON',
  'icon_type_css_class', 'fa',
  'link_column', 'LINK',
  'node_label_column', 'TITLE',
  'node_status_column', 'STATUS',
  'node_value_column', 'VALUE',
  'static_tree_id', 'tree651336726281602329',
  'tree_hierarchy', 'LEVEL',
  'tree_tooltip', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5847578797866382931)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5847563588771219091)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'CONTRACT_ALL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Collapse All'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.widget.tree.collapse_all(''tree651336726281602329'');'
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(5847563799638219091)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'EXPAND_ALL'
,p_button_action=>'REDIRECT_URL'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Expand All'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'javascript:apex.widget.tree.expand_all(''tree651336726281602329'');'
,p_button_css_classes=>'uButtonAlt'
,p_grid_new_row=>'N'
,p_grid_new_column=>'N'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(13084278710205234156)
,p_computation_sequence=>10
,p_computation_item=>'PROJECT_CAME_FROM'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp.component_end;
end;
/
