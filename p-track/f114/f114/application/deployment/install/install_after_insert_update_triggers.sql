prompt --application/deployment/install/install_after_insert_update_triggers
begin
--   Manifest
--     INSTALL: INSTALL-after insert update triggers
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
 p_id=>wwv_flow_imp.id(8957484334641733516)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'after insert update triggers'
,p_sequence=>550
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace trigger aiu_eba_proj_status_ms',
'    after insert or update on eba_proj_status_ms$',
'    for each row',
'    when ( not ( old.template_id is not null and new.template_id is null ))',
'begin',
'    --',
'    -- cascade update to project',
'    --',
'    update eba_proj_status$ set updated = localtimestamp',
'    where  id = :new.project_id;',
'end;',
'/',
'',
'create or replace trigger aiu_eba_proj_status_links',
'    after insert or update on eba_proj_status_links$',
'    for each row',
'begin',
'    --',
'    -- cascade update to project',
'    --',
'    update eba_proj_status$ set updated = localtimestamp',
'    where  id = :new.project_id;',
'end;',
'/',
'',
'',
'create or replace trigger aiu_eba_proj_status_ais',
'    after insert or update on eba_proj_status_ais$',
'    for each row',
'    when ( not ( old.template_id is not null and new.template_id is null ))',
'begin',
'    --',
'    -- cascade update to project',
'    --',
'    update eba_proj_status$ set updated = localtimestamp',
'    where  id = :new.project_id;',
'end;',
'/',
'',
'create or replace trigger aiu_eba_proj_status_updates',
'    after insert or update on eba_proj_status_updates$',
'    for each row',
'begin',
'    --',
'    -- cascade update to project',
'    --',
'    update eba_proj_status$ set updated = localtimestamp',
'    where  id = :new.project_id;',
'end;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
