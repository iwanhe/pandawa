prompt --application/deployment/install/upgrade_make_preference_name_unique
begin
--   Manifest
--     INSTALL: UPGRADE-Make Preference_Name Unique
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
 p_id=>wwv_flow_imp.id(6005796196359342870)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Make Preference_Name Unique'
,p_sequence=>300
,p_script_type=>'UPGRADE'
,p_condition_type=>'NOT_EXISTS'
,p_condition=>'select * from user_indexes where lower(index_name) = ''eba_proj_preferences_name_idx'' and uniqueness = ''UNIQUE'';'
,p_script_clob=>'create unique index eba_proj_preferences_name_idx on eba_proj_preferences(preference_name);'
);
wwv_flow_imp.component_end;
end;
/
