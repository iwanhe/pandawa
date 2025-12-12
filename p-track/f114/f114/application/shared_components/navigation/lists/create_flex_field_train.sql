prompt --application/shared_components/navigation/lists/create_flex_field_train
begin
--   Manifest
--     LIST: Create Flex Field Train
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_list(
 p_id=>wwv_flow_imp.id(6143634101570069465)
,p_name=>'Create Flex Field Train'
,p_list_status=>'PUBLIC'
,p_version_scn=>39567366590247
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6143634407741069465)
,p_list_item_display_sequence=>10
,p_list_item_link_text=>'Data Source'
,p_list_item_link_target=>'f?p=&APP_ID.:143:&SESSION.::&DEBUG.::::'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6143634713388069467)
,p_list_item_display_sequence=>20
,p_list_item_link_text=>'Flex Column'
,p_list_item_link_target=>'f?p=&APP_ID.:144:&SESSION.::&DEBUG.::::'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(6143635007385069467)
,p_list_item_display_sequence=>30
,p_list_item_link_text=>'Form Element'
,p_list_item_link_target=>'f?p=&APP_ID.:145:&SESSION.::&DEBUG.::::'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7553930514081204819)
,p_list_item_display_sequence=>35
,p_list_item_link_text=>'Select List Options'
,p_list_item_link_target=>'f?p=&APP_ID.:146:&SESSION.::&DEBUG.::::'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp_shared.create_list_item(
 p_id=>wwv_flow_imp.id(7507443666265318723)
,p_list_item_display_sequence=>40
,p_list_item_link_text=>'Confirmation'
,p_list_item_link_target=>'f?p=&APP_ID.:147:&SESSION.::&DEBUG.::::'
,p_security_scheme=>wwv_flow_imp.id(7197408082264470529)
,p_required_patch=>wwv_flow_imp.id(6143688812531166465)
,p_list_item_current_type=>'TARGET_PAGE'
);
wwv_flow_imp.component_end;
end;
/
