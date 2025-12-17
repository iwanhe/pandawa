prompt --application/deployment/install/upgrade_make_customer_mandatory_on_incidents
begin
--   Manifest
--     INSTALL: UPGRADE-Make Customer mandatory on Incidents
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
 p_id=>wwv_flow_imp.id(1731528367750434646)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'Make Customer mandatory on Incidents'
,p_sequence=>130
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from user_tab_cols',
'where table_name = ''EBA_INTRACK_INCIDENTS''',
'    and column_name = ''CUSTOMER_ID''',
'    and nullable = ''Y'''))
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'alter table eba_intrack_incidents',
'    modify (customer_id not null);',
'',
'alter table eba_intrack_incidents',
'    drop constraint eba_intrack_incid_cust_fk;',
'',
'alter table eba_intrack_incidents',
'    add constraint eba_intrack_incid_cust_fk foreign key (customer_id)',
'    references  eba_intrack_customers (id) on delete cascade;'))
);
wwv_flow_imp.component_end;
end;
/
