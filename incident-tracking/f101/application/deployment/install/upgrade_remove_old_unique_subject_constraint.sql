prompt --application/deployment/install/upgrade_remove_old_unique_subject_constraint
begin
--   Manifest
--     INSTALL: UPGRADE-Remove old Unique Subject constraint
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
 p_id=>wwv_flow_imp.id(2387671629575456716)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'Remove old Unique Subject constraint'
,p_sequence=>55
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>'select * from all_constraints where constraint_name = ''EBA_INTRACK_INC_UQ_SUBJ'';'
,p_script_clob=>'alter table eba_intrack_incidents drop constraint eba_intrack_inc_uq_subj;'
);
wwv_flow_imp.component_end;
end;
/
