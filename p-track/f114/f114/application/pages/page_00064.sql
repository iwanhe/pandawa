prompt --application/pages/page_00064
begin
--   Manifest
--     PAGE: 00064
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
 p_id=>64
,p_name=>'&APPLICATION_TITLE.: Home'
,p_alias=>'HOME'
,p_step_title=>'&APPLICATION_TITLE.: Home'
,p_reload_on_submit=>'A'
,p_warn_on_unsaved_changes=>'N'
,p_autocomplete_on_off=>'ON'
,p_group_id=>wwv_flow_imp.id(5847486190175074984)
,p_inline_css=>wwv_flow_string.join(wwv_flow_t_varchar2(
'.homepage-hero .t-HeroRegion-form,',
'.homepage-hero .t-HeroRegion-buttons {',
'  display: table-cell;',
'  vertical-align: middle;',
'}',
'',
'@media only screen and (max-width: 640px) {',
'    .homepage-hero .t-HeroRegion-form,',
'    .homepage-hero .t-HeroRegion-buttons {',
'        vertical-align: top;',
'    }',
'}',
'',
'.pa-Cards .t-Card .t-Card-titleWrap { padding: 16px 12px; }',
'.pa-Cards .t-Card .t-Card-title { text-align: left; }',
'.pa-Cards .t-Card .t-Card-title .fa { vertical-align: top; line-height: 24px; color: rgba(0, 0, 0, 0.50); margin-right: 4px; }',
'.pa-Cards .t-Card .t-Card-body { padding: 0px; border-top-width: 0; }',
'.pa-Cards-body { display: block; }',
'.pa-Cards-body-row { display: -webkit-box; display: -ms-flexbox; display: flex; padding: 12px; }',
'.pa-Cards-body-title { -webkit-box-flex: 1; -ms-flex-positive: 1; flex-grow: 1; font-size: 14px; line-height: 24px; color: rgba(0, 0, 0, 0.65); }',
'.pa-Cards-body-header { background: rgba(0, 0, 0, .05); -webkit-box-align: end; -ms-flex-align: end; align-items: flex-end; }',
'.pa-Cards-body-header .pa-Cards-body-title { color: rgba(0, 0, 0, 0.85); }',
'.pa-Cards-body-badgeContainer { -ms-flex-negative: 0; flex-shrink: 0; min-width: 15%; text-align: center; margin-left: 4px; }',
'.pa-Cards-body-badgeLabel { display: block; font-size: 11px; line-height: 16px; color: rgba(0, 0, 0, .55); margin-bottom: 4px; }',
'.pa-Cards-body-badge { display: inline-block; background: rgba(0, 0, 0, .075); padding: 4px 8px; line-height: 16px; border-radius: 16px; font-size: 12px; min-width: 32px; text-align: center; color: rgba(0, 0, 0, .65); }',
'.pa-Cards-body-badge:hover, .pa-Cards-body-badge:focus { -webkit-box-shadow: 0 0 0 2px rgba(5, 114, 206, 0.50); box-shadow: 0 0 0 2px rgba(5, 114, 206, 0.50); }',
'.pa-Cards-body-badge--hot { background-color: #0572ce; color: #FFF; }',
'.pa-Cards .t-Card-colorFill { display: none; pointer-events: none;}',
'.pa-Cards--hideInfo .t-Card-info { display: none; }',
'.pa-Cards .t-Card-info { padding: 8px 12px; border-top: 1px solid rgba(0, 0, 0, .05); margin-top: 0; background-color: rgba(0, 0, 0, .01); }',
'.pa-Cards .t-Card .t-Card-title {margin-right: 64px;}',
'.pa-Cards .t-Card-icon {',
'    background-color: transparent !important;',
'}',
'.pa-Cards .t-Card-icon .t-Icon {',
'    width: auto;',
'}',
'',
'.project-edit-link {opacity: 0; transition: 0.2s ease;}',
'.pa-Cards .t-Card:hover .project-edit-link {opacity: 1;}',
'',
'span.project-logo {',
'    display: block;',
'    width: 100%;',
'    background-size: cover;',
'    height: 100%;',
'    border-radius: 2px;',
'    background-position: 50%;',
'    background-repeat: no-repeat;',
'}',
'',
'span.t-Card-initials {',
'    width: 100%;',
'    height: 100%;',
'}',
'',
'.t-Cards-item.has-image .t-Card-icon {',
'    border-radius: 0;',
'    background-color: transparent;',
'}',
'.t-Cards-item.has-initials {',
'    ',
'}'))
,p_step_template=>wwv_flow_imp.id(6672319528586369818)
,p_page_template_options=>'#DEFAULT#'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This page provides a listing of all projects.  Using this page you can:',
'',
'<ul>',
'<li>Filter projects using left side filter bar</li>',
'<li>Control sort order of projects</li>',
'<li>Create new projects, assuming you have the privilege</li>',
'</ul>',
'',
'<p>Counts of action items, milestones, and issues represent the number that are open and the number of updates that were created within the last 30 days.</p>'))
,p_page_component_map=>'03'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(3850925427829294247)
,p_name=>'Simple Cards'
,p_template=>wwv_flow_imp.id(6672346928802369862)
,p_display_sequence=>40
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--basic:t-Cards--displayInitials:t-Cards--3cols:t-Cards--desc-3ln:t-Cards--animColorFill'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select card_title,',
'       card_link,',
'       card_icon,',
'       case when substr(card_initials, 1, 4) = ''<spa'' then',
'           ''has-image''',
'       else',
'           ''has-initials''',
'       end as card_modifiers,',
'       card_text,',
'       card_subtext,',
'       case when substr(card_initials, 1, 4) = ''<spa'' then',
'           card_initials',
'       else',
'           decode(instr(card_initials,'' ''),',
'                 0, ',
'                 substr(card_initials,1,2),',
'                 substr(card_initials,1,1)||substr(card_initials,instr(card_initials,'' '')+1,1)',
'           )',
'      end as card_initials,',
'      x.created,',
'      x.updated',
'from',
'(',
'select ',
'      s.PROJECT  card_title, ',
'      apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||s.id) card_link,',
'      null card_icon,',
'      null card_modifiers,',
'      --',
'      --',
'      rtrim(c.status_short_desc||'', ''||',
'      nvl(s.headline,nvl(s.description ,s.goal)),'', '')',
'      card_text,',
'     --',
'    decode(eba_proj_stat_ui.is_project_open(s.id), 0, ''Closed Project'', 1, ''Open Project'') || '', ''||',
'    decode(s.acl_status_level,1,''Open Access'',2,''Restricted Access'',3,''Restricted Access'') || '', ''||',
'    case when eba_proj_fw.get_preference_value( ''MOST_IMPORTANT_PROJECT_ROLE'' ) != ''Preference does not exist'' and exists',
'         (select null',
'            from eba_proj_user_ref rf,',
'                 eba_proj_status_users u,',
'                 eba_proj_roles r',
'           where rf.project_id = s.id',
'             and rf.user_id = u.id',
'             and rf.role_id = r.id',
'             and r.id = eba_proj_fw.get_preference_value( ''MOST_IMPORTANT_PROJECT_ROLE'' )',
'             and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'') then',
'        (   select listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '') within group',
'                (order by nvl(rf.acl_status_level,r.default_acl_status_level) desc, lower(u.username))',
'            from eba_proj_user_ref rf,',
'                eba_proj_status_users u,',
'                eba_proj_roles r',
'            where rf.project_id = s.id',
'                and rf.user_id = u.id',
'                and rf.role_id = r.id',
'                and r.id = eba_proj_fw.get_preference_value( ''MOST_IMPORTANT_PROJECT_ROLE'' )',
'                and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'' )',
'    else',
'        (   select listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '') within group',
'                (order by nvl(rf.acl_status_level,r.default_acl_status_level) desc, lower(u.username))',
'            from eba_proj_user_ref rf,',
'                eba_proj_status_users u,',
'                eba_proj_roles r',
'            where rf.project_id = s.id',
'                and rf.user_id = u.id',
'                and rf.role_id = r.id',
'                and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'' )',
'    end as card_subtext,',
'   case when s.logo_blob is null then',
'       upper(',
'           replace(replace(',
'               replace(replace(replace(replace(replace(s.project,''-'','' ''),'','','' ''),'';'','' ''),''|'','' ''),''/'','' ''),',
'           ''  '','' ''),''  '','' ''))',
'   else',
'       ''<span class="project-logo" style="background-image: url(''''''||apex_util.get_blob_file_src(p_item_name  => ''P2_LOGO'',p_v1 => s.id, p_content_disposition => ''inline'')||'''''');" aria-hidden="true"></span>''',
'   end as card_initials,',
'   s.created,',
'   s.updated',
'from EBA_PROJ_STATUS s,',
'     eba_proj_status_codes c',
'where c.id = s.PROJECT_STATUS(+) and ',
'      s.project is not null',
'    --',
'     and (NVL(:P64_OWNER,''0'') = ''0'' or',
'          exists (select null',
'                  from eba_proj_user_ref rf,',
'                      eba_proj_status_users u,',
'                      eba_proj_roles r',
'                  where lower(u.id) = lower(:P64_OWNER)',
'                      and rf.user_id = u.id',
'                      and rf.project_id = s.id',
'                      and rf.role_id = r.id',
'                      and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y''',
'                 )',
'            )',
'    and (:P64_STATUS is null or '':''||:P64_STATUS||'':'' like ''%:''||s.project_status||'':%'')',
'    and (:P64_SIZE is null or s.size_id = :P64_SIZE)',
'    and (nvl(:P64_CATEGORY,0) = 0 or s.cat_id = :P64_CATEGORY)',
'    and (nvl(:P64_DEAL_TYPE,0) = 0 or s.deal_type_id = :P64_DEAL_TYPE)',
'    and (:P64_SEARCH is null ',
'           or instr(upper(s.PROJECT),upper(:P64_SEARCH))>0',
'           or instr(upper(s.goal),upper(:P64_SEARCH))>0',
'           or instr(upper(s.description),upper(:P64_SEARCH))>0',
'           or instr(upper(s.row_key),upper(:P64_SEARCH))>0',
'           or instr(upper(s.code_name),upper(:P64_SEARCH))>0 ',
'           )',
'    and (NVL(:P64_FOLLOWING,''0'') != ''1'' or',
'             exists (',
'             select 1 from EBA_PROJ_STATUS_FAVORITES f ',
'             where f.content_id = s.id and f.user_name = upper(:APP_USER)))',
') x',
'where nvl(:P64_DISPLAY,''SIMPLECARDS'') = ''SIMPLECARDS''',
'order by decode(nvl(:P64_SORT,''DATE''),',
'                 ''DATE'',to_char(greatest(x.updated,x.created),''YYYYMMDDHH24MISS''),',
'                 ''CREATED'',to_char(x.created,''YYYYMMDDHH24MISS''),',
'                 ''x'') desc nulls last,',
'             decode(nvl(:P64_SORT,''DATE''),',
'                 ''PROJECT'', x.card_title,',
'                 ''x'') nulls last'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P64_STATUS,P64_OWNER,P64_CATEGORY,P64_FOLLOWING,P64_SEARCH,P64_DISPLAY,P64_SORT,P64_ROWS,P64_SIZE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6726044247164908098)
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_num_rows_item=>'P64_ROWS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3850925525369294248)
,p_query_column_id=>1
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3850925675599294249)
,p_query_column_id=>2
,p_column_alias=>'CARD_LINK'
,p_column_display_sequence=>2
,p_column_heading=>'Card link'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3850925745090294250)
,p_query_column_id=>3
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>3
,p_column_heading=>'Card icon'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3850925845466294251)
,p_query_column_id=>4
,p_column_alias=>'CARD_MODIFIERS'
,p_column_display_sequence=>4
,p_column_heading=>'Card modifiers'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3850925942229294252)
,p_query_column_id=>5
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>5
,p_column_heading=>'Card text'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3850926055707294253)
,p_query_column_id=>6
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>6
,p_column_heading=>'Card subtext'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3850926173146294254)
,p_query_column_id=>7
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>7
,p_column_heading=>'Card initials'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4091350316051305355)
,p_query_column_id=>8
,p_column_alias=>'CREATED'
,p_column_display_sequence=>8
,p_column_heading=>'Created'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(4091350416494305356)
,p_query_column_id=>9
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>9
,p_column_heading=>'Updated'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5910265093140766853)
,p_plug_name=>'Hidden Items'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>120
,p_plug_display_point=>'REGION_POSITION_07'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(5910265302491769580)
,p_plug_name=>'About Filtering'
,p_region_template_options=>'#DEFAULT#:js-dialog-size600x400'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672356708893369886)
,p_plug_display_sequence=>110
,p_plug_display_point=>'REGION_POSITION_04'
,p_plug_source=>'<p>You can filter the rows returned by this query by clicking on the <strong>Filters</strong> control and checking data values.  All checked values within a group will be or-ed, values in different groups will be and-ed.  Search filters are also and-'
||'ed, and multiple general search filters are also and-ed. </p>'
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(6720857462274739470)
,p_name=>'Project Cards'
,p_template=>wwv_flow_imp.id(6672346928802369862)
,p_display_sequence=>60
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_sub_css_classes=>'pa-Cards'
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#:u-colors:t-Cards--basic:t-Cards--displayInitials:t-Cards--cols:t-Cards--animColorFill'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select id,',
'       card_title,',
'       card_icon,',
'       card_modifiers,',
'       card_text,',
'       description,',
'       case when headline is not null then',
'           ''<br><strong>Headline:</strong> '' || headline || ''<br><strong>Updated:</strong> '' || apex_util.get_since(updated) || '' by '' || lower(updated_by)',
'       else',
'           ''<br><strong>Updated:</strong> '' || apex_util.get_since(updated) || '' by '' || lower(updated_by)',
'       end as headline,',
'       rtrim(card_subtext, '', '') as card_subtext,',
'       created,',
'       updated,',
'       ai_display,',
'       ms_display,',
'       pi_display,',
'       up_display,',
'       ai_me_url,',
'       ai_tm_url,',
'       ms_me_url,',
'       ms_tm_url,',
'       pi_me_url,',
'       pi_tm_url,',
'       up_me_url,',
'       up_tm_url,',
'       ai_me_cnt,',
'       ai_tm_cnt,',
'       ms_me_cnt,',
'       ms_tm_cnt,',
'       pi_me_cnt,',
'       pi_tm_cnt,',
'       up_me_cnt,',
'       up_tm_cnt,',
'       decode(ms_me_cnt,0,'' '',''pa-Cards-body-badge--hot'') ms_me_is_hot,',
'       decode(ai_me_cnt,0,'' '',''pa-Cards-body-badge--hot'') ai_me_is_hot,',
'       decode(pi_me_cnt,0,'' '',''pa-Cards-body-badge--hot'') pi_me_is_hot,',
'       decode(up_me_cnt,0,'' '',''pa-Cards-body-badge--hot'') up_me_is_hot,',
'       decode(instr(card_initials,'' ''),',
'                 0, ',
'                 substr(card_initials,1,2),',
'                 substr(card_initials,1,1)||substr(card_initials,instr(card_initials,'' '')+1,1)',
'           ) card_initials',
'from',
'(',
'select ',
'      s.id,',
'      s.PROJECT  card_title, ',
'      apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||s.id) card_link,',
'      null card_icon,',
'      null card_modifiers,',
'      rtrim(c.status_short_desc||'', ''||nvl(s.headline,nvl(s.description ,s.goal)),'', '') card_text,',
'      rtrim(nvl(s.description, s.goal),'', '') description,',
'      case when s.HEADLINE_LAST_UPDATED is not null then',
'           apex_util.get_since(s.HEADLINE_LAST_UPDATED) || '': '' || s.headline',
'      else',
'           null',
'      end as headline,',
'      s.project,',
'      s.created,',
'      s.updated,',
'      s.updated_by,',
'      --',
'      case when apex_util.get_build_option_status(',
'                    p_application_id    => :APP_ID,',
'                    p_build_option_name => ''Project Action Items''',
'                ) = ''INCLUDE'' then',
'          '' ''',
'      else',
'          ''style="display: none"''',
'      end AI_DISPLAY,',
'      case when apex_util.get_build_option_status(',
'                    p_application_id    => :APP_ID,',
'                    p_build_option_name => ''Project Milestones''',
'                ) = ''INCLUDE'' then',
'          '' ''',
'      else',
'          ''style="display: none"''',
'      end MS_DISPLAY,',
'      case when apex_util.get_build_option_status(',
'                    p_application_id    => :APP_ID,',
'                    p_build_option_name => ''Project Issues''',
'                ) = ''INCLUDE'' then',
'          '' ''',
'      else',
'          ''style="display: none"''',
'      end PI_DISPLAY,',
'      case when apex_util.get_build_option_status(',
'                    p_application_id    => :APP_ID,',
'                    p_build_option_name => ''Project Updates''',
'                ) = ''INCLUDE'' then',
'          '' ''',
'      else',
'          ''style="display: none"''',
'      end UP_DISPLAY,',
'      --',
'      apex_util.prepare_url(''f?p='' || :APP_ID || '':55:'' || :APP_SESSION || ''::NO:55,RP,RIR:P55_ID,P200_ID,P55_OWNER:'' || s.id || '','' || s.id || '','' || :APP_USER) as ai_me_url,',
'      apex_util.prepare_url(''f?p='' || :APP_ID || '':55:'' || :APP_SESSION || ''::NO:55,RP,RIR:P55_ID,P200_ID:'' || s.id || '','' || s.id) as ai_tm_url,',
'      apex_util.prepare_url(''f?p='' || :APP_ID || '':34:'' || :APP_SESSION || ''::NO:34,RP,RIR:P34_ID,P200_ID,P34_OWNER:'' || s.id || '','' || s.id || '','' || lower(:APP_USER) || '',Open'') as ms_me_url,',
'      apex_util.prepare_url(''f?p='' || :APP_ID || '':34:'' || :APP_SESSION || ''::NO:34,RP,RIR:P34_ID,P200_ID:'' || s.id || '','' || s.id) as ms_tm_url,',
'      apex_util.prepare_url(''f?p='' || :APP_ID || '':92:'' || :APP_SESSION || ''::NO:92,RP,RIR:P92_ID,P200_ID,IRC_ISSUE_OWNER,IR_OPEN:'' || s.id || '','' || s.id || '','' || :NICE_USERNAME || '',Open'') as pi_me_url,',
'      apex_util.prepare_url(''f?p='' || :APP_ID || '':92:'' || :APP_SESSION || ''::NO:92,RP,RIR:P92_ID,P200_ID,IR_OPEN:'' || s.id || '','' || s.id || '',Open'') as pi_tm_url,',
'      apex_util.prepare_url(''f?p='' || :APP_ID || '':75:'' || :APP_SESSION || ''::NO:75,RP,RIR:P75_PROJECT,P200_ID,P75_UPDATED,P75_UPDATE_BY:'' || s.id || '','' || s.id || '',30,'' || :APP_USER) as up_me_url,',
'      apex_util.prepare_url(''f?p='' || :APP_ID || '':75:'' || :APP_SESSION || ''::NO:75,RP,RIR:P75_PROJECT,P200_ID,P75_UPDATED:'' || s.id || '','' || s.id || '',30'') as up_tm_url,',
'      --',
'      (select count(*) from eba_proj_status_ais ai where ai.action_status = ''Open'' and (upper(ai.action_owner_01) = :APP_USER or upper(ai.action_owner_02) = :APP_USER or upper(ai.action_owner_03) = :APP_USER or upper(ai.action_owner_04) = :APP_USER o'
||'r exists (select null from eba_proj_user_ref rf where rf.project_id = ai.project_id and rf.user_id = :CURRENT_USER_ID and rf.role_id = ai.owner_role_id)) and ai.project_id = s.id) as ai_me_cnt,',
'      (select count(*) from eba_proj_status_ais where action_status = ''Open'' and project_id = s.id) as ai_tm_cnt,',
'      (select count(*) from eba_proj_status_ms ms where ms.milestone_status = ''Open'' and (upper(ms.milestone_owner) = :APP_USER or exists (select null from eba_proj_user_ref rf where rf.project_id = ms.project_id and rf.user_id = :CURRENT_USER_ID and'
||' rf.role_id = ms.owner_role_id)) and ms.project_id = s.id) as ms_me_cnt,',
'      (select count(*) from eba_proj_status_ms where milestone_status = ''Open'' and project_id = s.id) as ms_tm_cnt,',
'      (select count(*) from eba_proj_status_issues i where i.is_open = ''Y'' and (upper(i.issue_owner) = :APP_USER or exists (select null from eba_proj_user_ref rf where rf.project_id = i.project_id and rf.user_id = :CURRENT_USER_ID and rf.role_id = i.'
||'owner_role_id)) and i.project_id = s.id) as pi_me_cnt,',
'      (select count(*) from eba_proj_status_issues where is_open = ''Y'' and project_id = s.id) as pi_tm_cnt,',
'      (select count(*) from eba_proj_status_updates u where upper(u.update_owner) = :APP_USER and u.project_id = s.id and u.created >= sysdate - 30) as up_me_cnt,',
'      (select count(*) from eba_proj_status_updates u where u.project_id = s.id and u.created >= sysdate - 30) as up_tm_cnt,',
'      --',
'      (select ''<strong>'' || STATUS_SHORT_DESC || ''</strong>'' from EBA_PROJ_STATUS_CODES where id = s.project_status) || '', '' ||',
'      decode(eba_proj_stat_ui.is_project_open(s.id), 0, ''Closed Project, '', 1, null) ||',
'      decode(eba_proj_stat_ui.is_project_open(s.id), 0, decode(s.acl_status_level,1,''Open Access, '',2,''Restricted Access, '',3,''Restricted Access, ''), 1, null) ||',
'      case when eba_proj_fw.get_preference_value( ''MOST_IMPORTANT_PROJECT_ROLE'' ) != ''Preference does not exist'' and exists',
'         (select null',
'            from eba_proj_user_ref rf,',
'                 eba_proj_status_users u,',
'                 eba_proj_roles r',
'           where rf.project_id = s.id',
'             and rf.user_id = u.id',
'             and rf.role_id = r.id',
'             and r.id = eba_proj_fw.get_preference_value( ''MOST_IMPORTANT_PROJECT_ROLE'' )',
'             and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'') then',
'        (   select listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '') within group',
'                (order by nvl(rf.acl_status_level,r.default_acl_status_level) desc, lower(u.username))',
'            from eba_proj_user_ref rf,',
'                eba_proj_status_users u,',
'                eba_proj_roles r',
'            where rf.project_id = s.id',
'                and rf.user_id = u.id',
'                and rf.role_id = r.id',
'                and r.id = eba_proj_fw.get_preference_value( ''MOST_IMPORTANT_PROJECT_ROLE'' )',
'                and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'' )',
'      else',
'        (   select listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '') within group',
'                (order by nvl(rf.acl_status_level,r.default_acl_status_level) desc, lower(u.username))',
'            from eba_proj_user_ref rf,',
'                eba_proj_status_users u,',
'                eba_proj_roles r',
'            where rf.project_id = s.id',
'                and rf.user_id = u.id',
'                and rf.role_id = r.id',
'                and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'' )',
'      end as card_subtext,',
'      upper(',
'       replace(replace(',
'           replace(replace(replace(replace(replace(s.project,''-'','' ''),'','','' ''),'';'','' ''),''|'','' ''),''/'','' ''),',
'       ''  '','' ''),''  '','' '')) card_initials',
'from EBA_PROJ_STATUS s,',
'     eba_proj_status_codes c',
'where c.id = s.PROJECT_STATUS(+) and ',
'      s.project is not null',
'    --',
'     and (NVL(:P64_OWNER,''0'') = ''0'' or',
'          exists (select null',
'                  from eba_proj_user_ref rf,',
'                      eba_proj_status_users u,',
'                      eba_proj_roles r',
'                  where lower(u.id) = lower(:P64_OWNER)',
'                      and rf.user_id = u.id',
'                      and rf.project_id = s.id',
'                      and rf.role_id = r.id',
'                      and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y''',
'                 )',
'            )',
'    and (:P64_STATUS is null or '':''||:P64_STATUS||'':'' like ''%:''||s.project_status||'':%'')',
'    and (:P64_SIZE is null or s.size_id = :P64_SIZE)',
'    and (nvl(:P64_CATEGORY,0) = 0 or s.cat_id = :P64_CATEGORY)',
'    and (nvl(:P64_DEAL_TYPE,0) = 0 or s.deal_type_id = :P64_DEAL_TYPE)',
'    and (:P64_SEARCH is null ',
'           or instr(upper(s.PROJECT),upper(:P64_SEARCH))>0',
'           or instr(upper(s.goal),upper(:P64_SEARCH))>0',
'           or instr(upper(s.description),upper(:P64_SEARCH))>0',
'           or instr(upper(s.row_key),upper(:P64_SEARCH))>0',
'           or instr(upper(s.code_name),upper(:P64_SEARCH))>0 ',
'           )',
'    and (NVL(:P64_FOLLOWING,''0'') != ''1'' or',
'             exists (',
'             select 1 from EBA_PROJ_STATUS_FAVORITES f ',
'             where f.content_id = s.id and f.user_name = upper(:APP_USER)))',
') x',
'where nvl(:P64_DISPLAY,''CARDS'') = ''CARDS''',
'order by      ',
'             decode(nvl(:P64_SORT,''DATE''),',
'                 ''DATE'',to_char(greatest(x.updated,x.created),''YYYYMMDDHH24MISS''),',
'                 ''CREATED'',to_char(x.created,''YYYYMMDDHH24MISS''),',
'                 ''x'') desc nulls last,',
'             decode(nvl(:P64_SORT,''DATE''),',
'                 ''PROJECT'', x.card_title,',
'                 ''x'') nulls last'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P64_STATUS,P64_OWNER,P64_CATEGORY,P64_FOLLOWING,P64_SEARCH,P64_DISPLAY,P64_SORT,P64_ROWS,P64_SIZE'
,p_fixed_header=>'NONE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6726044247164908098)
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>'-'
,p_query_no_data_found=>'No Projects Found'
,p_query_more_data=>'Too many projects to display, please filter'
,p_query_num_rows_item=>'P64_ROWS'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(227589410100904845)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>27
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6720857510769739471)
,p_query_column_id=>2
,p_column_alias=>'CARD_TITLE'
,p_column_display_sequence=>1
,p_column_heading=>'Card title'
,p_column_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:RP,200:P200_ID:#ID#'
,p_column_linktext=>'#CARD_TITLE#'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6720857764404739473)
,p_query_column_id=>3
,p_column_alias=>'CARD_ICON'
,p_column_display_sequence=>2
,p_column_heading=>'Card icon'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6720857830494739474)
,p_query_column_id=>4
,p_column_alias=>'CARD_MODIFIERS'
,p_column_display_sequence=>3
,p_column_heading=>'Card modifiers'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6720857946968739475)
,p_query_column_id=>5
,p_column_alias=>'CARD_TEXT'
,p_column_display_sequence=>4
,p_column_heading=>'Card text'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<div class="pa-Cards-body">',
'  <div class="pa-Cards-body-row pa-Cards-body-header" #MS_DISPLAY#>',
'    <span class="pa-Cards-body-title">Milestones</span>',
'    <span class="pa-Cards-body-badgeContainer">',
'      <span class="pa-Cards-body-badgeLabel">Me</span>',
'      <a href="#MS_ME_URL#" class="pa-Cards-body-badge #MS_ME_IS_HOT#">#MS_ME_CNT#</a>',
'    </span>',
'    <span class="pa-Cards-body-badgeContainer">',
'      <span class="pa-Cards-body-badgeLabel">Total</span>',
'      <a href="#MS_TM_URL#" class="pa-Cards-body-badge">#MS_TM_CNT#</a>',
'    </span>',
'  </div>',
'  <div class="pa-Cards-body-row" #AI_DISPLAY#>',
'    <span class="pa-Cards-body-title">Action Items</span>',
'    <span class="pa-Cards-body-badgeContainer">',
'      <a href="#AI_ME_URL#" class="pa-Cards-body-badge #AI_ME_IS_HOT#">#AI_ME_CNT#</a>',
'    </span>',
'    <span class="pa-Cards-body-badgeContainer">',
'      <a href="#AI_TM_URL#" class="pa-Cards-body-badge">#AI_TM_CNT#</a>',
'    </span>',
'  </div>',
'  <div class="pa-Cards-body-row" #PI_DISPLAY#>',
'    <span class="pa-Cards-body-title">Issues</span>',
'    <span class="pa-Cards-body-badgeContainer">',
'      <a href="#PI_ME_URL#" class="pa-Cards-body-badge #PI_ME_IS_HOT#">#PI_ME_CNT#</a>',
'    </span>',
'    <span class="pa-Cards-body-badgeContainer">',
'      <a href="#PI_TM_URL#" class="pa-Cards-body-badge">#PI_TM_CNT#</a>',
'    </span>',
'  </div>',
'  <div class="pa-Cards-body-row" #UP_DISPLAY#>',
'    <span class="pa-Cards-body-title">Updates</span>',
'    <span class="pa-Cards-body-badgeContainer">',
'      <a href="#UP_ME_URL#" class="pa-Cards-body-badge #UP_ME_IS_HOT#">#UP_ME_CNT#</a>',
'    </span>',
'    <span class="pa-Cards-body-badgeContainer">',
'      <a href="#UP_TM_URL#" class="pa-Cards-body-badge">#UP_TM_CNT#</a>',
'    </span>',
'  </div>',
'</div>'))
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3736361181502595974)
,p_query_column_id=>6
,p_column_alias=>'DESCRIPTION'
,p_column_display_sequence=>34
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3736361366309595976)
,p_query_column_id=>7
,p_column_alias=>'HEADLINE'
,p_column_display_sequence=>35
,p_hidden_column=>'Y'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6720858027176739476)
,p_query_column_id=>8
,p_column_alias=>'CARD_SUBTEXT'
,p_column_display_sequence=>5
,p_column_heading=>'Card subtext'
,p_column_html_expression=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#CARD_SUBTEXT#',
'#HEADLINE#',
''))
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3769427189121526842)
,p_query_column_id=>9
,p_column_alias=>'CREATED'
,p_column_display_sequence=>32
,p_column_heading=>'Created'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3769427272401526843)
,p_query_column_id=>10
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>33
,p_column_heading=>'Updated'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483108580957085376)
,p_query_column_id=>11
,p_column_alias=>'AI_DISPLAY'
,p_column_display_sequence=>23
,p_column_heading=>'Ai display'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483108640352085377)
,p_query_column_id=>12
,p_column_alias=>'MS_DISPLAY'
,p_column_display_sequence=>24
,p_column_heading=>'Ms display'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483108792529085378)
,p_query_column_id=>13
,p_column_alias=>'PI_DISPLAY'
,p_column_display_sequence=>25
,p_column_heading=>'Pi display'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483108869718085379)
,p_query_column_id=>14
,p_column_alias=>'UP_DISPLAY'
,p_column_display_sequence=>26
,p_column_heading=>'Up display'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483107621504085367)
,p_query_column_id=>15
,p_column_alias=>'AI_ME_URL'
,p_column_display_sequence=>15
,p_column_heading=>'Ai me url'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483107768857085368)
,p_query_column_id=>16
,p_column_alias=>'AI_TM_URL'
,p_column_display_sequence=>16
,p_column_heading=>'Ai tm url'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483107894474085369)
,p_query_column_id=>17
,p_column_alias=>'MS_ME_URL'
,p_column_display_sequence=>17
,p_column_heading=>'Ms me url'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483107936671085370)
,p_query_column_id=>18
,p_column_alias=>'MS_TM_URL'
,p_column_display_sequence=>18
,p_column_heading=>'Ms tm url'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483108085602085371)
,p_query_column_id=>19
,p_column_alias=>'PI_ME_URL'
,p_column_display_sequence=>19
,p_column_heading=>'Pi me url'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483108131442085372)
,p_query_column_id=>20
,p_column_alias=>'PI_TM_URL'
,p_column_display_sequence=>20
,p_column_heading=>'Pi tm url'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483108269510085373)
,p_query_column_id=>21
,p_column_alias=>'UP_ME_URL'
,p_column_display_sequence=>21
,p_column_heading=>'Up me url'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483108325912085374)
,p_query_column_id=>22
,p_column_alias=>'UP_TM_URL'
,p_column_display_sequence=>22
,p_column_heading=>'Up tm url'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483106441314085355)
,p_query_column_id=>23
,p_column_alias=>'AI_ME_CNT'
,p_column_display_sequence=>7
,p_column_heading=>'Ai me cnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483106515520085356)
,p_query_column_id=>24
,p_column_alias=>'AI_TM_CNT'
,p_column_display_sequence=>8
,p_column_heading=>'Ai tm cnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483106690343085357)
,p_query_column_id=>25
,p_column_alias=>'MS_ME_CNT'
,p_column_display_sequence=>9
,p_column_heading=>'Ms me cnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483106795089085358)
,p_query_column_id=>26
,p_column_alias=>'MS_TM_CNT'
,p_column_display_sequence=>10
,p_column_heading=>'Ms tm cnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483106898895085359)
,p_query_column_id=>27
,p_column_alias=>'PI_ME_CNT'
,p_column_display_sequence=>11
,p_column_heading=>'Pi me cnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483106997164085360)
,p_query_column_id=>28
,p_column_alias=>'PI_TM_CNT'
,p_column_display_sequence=>12
,p_column_heading=>'Pi tm cnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483107067922085361)
,p_query_column_id=>29
,p_column_alias=>'UP_ME_CNT'
,p_column_display_sequence=>13
,p_column_heading=>'Up me cnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(3483107128361085362)
,p_query_column_id=>30
,p_column_alias=>'UP_TM_CNT'
,p_column_display_sequence=>14
,p_column_heading=>'Up tm cnt'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(227589520264904846)
,p_query_column_id=>31
,p_column_alias=>'MS_ME_IS_HOT'
,p_column_display_sequence=>28
,p_column_heading=>'Ms me is hot'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(227589655065904847)
,p_query_column_id=>32
,p_column_alias=>'AI_ME_IS_HOT'
,p_column_display_sequence=>29
,p_column_heading=>'Ai me is hot'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(227589748294904848)
,p_query_column_id=>33
,p_column_alias=>'PI_ME_IS_HOT'
,p_column_display_sequence=>30
,p_column_heading=>'Pi me is hot'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(227589835086904849)
,p_query_column_id=>34
,p_column_alias=>'UP_ME_IS_HOT'
,p_column_display_sequence=>31
,p_column_heading=>'Up me is hot'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(6720858159156739477)
,p_query_column_id=>35
,p_column_alias=>'CARD_INITIALS'
,p_column_display_sequence=>6
,p_column_heading=>'Card initials'
,p_column_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:RP,2:P2_ID:#ID#'
,p_column_linktext=>'<img src="#IMAGE_PREFIX#app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt="">'
,p_column_link_attr=>'title="Edit Project #CARD_TITLE#" class="project-edit-link"'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'eba_proj_fw.is_edit_authorized(',
'    p_username   => upper(:APP_USER),',
'    p_project_id => :P200_ID,',
'    p_min_auth   => 3 ) = ''Y'''))
,p_display_when_condition2=>'PLSQL'
,p_report_column_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8959288028214496702)
,p_plug_name=>'Breadcrumb'
,p_region_template_options=>'#DEFAULT#:t-BreadcrumbRegion--useBreadcrumbTitle'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672360279484369892)
,p_plug_display_sequence=>90
,p_plug_display_point=>'REGION_POSITION_01'
,p_menu_id=>wwv_flow_imp.id(8863635143327529617)
,p_plug_source_type=>'NATIVE_BREADCRUMB'
,p_menu_template_id=>wwv_flow_imp.id(6672378019032369952)
,p_plug_display_condition_type=>'NEVER'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(8959288933560502505)
,p_plug_name=>'Search'
,p_region_template_options=>'#DEFAULT#:t-Region--hiddenOverflow:t-Form--stretchInputs:t-Region--hideHeader'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672357720392369888)
,p_plug_display_sequence=>100
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
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(11639756968059255869)
,p_name=>'Project Report'
,p_template=>wwv_flow_imp.id(6672357720392369888)
,p_display_sequence=>70
,p_include_in_reg_disp_sel_yn=>'Y'
,p_region_sub_css_classes=>'project-summary t-Report--inline'
,p_region_template_options=>'#DEFAULT#:t-Region--noPadding:js-showMaximizeButton:t-Region--removeHeader:t-Region--scrollBody'
,p_component_template_options=>'#DEFAULT#:t-Report--stretch:t-Report--staticRowColors:t-Report--horizontalBorders:t-Report--rowHighlightOff'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select decode(s.parent_project_id,null,s.project||''000'',(select project from eba_proj_status p where p.id = s.parent_project_id)||''111''||s.project) sort_text,',
'    decode(s.parent_project_id,null,',
'        ''<a href="''||',
'        apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||s.id)||''">''||',
'        apex_escape.html(s.project)||''</a>'',',
'        ''<a href="''||',
'        apex_util.prepare_url(''f?p=''||:APP_ID||'':200:''||:APP_SESSION||'':::200:P200_ID:''||s.id)||',
'        ''"><span class="child-project-marker">''||apex_escape.html(s.project)||''</span></a>'') project,',
'    s.parent_project_id,',
'    c.status_short_desc status,',
'    (   select listagg(decode(u.first_name,null,eba_proj_fw.get_name_from_email_address(u.username),decode(u.last_name, null, eba_proj_fw.get_name_from_email_address(u.username), initcap(u.first_name || '' '' || u.last_name))),'', '') within group',
'            (order by nvl(rf.acl_status_level,r.default_acl_status_level) desc, lower(u.username))',
'        from eba_proj_user_ref rf,',
'            eba_proj_status_users u,',
'            eba_proj_roles r',
'        where rf.project_id = s.id',
'            and rf.user_id = u.id',
'            and rf.role_id = r.id',
'            and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'' ) as people,',
'    (   select listagg(lower(u.username),'', '') within group',
'            (order by nvl(rf.acl_status_level,r.default_acl_status_level) desc, lower(u.username))',
'        from eba_proj_user_ref rf,',
'            eba_proj_status_users u,',
'            eba_proj_roles r',
'        where rf.project_id = s.id',
'            and rf.user_id = u.id',
'            and rf.role_id = r.id',
'            and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y'' ) as all_owners,',
'    (select category from EBA_PROJ_STATUS_CATS  cat where cat.id = s.cat_id) category,',
'    s.updated,',
'    s.id project_id,',
'    eba_proj_stat_get_con_comp(s.id) complete_status,',
'    ( select sz.project_size from eba_proj_status_sizes sz where sz.id = s.size_id ) project_size,',
'    case when eba_proj_fw.is_edit_authorized( :APP_USER, s.id ) = ''Y'' then',
'        ''<a href="''||apex_util.prepare_url(''f?p=''||:APP_ID||'':2:''||:APP_SESSION',
'            ||'':::RP,2:P2_ID,P200_ID:''||s.id||'',''||s.id)',
'            ||''"><img src="''||:IMAGE_PREFIX||''app_ui/img/icons/apex-edit-pencil.png" class="apex-edit-pencil" alt=""></a>''',
'        else '' ''',
'    end as edit_link',
'from EBA_PROJ_STATUS s,',
'     eba_proj_status_codes c',
'where c.id = s.PROJECT_STATUS(+) and ',
'      s.project is not null',
'    --',
'     and (NVL(:P64_OWNER,''0'') = ''0'' ',
'            or exists ( select null',
'                        from eba_proj_user_ref rf,',
'                            eba_proj_status_users u,',
'                            eba_proj_roles r',
'                        where rf.project_id = s.id',
'                            and rf.user_id = u.id',
'                            and rf.role_id = r.id',
'                            and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y''',
'                            and u.id = lower(:P64_OWNER))',
'    )',
'    and (:P64_STATUS is null or '':''||:P64_STATUS||'':'' like ''%:''||s.project_status||'':%'')',
'    and (:P64_SIZE is null or s.size_id = :P64_SIZE)',
'    and (nvl(:P64_CATEGORY,0) = 0 or s.cat_id = :P64_CATEGORY)',
'    and (nvl(:P64_DEAL_TYPE,0) = 0 or s.deal_type_id = :P64_DEAL_TYPE)',
'    and (:P64_SEARCH is null ',
'          or instr(upper(s.PROJECT),upper(:P64_SEARCH))>0',
'          or instr(upper(s.goal),upper(:P64_SEARCH))>0',
'          or instr(upper(s.description),upper(:P64_SEARCH))>0',
'          or instr(upper(s.row_key),upper(:P64_SEARCH))>0',
'          or instr(upper(s.code_name),upper(:P64_SEARCH))>0 ',
'          ) ',
'    and (NVL(:P64_FOLLOWING,''0'') != ''1'' or',
'            exists (',
'            select 1 from EBA_PROJ_STATUS_FAVORITES f ',
'            where f.content_id = s.id and f.user_name = upper(:APP_USER)))',
'    and nvl(:P64_DISPLAY,''CARDS'') = ''REPORT''',
'order by      ',
'             decode(nvl(:P64_SORT,''DATE''),',
'                 ''DATE'',to_char(greatest(s.updated,s.created),''YYYYMMDDHH24MISS''),',
'                 ''CREATED'',to_char(s.created,''YYYYMMDDHH24MISS''),',
'                 ''x'') desc nulls last,',
'             decode(nvl(:P64_SORT,''DATE''),',
'                 ''PROJECT'', s.project,',
'                 ''x'') nulls last'))
,p_ajax_enabled=>'Y'
,p_ajax_items_to_submit=>'P64_STATUS,P64_OWNER,P64_CATEGORY,P64_FOLLOWING,P64_SEARCH,P64_DISPLAY,P64_SORT,P64_ROWS,P64_SIZE'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672364538207369907)
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' '
,p_query_break_cols=>'0'
,p_query_no_data_found=>'No Projects Found'
,p_query_more_data=>'Too many projects to display, please filter'
,p_query_num_rows_item=>'P64_ROWS'
,p_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_query_row_count_max=>100000
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11639760781382255890)
,p_query_column_id=>1
,p_column_alias=>'SORT_TEXT'
,p_column_display_sequence=>12
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11639758470321255880)
,p_query_column_id=>2
,p_column_alias=>'PROJECT'
,p_column_display_sequence=>4
,p_column_heading=>'Project'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11639759264326255883)
,p_query_column_id=>3
,p_column_alias=>'PARENT_PROJECT_ID'
,p_column_display_sequence=>3
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11639759636783255885)
,p_query_column_id=>4
,p_column_alias=>'STATUS'
,p_column_display_sequence=>6
,p_column_heading=>'Status'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(20289555261375214616)
,p_query_column_id=>5
,p_column_alias=>'PEOPLE'
,p_column_display_sequence=>7
,p_column_heading=>'Owners'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11639760400853255888)
,p_query_column_id=>6
,p_column_alias=>'ALL_OWNERS'
,p_column_display_sequence=>8
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11639757715287255878)
,p_query_column_id=>7
,p_column_alias=>'CATEGORY'
,p_column_display_sequence=>9
,p_column_heading=>'&CAT_TITLE.'
,p_heading_alignment=>'LEFT'
,p_lov_show_nulls=>'YES'
,p_derived_column=>'N'
,p_lov_display_extra=>'YES'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11639758066826255879)
,p_query_column_id=>8
,p_column_alias=>'UPDATED'
,p_column_display_sequence=>11
,p_column_heading=>'Updated'
,p_column_format=>'SINCE'
,p_column_alignment=>'RIGHT'
,p_heading_alignment=>'RIGHT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11639758860500255881)
,p_query_column_id=>9
,p_column_alias=>'PROJECT_ID'
,p_column_display_sequence=>2
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11639757243015255876)
,p_query_column_id=>10
,p_column_alias=>'COMPLETE_STATUS'
,p_column_display_sequence=>10
,p_column_heading=>'Completeness'
,p_column_alignment=>'CENTER'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(11984498423337778563)
,p_query_column_id=>11
,p_column_alias=>'PROJECT_SIZE'
,p_column_display_sequence=>5
,p_column_heading=>'Size'
,p_heading_alignment=>'LEFT'
,p_display_when_cond_type=>'EXPRESSION'
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'apex_util.get_build_option_status (',
'    p_application_id => :APP_ID,',
'    p_build_option_name => ''Project Sizes''',
') = ''INCLUDE'''))
,p_display_when_condition2=>'PLSQL'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(18231640450059257559)
,p_query_column_id=>12
,p_column_alias=>'EDIT_LINK'
,p_column_display_sequence=>1
,p_column_heading=>'<span class="u-VisuallyHidden">Edit</span>'
,p_heading_alignment=>'LEFT'
,p_report_column_required_role=>wwv_flow_imp.id(7197408606371470531)
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12916778675217003894)
,p_name=>'Users Pending Approval'
,p_template=>wwv_flow_imp.id(6672346928802369862)
,p_display_sequence=>10
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null id,',
'    ''warning'' ALERT_TYPE,',
'    ''Users Pending Approval'' as ALERT_TITLE,',
'    ''<a href="''',
'        ||apex_util.prepare_url(''f?p=''||:APP_ID||'':89:''||:APP_SESSION||'':::RIR:IREQ_ACCESS_LEVEL_ID:Pending Approval'')',
'        ||''" title="Manage the Access Control List">''||count(*)',
'        ||case when count(*) = 1 then '' user</a> is'' else '' users</a> are'' end',
'        ||'' pending approval. Click here to manage the access control list.'' ALERT_DESC,',
'    '''' alert_action',
'from eba_proj_status_users',
'where access_level_id = 0'))
,p_required_role=>wwv_flow_imp.id(7197408082264470529)
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'from eba_proj_status_users',
'where access_level_id = 0'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672361770805369896)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_break_cols=>'0'
,p_query_num_rows_type=>'0'
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_break_type_flag=>'DEFAULT_BREAK_FORMATTING'
,p_csv_output=>'N'
,p_query_asc_image=>'apex/builder/dup.gif'
,p_query_asc_image_attr=>'width="16" height="16" alt="" '
,p_query_desc_image=>'apex/builder/ddown.gif'
,p_query_desc_image_attr=>'width="16" height="16" alt="" '
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12916778957184003897)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_column_heading=>'ID'
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12916779346584003898)
,p_query_column_id=>2
,p_column_alias=>'ALERT_TYPE'
,p_column_display_sequence=>4
,p_column_heading=>'Alert Type'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12916779775482003899)
,p_query_column_id=>3
,p_column_alias=>'ALERT_TITLE'
,p_column_display_sequence=>2
,p_column_heading=>'Alert Title'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12916780158062003899)
,p_query_column_id=>4
,p_column_alias=>'ALERT_DESC'
,p_column_display_sequence=>3
,p_column_heading=>'Alert Desc'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12916780535899003900)
,p_query_column_id=>5
,p_column_alias=>'ALERT_ACTION'
,p_column_display_sequence=>5
,p_column_heading=>'Alert Action'
,p_heading_alignment=>'LEFT'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12916789011762095148)
,p_plug_name=>'ACL Warning'
,p_region_template_options=>'#DEFAULT#:t-Alert--colorBG:t-Alert--defaultIcons:t-Alert--warning:t-Alert--horizontal'
,p_plug_template=>wwv_flow_imp.id(6672345091278369856)
,p_plug_display_sequence=>30
,p_include_in_reg_disp_sel_yn=>'Y'
,p_plug_source_type=>'PLUGIN_COM.ORACLE.APEX.ACL_WARNING'
,p_plug_display_condition_type=>'EXPRESSION'
,p_plug_display_when_condition=>'EBA_proj_fw.get_preference_value(''ACCESS_CONTROL_ENABLED'') = ''N'''
,p_plug_display_when_cond2=>'PLSQL'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'attribute_01', 'f?p=&APP_ID.:SETTINGS:&SESSION.::&DEBUG.:RP::')).to_clob
);
wwv_flow_imp_page.create_report_region(
 p_id=>wwv_flow_imp.id(12916796342011007693)
,p_name=>'Notifications'
,p_template=>wwv_flow_imp.id(6672346928802369862)
,p_display_sequence=>20
,p_region_template_options=>'#DEFAULT#'
,p_component_template_options=>'#DEFAULT#'
,p_source_type=>'NATIVE_SQL_REPORT'
,p_query_type=>'SQL'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select ',
'    id,',
'    decode(lower(NOTIFICATION_TYPE),''yellow'',''warning'',''red'',''danger'',lower(NOTIFICATION_TYPE)) as ALERT_TYPE,',
'    NOTIFICATION_NAME as ALERT_TITLE,',
'    NOTIFICATION_DESCRIPTION as ALERT_DESC,',
'    '''' alert_action',
'  from EBA_PROJ_STATUS_NOTIFICATIONS',
' where (DISPLAY_FROM is null or DISPLAY_FROM <= current_date) and',
'       (DISPLAY_UNTIL is null or DISPLAY_UNTIL >= current_date)',
' order by nvl(DISPLAY_SEQUENCE,0),NOTIFICATION_NAME'))
,p_display_when_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select null',
'  from EBA_PROJ_STATUS_NOTIFICATIONS',
' where (DISPLAY_FROM is null or DISPLAY_FROM <= current_date) and',
'       (DISPLAY_UNTIL is null or DISPLAY_UNTIL >= current_date)'))
,p_display_condition_type=>'EXISTS'
,p_ajax_enabled=>'Y'
,p_lazy_loading=>false
,p_query_row_template=>wwv_flow_imp.id(6672361770805369896)
,p_query_num_rows=>100
,p_query_options=>'DERIVED_REPORT_COLUMNS'
,p_query_show_nulls_as=>' '
,p_csv_output=>'N'
,p_prn_output=>'N'
,p_sort_null=>'L'
,p_plug_query_strip_html=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12916796704063007695)
,p_query_column_id=>1
,p_column_alias=>'ID'
,p_column_display_sequence=>1
,p_heading_alignment=>'LEFT'
,p_hidden_column=>'Y'
,p_derived_column=>'N'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12916797045760007696)
,p_query_column_id=>2
,p_column_alias=>'ALERT_TYPE'
,p_column_display_sequence=>2
,p_column_heading=>'Alert Type'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12916797432855007696)
,p_query_column_id=>3
,p_column_alias=>'ALERT_TITLE'
,p_column_display_sequence=>3
,p_column_heading=>'Alert Title'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12916797909857007696)
,p_query_column_id=>4
,p_column_alias=>'ALERT_DESC'
,p_column_display_sequence=>4
,p_column_heading=>'Alert Desc'
,p_heading_alignment=>'LEFT'
,p_display_as=>'WITHOUT_MODIFICATION'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_report_columns(
 p_id=>wwv_flow_imp.id(12916798295829007697)
,p_query_column_id=>5
,p_column_alias=>'ALERT_ACTION'
,p_column_display_sequence=>5
,p_column_heading=>'Alert Action'
,p_heading_alignment=>'LEFT'
,p_derived_column=>'N'
,p_include_in_export=>'Y'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(12916816273056018460)
,p_plug_name=>'Show Timezone'
,p_region_template_options=>'#DEFAULT#:margin-top-md'
,p_component_template_options=>'#DEFAULT#'
,p_region_attributes=>'style="clear:both;"'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>80
,p_plug_new_grid_row=>false
,p_plug_new_grid_column=>false
,p_plug_source=>'<div class="subInfoTextRegion"><p>Dates and Times are displayed in the <a href="&P64_TIMEZONE_URL.">&P64_TIMEZONE.</a> timezone.</p></div>'
,p_plug_query_headings_type=>'QUERY_COLUMNS'
,p_plug_query_num_rows_type=>'NEXT_PREVIOUS_LINKS'
,p_plug_query_show_nulls_as=>' - '
,p_pagination_display_position=>'BOTTOM_RIGHT'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14141337277450977059)
,p_plug_name=>'&APPLICATION_TITLE.'
,p_region_name=>'projectMilestones'
,p_region_css_classes=>'homepage-hero'
,p_icon_css_classes=>'app-p-track'
,p_region_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672353080757369874)
,p_plug_display_sequence=>70
,p_plug_display_point=>'REGION_POSITION_01'
,p_plug_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'for c1 in ( select preference_value',
'            from eba_proj_preferences',
'            where preference_name = ''APPLICATION_SUBTITLE''',
'            union all',
'            select ''Collaboratively track projects, milestones, and action items.''',
'            from dual',
'            where not exists ( select null',
'                               from eba_proj_preferences',
'                               where preference_name = ''APPLICATION_SUBTITLE'')',
'          ) loop',
'    sys.htp.p(''<p>''||apex_escape.html(c1.preference_value)||''</p>'');',
'end loop;'))
,p_plug_source_type=>'NATIVE_PLSQL'
);
wwv_flow_imp_page.create_page_plug(
 p_id=>wwv_flow_imp.id(14141337569612977061)
,p_plug_name=>'Search'
,p_parent_plug_id=>wwv_flow_imp.id(14141337277450977059)
,p_region_css_classes=>'t-Form--search'
,p_region_template_options=>'#DEFAULT#:t-Form--xlarge'
,p_component_template_options=>'#DEFAULT#'
,p_plug_template=>wwv_flow_imp.id(6672346928802369862)
,p_plug_display_sequence=>80
,p_plug_display_point=>'SUB_REGIONS'
,p_plug_display_condition_type=>'NEVER'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'expand_shortcuts', 'N',
  'output_as', 'HTML',
  'show_line_breaks', 'N')).to_clob
,p_plug_comment=>'I have conditioned this out as we now have an omnipresent search in the page header.'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(12925057407669250716)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(6103702204286064592)
,p_button_name=>'VIEW_DASHBOARD'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--noUI'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'View Dashboard'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:51:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-dashboard'
,p_required_patch=>wwv_flow_imp.id(11807336118869114840)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8039675324374543737)
,p_button_sequence=>40
,p_button_plug_id=>wwv_flow_imp.id(8959288933560502505)
,p_button_name=>'P64_GO'
,p_button_static_id=>'P64_GO'
,p_button_action=>'SUBMIT'
,p_button_template_options=>'#DEFAULT#:t-Button--primary'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_image_alt=>'Search'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_condition_type=>'NEVER'
,p_request_source=>'Go'
,p_request_source_type=>'STATIC'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(8959289536055502517)
,p_button_sequence=>50
,p_button_plug_id=>wwv_flow_imp.id(8959288933560502505)
,p_button_name=>'P64_RESET'
,p_button_static_id=>'P64_RESET'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--iconLeft'
,p_button_template_id=>wwv_flow_imp.id(6672377257472369946)
,p_button_image_alt=>'Reset'
,p_button_position=>'CREATE'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:64:&SESSION.::&DEBUG.:RP,64::'
,p_icon_css_classes=>'fa-undo-alt'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2662002143559544752)
,p_button_sequence=>10
,p_button_plug_id=>wwv_flow_imp.id(14141337277450977059)
,p_button_name=>'DASHBOARD'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--pillStart'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Go to Dashboard'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:51:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-dial-gauge-chart'
,p_required_patch=>wwv_flow_imp.id(11807336118869114840)
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(2662002287198544753)
,p_button_sequence=>20
,p_button_plug_id=>wwv_flow_imp.id(14141337277450977059)
,p_button_name=>'INTERACTIVE_REPORT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#:t-Button--pillEnd:t-Button--gapRight'
,p_button_template_id=>wwv_flow_imp.id(6672377088120369944)
,p_button_image_alt=>'Go to Interactive Report'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:RP::'
,p_icon_css_classes=>'fa-table'
);
wwv_flow_imp_page.create_page_button(
 p_id=>wwv_flow_imp.id(13908317027985113240)
,p_button_sequence=>30
,p_button_plug_id=>wwv_flow_imp.id(14141337277450977059)
,p_button_name=>'CREATE_PROJECT'
,p_button_action=>'REDIRECT_PAGE'
,p_button_template_options=>'#DEFAULT#'
,p_button_template_id=>wwv_flow_imp.id(6672377832177369949)
,p_button_is_hot=>'Y'
,p_button_image_alt=>'Create Project'
,p_button_position=>'NEXT'
,p_button_alignment=>'RIGHT'
,p_button_redirect_url=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.:RP,300,301,302,303::'
,p_button_condition=>wwv_flow_string.join(wwv_flow_t_varchar2(
'(',
'    eba_proj_stat_ui.get_authorization_level(:APP_USER) >= 2',
'    and',
'    replace(eba_proj_fw.get_preference_value( ''PROJECT_CREATE_REQ_AUTH_ROLE'' ),''Preference does not exist'',''CONTRIBUTORS'') =  ''CONTRIBUTORS''',
')',
'or',
'(',
'    eba_proj_stat_ui.get_authorization_level(:APP_USER) >= 3',
'    and',
'    replace(eba_proj_fw.get_preference_value( ''PROJECT_CREATE_REQ_AUTH_ROLE'' ),''Preference does not exist'',''CONTRIBUTORS'') =  ''ADMINS''',
')',
'or',
'(',
'    eba_proj_stat_ui.get_authorization_level(:APP_USER) >= 4',
'    and',
'    replace(eba_proj_fw.get_preference_value( ''PROJECT_CREATE_REQ_AUTH_ROLE'' ),''Preference does not exist'',''CONTRIBUTORS'') =  ''SUPER_ADMINS''',
')'))
,p_button_condition2=>'PLSQL'
,p_button_condition_type=>'EXPRESSION'
,p_button_css_classes=>'create-button'
,p_security_scheme=>wwv_flow_imp.id(7197408606371470531)
);
wwv_flow_imp_page.create_page_branch(
 p_id=>wwv_flow_imp.id(1221768276654995147)
,p_branch_name=>'Go to Getting Started Page'
,p_branch_action=>'f?p=&APP_ID.:1000:&SESSION.::&DEBUG.:RP::&success_msg=#SUCCESS_MSG#'
,p_branch_point=>'BEFORE_HEADER'
,p_branch_type=>'REDIRECT_URL'
,p_branch_sequence=>10
,p_branch_condition_type=>'EXPRESSION'
,p_branch_condition=>'eba_proj_fw.get_preference_value(''FIRST_RUN'') = ''YES'''
,p_branch_condition_text=>'PLSQL'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6075097010133580913)
,p_name=>'P64_FOLLOWING'
,p_item_sequence=>80
,p_item_plug_id=>wwv_flow_imp.id(8959288933560502505)
,p_prompt=>'Following'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'I AM FOLLOWING'
,p_lov=>'.'||wwv_flow_imp.id(6075097187837583330)||'.'
,p_lov_display_null=>'YES'
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6224920000709315781)
,p_name=>'P64_MODE'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(5910265093140766853)
,p_display_as=>'NATIVE_HIDDEN'
,p_is_persistent=>'U'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(6837575893660594569)
,p_name=>'P64_ROWS'
,p_item_sequence=>100
,p_item_plug_id=>wwv_flow_imp.id(8959288933560502505)
,p_item_default=>'50'
,p_prompt=>'Rows'
,p_source=>'50'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'NUMBER OF ROWS'
,p_lov=>'.'||wwv_flow_imp.id(6837380404471503108)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8959289345882502512)
,p_name=>'P64_CATEGORY'
,p_item_sequence=>60
,p_item_plug_id=>wwv_flow_imp.id(8959288933560502505)
,p_item_default=>'0'
,p_prompt=>'&CAT_TITLE.'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'CATEGORIES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select CATEGORY display_value, ID return_value ',
'from EBA_PROJ_STATUS_CATS',
'where is_active_yn = ''Y''',
'order by display_sequence nulls last, 1'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All &CAT_TITLE_PL. -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8959289746595502517)
,p_name=>'P64_STATUS'
,p_item_sequence=>30
,p_item_plug_id=>wwv_flow_imp.id(8959288933560502505)
,p_item_default=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    r varchar2(400) := null; ',
'begin',
'    for c1 in ( select sc.id',
'                from eba_proj_status_codes sc',
'                where is_active_yn = ''Y''',
'                    and ( ''ALL'' = nvl( (select preference_value',
'                            from eba_proj_user_preferences pr',
'                            where pr.username = v(''APP_USER'')',
'                                and pr.preference_name = ''NAVIGATION MENU'' ), ''OPEN'' )',
'                        or sc.is_closed_status = ''N''',
'                )',
'                order by display_sequence ) loop',
'        r := r||c1.id||'':'';',
'    end loop;',
'    return r;',
'exception when others then return ''0'';',
'end;'))
,p_item_default_type=>'FUNCTION_BODY'
,p_item_default_language=>'PLSQL'
,p_prompt=>'Status'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'declare',
'    r varchar2(400) := null; ',
'begin',
'    for c1 in ( select sc.id',
'                from eba_proj_status_codes sc',
'                where is_active_yn = ''Y''',
'                    and ( ''ALL'' = nvl( (select preference_value',
'                            from eba_proj_user_preferences pr',
'                            where pr.username = v(''APP_USER'')',
'                                and pr.preference_name = ''NAVIGATION MENU'' ), ''OPEN'' )',
'                        or sc.is_closed_status = ''N''',
'                )',
'                order by display_sequence ) loop',
'        r := r||c1.id||'':'';',
'    end loop;',
'    return r;',
'exception when others then return ''0'';',
'end;'))
,p_source_type=>'FUNCTION_BODY'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_CHECKBOX'
,p_named_lov=>'STATUS CODES WITH COUNTS'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select display_value, return_value',
'from',
'(',
'select STATUS_short_desc || '' (''||count(*)||'')'' display_value, ',
'       sc.ID return_value ,',
'       sc.display_sequence',
'from EBA_PROJ_STATUS_CODES sc, eba_proj_status s',
'where is_active_yn = ''Y'' and ',
'      status_short_desc is not null and',
'      s.project_status = sc.id',
'group by sc.STATUS_short_desc, sc.id, sc. display_sequence',
'order by 3,1',
') x'))
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'number_of_columns', '1')).to_clob
,p_multi_value_type=>'SEPARATED'
,p_multi_value_separator=>':'
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8959289928944502518)
,p_name=>'P64_OWNER'
,p_item_sequence=>50
,p_item_plug_id=>wwv_flow_imp.id(8959288933560502505)
,p_item_default=>'0'
,p_prompt=>'Project Person'
,p_source=>'0'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'DISTINCT PROJECT OWNERS BY ID'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select eba_proj_fw.get_name_from_email_address(u.username) d, u.id r',
'from eba_proj_status_users u',
'where exists ( select null',
'               from eba_proj_user_ref rf,',
'                   eba_proj_roles r,',
'                   eba_proj_status p,',
'                   eba_proj_status_codes sc',
'               where rf.user_id = u.id',
'                   and p.id = rf.project_id',
'                   and rf.role_id = r.id',
'                   and eba_proj_fw.is_edit_authorized( u.username, rf.project_id ) = ''Y''',
'                   and p.project_status = sc.id',
'                   and sc.is_closed_status != ''Y'' )',
'order by eba_proj_fw.get_name_from_email_address(u.username)'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All People -'
,p_lov_null_value=>'0'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8959437028568583162)
,p_name=>'P64_SORT'
,p_item_sequence=>90
,p_item_plug_id=>wwv_flow_imp.id(8959288933560502505)
,p_use_cache_before_default=>'NO'
,p_prompt=>'Sort'
,p_source=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select nvl(home_sort_filter_value,''DATE'')',
'  from eba_proj_status_users',
' where id = :CURRENT_USER_ID;'))
,p_source_type=>'QUERY'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'PROJECT SORT OPTIONS'
,p_lov=>'.'||wwv_flow_imp.id(8959437320303609223)||'.'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(8959631020758478343)
,p_name=>'P64_SEARCH'
,p_item_sequence=>20
,p_item_plug_id=>wwv_flow_imp.id(8959288933560502505)
,p_prompt=>'Project Search'
,p_placeholder=>'Search Projects'
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
  'trim_spaces', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11238283611761566659)
,p_name=>'P64_DISPLAY'
,p_item_sequence=>110
,p_item_plug_id=>wwv_flow_imp.id(8959288933560502505)
,p_item_default=>'SIMPLECARDS'
,p_prompt=>'Display As'
,p_source=>'SIMPLECARDS'
,p_source_type=>'STATIC'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>'STATIC:Cards;CARDS,Report;REPORT,Simple Cards;SIMPLECARDS'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'YES'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(11984498413112778562)
,p_name=>'P64_SIZE'
,p_item_sequence=>40
,p_item_plug_id=>wwv_flow_imp.id(8959288933560502505)
,p_prompt=>'Size'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select project_size d, ID r',
'from EBA_PROJ_STATUS_SIZES',
'order by display_sequence;'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Sizes -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(12131994237014236636)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12917003653794121831)
,p_name=>'P64_TIMEZONE_URL'
,p_item_sequence=>120
,p_item_plug_id=>wwv_flow_imp.id(5910265093140766853)
,p_source=>'apex_util.prepare_url(''f?p=''||:APP_ID||'':99:''||:APP_SESSION)'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(12917004947376123692)
,p_name=>'P64_TIMEZONE'
,p_item_sequence=>130
,p_item_plug_id=>wwv_flow_imp.id(5910265093140766853)
,p_source=>'nvl(apex_util.get_session_time_zone(),''unknown'')'
,p_source_type=>'EXPRESSION'
,p_source_language=>'PLSQL'
,p_display_as=>'NATIVE_HIDDEN'
,p_item_template_options=>'#DEFAULT#'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'value_protected', 'Y')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(14141337927759977062)
,p_name=>'P64_SEARCH_1'
,p_item_sequence=>10
,p_item_plug_id=>wwv_flow_imp.id(14141337569612977061)
,p_prompt=>'Search'
,p_placeholder=>'Search'
,p_display_as=>'NATIVE_AUTO_COMPLETE'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select project',
'from EBA_PROJ_STATUS',
'order by 1'))
,p_cSize=>48
,p_cMaxlength=>400
,p_field_template=>wwv_flow_imp.id(6672376881168369939)
,p_item_icon_css_classes=>'fa-search'
,p_item_template_options=>'#DEFAULT#'
,p_lov_display_extra=>'NO'
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'fetch_on_type', 'Y',
  'match_type', 'CONTAINS_IGNORE',
  'max_values_in_list', '500')).to_clob
);
wwv_flow_imp_page.create_page_item(
 p_id=>wwv_flow_imp.id(19204380643190214114)
,p_name=>'P64_DEAL_TYPE'
,p_item_sequence=>70
,p_item_plug_id=>wwv_flow_imp.id(8959288933560502505)
,p_prompt=>'Deal Type'
,p_display_as=>'NATIVE_SELECT_LIST'
,p_named_lov=>'DEAL TYPES'
,p_lov=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'    deal_type d,',
'    id r',
'from',
'    eba_proj_deal_types',
'where',
'    is_active_yn = ''Y''',
'order by',
'    display_sequence'))
,p_lov_display_null=>'YES'
,p_lov_null_text=>'- All Deal Types -'
,p_cHeight=>1
,p_field_template=>wwv_flow_imp.id(6790474178485091309)
,p_item_template_options=>'#DEFAULT#'
,p_is_persistent=>'U'
,p_lov_display_extra=>'NO'
,p_required_patch=>wwv_flow_imp.id(19136688366517761209)
,p_encrypt_session_state_yn=>'N'
,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2(
  'page_action_on_selection', 'NONE')).to_clob
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(8959290140486504596)
,p_computation_sequence=>10
,p_computation_item=>'LAST_VIEW'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'64'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(6224920190141320630)
,p_computation_sequence=>20
,p_computation_item=>'P64_MODE'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'GRID'
,p_compute_when=>'P64_MODE'
,p_compute_when_type=>'ITEM_IS_NULL'
);
wwv_flow_imp_page.create_page_computation(
 p_id=>wwv_flow_imp.id(13084279207845234161)
,p_computation_sequence=>30
,p_computation_item=>'PROJECT_CAME_FROM'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'STATIC_ASSIGNMENT'
,p_computation=>'&APP_PAGE_ID.'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(6720857172270739467)
,p_name=>'Refresh Results'
,p_event_sequence=>10
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P64_STATUS,P64_OWNER,P64_CATEGORY,P64_FOLLOWING,P64_SEARCH,P64_ROWS,P64_SORT,P64_SIZE,P64_DEAL_TYPE'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(19204380905245214116)
,p_event_id=>wwv_flow_imp.id(6720857172270739467)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_EXECUTE_PLSQL_CODE'
,p_attribute_01=>wwv_flow_string.join(wwv_flow_t_varchar2(
'update eba_proj_status_users',
'   set home_sort_filter_value = :P64_SORT',
' where id = :CURRENT_USER_ID;'))
,p_attribute_02=>'P64_STATUS,P64_OWNER,P64_CATEGORY,P64_FOLLOWING,P64_SEARCH,P64_ROWS,P64_SORT,P64_SIZE,P64_DEAL_TYPE'
,p_attribute_05=>'PLSQL'
,p_wait_for_result=>'Y'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(6720858964628739485)
,p_event_id=>wwv_flow_imp.id(6720857172270739467)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6720857462274739470)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11238283702726566660)
,p_event_id=>wwv_flow_imp.id(6720857172270739467)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11639756968059255869)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(4036795237760725285)
,p_event_id=>wwv_flow_imp.id(6720857172270739467)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3850925427829294247)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(11238283739735566661)
,p_name=>'Change View to Cards'
,p_event_sequence=>20
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P64_DISPLAY'
,p_condition_element=>'P64_DISPLAY'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'CARDS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11646583053143978315)
,p_event_id=>wwv_flow_imp.id(11238283739735566661)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11639756968059255869)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3850926232039294255)
,p_event_id=>wwv_flow_imp.id(11238283739735566661)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3850925427829294247)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11238283939002566663)
,p_event_id=>wwv_flow_imp.id(11238283739735566661)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6720857462274739470)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(11238283911476566662)
,p_event_id=>wwv_flow_imp.id(11238283739735566661)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6720857462274739470)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3836567014408064452)
,p_name=>'Change View to Cards On Load'
,p_event_sequence=>30
,p_condition_element=>'P64_DISPLAY'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'CARDS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3836567180371064453)
,p_event_id=>wwv_flow_imp.id(3836567014408064452)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11639756968059255869)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3836567214548064454)
,p_event_id=>wwv_flow_imp.id(3836567014408064452)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6720857462274739470)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3836567393788064455)
,p_event_id=>wwv_flow_imp.id(3836567014408064452)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6720857462274739470)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3836567471443064456)
,p_event_id=>wwv_flow_imp.id(3836567014408064452)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3850925427829294247)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3840906556195688886)
,p_name=>'Change View to Simple Cards'
,p_event_sequence=>40
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P64_DISPLAY'
,p_condition_element=>'P64_DISPLAY'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'SIMPLECARDS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3840906686821688887)
,p_event_id=>wwv_flow_imp.id(3840906556195688886)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11639756968059255869)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3840906955273688890)
,p_event_id=>wwv_flow_imp.id(3840906556195688886)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6720857462274739470)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3850926406192294257)
,p_event_id=>wwv_flow_imp.id(3840906556195688886)
,p_event_result=>'TRUE'
,p_action_sequence=>50
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3850925427829294247)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3850926348916294256)
,p_event_id=>wwv_flow_imp.id(3840906556195688886)
,p_event_result=>'TRUE'
,p_action_sequence=>60
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3850925427829294247)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3836567571191064457)
,p_name=>'Change View to Simple Cards On Load'
,p_event_sequence=>50
,p_condition_element=>'P64_DISPLAY'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'SIMPLECARDS'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3836567606299064458)
,p_event_id=>wwv_flow_imp.id(3836567571191064457)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11639756968059255869)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3836567737645064459)
,p_event_id=>wwv_flow_imp.id(3836567571191064457)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3850925427829294247)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3836567904241064460)
,p_event_id=>wwv_flow_imp.id(3836567571191064457)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6720857462274739470)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3836567983737064461)
,p_event_id=>wwv_flow_imp.id(3836567571191064457)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'Y'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3850925427829294247)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3840907092919688891)
,p_name=>'Change View to Report'
,p_event_sequence=>60
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P64_DISPLAY'
,p_condition_element=>'P64_DISPLAY'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'REPORT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'change'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3850924915041294242)
,p_event_id=>wwv_flow_imp.id(3840907092919688891)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6720857462274739470)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3850926562734294258)
,p_event_id=>wwv_flow_imp.id(3840907092919688891)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3850925427829294247)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3850925072114294243)
,p_event_id=>wwv_flow_imp.id(3840907092919688891)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11639756968059255869)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3850925134769294244)
,p_event_id=>wwv_flow_imp.id(3840907092919688891)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11639756968059255869)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(3836568073619064462)
,p_name=>'Change View to Report On Load'
,p_event_sequence=>70
,p_condition_element=>'P64_DISPLAY'
,p_triggering_condition_type=>'EQUALS'
,p_triggering_expression=>'REPORT'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'ready'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3836568159153064463)
,p_event_id=>wwv_flow_imp.id(3836568073619064462)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3850925427829294247)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3836568279692064464)
,p_event_id=>wwv_flow_imp.id(3836568073619064462)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_HIDE'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6720857462274739470)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3836568320706064465)
,p_event_id=>wwv_flow_imp.id(3836568073619064462)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11639756968059255869)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3836568417447064466)
,p_event_id=>wwv_flow_imp.id(3836568073619064462)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_SHOW'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11639756968059255869)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_event(
 p_id=>wwv_flow_imp.id(15213097062474322348)
,p_name=>'Perform Search on Enter'
,p_event_sequence=>90
,p_triggering_element_type=>'ITEM'
,p_triggering_element=>'P64_SEARCH'
,p_triggering_condition_type=>'JAVASCRIPT_EXPRESSION'
,p_triggering_expression=>'this.browserEvent.which === 13'
,p_bind_type=>'bind'
,p_execution_type=>'IMMEDIATE'
,p_bind_event_type=>'keydown'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15213097273026322350)
,p_event_id=>wwv_flow_imp.id(15213097062474322348)
,p_event_result=>'TRUE'
,p_action_sequence=>10
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(6720857462274739470)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(3836568923118064471)
,p_event_id=>wwv_flow_imp.id(15213097062474322348)
,p_event_result=>'TRUE'
,p_action_sequence=>20
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(3850925427829294247)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15213097381599322351)
,p_event_id=>wwv_flow_imp.id(15213097062474322348)
,p_event_result=>'TRUE'
,p_action_sequence=>30
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_REFRESH'
,p_affected_elements_type=>'REGION'
,p_affected_region_id=>wwv_flow_imp.id(11639756968059255869)
,p_attribute_01=>'N'
);
wwv_flow_imp_page.create_page_da_action(
 p_id=>wwv_flow_imp.id(15213097726848322355)
,p_event_id=>wwv_flow_imp.id(15213097062474322348)
,p_event_result=>'TRUE'
,p_action_sequence=>40
,p_execute_on_page_init=>'N'
,p_action=>'NATIVE_CANCEL_EVENT'
);
wwv_flow_imp_page.create_page_process(
 p_id=>wwv_flow_imp.id(8959319916657027525)
,p_process_sequence=>10
,p_process_point=>'AFTER_SUBMIT'
,p_process_type=>'NATIVE_SESSION_STATE'
,p_process_name=>'clear cache for this page'
,p_attribute_01=>'CLEAR_CACHE_CURRENT_PAGE'
,p_process_when=>'reset_page'
,p_process_when_type=>'REQUEST_IN_CONDITION'
,p_internal_uid=>8959319916657027525
);
wwv_flow_imp.component_end;
end;
/
