prompt --application/deployment/install/install_notifications
begin
--   Manifest
--     INSTALL: INSTALL-Notifications
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(2890764571173472164)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'Notifications'
,p_sequence=>37
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_intrack_notifications (',
'    id                        number            not null',
'                                                constraint eba_intrack_note_pk',
'                                                primary key,',
'    row_version_number        number,',
'    notification_name         varchar2(255)     not null,',
'    notification_description  varchar2(4000)    null,',
'    --',
'    notification_type         varchar2(30)      not null',
'                                                constraint eba_intrack_note_tp_cc',
'                                                check (notification_type in (''RED'',''YELLOW'')),',
'    --',
'    display_sequence          number,',
'    display_from              timestamp with time zone,',
'    display_until             timestamp with time zone,',
'    --',
'    created_by                varchar2(255)       not null,',
'    created                   timestamp with time zone,',
'    updated_by                varchar2(255)       not null,',
'    updated                   timestamp with time zone )',
'/',
'create unique index eba_intrack_note_uk on eba_intrack_notifications (notification_name);',
'/',
'',
'create or replace trigger eba_intrack_note_biu',
'before insert or update on eba_intrack_notifications',
'    for each row',
'begin',
'    if inserting and :new.id is null then',
'        select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'')',
'        into :new.id',
'        from dual;',
'    end if;',
'    if inserting then',
'        :new.created_by := nvl(v(''APP_USER''),USER);',
'        :new.created := current_timestamp;',
'        :new.updated_by := nvl(v(''APP_USER''),USER);',
'        :new.updated := current_timestamp;',
'        :new.row_version_number := 1;',
'    end if;',
'    if updating then',
'        :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'        :new.updated_by := nvl(v(''APP_USER''),USER);',
'        :new.updated    := current_timestamp;',
'    end if;',
'    if :new.notification_type is null then',
'       :new.notification_type := ''MANUAL'';',
'    end if;',
'end;',
'/',
'show errors',
'',
'alter trigger eba_intrack_note_biu enable;',
'/',
'  ',
'',
''))
);
wwv_flow_imp.component_end;
end;
/
