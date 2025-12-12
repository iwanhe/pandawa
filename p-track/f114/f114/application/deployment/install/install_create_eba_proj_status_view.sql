prompt --application/deployment/install/install_create_eba_proj_status_view
begin
--   Manifest
--     INSTALL: INSTALL-create eba_proj_status view
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
 p_id=>wwv_flow_imp.id(4348661170399060999)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'create eba_proj_status view'
,p_sequence=>200
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace force view eba_proj_status as',
'    select prj.id,',
'        prj.is_deleted_yn,',
'        prj.template_id,',
'        prj.row_version_number,',
'        prj.cat_id,',
'        prj.parent_project_id,',
'        prj.row_key,',
'        prj.project,',
'        prj.description,',
'        prj.project_customer,',
'        prj.acl_status_level,',
'        prj.logo_blob,',
'        prj.logo_name,',
'        prj.logo_mimetype,',
'        prj.logo_charset,',
'        prj.logo_lastupd,',
'        prj.project_flex_01,',
'        prj.project_flex_02,',
'        prj.project_flex_03,',
'        prj.project_flex_04,',
'        prj.project_flex_05,',
'        prj.project_flex_06,',
'        prj.project_flex_07,',
'        prj.project_flex_08,',
'        prj.project_flex_n01,',
'        prj.project_flex_n02,',
'        prj.project_flex_n03,',
'        prj.project_flex_n04,',
'        prj.project_flex_d01,',
'        prj.project_flex_d02,',
'        prj.project_flex_d03,',
'        prj.project_flex_d04,',
'        prj.project_flex_d05,',
'        prj.project_flex_d06,',
'        prj.project_flex_d07,',
'        prj.project_flex_d08,',
'        prj.project_flex_d09,',
'        prj.project_flex_d10,',
'        prj.project_flex_d11,',
'        prj.project_flex_d12,',
'        prj.project_flex_clob,',
'        prj.project_status,',
'        prj.restrict_ms_ai_management,',
'        prj.tags,',
'        prj.next_milestone_name,',
'        prj.next_milestone_date,',
'        prj.goal,',
'        prj.what_is_success,',
'        prj.url,',
'        prj.include_by_default_yn,',
'        prj.size_id,',
'        prj.code_name,',
'        prj.deal_type_id,',
'        prj.project_start_date,',
'        prj.created,',
'        prj.created_by,',
'        prj.updated,',
'        prj.updated_by,',
'        prj.headline,',
'        prj.headline_last_updated,',
'        prj.requesting_team,',
'        prj.impacted_environment',
'    from eba_proj_status$ prj',
'    where prj.is_deleted_yn = ''N''',
'        and ( eba_proj_stat_ui.get_authorization_level( p_username => (select sys_context(''APEX$SESSION'',''APP_USER'') from dual) ) >= 4',
'            or prj.acl_status_level in (1,2)',
'            or ( prj.acl_status_level = 3',
'                and exists (select null',
'                            from eba_proj_status_users u,',
'                                eba_proj_user_ref rf,',
'                                ( select upper(sys_context(''APEX$SESSION'',''APP_USER'')) nm from dual ) usr',
'                            where u.username = usr.nm',
'                                and rf.user_id = u.id',
'                                and rf.project_id = prj.id',
'                            )',
'            )',
'        )',
'/'))
);
wwv_flow_imp.component_end;
end;
/
