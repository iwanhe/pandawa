prompt --application/deployment/install/install_blend_colors_function
begin
--   Manifest
--     INSTALL: INSTALL-Blend Colors Function
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
 p_id=>wwv_flow_imp.id(6794056010395638082)
,p_install_id=>wwv_flow_imp.id(8903256921486151716)
,p_name=>'Blend Colors Function'
,p_sequence=>570
,p_script_type=>'INSTALL'
,p_script_clob=>wwv_flow_string.join(wwv_flow_t_varchar2(
'create or replace function eba_proj_stat_blend_colors ( i_color_in in varchar2,',
'                                          i_blend in varchar2 default ''#FFFFFF'',',
'                                          i_percent in number default 50 ) return varchar2 as',
'    l_hc number := 0;',
'    l_hb number := 0;',
'    l_c number; l_b number;',
'    l_final_color varchar2(7) := ''#'';',
'begin',
'    if substr(i_color_in,1,1) = ''#'' then',
'        l_hc := 1;',
'    end if;',
'    if substr(i_blend,1,1) = ''#'' then',
'        l_hb := 1;',
'    end if;',
'    for i in 1..3 loop',
'        if length(i_color_in) = 3+l_hc then',
'            -- #F00 style color',
'            l_c := to_number(substr( i_color_in, l_hc+i, 1 )||substr( i_color_in, l_hc+i, 1 ),''XX'');',
'        else',
'            -- #FF0000 style color',
'            l_c := to_number(substr( i_color_in, l_hc+(2*i-1), 2 ),''XX'');',
'        end if;',
'        if length(i_blend) = 4 then',
'            -- #F00 style color',
'            l_b := to_number(substr( i_blend, l_hb+i, 1 )||substr( i_blend, l_hb+i, 1 ),''XX'');',
'        else',
'            -- #FF0000 style color',
'            l_b := to_number(substr( i_blend, l_hb+(2*i-1), 2 ),''XX'');',
'        end if;',
'',
'       l_final_color := l_final_color||to_char((l_c*(100-i_percent)+l_b*i_percent)/100, ''fm0X'');',
'    end loop;',
'    return l_final_color;',
'end eba_proj_stat_blend_colors;',
'/',
'show errors',
'',
''))
);
wwv_flow_imp.component_end;
end;
/
