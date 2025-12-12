prompt --application/deployment/install/install_eba_proj_user_preferences
begin
--   Manifest
--     INSTALL: INSTALL-eba_proj_user_preferences
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
 p_id=>wwv_flow_imp.id(5304318461316359242)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'eba_proj_user_preferences'
,p_sequence=>720
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_user_preferences (',
'    id                     number primary key,',
'    username               varchar2(255) not null,',
'    row_version_number     number,',
'    preference_name        varchar2(100) not null,',
'    preference_value       varchar2(4000),',
'    --',
'    created                timestamp(6) with local time zone,',
'    created_by             varchar2(255),',
'    updated                timestamp(6) with local time zone,',
'    updated_by             varchar2(255)',
')',
'/',
'',
'create unique index eba_proj_user_prefs_idx on eba_proj_user_preferences(username, preference_name);',
'',
'create or replace trigger eba_proj_user_preferences_biu',
'   before insert or update on eba_proj_user_preferences',
'   for each row',
'begin',
'    if :new.ID is null then',
'        :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if inserting then',
'       :new.created := localtimestamp;',
'       :new.created_by := nvl(apex_application.g_user,user);',
'       :new.row_version_number := 1;',
'    else',
'       :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'    end if;',
'',
'    :new.updated := localtimestamp;',
'    :new.updated_by := nvl(apex_application.g_user,user);',
'end;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
