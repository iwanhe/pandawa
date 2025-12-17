prompt --application/deployment/install/install_time_zone
begin
--   Manifest
--     INSTALL: INSTALL-time zone
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
 p_id=>wwv_flow_imp.id(3210649268714966783)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'time zone'
,p_sequence=>25
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_intrack_tz_pref (',
'  id                        number not null',
'                            constraint eba_intrack_tz_pref_pk',
'                            primary key,',
'  row_version_number        integer,',
'  userid                    varchar2(255) not null,',
'  TIMEZONE_PREFERENCE       varchar2(255) not null,',
'  created                   timestamp with time zone,',
'  created_by                varchar2(255),',
'  updated                   timestamp with time zone,',
'  updated_by                varchar2(255)',
'  );',
'  ',
'create or replace trigger biu_eba_intrack_tz_pref',
'   before insert or update on eba_intrack_tz_pref',
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
'   if :new.TIMEZONE_PREFERENCE is null then',
'       :new.timezone_preference := ''UTC'';',
'   end if;',
'end;',
'/',
'alter trigger biu_eba_intrack_tz_pref enable;'))
);
wwv_flow_imp.component_end;
end;
/
