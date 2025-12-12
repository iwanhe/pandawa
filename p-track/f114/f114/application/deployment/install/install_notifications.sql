prompt --application/deployment/install/install_notifications
begin
--   Manifest
--     INSTALL: INSTALL-notifications
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
 p_id=>wwv_flow_imp.id(7417240206244792274)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'notifications'
,p_sequence=>400
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_status_notifications (',
'    id                        number            not null',
'                                                constraint eba_proj_status_note_pk',
'                                                primary key,',
'    row_version_number        number,',
'    notification_name         varchar2(255)     not null,',
'    notification_description  varchar2(4000)    null,',
'    --',
'    notification_type         varchar2(30)      not null',
'                                                constraint eba_proj_status_note_tp_cc',
'                                                check (notification_type in (''RED'',''YELLOW'')),',
'    --',
'    display_sequence          number,',
'    display_from              timestamp with local time zone,',
'    display_until             timestamp with local time zone,',
'    --',
'    created_by                varchar2(255)       not null,',
'    created                   timestamp with local time zone,',
'    updated_by                varchar2(255)       not null,',
'    updated                   timestamp with local time zone )',
'/',
'create unique index eba_proj_status_note_uk on eba_proj_status_notifications (notification_name);',
'/',
'',
'create or replace trigger eba_proj_status_note_biu',
'before insert or update on eba_proj_status_notifications',
'    for each row',
'begin',
'    if inserting and :new.id is null then',
'        select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'')',
'        into :new.id',
'        from dual;',
'    end if;',
'    if inserting then',
'        :new.created_by := nvl(v(''APP_USER''),USER);',
'        :new.created := localtimestamp;',
'        :new.updated_by := nvl(v(''APP_USER''),USER);',
'        :new.updated := localtimestamp;',
'        :new.row_version_number := 1;',
'    end if;',
'    if updating then',
'        :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'        :new.updated_by := nvl(v(''APP_USER''),USER);',
'        :new.updated    := localtimestamp;',
'    end if;',
'    if :new.notification_type is null then',
'       :new.notification_type := ''MANUAL'';',
'    end if;',
'end;',
'/',
'show errors',
'',
'alter trigger eba_proj_status_note_biu enable;',
'/',
'  ',
'',
''))
);
wwv_flow_imp.component_end;
end;
/
