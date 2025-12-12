prompt --application/shared_components/user_interface/lovs/mass_update_action_item_statuses
begin
--   Manifest
--     MASS UPDATE ACTION ITEM STATUSES
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
 p_id=>wwv_flow_imp.id(21277267940168913647)
,p_lov_name=>'MASS UPDATE ACTION ITEM STATUSES'
,p_lov_query=>'.'||wwv_flow_imp.id(21277267940168913647)||'.'
,p_location=>'STATIC'
,p_version_scn=>39567366591419
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(21277268290664913653)
,p_lov_disp_sequence=>20
,p_lov_disp_value=>'Closed / Completed'
,p_lov_return_value=>'Closed'
);
wwv_flow_imp_shared.create_static_lov_data(
 p_id=>wwv_flow_imp.id(21277268683141913655)
,p_lov_disp_sequence=>30
,p_lov_disp_value=>'Not Applicable'
,p_lov_return_value=>'Not Applicable'
);
wwv_flow_imp.component_end;
end;
/
