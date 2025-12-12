prompt --application/deployment/install/install_timezone_table
begin
--   Manifest
--     INSTALL: INSTALL-Timezone Table
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
 p_id=>wwv_flow_imp.id(5963503891372651367)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Timezone Table'
,p_sequence=>440
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_tz_pref (',
'    id                       number        not null',
'                             constraint eba_proj_tz_pref_pk',
'                             primary key,',
'    username                 varchar2(255) not null',
'                             constraint eba_proj_tz_pref_uk',
'                             unique,',
'    timezone_preference      varchar2(255) not null,',
'    --',
'    row_version_number       number                          not null,',
'    created                  timestamp with local time zone  not null,',
'    created_by               varchar2(255)                   not null,',
'    updated                  timestamp with local time zone  not null,',
'    updated_by               varchar2(255)                   not null )',
'/',
'  ',
'create or replace trigger eba_proj_tz_pref_biu',
'    before insert or update on eba_proj_tz_pref',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if inserting then',
'        :new.created    := localtimestamp;',
'        :new.created_by := nvl(wwv_flow.g_user,user);',
'        :new.row_version_number := 1;',
'    elsif updating then',
'        :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'    end if;',
'    if :new.timezone_preference is null then',
'        :new.timezone_preference := ''UTC'';',
'    end if;',
'    :new.updated    := localtimestamp;',
'    :new.updated_by := nvl(wwv_flow.g_user,user);',
'    :new.username   := upper(:new.username);',
'end;',
'/',
'    ',
'alter trigger eba_proj_tz_pref_biu enable;'))
);
wwv_flow_imp.component_end;
end;
/
