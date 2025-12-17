prompt --application/deployment/install/upgrade_click_counting_table
begin
--   Manifest
--     INSTALL: UPGRADE-Click Counting Table
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
 p_id=>wwv_flow_imp.id(1536591269839427533)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'Click Counting Table'
,p_sequence=>100
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tables',
'where table_name = ''EBA_INTRACK_CLICKS'';'))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_intrack_clicks (    ',
'    id                number primary key,',
'    view_id           number,',
'    app_username      varchar2(255),',
'    view_timestamp    timestamp(6) with time zone,',
'    app_session       varchar2(255)',
');',
'/',
'',
'',
'create index eba_intrack_clicks_idx1 on eba_intrack_clicks (view_id);',
'create index eba_intrack_clicks_idx2 on eba_intrack_clicks (view_timestamp);',
'',
'create or replace trigger eba_intrack_clicks_biu',
'    before insert on eba_intrack_clicks',
'    for each row',
'begin',
'     if :new.id is null then',
'         :new.id := eba_intrack_seq.nextval;',
'     end if;',
'     :new.view_timestamp := current_timestamp;',
'     :new.app_username := nvl(v(''APP_USER''),user);',
'     :new.app_session := v(''APP_SESSION'');',
'end;',
'/',
'',
'alter trigger eba_intrack_clicks_biu enable;',
''))
);
wwv_flow_imp.component_end;
end;
/
