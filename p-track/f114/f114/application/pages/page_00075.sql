prompt --application/pages/page_00075
begin
--   Manifest
--     PAGE: 00075
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_page.create_page(
 p_id=>75
,p_name=>'Manage Project Updates'
,p_alias=>'UPDATES'
,p_step_title=>'Manage Project Updates'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486396754076853)
,p_html_page_header=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<style>',
'table.formlayout label {display: block; line-height:18px; }',
'table.formlayout label a {font: bold 11px/18px Arial, sans-serif; color: #333;}',
'table.formlayout label + br {display: none;}',
'#main-sb-left > div {margin-left: 10px;}',
'</style>'))
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.small-profile-photo { display: block; width: 32px; height: 32px; background-size: cover; background-repeat: no-repeat; border-radius: 100%; box-shadow: 0 0 0 1px rgba(0, 0, 0, .1) inset; }',
''))
,p_step_template=>wwv_flow_imp.id(6672319528586369818)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>'This page renders a timeline report of a project''s updates. Use the filter controls on the left of the report to change the timeline results. Click the linked username in an update to go to that user''s profile page. Click the <strong>Add Update</stro'
||'ng> button to add a new update. Click the <strong>< Return to Project</strong> button to return to the project details page.'
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6669835783441209495)
,p_plug_name=>'Search Filter'
,p_region_template_options=>'#DEFAULT#:t-Region--hideHeader:t-Region--hiddenOverflow:t-Form--stretchInputs:t-Form--labelsAbove'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>50
,p_plug_display_point=>'REGION_POSITION_02'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows=>15
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(6669838508815209498)
,p_plug_name=>'Status'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>30
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11512442499566053820)
,p_name=>'Project Updates'
,p_region_name=>'projectUpdates'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#:js-showMaximizeButton:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Comments--chat'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select comment_modifiers,',
'    note_type,',
'    comment_text,',
'    attribute_1,',
'    attribute_2,',
'    attribute_3,',
'    attribute_4,',
'    user_name,',
'    comment_date,',
'    icon_modifier,',
'    user_icon,',
'    actions,',
'    gold_label,',
'    gold_class,',
'    update_id,',
'    update_date,',
'    apex_util.prepare_url(x.user_profile) as profile_url',
'from (  select '''' comment_modifiers, --use is-systemMessage for gray look',
'            t.status_update_type||decode(t.is_active_yn,''Y'','''','' (inactive)'') note_type,',
'            regexp_replace(nvl(u.formatted_update,u.status_update),''##BREAK##'','''') comment_text,',
'            '''' attribute_1,',
'            '''' attribute_2,',
'            '''' attribute_3,',
'            '''' attribute_4,',
'            decode(u.gold_yn, null, '' '', ''N'', null, ''Y'', ''Gold'') as gold_label,',
'            decode(u.gold_yn, null, '' '', ''N'', ''is-hidden'', ''Y'', ''is-warning'') as gold_class,',
'            decode(us.first_name,null,lower(us.username),decode(us.last_name, null, lower(us.username), initcap(us.first_name || '' '' || us.last_name))) user_name,',
'            apex_util.get_since(u.update_date) comment_date,',
'            case',
'               when dbms_lob.getlength(us.photo_blob) > 0 then',
'                   ''comment-user-has-photo''',
'               else',
'                   ''u-color-''|| (ora_hash(u.created_by,44) + 1)',
'            end icon_modifier,',
'',
'            -- get user photo or initials',
'            case',
'                when dbms_lob.getlength(us.photo_blob) > 0 then',
'                    ''<span class="small-profile-photo" style="background-image: url(''''''',
'                      ||apex_util.prepare_url(''f?p=''||:APP_ID||'':IMAGE:''||:APP_SESSION||''::::GET_ID:''||apex_escape.html(us.username))',
'                      ||'''''');"></span>''',
'                else',
'                    upper(decode(instr(replace(u.created_by,''.'','' ''),'' ''),',
'                                 0, ',
'                                 substr(u.created_by,1,2),',
'                                 substr(u.created_by,1,1)||substr(u.created_by,instr(replace(u.created_by,''.'','' ''),'' '')+1,1)',
'                          ))',
'            end user_icon,',
'            --',
'            case when (eba_proj_fw.is_edit_authorized( p_username => upper(:APP_USER),',
'                                                      p_project_id => u.project_id ) = ''Y''',
'                       and',
'                       u.created_by = :APP_USER',
'                      )',
'                    then ''Edit''',
'                else ''''',
'            end as actions,',
'            u.id update_id,',
'            u.update_date,',
'            eba_proj_fw.profile_url(u.update_owner) as user_profile',
'        from eba_proj_status_updates u,',
'            eba_proj_status_update_types t,',
'            eba_proj_status_users us,',
'            eba_proj_status p,',
'            eba_proj_status_codes s,',
'            eba_proj_color_codes col',
'        where upper(u.update_owner) = us.username(+)',
'            and p.id = u.project_id',
'            and p.project_status = s.id(+)',
'            and col.id(+) = s.color_code_id',
'            and u.update_type = t.id',
'            and ( :P75_KEY is null or u.row_key = upper(:P75_KEY) )',
'            and ( nvl(:P75_UPDATE_TYPE,0) = 0',
'                or u.update_type = nvl(:P75_UPDATE_TYPE,0) )',
'            and ( :P75_SEARCH is null',
'                or instr(upper(p.row_key),upper(:P75_SEARCH)) > 0',
'                or instr(upper(p.code_name),upper(:P75_SEARCH)) > 0',
'                or instr(upper(u.row_key),upper(:P75_SEARCH)) > 0',
'                or instr(upper(dbms_lob.substr(u."STATUS_UPDATE",2000,1)),upper(:P75_SEARCH)) > 0',
'                or instr(upper(dbms_lob.substr(u."STATUS_UPDATE",2000,1990)),upper(:P75_SEARCH)) > 0',
'                or instr(upper(dbms_lob.substr(u."STATUS_UPDATE",2000,3990)),upper(:P75_SEARCH)) > 0',
'                or instr(upper(u.update_owner),upper(:P75_SEARCH)) > 0',
'            )',
'            and (:P75_UPDATE_BY is null',
'                or upper(u.update_owner) like upper(:P75_UPDATE_BY))',
'            and (:P75_UPDATED is null',
'                or u.created >= sysdate - :P75_UPDATED)',
'            and ( :P75_GOLD is null',
'                or ( :P75_GOLD is not null',
'                    and :P75_GOLD = nvl(u.gold_yn,''N'')',
'                )',
'            )',
'            and p.id = :P75_PROJECT',
'        -- eba_proj_status_users.username is forced to upper via trigger',
'        -- eba_proj_status_updates.owner is forced to lower via trigger',
'        order by 16 desc',
') x'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P75_GOLD,P75_UPDATE_BY,P75_UPDATE_TYPE,P75_KEY,P75_SEARCH'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364136973369904)
,p_query_headings_type=>'QUERY_COLUMNS'
,p_query_num_rows=>15
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_no_data_found=>'No project updates found.'
,p_query_row_count_max=>500
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
,p_required_patch=>wwv_flow_imp.id(11756704262311161627)
,p_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select 1 x',
'from EBA_PROJ_STATUS_UPDATES u,',
'    EBA_PROJ_STATUS_UPDATE_TYPES t',
'where u.update_type = t.id(+)',
'    and ( u.project_id = :P200_ID ',
'        or (nvl(:P200_INC_CHILD,''N'') = ''Y''',
'            and u.project_id in (select s.id ',
'                                 from EBA_PROJ_STATUS s',
'                                 where s.parent_project_id = :P200_ID))',
'    )',
'union all',
'select 1 x',
'from eba_proj_history f',
'where component_id = :P200_ID ',
'union all',
'select 1 x',
'from eba_proj_history f,',
'    eba_proj_status_ais ai',
'where f.table_name = ''STATUS_AIS''',
'    and f.component_id = ai.id',
'    and ai.project_id = :P200_ID ',
'union all',
'select 1 x',
'from eba_proj_history f,',
'    eba_proj_status_ms ms',
'where f.table_name = ''STATUS_MS''',
'    and f.component_id = ms.id',
'    and ms.project_id = :P200_ID'))
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836784672585451261)
,p_query_column_id=>1
,p_column_alias=>'COMMENT_MODIFIERS'
,p_column_display_sequence=>14
,p_column_heading=>'Comment modifiers'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836784933716451265)
,p_query_column_id=>2
,p_column_alias=>'NOTE_TYPE'
,p_column_display_sequence=>1
,p_column_heading=>'Note Type'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836785365788451265)
,p_query_column_id=>3
,p_column_alias=>'COMMENT_TEXT'
,p_column_display_sequence=>8
,p_column_heading=>'Comment Text'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836785715250451265)
,p_query_column_id=>4
,p_column_alias=>'ATTRIBUTE_1'
,p_column_display_sequence=>3
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836786189886451266)
,p_query_column_id=>5
,p_column_alias=>'ATTRIBUTE_2'
,p_column_display_sequence=>4
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836786508591451266)
,p_query_column_id=>6
,p_column_alias=>'ATTRIBUTE_3'
,p_column_display_sequence=>2
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836786992001451267)
,p_query_column_id=>7
,p_column_alias=>'ATTRIBUTE_4'
,p_column_display_sequence=>5
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836787397707451268)
,p_query_column_id=>8
,p_column_alias=>'USER_NAME'
,p_column_display_sequence=>9
,p_column_heading=>'Username'
,p_column_html_expression=>'<a href="#PROFILE_URL#">#USER_NAME#</a>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836787775445451268)
,p_query_column_id=>9
,p_column_alias=>'COMMENT_DATE'
,p_column_display_sequence=>10
,p_column_heading=>'Comment Date'
,p_column_html_expression=>'#COMMENT_DATE# <span class="t-Badge t-Badge--orb t-Badge--small #GOLD_CLASS#">#GOLD_LABEL#</span>'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836788163332451269)
,p_query_column_id=>10
,p_column_alias=>'ICON_MODIFIER'
,p_column_display_sequence=>11
,p_column_heading=>'Icon modifier'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836788558666451270)
,p_query_column_id=>11
,p_column_alias=>'USER_ICON'
,p_column_display_sequence=>12
,p_column_heading=>'User icon'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836788919251451270)
,p_query_column_id=>12
,p_column_alias=>'ACTIONS'
,p_column_display_sequence=>13
,p_column_heading=>'Actions'
,p_column_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:RP,12:P12_ID:#UPDATE_ID#'
,p_column_linktext=>'#ACTIONS#'
,p_heading_alignment=>'LEFT'
,p_report_column_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_derived_column=>'N'
,p_include_in_export=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836789322793451271)
,p_query_column_id=>13
,p_column_alias=>'GOLD_LABEL'
,p_column_display_sequence=>16
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836789723810451272)
,p_query_column_id=>14
,p_column_alias=>'GOLD_CLASS'
,p_column_display_sequence=>17
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836790160133451273)
,p_query_column_id=>15
,p_column_alias=>'UPDATE_ID'
,p_column_display_sequence=>6
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836790506787451273)
,p_query_column_id=>16
,p_column_alias=>'UPDATE_DATE'
,p_column_display_sequence=>7
,p_column_heading=>'Update Date'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3836790953418451274)
,p_query_column_id=>17
,p_column_alias=>'PROFILE_URL'
,p_column_display_sequence=>15
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(6669836400448209495)
,p_button_sequence=>100
,p_button_plug_id=>wwv_flow_imp.id(6669835783441209495)
,p_button_name=>'P75_RESET'
,p_button_static_id=>'P75_RESET'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft:t-Button--gapTop'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_image_alt=>'Reset'
,p_button_position=>'BELOW_BOX'
,p_button_alignment=>'RIGHT'
,p_button_execute_validations=>'N'
,p_icon_css_classes=>'fa-undo-alt'
,p_request_source=>'reset'
,p_request_source_type=>'STATIC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12385758642260735563)
,p_button_sequence=>92
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'return_to_project'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_image_alt=>'Return to Project'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.::P200_ID:&P75_PROJECT.#projectUpdates'
,p_icon_css_classes=>'fa-chevron-left'
,p_grid_new_row=>'Y'
,p_grid_new_column=>'Y'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(3483109895251085389)
,p_button_sequence=>102
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'ADD_UPDATE'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Add Update'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:12:P12_PROJECT_ID:&P75_PROJECT.'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6669839308153209499)
,p_branch_name=>'Go To Page 75'
,p_branch_action=>'f?p=&APP_ID.:75:&SESSION.::&DEBUG.:RP,75:P75_PROJECT:&P75_PROJECT.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_when_button_id=>wwv_flow_imp.id(6669836400448209495)
,p_branch_sequence=>10
,p_save_state_before_branch_yn=>'Y'
,p_branch_comment=>'Created 01-JUL-2011 07:39 by SBKENNED'
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(6669839511019209499)
,p_branch_action=>'f?p=&FLOW_ID.:75:&SESSION.'
,p_branch_point=>'AFTER_PROCESSING'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>20
,p_save_state_before_branch_yn=>'Y'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3483107415196085365)
,p_name=>'P75_UPDATE_BY'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(6669835783441209495)
,p_prompt=>'Update By'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    distinct initcap(v1.d), v1.r',
'from',
'    (',
'        select ',
'            (select initcap(u.username) from eba_proj_status_users u where u.id = r.user_id) as d,',
'            (select upper(u.username) from eba_proj_status_users u where u.id = r.user_id) as r',
'        from',
'            EBA_PROJ_USER_REF r',
'        where',
'            r.project_id = :P75_PROJECT',
'        union all',
'        select ',
'            initcap(u.update_owner) as d,',
'            (select u.username from eba_proj_status_users u where upper(u.username) = upper(u.update_owner)) as r',
'        from',
'            EBA_PROJ_STATUS_UPDATES u',
'        where',
'            u.project_id = :P75_PROJECT',
'        and',
'            u.update_owner is not null',
'        ) v1;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(3483108914028085380)
,p_name=>'P75_UPDATED'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(6669835783441209495)
,p_prompt=>'Updated'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'UPDATED SINCE'
,p_lov=>'.'||wwv_flow_imp.id(3765646761693449590)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6067002685681895416)
,p_name=>'P75_KEY'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(6669835783441209495)
,p_prompt=>'Project Update Key'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'N',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6669835997721209495)
,p_name=>'P75_SEARCH'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(6669835783441209495)
,p_prompt=>'Search'
,p_placeholder=>'Search Updates'
,p_display_as=>'NATIVE_TEXT_FIELD'
,p_cSize=>64
,p_cMaxlength=>4000
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#:t-Form-fieldContainer--large'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'disabled', 'N',
  'submit_when_enter_pressed', 'Y',
  'subtype', 'TEXT',
  'trim_spaces', 'BOTH')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6669836196530209495)
,p_name=>'P75_UPDATE_TYPE'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(6669835783441209495)
,p_item_default=>'ALL'
,p_prompt=>'Type'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'UPDATE TYPES (ALL)'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select status_update_type||decode(is_active_yn,''Y'','''','' (Inactive)'') d, id r',
'from   EBA_PROJ_STATUS_UPDATE_TYPES',
'order by is_active_yn desc, display_sequence'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_lov_null_value=>'0'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_tag_attributes=>'style="width: 170px;"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6669837904402209497)
,p_name=>'P75_PROJECT'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(6669835783441209495)
,p_prompt=>'Project'
,p_display_as=>'NATIVE_HIDDEN'
,p_cSize=>64
,p_cMaxlength=>4000
,p_cHeight=>1
,p_cAttributes=>'nowrap="nowrap"'
,p_tag_attributes=>'style="width: 170px;"'
,p_label_alignment=>'ABOVE'
,p_field_alignment=>'LEFT-CENTER'
,p_field_template=>wwv_flow_imp.id(6672376976377369941)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(18042376322333658693)
,p_name=>'P75_GOLD'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(6669835783441209495)
,p_prompt=>'Gold Rated'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'YES NO RETURNS Y N'
,p_lov=>'.'||wwv_flow_imp.id(8910494933283350717)||'.'
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_help_text=>'<p>Filter updates by their "Gold" rating.</p>'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(6669839090356209499)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'75'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18011877497238745628)
,p_name=>'Search Updates on Enter'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P75_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.keyCode == 13'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'custom'
,p_bind_event_type_custom=>'change, keypress'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18011877652085745630)
,p_event_id=>wwv_flow_imp.id(18011877497238745628)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01=>'this.browserEvent.preventDefault();'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(18011877862447745632)
,p_name=>'Refresh results on filter change'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P75_GOLD,P75_UPDATE_TYPE,P75_KEY,P75_UPDATE_BY,P75_UPDATED'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(18011877981757745633)
,p_event_id=>wwv_flow_imp.id(18011877862447745632)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11512442499566053820)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3483109962717085390)
,p_name=>'Refresh on Add'
,p_event_sequence=>30
,p_triggering_element_type=>'BUTTON'
,p_triggering_button_id=>wwv_flow_imp.id(3483109895251085389)
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'apexafterclosedialog'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3836569878847064480)
,p_event_id=>wwv_flow_imp.id(3483109962717085390)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11512442499566053820)
,p_attribute_01=>'N'
);
wwv_flow_imp.component_end;
end;
/
