prompt --application/deployment/install/install_notes
begin
--   Manifest
--     INSTALL: INSTALL-notes
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
 p_id=>wwv_flow_imp.id(3024126063165880219)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'notes'
,p_sequence=>350
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE TABLE "EBA_INTRACK_NOTES" ',
'   ( ',
'    "ID"                     NUMBER constraint EBA_INTRACK_notes_pk primary key, ',
'    "ROW_VERSION_NUMBER"     NUMBER not null, ',
'    incident_id              number references eba_intrack_incidents(id) on delete cascade,',
'    "NOTE"                   CLOB, ',
'    tags                     VARCHAR2(4000 BYTE), ',
'    "CREATED"                timestamp with time zone, ',
'    "CREATED_BY"             VARCHAR2(255 BYTE), ',
'    "UPDATED"                timestamp with time zone, ',
'    "UPDATED_BY"             VARCHAR2(255 BYTE)',
'   ) ;',
'',
'create index EBA_INTRACK_NOTES_i1 on EBA_INTRACK_NOTES(incident_id);',
'',
'CREATE OR REPLACE TRIGGER "BIU_EBA_INTRACK_NOTES" ',
'   before insert or update on EBA_INTRACK_NOTES',
'   for each row',
'begin',
'   if :new."ID" is null then',
'     select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') into :new.id from dual;',
'   end if;',
'   if inserting then',
'       :new.created := current_timestamp;',
'       :new.created_by := nvl(wwv_flow.g_user,user);',
'       :new.updated := current_timestamp;',
'       :new.updated_by := nvl(wwv_flow.g_user,user);',
'       :new.row_version_number := 1;',
'   elsif updating then',
'       :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'   end if;',
'   if inserting or updating then',
'       :new.updated := current_timestamp;',
'       :new.updated_by := nvl(wwv_flow.g_user,user);',
'   end if;',
'end;',
'/',
'ALTER TRIGGER "BIU_EBA_INTRACK_NOTES" ENABLE;',
'',
''))
);
wwv_flow_imp.component_end;
end;
/
