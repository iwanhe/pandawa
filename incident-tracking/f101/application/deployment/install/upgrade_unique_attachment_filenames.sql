prompt --application/deployment/install/upgrade_unique_attachment_filenames
begin
--   Manifest
--     INSTALL: UPGRADE-Unique Attachment Filenames
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
 p_id=>wwv_flow_imp.id(1512893068210094632)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'Unique Attachment Filenames'
,p_sequence=>70
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>'select * from all_constraints where constraint_name = ''EBA_INTRACK_FILES_UQ_ID_FN'';'
,p_script_clob=>'alter table eba_intrack_files add constraint eba_intrack_files_uq_id_fn unique (incident_id, filename);'
);
wwv_flow_imp.component_end;
end;
/
