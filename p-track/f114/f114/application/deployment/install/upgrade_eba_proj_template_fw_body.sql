prompt --application/deployment/install/upgrade_eba_proj_template_fw_body
begin
--   Manifest
--     INSTALL: UPGRADE-eba_proj_template_fw body
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
 p_id=>wwv_flow_imp.id(13550177394343090734)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'eba_proj_template_fw body'
,p_sequence=>990
,p_script_type=>'UPGRADE'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace package body eba_proj_template_fw as',
'',
'    function start_offset( p_milestone_id in number ) return number is',
'    begin',
'        for c1 in ( with ms_hier ( template_id, milestone_id, parent_milestone_id, start_date_offset, due_date_offset )',
'                    as (',
'                        select m.template_id,',
'                            m.id milestone_id,',
'                            m.parent_milestone_id,',
'                            m.start_date_offset,',
'                            m.due_date_offset',
'                        from eba_proj_template_ms m',
'                        where m.parent_milestone_id is null',
'                        union all',
'                        select m.template_id,',
'                            m.id milestone_id,',
'                            m.parent_milestone_id,',
'                            mh.start_date_offset + mh.due_date_offset start_date_offset,',
'                            m.due_date_offset',
'                        from eba_proj_template_ms m,',
'                            ms_hier mh',
'                        where mh.template_id = m.template_id',
'                            and mh.milestone_id = m.parent_milestone_id',
'                    )',
'                    select start_date_offset',
'                    from ms_hier',
'                    where milestone_id = p_milestone_id ) loop',
'            return c1.start_date_offset;',
'        end loop;',
'',
'        return 0;',
'    end start_offset;',
'',
'end eba_proj_template_fw;',
'/'))
);
wwv_flow_imp.component_end;
end;
/
