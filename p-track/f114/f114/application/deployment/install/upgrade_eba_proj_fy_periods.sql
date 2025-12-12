prompt --application/deployment/install/upgrade_eba_proj_fy_periods
begin
--   Manifest
--     INSTALL: UPGRADE-EBA_PROJ_FY_PERIODS
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
 p_id=>wwv_flow_imp.id(3370078388953055776)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'EBA_PROJ_FY_PERIODS'
,p_sequence=>840
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tables',
'where table_name = ''EBA_PROJ_FY_PERIODS'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'CREATE TABLE  "EBA_PROJ_FY_PERIODS" ',
'   (    "ID" NUMBER, ',
'    "ROW_VERSION_NUMBER" NUMBER, ',
'    "PERIOD_NAME" VARCHAR2(255) NOT NULL ENABLE, ',
'    "FIRST_DAY" TIMESTAMP (6) WITH LOCAL TIME ZONE, ',
'    "LAST_DAY" TIMESTAMP (6) WITH LOCAL TIME ZONE, ',
'    "FISCAL_YEAR" NUMBER(2,0)',
'   )',
'/'))
);
wwv_flow_imp.component_end;
end;
/
