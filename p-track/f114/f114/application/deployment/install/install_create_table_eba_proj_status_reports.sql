prompt --application/deployment/install/install_create_table_eba_proj_status_reports
begin
--   Manifest
--     INSTALL: INSTALL-create table eba_proj_status_reports
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
 p_id=>wwv_flow_imp.id(6060588706598775291)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'create table eba_proj_status_reports'
,p_sequence=>310
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_status_reports$ (',
'    id                      number primary key,',
'    row_version_number      number,',
'    report_name             varchar2(255),',
'    report_description      clob,',
'    row_key                 varchar2(50),',
'    --',
'    created                 timestamp(6) with local time zone,',
'    created_by              varchar2(255),',
'    updated                 timestamp(6) with local time zone,',
'    updated_by              varchar2(255)',
'    )',
'/',
'',
'create or replace view eba_proj_status_reports as',
'    select id,',
'        row_version_number,',
'        report_name,',
'        report_description,',
'        row_key,',
'        created,',
'        created_by,',
'        updated,',
'        updated_by',
'    from eba_proj_status_reports$;'))
);
wwv_flow_imp.component_end;
end;
/
