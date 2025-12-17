prompt --application/deployment/install/upgrade_unique_ticket_names_subjects
begin
--   Manifest
--     INSTALL: UPGRADE-Unique Ticket Names/Subjects
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
 p_id=>wwv_flow_imp.id(1510581650165436467)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'Unique Ticket Names/Subjects'
,p_sequence=>60
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>'select * from all_constraints where constraint_name = ''EBA_INTRACK_INC_UQ_SUBJ'';'
,p_script_clob=>'alter table eba_intrack_incidents add constraint eba_intrack_inc_uq_subj unique (product_id, product_version_id, subject);'
);
wwv_flow_imp.component_end;
end;
/
