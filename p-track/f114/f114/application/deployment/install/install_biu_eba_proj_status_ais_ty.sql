prompt --application/deployment/install/install_biu_eba_proj_status_ais_ty
begin
--   Manifest
--     INSTALL: INSTALL-biu_eba_proj_status_ais_ty
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
 p_id=>wwv_flow_imp.id(4194677196730507573)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'biu_eba_proj_status_ais_ty'
,p_sequence=>760
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace trigger biu_eba_proj_status_ais_ty',
'    before insert or update on eba_proj_status_ais_types',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if inserting then',
'        :new.created := localtimestamp;',
'        :new.created_by := nvl(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'        :new.row_version_number := 1;',
'    elsif updating then',
'        :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'    end if;',
'    if inserting or updating then',
'        :new.updated := localtimestamp;',
'        :new.updated_by := nvl(sys_context(''APEX$SESSION'',''APP_USER''),user);',
'    end if;',
'end;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
