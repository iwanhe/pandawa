prompt --application/deployment/install/upgrade_remove_unique_link_names_constraint
begin
--   Manifest
--     INSTALL: UPGRADE-Remove Unique Link Names constraint
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
 p_id=>wwv_flow_imp.id(1512893351848108826)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'Remove Unique Link Names constraint'
,p_sequence=>80
,p_script_type=>'UPGRADE'
,p_condition_type=>'EXISTS'
,p_condition=>'select * from all_constraints where constraint_name = ''EBA_INTRACK_LINKS_UQ_ID_FN'';'
,p_script_clob=>'alter table eba_intrack_links drop constraint eba_intrack_links_uq_id_fn;'
);
wwv_flow_imp.component_end;
end;
/
