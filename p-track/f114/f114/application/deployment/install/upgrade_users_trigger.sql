prompt --application/deployment/install/upgrade_users_trigger
begin
--   Manifest
--     INSTALL: UPGRADE-Users Trigger
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
 p_id=>wwv_flow_imp.id(5884509307503269047)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Users Trigger'
,p_sequence=>860
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'-- First, clean up any bad data.',
'delete from eba_proj_status_users psu',
'where exists (  select null',
'                from eba_proj_status_users ps2',
'                where upper(ps2.username) = upper(psu.username)',
'                    and ( ps2.access_level_id < psu.access_level_id',
'                        or ( ps2.access_level_id = psu.access_level_id',
'                            and ps2.id > psu.id )));',
'/',
'update eba_proj_status_users',
'    set username = upper(username)',
'    where username != upper(username);',
'/',
'',
'commit;',
'/',
'',
'-- Now, we can safely replace the trigger.',
'CREATE OR REPLACE TRIGGER EBA_PROJ_STATUS_USERS_BIU ',
'   before insert or update on eba_proj_status_users',
'   for each row',
'begin',
'   if :new.ID is null then',
'     select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') into :new.id from dual;',
'   end if;',
'   if inserting then',
'       :new.created := localtimestamp;',
'       :new.created_by := nvl(apex_application.g_user,user);',
'       :new.row_version_number := 1;',
'   elsif updating then',
'       :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'   end if;',
'   if inserting or updating then',
'       :new.updated := localtimestamp;',
'       :new.updated_by := nvl(apex_application.g_user,user);',
'   end if;',
'   :new.username := upper(:new.username);',
'   :new.email_address := lower(:new.email_address);',
'end;',
'/',
'ALTER TRIGGER EBA_PROJ_STATUS_USERS_BIU ENABLE',
'/',
''))
);
wwv_flow_imp.component_end;
end;
/
