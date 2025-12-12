prompt --application/deployment/install/install_create_tag_tables
begin
--   Manifest
--     INSTALL: INSTALL-create tag tables
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
 p_id=>wwv_flow_imp.id(6060578399363725952)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'create tag tables'
,p_sequence=>380
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE TABLE eba_proj_tags$ (',
'    id                      number primary key,',
'    row_version_number      number,',
'    tag                     varchar2(255) not null,',
'    content_id              number,',
'    content_type            varchar2(30)',
'                            constraint eba_proj_tags_ck check',
'                            (content_type in (''STATUS'',''STATUS_ISSUES'',''FILE'',''AI'',''MILESTONE'',''LINK'',''UPDATES'')),',
'    --',
'    created                 timestamp with local time zone,',
'    created_by              varchar2(255),',
'    updated                 timestamp with local time zone,',
'    updated_by              varchar2(255)',
'    )',
'/',
'',
'create unique index eba_proj_tags_i1 on eba_proj_tags$(tag, content_id);',
'create unique index eba_proj_tags_i2 on eba_proj_tags$(content_id, tag);',
'',
'create or replace view eba_proj_tags as',
'select id, ',
'    row_version_number, ',
'    tag, ',
'    content_id, ',
'    content_type, ',
'    created, ',
'    created_by, ',
'    updated, ',
'    updated_by ',
'from eba_proj_tags$ t',
'where ( t.content_type = ''AI''',
'        and exists ( select null from eba_proj_status_ais a where t.content_id = a.id ))',
'    or ( t.content_type = ''MILESTONE''',
'        and exists ( select null from eba_proj_status_ms m where t.content_id = m.id ))',
'    or ( t.content_type = ''FILE''',
'        and exists ( select null from eba_proj_status_files f where t.content_id = f.id ))',
'    or ( t.content_type = ''STATUS''',
'        and exists ( select null from eba_proj_status p where t.content_id = p.id ))',
'    or ( t.content_type = ''STATUS_ISSUES''',
'        and exists ( select null from eba_proj_status_issues p where t.content_id = p.id ))',
'    or ( t.content_type = ''LINK''',
'        and exists ( select null from eba_proj_status_links l where t.content_id = l.id ))',
'    or ( t.content_type = ''UPDATES''',
'        and exists ( select null from eba_proj_status_updates u where t.content_id = u.id ))',
'/',
'',
'create or replace view eba_proj_tags_type_sum as',
'select tag, ',
'    content_type, ',
'    count(*) tag_count ',
'from eba_proj_tags',
'group by tag, content_type',
'/',
'',
'create or replace view eba_proj_tags_sum as',
'select tag, ',
'    count(*) tag_count ',
'from eba_proj_tags',
'group by tag',
'/'))
);
wwv_flow_imp.component_end;
end;
/
