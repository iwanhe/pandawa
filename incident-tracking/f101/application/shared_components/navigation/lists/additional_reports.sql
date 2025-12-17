prompt --application/shared_components/navigation/lists/additional_reports
begin
--   Manifest
--     LIST: Additional Reports
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(2873527047980677846)
,p_name=>'Additional Reports'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567690152271
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2873528153757677850)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Distribution of Tickets by Status Codes'
,p_list_item_link_target=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.::::'
,p_list_item_icon=>'fa-tags'
,p_list_text_01=>'Horizontal bar chart of tickets'
,p_list_text_02=>'chartIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2873528470354677851)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Distribution of Tickets by Product'
,p_list_item_link_target=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-tags'
,p_list_text_01=>'Horizontal bar chart of tickets'
,p_list_text_02=>'chartIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2873528750923677851)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Distribution of Tickets by Product and Version'
,p_list_item_link_target=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-tags'
,p_list_text_01=>'Horizontal bar chart of tickets'
,p_list_text_02=>'chartIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2873529074680677851)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Distribution of Tickets by Customer'
,p_list_item_link_target=>'f?p=&APP_ID.:41:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-tags'
,p_list_text_01=>'Horizontal bar chart of tickets'
,p_list_text_02=>'chartIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(2873529364887677851)
,p_list_item_display_sequence=>50
,p_list_item_link_text=>'Distribution of Tickets by Filer'
,p_list_item_link_target=>'f?p=&APP_ID.:42:&SESSION.::&DEBUG.:RP:::'
,p_list_item_icon=>'fa-tags'
,p_list_text_01=>'Horizontal bar chart of tickets'
,p_list_text_02=>'chartIcon'
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
