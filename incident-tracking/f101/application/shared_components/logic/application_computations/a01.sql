prompt --application/shared_components/logic/application_computations/a01
begin
--   Manifest
--     APPLICATION COMPUTATION: A01
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_flow_computation(
 p_id=>wwv_flow_imp.id(2328766881145215728)
,p_computation_sequence=>10
,p_computation_item=>'A01'
,p_computation_point=>'BEFORE_HEADER'
,p_computation_type=>'QUERY'
,p_computation_processed=>'REPLACE_EXISTING'
,p_computation=>wwv_flow_string.join(wwv_flow_t_varchar2(
'select',
'	count(*)',
'from',
'    eba_intrack_incidents_view',
'where status_code in (select status_code from eba_intrack_status where status_type = ''OPEN'');'))
,p_version_scn=>39567690152417
);
wwv_flow_imp.component_end;
end;
/
