prompt --application/deployment/install/upgrade_new_project_and_ai_columns_and_tables
begin
--   Manifest
--     INSTALL: UPGRADE-New Project and AI Columns and Tables
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
 p_id=>wwv_flow_imp.id(19136378797208660299)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'New Project and AI Columns and Tables'
,p_sequence=>680
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from user_tab_cols',
' where table_name = ''EBA_PROJ_STATUS$''',
'   and column_name = ''DEAL_TYPE_ID'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_proj_status$ add code_name varchar2(255)',
'/',
'',
'alter table eba_proj_status$ add deal_type_id number',
'/',
'',
'alter table eba_proj_status_ais$ add link_url varchar2(255)',
'/',
'',
'alter table eba_proj_status_ais$ add link_text varchar2(255)',
'/',
'',
'',
'',
'create table eba_proj_deal_types',
'(',
'    id                      number primary key,',
'    row_version_number      number,',
'    deal_type               varchar2(50) not null,',
'    display_sequence        number,',
'    is_active_yn            varchar2(1) default ''Y'' not null,',
'    created                 timestamp(6) with local time zone,',
'    created_by              varchar2(255),',
'    updated                 timestamp(6) with local time zone,',
'    updated_by              varchar2(255)',
')',
'/',
'',
'create or replace trigger biu_eba_proj_deal_types',
'    before insert or update on eba_proj_deal_types',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if inserting then',
'        :new.created := localtimestamp;',
'        :new.created_by := nvl(apex_application.g_user,user);',
'        :new.row_version_number := 1;',
'    elsif updating then',
'        :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'    end if;',
'    if inserting or updating then',
'        :new.updated := localtimestamp;',
'        :new.updated_by := nvl(apex_application.g_user,user);',
'    end if;',
'end;',
'/',
'',
'alter trigger biu_eba_proj_deal_types enable',
'/',
'',
'alter table eba_proj_status$ add constraint eba_proj_deal_type_fk foreign key( deal_type_id ) references eba_proj_deal_types(id);',
'',
'insert into eba_proj_deal_types',
'(deal_type, display_sequence, is_active_yn)',
'values',
'(''To Be Determined (TBD)'', 1, ''Y'');',
'',
'insert into eba_proj_deal_types',
'(deal_type, display_sequence, is_active_yn)',
'values',
'(''Asset Purchase'', 2, ''Y'');',
'',
'insert into eba_proj_deal_types',
'(deal_type, display_sequence, is_active_yn)',
'values',
'(''Private'', 3, ''Y'');',
'',
'insert into eba_proj_deal_types',
'(deal_type, display_sequence, is_active_yn)',
'values',
'(''Public'', 4, ''Y'');',
'',
'commit;'))
);
wwv_flow_imp.component_end;
end;
/
