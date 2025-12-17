prompt --application/deployment/install/install_countries
begin
--   Manifest
--     INSTALL: INSTALL-countries
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
 p_id=>wwv_flow_imp.id(2837283645087930366)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'countries'
,p_sequence=>35
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_intrack_countries (',
'    id                         number primary key,',
'    row_version_number         number,',
'    row_key                    varchar2(255),',
'    --',
'    country_code               varchar2(30),',
'    country_name               varchar2(255),',
'    --',
'    flex_01                    varchar2(4000),',
'    flex_02                    varchar2(4000),',
'    flex_03                    varchar2(4000),',
'    flex_04                    varchar2(4000),',
'    --',
'    created_by                 varchar2(255),',
'    created                    timestamp with time zone,',
'    updated_by                 varchar2(255),',
'    updated                    timestamp with time zone',
');',
'',
'',
'create or replace trigger biu_eba_intrack_countries',
'before insert or update on eba_intrack_countries',
'    for each row',
'begin',
'    if inserting and :new.id is null then',
'        select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') into :new.id from dual;',
'    end if;',
'    if inserting then',
'        :new.row_version_number := 1;',
'        :NEW.CREATED := current_timestamp;',
'        :NEW.CREATED_BY := nvl(v(''APP_USER''),USER);',
'    end if;',
'    if updating then',
'        :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'        :NEW.UPDATED := current_timestamp;',
'        :NEW.UPDATED_BY := nvl(v(''APP_USER''),USER);',
'    end if;',
'end;',
'/',
'show errors'))
);
wwv_flow_imp.component_end;
end;
/
