prompt --application/deployment/install/upgrade_eba_proj_tags_ck_check_constraint
begin
--   Manifest
--     INSTALL: UPGRADE-eba_proj_tags_ck check constraint
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
 p_id=>wwv_flow_imp.id(5983158985284269732)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'eba_proj_tags_ck check constraint'
,p_sequence=>280
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_proj_tags$ drop constraint  eba_proj_tags_ck;',
'alter table eba_proj_tags$ add constraint eba_proj_tags_ck check',
'                            (content_type in (''STATUS'',''FILE'',''AI'',''MILESTONE'',''LINK'',''UPDATES''));',
'',
''))
);
wwv_flow_imp.component_end;
end;
/
