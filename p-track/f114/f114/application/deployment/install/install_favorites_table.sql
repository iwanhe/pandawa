prompt --application/deployment/install/install_favorites_table
begin
--   Manifest
--     INSTALL: INSTALL-Favorites Table
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
 p_id=>wwv_flow_imp.id(5755639096194602954)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Favorites Table'
,p_sequence=>410
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_status_favorites (',
'    id           number primary key,',
'    user_name    varchar2(255) not null,',
'    content_id   number not null,',
'    content_type varchar2(30) not null',
'                 constraint eba_proj_status_fav_ck check',
'                     (content_type in (''PROJECT'',''ACTION ITEM''))',
'    )',
'/',
'create unique index eba_proj_status_fav_u1',
'    on eba_proj_status_favorites ( user_name, content_id, content_type );',
'/',
'',
'create or replace trigger biu_eba_proj_status_favorites',
'    before insert or update on eba_proj_status_favorites',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'',
'    if :new.user_name is null then',
'        :new.user_name := nvl(v(''APP_USER''),USER);',
'    end if;',
'    :new.user_name := upper(:new.user_name);',
'end;',
'/',
'show errors',
''))
);
wwv_flow_imp.component_end;
end;
/
