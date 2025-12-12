prompt --application/deployment/install/install_create_trigger_eba_proj_status_users_biu
begin
--   Manifest
--     INSTALL: INSTALL-create trigger eba_proj_status_users_biu
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
 p_id=>wwv_flow_imp.id(4194675668361465957)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'create trigger eba_proj_status_users_biu'
,p_sequence=>100
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace trigger eba_proj_status_users_biu ',
'    before insert or update on eba_proj_status_users',
'    for each row',
'begin',
'    if (inserting or updating) and nvl(dbms_lob.getlength(:new.photo_blob),0) > 358400 then',
'        raise_application_error(-20000, ''The size of the uploaded photo was over 350KB. Please upload a smaller file.'');',
'    end if;',
'    if :new.ID is null then',
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
'    :new.username := upper(:new.username);',
'end;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
