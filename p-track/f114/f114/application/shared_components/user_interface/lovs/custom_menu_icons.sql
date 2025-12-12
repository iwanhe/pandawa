prompt --application/shared_components/user_interface/lovs/custom_menu_icons
begin
--   Manifest
--     CUSTOM_MENU_ICONS
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_list_of_values(
 p_id=>wwv_flow_imp.id(4028404581045797911)
,p_lov_name=>'CUSTOM_MENU_ICONS'
,p_lov_query=>'.'||wwv_flow_imp.id(4028404581045797911)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366590999
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(4028404747306797915)
,p_lov_disp_sequence=>10
,p_lov_disp_value=>'Cloud'
,p_lov_return_value=>'fa-cloud'
,p_lov_template=>'<span class="fa fa-cloud" aria-hidden="true" title="#DISPLAY_VALUE#"></span>'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(4028405125694797918)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Exchange'
,p_lov_return_value=>'fa-exchange'
,p_lov_template=>'<span class="fa fa-exchange" aria-hidden="true" title="#DISPLAY_VALUE#"></span>'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(4028405521005797918)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Home'
,p_lov_return_value=>'fa-home'
,p_lov_template=>'<span class="fa fa-home" aria-hidden="true" title="#DISPLAY_VALUE#"></span>'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(4028405946629797918)
,p_lov_disp_sequence=>40
,p_lov_disp_value=>'Inbox'
,p_lov_return_value=>'fa-inbox'
,p_lov_template=>'<span class="fa fa-inbox" aria-hidden="true" title="#DISPLAY_VALUE#"></span>'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(4028406330235797919)
,p_lov_disp_sequence=>50
,p_lov_disp_value=>'Play Icon'
,p_lov_return_value=>'fa-play'
,p_lov_template=>'<span class="fa fa-play" aria-hidden="true" title="#DISPLAY_VALUE#"></span>'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(4028406801577797919)
,p_lov_disp_sequence=>60
,p_lov_disp_value=>'Reply Icon'
,p_lov_return_value=>'fa-reply'
,p_lov_template=>'<span class="fa fa-reply" aria-hidden="true" title="#DISPLAY_VALUE#"></span>'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(4028407172944797919)
,p_lov_disp_sequence=>70
,p_lov_disp_value=>'Right Arrow in Circle'
,p_lov_return_value=>'fa-chevron-circle-right'
,p_lov_template=>'<span class="fa fa-chevron-circle-right" aria-hidden="true" title="#DISPLAY_VALUE#"></span>'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(4028407568689797920)
,p_lov_disp_sequence=>80
,p_lov_disp_value=>'Up and to the Right'
,p_lov_return_value=>'fa-arrow-up-right-alt'
,p_lov_template=>'<span class="fa fa-arrow-up-right-alt" aria-hidden="true" title="#DISPLAY_VALUE#"></span>'
);
wwv_flow_imp.component_end;
end;
/
