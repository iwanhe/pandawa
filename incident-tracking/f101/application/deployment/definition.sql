prompt --application/deployment/definition
begin
--   Manifest
--     INSTALL: 101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_install(
 p_id=>wwv_flow_imp.id(2719947952873449465)
,p_welcome_message=>'This application installer will guide you through the process of creating your database objects and seed data.'
,p_configuration_message=>'You can configure the following attributes of your application.'
,p_build_options_message=>'You can choose to include the following build options.'
,p_validation_message=>'The following validations will be performed to ensure your system is compatible with this application.'
,p_install_message=>'Please confirm that you would like to install this application''s supporting objects.'
,p_upgrade_message=>'The application installer has detected that this application''s supporting objects were previously installed.  This wizard will guide you through the process of upgrading these supporting objects.'
,p_upgrade_confirm_message=>'Please confirm that you would like to install this application''s supporting objects.'
,p_upgrade_success_message=>'Your application''s supporting objects have been installed.'
,p_upgrade_failure_message=>'Installation of database objects and seed data has failed.'
,p_get_version_sql_query=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from user_tables',
' where table_name like ''EBA_INTRACK_%'''))
,p_deinstall_success_message=>'Deinstallation complete.'
,p_deinstall_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'drop sequence eba_intrack_seq;',
'',
'drop table eba_intrack_assignees        cascade constraints;',
'drop table eba_intrack_error_lookup     cascade constraints;',
'drop table eba_intrack_tz_pref          cascade constraints;',
'drop table eba_intrack_access_levels    cascade constraints;',
'drop table eba_intrack_users            cascade constraints;',
'drop table eba_intrack_preferences      cascade constraints;',
'drop table eba_intrack_notifications    cascade constraints;',
'drop table eba_intrack_tags             cascade constraints;',
'drop table eba_intrack_tags_type_sum    cascade constraints;',
'drop table eba_intrack_tags_sum         cascade constraints;',
'drop table eba_intrack_group            cascade constraints;',
'drop table eba_intrack_user_group       cascade constraints;',
'drop table eba_intrack_urgency          cascade constraints;',
'drop table eba_intrack_severity         cascade constraints;',
'drop table eba_intrack_status           cascade constraints;',
'drop table eba_intrack_category         cascade constraints;',
'drop table eba_intrack_product          cascade constraints;',
'drop table eba_intrack_version          cascade constraints;',
'drop table eba_intrack_incidents        cascade constraints;',
'drop table eba_intrack_customers        cascade constraints;',
'drop table eba_intrack_customer_contact cascade constraints;',
'drop table eba_intrack_inc_followup     cascade constraints;',
'drop table eba_intrack_files            cascade constraints;',
'drop table eba_intrack_countries        cascade constraints;',
'drop table eba_intrack_links            cascade constraints;',
'drop table eba_intrack_notes            cascade constraints;',
'drop table eba_intrack_errors           cascade constraints;',
'drop table eba_intrack_clicks           cascade constraints;',
'drop table eba_intrack_verifications    cascade constraints;',
'',
'drop view      eba_intrack_incidents_view ;  ',
'',
'drop function  eba_intrack_get_versions;',
'drop function  eba_intrack_val_email_fmt;',
'',
'drop procedure eba_intrack_load_sample;',
'',
'drop package   eba_intrack_incident;',
'drop package   eba_intrack;',
'drop package   eba_intrack_fw;'))
,p_required_free_kb=>100
,p_required_sys_privs=>'CREATE PROCEDURE:CREATE SEQUENCE:CREATE TABLE:CREATE TRIGGER:CREATE VIEW'
,p_required_names_available=>'EBA_INTRACK_ACCESS_LEVELS:EBA_INTRACK_CATEGORY:EBA_INTRACK_COUNTRIES:EBA_INTRACK_CUSTOMER_CONTACT:EBA_INTRACK_CUSTOMERS:EBA_INTRACK_ERROR_LOOKUP:EBA_INTRACK_FILES:EBA_INTRACK_GROUP:EBA_INTRACK_INC_FOLLOWUP:EBA_INTRACK_INCIDENTS:EBA_INTRACK_LINKS:EBA_'
||'INTRACK_NOTES:EBA_INTRACK_NOTIFICATIONS:EBA_INTRACK_PREFERENCES:EBA_INTRACK_PRODUCT:EBA_INTRACK_SEVERITY:EBA_INTRACK_STATUS:EBA_INTRACK_TAGS:EBA_INTRACK_TAGS_SUM:EBA_INTRACK_TAGS_TYPE_SUM:EBA_INTRACK_TZ_PREF:EBA_INTRACK_URGENCY:EBA_INTRACK_USER_GROUP'
||':EBA_INTRACK_USER:EBA_INTRACK_VERSION:EBA_INTRACK_SEQ:EBA_INTRACK_FW:EBA_INTRACK_CLICKS:EBA_INTRACK_VERIFICATIONS'
,p_deinstall_message=>'This operation will completely remove this application from your workspace.'
);
wwv_flow_imp.component_end;
end;
/
