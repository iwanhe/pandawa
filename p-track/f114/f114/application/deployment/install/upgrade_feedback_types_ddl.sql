prompt --application/deployment/install/upgrade_feedback_types_ddl
begin
--   Manifest
--     INSTALL: UPGRADE-Feedback Types DDL
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
 p_id=>wwv_flow_imp.id(16930790324834908674)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Feedback Types DDL'
,p_sequence=>930
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tables',
'where table_name = ''EBA_PROJ_FEEDBACK_TYPES'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_feedback_types',
'(',
'    id             number constraint eba_proj_feedback_types_pk not null primary key,',
'    type           varchar2(30),',
'    created        timestamp with local time zone,',
'    created_by     varchar2(255),',
'    updated        timestamp with local time zone,',
'    updated_by     varchar2(255)',
');',
'',
'create or replace trigger eba_proj_feedback_types_biu',
'    before insert or update ',
'    on eba_proj_feedback_types',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if inserting then',
'        :new.created := localtimestamp;',
'        :new.created_by := NVL(V(''APP_USER''),user);',
'    end if;',
'    :new.updated := localtimestamp;',
'    :new.updated_by := NVL(V(''APP_USER''),user);',
'end;',
'/',
'',
'alter trigger eba_proj_feedback_types_biu enable',
'/'))
);
wwv_flow_imp.component_end;
end;
/
