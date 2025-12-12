prompt --application/deployment/install/install_create_table_eba_proj_status_searches
begin
--   Manifest
--     INSTALL: INSTALL-create table eba_proj_status_searches
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
 p_id=>wwv_flow_imp.id(6060578585295731344)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'create table eba_proj_status_searches'
,p_sequence=>110
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create table eba_proj_status_searches (',
'    id                      number primary key,',
'    row_version_number      number,',
'    search_date             timestamp(6) with local time zone,',
'    search_string           varchar2(4000),',
'    search_user             varchar2(255),',
'    hits                    number,',
'    parms                   varchar2(255)',
'    )',
'/',
'',
'    '))
);
wwv_flow_imp.component_end;
end;
/
