prompt --application/deployment/install/install_eba_proj_required_items_ddl
begin
--   Manifest
--     INSTALL: INSTALL-eba_proj_required_items DDL
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
 p_id=>wwv_flow_imp.id(616303373058886451)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'eba_proj_required_items DDL'
,p_sequence=>960
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_required_items (',
'    id                             number not null constraint eba_proj_required_id_pk primary key,',
'    page_id                        number,',
'    item_name                      varchar2(255),',
'    created                        date not null,',
'    created_by                     varchar2(255) not null,',
'    updated                        date not null,',
'    updated_by                     varchar2(255) not null',
');',
'',
'',
'-- triggers',
'create or replace trigger eba_proj_required_items_bi',
'    before insert or update ',
'    on eba_proj_required_items',
'    for each row',
'begin',
'    if :new.id is null then',
'        :new.id := to_number(sys_guid(), ''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'');',
'    end if;',
'    if inserting then',
'        :new.created := sysdate;',
'        :new.created_by := user;',
'    end if;',
'    :new.updated := sysdate;',
'    :new.updated_by := user;',
'end eba_proj_required_items_bi;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
