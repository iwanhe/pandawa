prompt --application/deployment/install/upgrade_click_counting
begin
--   Manifest
--     INSTALL: UPGRADE-click counting
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
 p_id=>wwv_flow_imp.id(6061157597236172443)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'click counting'
,p_sequence=>310
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tables',
'where table_name = ''EBA_PROJ_STATUS_CLICKS$'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_status_clicks$(',
'    id                number primary key,',
'    project_id        number references eba_proj_status$(id) on delete cascade,',
'    app_username      varchar2(255), ',
'    view_timestamp    timestamp(6) with local time zone, ',
'    app_session       varchar2(255)',
')',
'/',
'',
'create or replace trigger  eba_proj_status_clicks_biu',
'    before insert on eba_proj_status_clicks$',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    :new.view_timestamp := localtimestamp;',
'    :new.app_username := nvl(v(''APP_USER''),user);',
'    :new.app_session := v(''APP_SESSION'');',
'end;',
'/',
'alter trigger  eba_proj_status_clicks_biu enable',
'/',
'',
'create index eba_proj_status_clicks_01 on eba_proj_status_clicks$(project_id);',
'create index eba_proj_status_clicks_02 on eba_proj_status_clicks$(view_timestamp);',
'',
''))
);
wwv_flow_imp.component_end;
end;
/
