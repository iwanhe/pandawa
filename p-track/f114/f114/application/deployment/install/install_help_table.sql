prompt --application/deployment/install/install_help_table
begin
--   Manifest
--     INSTALL: INSTALL-Help Table
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
 p_id=>wwv_flow_imp.id(7748502206362946350)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Help Table'
,p_sequence=>580
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table  eba_proj_help_page (',
'    id number not null enable,',
'    row_version_number number(*,0),',
'    language_code varchar2(30),',
'    application_name varchar2(255),',
'    sprite varchar2(1000),',
'    alternative_image varchar2(1000),',
'    show_app_version_yn varchar2(1),',
'    show_page_count_yn varchar2(1),',
'    use_app_title_yn varchar2(1),',
'    show_icon varchar2(255),',
'    support_link varchar2(1000),',
'    support_link_text varchar2(1000),',
'    additional_help_link varchar2(1000),',
'    vendor varchar2(1000),',
'    twitter varchar2(1000),',
'    facebook varchar2(1000),',
'    linkedin varchar2(1000),',
'    website varchar2(1000),',
'    attr_label_01 varchar2(255),',
'    attr_value_01 varchar2(1000),',
'    attr_label_02 varchar2(255),',
'    attr_value_02 varchar2(1000),',
'    attr_label_03 varchar2(255),',
'    attr_value_03 varchar2(1000),',
'    attr_label_04 varchar2(255),',
'    attr_value_04 varchar2(1000),',
'    attr_label_05 varchar2(255),',
'    attr_value_05 varchar2(1000),',
'    attr_label_06 varchar2(255),',
'    attr_value_06 varchar2(1000),',
'    attr_label_07 varchar2(255),',
'    attr_value_07 varchar2(1000),',
'    attr_label_08 varchar2(255),',
'    attr_value_08 varchar2(1000),',
'    about_app clob,',
'    getting_started clob,',
'    quick_start clob,',
'    support clob,',
'    public_help clob,',
'    features clob,',
'    created timestamp (6) with local time zone,',
'    created_by varchar2(255),',
'    updated timestamp (6) with local time zone,',
'    updated_by varchar2(255),',
'    constraint eba_proj_help_page_pk primary key (id) enable',
'   )',
'/',
'',
'create or replace trigger  biu_eba_proj_help_page',
'   before insert or update on eba_proj_help_page',
'   for each row',
'begin',
'   if :new.id is null then',
'     select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') into :new.id from dual;',
'   end if;',
'   if inserting then',
'       :new.created := localtimestamp;',
'       :new.created_by := nvl(wwv_flow.g_user,user);',
'       :new.updated := localtimestamp;',
'       :new.updated_by := nvl(wwv_flow.g_user,user);',
'       :new.row_version_number := 1;',
'   elsif updating then',
'       :new.row_version_number := nvl(:old.row_version_number,1) + 1;',
'   end if;',
'   if inserting or updating then',
'       :new.updated := localtimestamp;',
'       :new.updated_by := nvl(wwv_flow.g_user,user);',
'   end if;',
'end;',
'/',
'alter trigger  biu_eba_proj_help_page enable;',
'/',
''))
);
wwv_flow_imp.component_end;
end;
/
