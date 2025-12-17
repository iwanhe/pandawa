prompt --application/deployment/install/install_val_email_fmt
begin
--   Manifest
--     INSTALL: INSTALL-val email fmt
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_install_script(
 p_id=>wwv_flow_imp.id(2775680869588886310)
,p_install_id=>wwv_flow_imp.id(2719947952873449465)
,p_name=>'val email fmt'
,p_sequence=>310
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace function eba_intrack_val_email_fmt (',
'   p_email_address  in   varchar2)',
'   return varchar2',
'is',
'    g_email_regexp         varchar2(4000) := ''^[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~](\.?[-!#$%&''''''''*+/0-9=?A-Z^_a-z{|}~])*@[a-zA-Z](-?[a-zA-Z0-9+])*(\.[a-zA-Z](-?[a-zA-Z0-9+])*)+$'';',
'begin',
'   if regexp_instr(p_email_address,g_email_regexp) = 0 then',
'      return ''Invalid email address format.'';',
'   end if;',
'   return null;',
'exception when others then',
'    return ''Invalid email address *'';',
'end eba_intrack_val_email_fmt;',
'/',
'show errors'))
);
wwv_flow_imp.component_end;
end;
/
