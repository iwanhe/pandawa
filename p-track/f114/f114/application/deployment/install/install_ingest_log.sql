prompt --application/deployment/install/install_ingest_log
begin
--   Manifest
--     INSTALL: INSTALL-ingest log
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
 p_id=>wwv_flow_imp.id(8920753740072556677)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'ingest log'
,p_sequence=>390
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_status_ingest_log (',
'    id                      number primary key,',
'    p_to                    varchar2(4000),',
'    p_from                  varchar2(4000),',
'    p_cc                    varchar2(4000),',
'    p_subject               varchar2(4000),',
'    p_body                  varchar2(4000),',
'    apply_date              date,',
'    rows_processed          number,',
'    row_key                 varchar2(255),',
'    component_id            number,',
'    log_info                varchar2(4000)',
'    )',
'/',
'',
'',
'CREATE OR REPLACE TRIGGER  bi_eba_proj_status_ingest_log',
'   before insert or update on eba_proj_status_ingest_log             ',
'   for each row ',
'begin  ',
'   if :new."ID" is null then',
'     select to_number(sys_guid(),''XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX'') into :new.id from dual;',
'   end if;',
'   if inserting then',
'       :new.apply_date := current_date;',
'   end if;',
'end;',
'/',
'ALTER TRIGGER bi_eba_proj_status_ingest_log ENABLE',
'/'))
);
wwv_flow_imp.component_end;
end;
/
