prompt --application/deployment/install/install_eba_proj_resource_types_biu
begin
--   Manifest
--     INSTALL: INSTALL-EBA_PROJ_RESOURCE_TYPES_BIU
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
 p_id=>wwv_flow_imp.id(4194686885091519865)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'EBA_PROJ_RESOURCE_TYPES_BIU'
,p_sequence=>780
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace trigger eba_proj_resource_types_biu',
'    before insert or update on eba_proj_resource_types',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if inserting then',
'        :new.created := localtimestamp;',
'        :new.created_by := nvl(wwv_flow.g_user,user);',
'    end if;',
'    :new.updated := localtimestamp;',
'    :new.updated_by := nvl(wwv_flow.g_user,user);',
'end;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
