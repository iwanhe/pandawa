prompt --application/shared_components/plugins/dynamic_action/be_apexrnd_aop_da
begin
--   Manifest
--     PLUGIN: BE.APEXRND.AOP_DA
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.05.31'
,p_release=>'24.1.5'
,p_default_workspace_id=>30014105435788499543
,p_default_application_id=>216180
,p_default_id_offset=>0
,p_default_owner=>'WKSP_NTIAPPS'
);
wwv_flow_imp_shared.create_plugin(
 p_id=>wwv_flow_imp.id(34953412032582880042)
,p_plugin_type=>'DYNAMIC ACTION'
,p_name=>'BE.APEXRND.AOP_DA'
,p_display_name=>'UC - APEX Office Print (AOP) - DA'
,p_category=>'EXECUTE'
,p_image_prefix => nvl(wwv_flow_application_install.get_static_plugin_file_prefix('DYNAMIC ACTION','BE.APEXRND.AOP_DA'),'')
,p_javascript_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#PLUGIN_FILES#js/es6-promise.min.js',
'#PLUGIN_FILES#js/aop_da.min.js'))
,p_css_file_urls=>wwv_flow_string.join(wwv_flow_t_varchar2(
'#PLUGIN_FILES#css/spinkit.min.css',
'#PLUGIN_FILES#css/spinkit-aop.min.css',
'#PLUGIN_FILES#css/aop.min.css'))
,p_api_version=>1
,p_render_function=>'aop_api_pkg.f_render_aop'
,p_ajax_function=>'aop_api_pkg.f_ajax_aop'
,p_standard_attributes=>'ITEM:STOP_EXECUTION_ON_ERROR:WAIT_FOR_RESULT:INIT_JAVASCRIPT_CODE'
,p_substitute_attributes=>true
,p_version_scn=>1
,p_subscribe_plugin_settings=>true
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'APEX Office Print (AOP) is created by United Codes to facilitate exporting data and printing documents in Oracle Application Express (APEX) based on an Office document (Word, Excel, PowerPoint) or HTML, Markdown, CSV, or Text. This plugin can only be'
||' used to print to AOP and is copyrighted by APEX R&D and United Codes. If you have any questions please contact support@apexofficeprint.com.',
'We hope you enjoy AOP!'))
,p_version_identifier=>'22.2'
,p_about_url=>'https://www.apexofficeprint.com'
,p_files_version=>277
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(34953428540828225938)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>1
,p_display_sequence=>1000
,p_prompt=>'AOP URL'
,p_attribute_type=>'TEXT'
,p_is_required=>true
,p_default_value=>'https://api.apexofficeprint.com/'
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'URL to APEX Office Print server. <br/>',
'When installed on the same server as the database using the default port you can use http://localhost:8010/ <br/>',
'To use AOP as a service, you can use http(s)://api.apexofficeprint.com/ <br/>',
'When using HTTPS, make sure to add the certificate to the wallet of your database. Alternatively you can setup a proxy rule in your webserver to do the HTTPS handshaking so the AOP plugin can call a local url. Instructions how to setup both options c'
||'an be found in the documentation.<br/>',
'When running AOP on the Oracle Cloud you are obliged to use HTTPS, so the url should be https://api.apexofficeprint.com/ or https://www.cloudofficeprint.com/aop/<br/>',
'You can also dynamically specify a url by an Application Item e.g. &AI_AOP_URL.'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(34840245324266261231)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>2
,p_display_sequence=>2000
,p_prompt=>'API key'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_display_length=>50
,p_max_length=>50
,p_is_translatable=>false
,p_help_text=>'Enter your API key found on your account when you login at https://www.apexofficeprint.com.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(34540059257675739391)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>3
,p_display_sequence=>3000
,p_prompt=>'Debug'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'No'
,p_help_text=>'By default debug is turned off.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34540066724348740781)
,p_plugin_attribute_id=>wwv_flow_imp.id(34540059257675739391)
,p_display_sequence=>10
,p_display_value=>'Remote'
,p_return_value=>'Yes'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enabling remote debug will capture the JSON and is made available in your dashboard at https://www.apexofficeprint.com.',
'This makes it easier to debug your JSON, check if it''s valid and contact us in case you need support.',
'This option only works when you use http(s)://www.apexofficeprint.com/api in your AOP settings.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34286307903379765964)
,p_plugin_attribute_id=>wwv_flow_imp.id(34540059257675739391)
,p_display_sequence=>20
,p_display_value=>'Local'
,p_return_value=>'Local'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enabling local debug will download the JSON that is sent to the AOP server component. ',
'This makes it easier to debug your JSON, check if it''s valid and contact us in case you need support.',
'Note that the output file will not be produced and the server will never be called.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33463216849618551956)
,p_plugin_attribute_id=>wwv_flow_imp.id(34540059257675739391)
,p_display_sequence=>30
,p_display_value=>'Derived from Application Item'
,p_return_value=>'APEX_ITEM'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option is useful when you want to dynamically set AOP debugging.<br/>',
'The application item needs to be called AOP_DEBUG and can have values: No, Yes (=Remote) or Local.'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(34542946644040923198)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>4
,p_display_sequence=>4000
,p_prompt=>'Converter'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'LibreOffice'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'To transform an Office document to PDF, APEX Office Print is using an external converter.',
'By default LibreOffice is used, but you can select another converter on request.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34542969077706950246)
,p_plugin_attribute_id=>wwv_flow_imp.id(34542946644040923198)
,p_display_sequence=>10
,p_display_value=>'MS Office (Windows only)'
,p_return_value=>'officetopdf'
,p_help_text=>'Uses Microsoft Office to do the conversion and following module http://officetopdf.codeplex.com'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34542969526867953425)
,p_plugin_attribute_id=>wwv_flow_imp.id(34542946644040923198)
,p_display_sequence=>20
,p_display_value=>'Custom'
,p_return_value=>'custom'
,p_help_text=>'Specify the name of the custom converter defined at the AOP Server.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(33732535332899718351)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>5
,p_display_sequence=>5000
,p_prompt=>'Settings package'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_show_in_wizard=>false
,p_display_length=>80
,p_max_length=>300
,p_is_translatable=>false
,p_examples=>'aop_settings_pkg'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'When you use a different AOP server in DEV, TEST, PROD it might be easier to define the package where the settings (e.g. AOP server) is defined.<br/>',
'This makes deployments seamless and you don''t need to update the plug-in component settings manually afterwards.<br/>',
'When a package is defined, we will always read those settings, regardless what is filled in above.'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(33781772495889336062)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>6
,p_display_sequence=>1500
,p_prompt=>'AOP Failover URL'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Failover URL to APEX Office Print server incase the AOP URL fails. <br/>',
'When installed on the same server as the database using the default port you can use http://localhost:8010/ <br/>',
'To use AOP as a service, you can use http(s)://www.apexofficeprint.com/failover-api/ <br/>',
'When using HTTPS, make sure to add the certificate to the wallet of your database. Alternatively you can setup a proxy rule in your webserver to do the HTTPS handshaking so the AOP plugin can call a local url. Instructions how to setup both options c'
||'an be found in the documentation.<br/>',
'When running AOP on the Oracle Cloud you are obliged to use HTTPS, so the url should be https://www.apexofficeprint.com/failover-api/ or https://www.cloudofficeprint.com/aop/'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(33808030096366361708)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>7
,p_display_sequence=>9000
,p_prompt=>'Failover procedure'
,p_attribute_type=>'PLSQL'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(33781772495889336062)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'NOT_NULL'
,p_examples=>'aop_sample_pkg.failover_procedure;'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Specify the procedure that should be called when the failover url is used.',
'The procedure can for example send an email to notify the primary AOP url is not used, but the fallback url.'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(33647203510375809485)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>8
,p_display_sequence=>8000
,p_prompt=>'Logging package'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>'see aop_log_pkg that comes with the AOP Sample app.'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'If you want every request to aop_api_pkg.plsql_call_to_aop to be logged, you can specify a logging package here.<br/>',
'The logging package needs at least a function and a procedure with following definition:',
'<pre>',
'function start_request (',
'  p_data_type             in varchar2,',
'  p_data_source           in clob,',
'  p_template_type         in varchar2,',
'  p_template_source       in clob,',
'  p_output_type           in varchar2,',
'  p_output_filename       in varchar2 default null,',
'  p_output_type_item_name in varchar2 default null,',
'  p_output_to             in varchar2 default null,',
'  p_procedure             in varchar2 default null,',
'  p_binds                 in varchar2 default null,',
'  p_special               in varchar2 default null,',
'  p_aop_remote_debug      in varchar2 default null,',
'  p_output_converter      in varchar2 default null,',
'  p_aop_url               in varchar2,',
'  p_api_key               in varchar2,',
'  p_aop_mode              in varchar2 default null,',
'  p_app_id                in number   default null,',
'  p_page_id               in number   default null,',
'  p_user_name             in varchar2 default null,',
'  p_init_code             in clob     default null,',
'  p_output_encoding       in varchar2 default null,',
'  p_output_split          in varchar2 default null,',
'  p_output_merge          in varchar2 default null,',
'  p_failover_aop_url      in varchar2 default null,',
'  p_failover_procedure    in varchar2 default null,',
'  p_prepend_files_sql     in clob     default null,',
'  p_append_files_sql      in clob     default null,',
'  p_media_files_sql       in clob     default null,',
'  p_sub_templates_sql     in clob     default null',
') return number;',
'',
'',
'procedure end_request (',
'  p_aop_log_id            in number,  ',
'  p_status                in varchar2, ',
'  p_aop_json              in clob,',
'  p_aop_error             in varchar2, ',
'  p_ora_sqlcode           in number, ',
'  p_ora_sqlerrm           in varchar2',
')',
'</pre>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(33416494950731303374)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>9
,p_display_sequence=>4050
,p_prompt=>'Custom converter'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(34542946644040923198)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'custom'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'AOP Server config looks like this:',
'<br/>',
'<pre><code>',
'{',
'    "converters": {',
'        "abiword":{',
'            "command": "abiword --to={outputFormat} --to-name={outputFile} {inputFile}"',
'        },',
'        "other":{',
'            "command":""',
'        }',
'    }',
'}',
'</code></pre>',
'</p>',
'<p>',
'This means you can use abiword or other as the name of the custom converter.',
'</p>'))
,p_help_text=>'Specify the name of the custom converter as specified at the AOP Server e.g. abiword'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(33450424318385526844)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'APPLICATION'
,p_attribute_sequence=>10
,p_display_sequence=>2500
,p_prompt=>'AOP Mode'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'Production'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Production (=null)',
'  Credits will be used.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33450424704595529523)
,p_plugin_attribute_id=>wwv_flow_imp.id(33450424318385526844)
,p_display_sequence=>10
,p_display_value=>'Development'
,p_return_value=>'development'
,p_help_text=>'In development mode no credits are used.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33450425538006545557)
,p_plugin_attribute_id=>wwv_flow_imp.id(33450424318385526844)
,p_display_sequence=>20
,p_display_value=>'Derived from Application Item'
,p_return_value=>'APEX_ITEM'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option is useful when you want to dynamically set the AOP mode.<br/>',
'The application item needs to be called AOP_MODE and can have values: development, production  or null (=production).'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(34953429651802251137)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>1
,p_display_sequence=>23
,p_prompt=>'Data Source'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(34916823251441283174)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'URL,XML,JSON,JSON_FILES'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'select ',
'  ''file1'' as filename,  ',
'  cursor( ',
'    select',
'      c.cust_first_name, ',
'      c.cust_last_name, ',
'      c.cust_city, ',
'      cursor(select o.order_total, ''Order '' || rownum as order_name,',
'                cursor(select p.product_name, i.quantity, i.unit_price, APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as image ',
'                         from demo_order_items i, demo_product_info p ',
'                        where o.order_id = i.order_id ',
'                          and i.product_id = p.product_id ',
'                      ) product                 ',
'               from demo_orders o ',
'              where c.customer_id = o.customer_id ',
'            ) orders ',
'    from demo_customers c ',
'    where customer_id = :id ',
'  ) as data ',
'from dual ',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>Specify the XML or JSON.',
'</p>',
'<p>For type URL:<br/>',
'Create (in for example ORDS) a new REST web service with a GET, source type "Query" and format "JSON".<br/>',
'Put the url in this text box, e.g. https://www.apexofficeprint.com/ords/aop/get_data/1',
'<br/><br/>',
'Here''s an example of a query which contains a parameter too:',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(34412534578893013072)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>2
,p_display_sequence=>27
,p_prompt=>'Special'
,p_attribute_type=>'CHECKBOXES'
,p_is_required=>false
,p_show_in_wizard=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(34916823251441283174)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'SQL,PLSQL_SQL,IR'
,p_lov_type=>'STATIC'
,p_help_text=>'Specific features of APEX Office Print'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34412555675494015656)
,p_plugin_attribute_id=>wwv_flow_imp.id(34412534578893013072)
,p_display_sequence=>10
,p_display_value=>'Treat all numbers as strings'
,p_return_value=>'NUMBER_TO_STRING'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'There''s a limitation in APEX with the cursor() statement in SQL that it doesn''t remember which datatype the column is in. So when doing to_char(0.9,''990D00'') it will return 0.9 as number instead of as string ''0.90''. To resolve this, enable this check'
||'box and concatenate your number with ''!FMT!'' e.g. ''!FMT!''||to_char(35, ''990D00'') - !FMT! stands for format.',
'</p>',
'<p>',
'Alternatively if you format your number with the currency sign to_char(35,''FML990D00'') Oracle will recognise it as a string and you don''t need to use this checkbox.',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34412555984932017134)
,p_plugin_attribute_id=>wwv_flow_imp.id(34412534578893013072)
,p_display_sequence=>20
,p_display_value=>'Report as Labels'
,p_return_value=>'REPORT_AS_LABELS'
,p_help_text=>'Check this box in case you want to use the Classic or Interactive Report data source but print them as Labels (using the Mailings feature in Word).'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34470670142827379650)
,p_plugin_attribute_id=>wwv_flow_imp.id(34412534578893013072)
,p_display_sequence=>30
,p_display_value=>'IR/IG: Show Filters on top'
,p_return_value=>'FILTERS_ON_TOP'
,p_help_text=>'When there''re filters applied to the Interactive Report, this checkbox will print them above the report.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34470694027219383364)
,p_plugin_attribute_id=>wwv_flow_imp.id(34412534578893013072)
,p_display_sequence=>40
,p_display_value=>'IR/IG: Show Highlights on top'
,p_return_value=>'HIGHLIGHTS_ON_TOP'
,p_help_text=>'When there''re highlights applied to the Interactive Report, this checkbox will print them above the report.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34476640759938501433)
,p_plugin_attribute_id=>wwv_flow_imp.id(34412534578893013072)
,p_display_sequence=>50
,p_display_value=>'IR/IG: Show header with filter (Excel)'
,p_return_value=>'HEADER_WITH_FILTER'
,p_help_text=>'When exporting the Interactive Report to Excel, show the header with filter option.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34481605049706384150)
,p_plugin_attribute_id=>wwv_flow_imp.id(34412534578893013072)
,p_display_sequence=>60
,p_display_value=>'IR/IG: Use Saved Report instead of Report in Session'
,p_return_value=>'ALWAYS_REPORT_ALIAS'
,p_help_text=>'When defining the Interactive Report source ir1|my_saved_report, the "my_saved_report" will be used, even when the person is looking at a different report in his session session.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33756153354759828117)
,p_plugin_attribute_id=>wwv_flow_imp.id(34412534578893013072)
,p_display_sequence=>70
,p_display_value=>'IR/IG: Repeat header on every page'
,p_return_value=>'REPEAT_HEADER'
,p_help_text=>'When the table spans multiple pages, the header row will be repeated on every page.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33255142642067605286)
,p_plugin_attribute_id=>wwv_flow_imp.id(34412534578893013072)
,p_display_sequence=>80
,p_display_value=>'Obfuscate data'
,p_return_value=>'OBFUSCATE_DATA'
,p_help_text=>'Obfuscate data, so it''s easy to send examples to others.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(34282940972320040592)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>3
,p_display_sequence=>30
,p_prompt=>'Init PL/SQL Code'
,p_attribute_type=>'PLSQL'
,p_is_required=>false
,p_is_translatable=>false
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<pre>',
'aop_api_pkg.g_output_filename         := ''output'';',
'aop_api_pkg.g_output_filename         := v(''P1_FILENAME'');',
'aop_api_pkg.g_output_remove_last_page := true;',
'aop_api_pkg.g_rpt_header_font_size    := ''12'';',
'aop_api_pkg.g_prepend_files_sql       := q''[select filename, mime_type, template_blob as file_blob from aop_template where filename like ''PREPEND%'' order by filename]'';',
'aop_api_pkg.g_append_files_sql        := q''[select filename, mime_type, template_blob as file_blob from aop_template where filename like ''APPEND%'' order by filename]'';',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'You can define global variables of the aop_api_pkg in this area.<br/>',
'</p>',
'For a list of available global variables, see the spec of aop_api_pkg:',
'<pre>',
'-- Global variables ',
'g_output_filename         varchar2(100) := null;',
'g_language                varchar2(2)   := ''en'';  -- Language can be: en, fr, nl, de',
'g_debug                   varchar2(10)  := null;  -- set to ''Local'' when only the JSON needs to be generated, ''Remote'' for remote debug',
'g_output_remove_last_page boolean       := false; -- PDF option to remove the last page; e.g. when the last page is empty',
'',
'-- Interactive Report',
'g_rpt_header_font_name    varchar2(50)  := '''';    -- Arial - see https://www.microsoft.com/typography/Fonts/product.aspx?PID=163',
'g_rpt_header_font_size    varchar2(3)   := '''';    -- 14',
'g_rpt_header_font_color   varchar2(50)  := '''';    -- #071626',
'g_rpt_header_back_color   varchar2(50)  := '''';    -- #FAFAFA',
'g_rpt_header_border_width varchar2(50)  := '''';    -- 1 ; ''0'' = no border',
'g_rpt_header_border_color varchar2(50)  := '''';    -- #000000',
'g_rpt_data_font_name      varchar2(50)  := '''';    -- Arial - see https://www.microsoft.com/typography/Fonts/product.aspx?PID=163',
'g_rpt_data_font_size      varchar2(3)   := '''';    -- 14',
'g_rpt_data_font_color     varchar2(50)  := '''';    -- #000000',
'g_rpt_data_back_color     varchar2(50)  := '''';    -- #FFFFFF',
'g_rpt_data_border_width   varchar2(50)  := '''';    -- 1 ; ''0'' = no border ',
'g_rpt_data_border_color   varchar2(50)  := '''';    -- #000000',
'g_rpt_data_alt_row_color  varchar2(50)  := '''';    -- #FFFFFF for no alt row color, use same color as g_rpt_data_back_color',
'',
'-- APEX Page Items ',
'g_apex_items              varchar2(4000):= null;  -- colon-separated list of APEX items e.g. P1_X:P1_Y, which can be referenced in a template using {Pxx_ITEM}',
'                                                  -- you can only use this global variable in combination with reports (classic, IR, IG, ...).',
'                                                  -- When using a SQL Query, you can define the page item in your SQL query, e.g. :P1_ITEM as "P1_ITEM"',
'',
'-- Call a Web Service where AOP will send the file to (POST Request)',
'g_web_service_url         varchar2(500) := null;  -- URL to be called once AOP has created the document. AOP will do a POST request and headers can be specified',
'g_web_service_headers     varchar2(4000):= null;  -- The headers for the POST request e.g. {"file_id": "F123", "access_token": "A456789"}',
'',
'-- Templates',
'g_template_start_delimiter   varchar2(2)   := null;  -- { is the default start delimiter used is a template, but you can set this variable with the following options: {, {{, <, <<',
'g_template_end_delimiter     varchar2(2)   := null;  -- } is the default end delimiter used in a template, but you can set this variable with the following options: }, }}, >, >>',
'g_cache_template             boolean       := false; -- cache the template; an hash is returned in g_template_cache_hash',
'',
'-- Password protected PDF',
'g_output_read_password       varchar2(200) := null; -- protect PDF to read',
'g_output_modify_password     varchar2(200) := null; -- protect PDF to write (modify)',
'g_output_pwd_protection_flag number(4)     := null; -- optional; default is 4. ',
'',
'-- Watermark',
'g_output_watermark           varchar2(4000):= null; -- Watermark in PDF',
'g_output_watermark_color     varchar2(500) := null; -- Watermark option color',
'',
'-- Many more are specified in the package',
'</pre>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(34953453747451215610)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>4
,p_display_sequence=>31
,p_prompt=>'Output Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_default_value=>'docx'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34953454344432217036)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>10
,p_display_value=>'Word (docx)'
,p_return_value=>'docx'
,p_is_quick_pick=>true
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34953455137315220286)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>20
,p_display_value=>'Excel (xlsx)'
,p_return_value=>'xlsx'
,p_is_quick_pick=>true
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34953455536453220750)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>30
,p_display_value=>'PowerPoint (pptx)'
,p_return_value=>'pptx'
,p_is_quick_pick=>true
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34953455935374221283)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>40
,p_display_value=>'PDF (pdf)'
,p_return_value=>'pdf'
,p_is_quick_pick=>true
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34953456733433222145)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>60
,p_display_value=>'HTML (html)'
,p_return_value=>'html'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33810690532132897923)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>65
,p_display_value=>'Markdown (md)'
,p_return_value=>'md'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33644796638649210703)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>66
,p_display_value=>'Text (txt)'
,p_return_value=>'txt'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34953456334512221674)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>67
,p_display_value=>'Rich Text Format (rtf)'
,p_return_value=>'rtf'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33439811150294523827)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>68
,p_display_value=>'CSV (csv)'
,p_return_value=>'csv'
,p_help_text=>'Comma separated values file. Text file containing information separated by commas.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33504516660567775494)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>69
,p_display_value=>'One Page PDF (pdf)'
,p_return_value=>'onepagepdf'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33168351961822293304)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>70
,p_display_value=>'PDF Form Fields (pdf)'
,p_return_value=>'form_fields'
,p_help_text=>'Get the form fields defined on a PDF.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33450990194219810919)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>210
,p_display_value=>'Word with macros (docm)'
,p_return_value=>'docm'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33450990554582812218)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>220
,p_display_value=>'Excel with macros (xlsm)'
,p_return_value=>'xlsm'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33450991009740813317)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>230
,p_display_value=>'PowerPoint with macros (pptm)'
,p_return_value=>'pptm'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33450991359700814704)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>240
,p_display_value=>'Calendar (ics)'
,p_return_value=>'ics'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33450991737253816092)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>250
,p_display_value=>'Calendar (ifb)'
,p_return_value=>'ifb'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33005917413406561372)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>310
,p_display_value=>'Word (doc)'
,p_return_value=>'doc'
,p_help_text=>'Old Microsoft Word version'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33005917816606563426)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>320
,p_display_value=>'Excel (xls)'
,p_return_value=>'xls'
,p_help_text=>'Old Microsoft Excel version'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33005918219695565799)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>330
,p_display_value=>'PowerPoint (ppt)'
,p_return_value=>'ppt'
,p_help_text=>'Old Microsoft PowerPoint version'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33170837853096352497)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>520
,p_display_value=>'OpenDocument Text (odt)'
,p_return_value=>'odt'
,p_help_text=>'OpenOffice Word'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33170838200807350605)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>530
,p_display_value=>'OpenDocument Spreadsheet (ods)'
,p_return_value=>'ods'
,p_help_text=>'OpenOffice Excel'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33170838683102349221)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>540
,p_display_value=>'OpenDocument Presentation (odp)'
,p_return_value=>'odp'
,p_help_text=>'OpenOffice Powerpoint'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33221346331853181928)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>550
,p_display_value=>'XML (xml)'
,p_return_value=>'xml'
,p_help_text=>'Extensible Markup Language is a markup language that defines a set of rules for encoding documents in a format that is both human-readable and machine-readable.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33255122557463312675)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>560
,p_display_value=>'JSON (json)'
,p_return_value=>'json'
,p_help_text=>'JSON stands for JavaScript Object Notation. JSON is a lightweight data-interchange format.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34953584162700143538)
,p_plugin_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_display_sequence=>900
,p_display_value=>'Defined by APEX Item'
,p_return_value=>'apex_item'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(34916823251441283174)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>5
,p_display_sequence=>20
,p_prompt=>'Data Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>true
,p_default_value=>'SQL'
,p_is_translatable=>false
,p_lov_type=>'STATIC'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34881472945747829074)
,p_plugin_attribute_id=>wwv_flow_imp.id(34916823251441283174)
,p_display_sequence=>10
,p_display_value=>'SQL'
,p_return_value=>'SQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter a select statement in which you can use a cursor to do nested records. Use "" as alias for column names to force lower case column names.<br/>You can also use SQL that generates JSON.',
'<br/>',
'Note that you can use bind variables e.g. :PXX_ITEM.',
'<br/>',
'',
'<p><b>Cursor syntax:</b></p>',
'<p>Details of a customer e.g. for a letter</p>',
'<pre>',
'select',
'    ''file1'' as "filename",',
'    cursor',
'    (select ',
'         c.cust_first_name as "cust_first_name",',
'         c.cust_last_name as "cust_last_name",',
'         c.cust_city as "cust_city"',
'       from demo_customers c',
'      where c.customer_id = :PXX_ITEM ',
'    ) as "data"',
'from dual',
'</pre>',
'',
'<p><b>Native JSON database functionality:</b></p>',
'<p>Details of a customer e.g. for a letter</p>',
'<pre>',
'select ',
'  json_arrayagg( ',
'    json_object( ',
'      ''filename'' value ''file1'', ',
'      ''data''     value (select ',
'                          json_arrayagg(',
'                            json_object( ',
'                              ''cust_first_name'' value c.cust_first_name, ',
'                              ''cust_last_name''  value c.cust_last_name,',
'                              ''cust_city''       value c.cust_city ',
'                            )',
'                          )  ',
'                          from demo_customers c',
'                          where c.customer_id = :PXX_ITEM',
'                        )  ',
'    )',
'  ) as aop_json',
'  from dual ',
'</pre>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34470354646716081630)
,p_plugin_attribute_id=>wwv_flow_imp.id(34916823251441283174)
,p_display_sequence=>15
,p_display_value=>'PL/SQL Function (returning SQL)'
,p_return_value=>'PLSQL_SQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter a PL/SQL procedure that returns as select statement in which you can use a cursor to do nested records. Use "" as alias for column names to force lower case column names.<br/>',
'Note that you can use bind variables e.g. :PXX_ITEM.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34916824246912285296)
,p_plugin_attribute_id=>wwv_flow_imp.id(34916823251441283174)
,p_display_sequence=>20
,p_display_value=>'PL/SQL Function (returning JSON)'
,p_return_value=>'PLSQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Return JSON as defined in the URL example above.',
'(see example in help of Data Source)'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34916823848853284332)
,p_plugin_attribute_id=>wwv_flow_imp.id(34916823251441283174)
,p_display_sequence=>30
,p_display_value=>'URL (returning JSON)'
,p_return_value=>'URL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'The Source should point to a URL that returns a JSON object with following format:',
'{',
'  "filename": "file1",',
'  "data":[{...}]',
'}',
'If the URL is using an APEX/ORDS REST call it will automatically be wrapped with additional JSON: {"items":[...]} This is ok as the plugin removes it for you.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34747504381375704771)
,p_plugin_attribute_id=>wwv_flow_imp.id(34916823251441283174)
,p_display_sequence=>40
,p_display_value=>'Region(s): Classic Report, Interactive Report/Grid, SVG, Canvas, HTML, Other'
,p_return_value=>'IR'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Enter a comma separated list of static id of one of following region types:',
'<ul>',
'<li>Classic Report</li>',
'<li>Interactive Report</li>',
'<li>Interactive Grid</li>',
'<li>JET Chart</li>',
'<li>Any other region (static html, div, plugin) which you want to include</li>',
'</ul>',
'</p>',
'<p>',
'e.g. my_classic_report,ir1,jet2,my_div',
'</p>',
'<p>',
'In your template you can include the entire Interactive Report by using the tag {&interactive_1} for the first interactive report, {&interactive_2} for the second etc.',
'<br/>',
'To include an Interactive Grid as you see on the screen you use the tag {&interactive_<static_id>}.',
'<br/>',
'If you just want to get the data and do the styling yourself, you can use for classic report: {#<static_id>}{column}{/<static_id} or for interactive report {#aopireportdata_1}{column}{/aopireportdata_1}.',
'For interactive grid use {#aopigridoptions_<static_id>} {column} {/aopigridoptions_<static_id>}',
'<br/>',
'To include the svg(s) in the div use {%region} and specify in the Custom Attributes of the region: aop-region-as="client_svg"',
'<br/>',
'To include a canvas in the div use {%region} and specify in the Custom Attributes of the region: aop-region-as="client_canvas"',
'<br/>',
'To include the html in the div use {_region} and specify in the Custom Attributes of the region: aop-region-as="server_html" or aop-region-as="client_html". AOP will translate the html into native Word styling either by passing the HTML defined in th'
||'e Region Source (server_html) or defined after rendering on the page (client_html).',
'<br/>',
'To include a screenshot of the div use {%region}, you don''t have to specify anything or you can specify in the Custom Attributes of the region: aop-region-as="client_screenshot".',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33364643301095897889)
,p_plugin_attribute_id=>wwv_flow_imp.id(34916823251441283174)
,p_display_sequence=>50
,p_display_value=>'XML (data part)'
,p_return_value=>'XML'
,p_help_text=>'Data in XML format. No need to specify files or filename.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33364643720757898804)
,p_plugin_attribute_id=>wwv_flow_imp.id(34916823251441283174)
,p_display_sequence=>60
,p_display_value=>'JSON (data part)'
,p_return_value=>'JSON'
,p_help_text=>'Data in JSON format. No need to specify files or filename.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33366289088399935175)
,p_plugin_attribute_id=>wwv_flow_imp.id(34916823251441283174)
,p_display_sequence=>70
,p_display_value=>'JSON (REST, GraphQL, Raw)'
,p_return_value=>'JSON_FILES'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter JSON in format ',
'<code>',
'[',
'{ "filename": "xxx.docx",',
'  "datasource": "graphql",',
'  "query": "{human(id:\"1000\"){name height}",',
'  "endpoint": "https://api.graph.cool/simple/v1/",',
'  "headers": [{"Content-Type":"application/json"},{"Custom-Auth-Token":"xyz"}]',
'} ',
']',
'</code>',
'',
'The files part of the AOP structure will be filled in with the value specified here.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33176517959825547622)
,p_plugin_attribute_id=>wwv_flow_imp.id(34916823251441283174)
,p_display_sequence=>80
,p_display_value=>'None'
,p_return_value=>'NONE'
,p_help_text=>'To only append or prepend files or to work with PDFs, set the data type to none.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(34881437792619573690)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>6
,p_display_sequence=>10
,p_prompt=>'Template Type'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'AOP Template'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'<b>AOP Template</b>: will generate a Word document with a starting template based on the data (JSON) that is submitted. <br/>',
'Documentation is also added on the next page(s) that describe the functions AOP will understand.',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33364453639151779593)
,p_plugin_attribute_id=>wwv_flow_imp.id(34881437792619573690)
,p_display_sequence=>1
,p_display_value=>'AOP Report'
,p_return_value=>'AOP_REPORT'
,p_help_text=>'AOP will generate a report for you based on the Print Attributes specified in the given region (in case multiple regions are specified, the first region is used for the Print Attributes).'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33176519342558539225)
,p_plugin_attribute_id=>wwv_flow_imp.id(34881437792619573690)
,p_display_sequence=>3
,p_display_value=>'APEX Report'
,p_return_value=>'APEX_REPORT'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'From APEX 20.2 onwards, APEX supports the creation of native Excel and PDF of a region. Using APEX Report will use this feature. Note: only 1 region (static id) can be rendered.',
'An alternative to APEX Report is an AOP Report, which uses the AOP rendering and which supports also HTML expressions.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33206766266827684481)
,p_plugin_attribute_id=>wwv_flow_imp.id(34881437792619573690)
,p_display_sequence=>4
,p_display_value=>'APEX Report (Data only)'
,p_return_value=>'APEX_REPORT_DO'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'From APEX 20.2 onwards, APEX supports the creation of native Excel and PDF of a region. Using APEX Report will use this feature. Data only will remove highlights etc. and just export the data. Note: only 1 region (static id) can be rendered.',
'An alternative to APEX Report is an AOP Report, which uses the AOP rendering and which supports also HTML expressions.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34839985967588001191)
,p_plugin_attribute_id=>wwv_flow_imp.id(34881437792619573690)
,p_display_sequence=>5
,p_display_value=>'Static Application Files'
,p_return_value=>'APEX'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the filename of the file uploaded to your Shared Components > Static Application Files<br/>',
'e.g. aop_template_d01.docx'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34727592945936664955)
,p_plugin_attribute_id=>wwv_flow_imp.id(34881437792619573690)
,p_display_sequence=>7
,p_display_value=>'Static Workspace Files'
,p_return_value=>'WORKSPACE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the filename of the file uploaded to your Shared Components > Static Workspace Files<br/>',
'e.g. aop_template_d01.docx'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34881440346013574391)
,p_plugin_attribute_id=>wwv_flow_imp.id(34881437792619573690)
,p_display_sequence=>10
,p_display_value=>'SQL'
,p_return_value=>'SQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Query that returns two columns: template_type and file (in this order) <br/>',
'- template_type: docx, xlsx, pptx, html, md <br/>',
'- file: blob column'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33770228880832994029)
,p_plugin_attribute_id=>wwv_flow_imp.id(34881437792619573690)
,p_display_sequence=>15
,p_display_value=>'PL/SQL Function (returning SQL)'
,p_return_value=>'PLSQL_SQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter a PL/SQL procedure that returns a select statement with two columns: template_type and file (in this order) <br/>',
'- template_type: docx, xlsx, pptx, html, md <br/>',
'- file: blob column',
'<br/>',
'Note that you can use bind variables e.g. :PXX_ITEM.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34881440785550575117)
,p_plugin_attribute_id=>wwv_flow_imp.id(34881437792619573690)
,p_display_sequence=>20
,p_display_value=>'PL/SQL Function (returning JSON)'
,p_return_value=>'PLSQL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Return JSON object with following format: ',
'<pre>',
'{',
'  "file":"clob base 64 data",',
'  "template_type":"docx,xlsx,pptx"',
'}',
'</pre>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33374774912003360905)
,p_plugin_attribute_id=>wwv_flow_imp.id(34881437792619573690)
,p_display_sequence=>25
,p_display_value=>'JSON'
,p_return_value=>'JSON'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Add the JSON of "template" in here. <br/>',
'e.g.:',
'<pre>',
'{"filename":"aop_template_d01.docx", "template_type":"docx"}',
'</pre>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34881441154124575924)
,p_plugin_attribute_id=>wwv_flow_imp.id(34881437792619573690)
,p_display_sequence=>30
,p_display_value=>'Filename (with path relative to AOP server)'
,p_return_value=>'FILENAME'
,p_help_text=>'Enter the path and filename of the template which is stored on the same server AOP is running at.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33366279271703655654)
,p_plugin_attribute_id=>wwv_flow_imp.id(34881437792619573690)
,p_display_sequence=>35
,p_display_value=>'Filename (with database directory)'
,p_return_value=>'DB_DIRECTORY'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the Database directory colon separated with the filename. <br/>',
'e.g. AOP_TEMPLATE:my_template.docx',
'<br/><br/>',
'Example how to create Database directory: <br/>',
'CREATE DIRECTORY AOP_TEMPLATE AS ''/home/oracle/aop_template'';'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34470171492984627784)
,p_plugin_attribute_id=>wwv_flow_imp.id(34881437792619573690)
,p_display_sequence=>40
,p_display_value=>'URL (call from DB)'
,p_return_value=>'URL'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the url to your template in docx, xlsx or pptx. <br/>',
'e.g. https://www.apexofficeprint.com/templates/aop_template_d01.docx',
'<br/><br/>',
'Always make sure your url ends with the filename. E.g. for Google Drive add to the end of the url &aop=.docx',
'<br/><br/>',
'This call is done from the database, so the database server needs to have access to the url.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33450434152967705288)
,p_plugin_attribute_id=>wwv_flow_imp.id(34881437792619573690)
,p_display_sequence=>50
,p_display_value=>'URL (call from AOP)'
,p_return_value=>'URL_AOP'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter the url to your template in docx, xlsx or pptx. <br/>',
'e.g. https://www.apexofficeprint.com/templates/aop_template_d01.docx ',
'<br/><br/>',
'Always make sure your url ends with the filename. E.g. for Google Drive add to the end of the url &aop=.docx',
'<br/><br/>',
'This call is done from AOP, so the AOP server needs to have access to the url.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33168348564033351406)
,p_plugin_attribute_id=>wwv_flow_imp.id(34881437792619573690)
,p_display_sequence=>60
,p_display_value=>'None'
,p_return_value=>'NONE'
,p_help_text=>'To only append or prepend files or to fill PDFs, set the template type to none.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(34953583341362138319)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>7
,p_display_sequence=>11
,p_prompt=>'Template Source'
,p_attribute_type=>'TEXTAREA'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(34881437792619573690)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'APEX,WORKSPACE,FILENAME,URL,URL_AOP,DB_DIRECTORY,JSON'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Reference a file in Shared Components > Static Application Files or Static Workspace Files <br/>',
'<pre>',
'aop_template.docx',
'</pre>',
'In case you want to specify the template dynamically, use the SQL option with following:',
'<pre>',
'select case ',
'        when mime_type = ''application/octet-stream''',
'        then substr(file_name, instr(file_name,''.'',-1)+1) ',
'        else mime_type',
'        end as template_type, ',
'        file_content as template_blob',
'  from apex_application_static_files',
' where file_name    = :PXX_YOUR_ITEM',
'   and application_id = :APP_ID',
'</pre>',
'</p>',
'<p>',
'Reference a file on the server. Include the path relative to the AOP executable.',
'</p>',
'<p>',
'Reference a url, accessible from the database.',
'</p>',
'<p>',
'Reference a url, accessible from the AOP Server.',
'</p>',
'<p>',
'Specify the region static id where the Print Attributes are specified for the AOP Report.',
'</p>',
'<p>',
'Reference a database directory and file on the database server. Format: DIRECTORY:FILENAME e.g. AOP_TEMPLATE:my_template.docx',
'</p>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>The templates need to be of format: Word (docx), Excel (xlsx), Powerpoint (pptx), HTML (html), Text (txt), CSV (csv) or Markdown (md).',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(34953584750192149342)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>8
,p_display_sequence=>32
,p_prompt=>'Output Type APEX Item'
,p_attribute_type=>'PAGE ITEM'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(34953453747451215610)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'apex_item'
,p_help_text=>'APEX item that contains the output type. See Output Type help text for valid list of output types.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(34781593183572372550)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>9
,p_display_sequence=>12
,p_prompt=>'Template Source'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_sql_min_column_count=>2
,p_sql_max_column_count=>2
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(34881437792619573690)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'SQL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'To query your own table:',
'<pre>',
' select template_type, template_blob',
'  from aop_template  ',
' where id = :P1_TEMPLATE_ID ',
'</pre>',
'To query the APEX static application files use:',
'<pre>',
'select case ',
'        when mime_type = ''application/octet-stream''',
'        then substr(file_name, instr(file_name,''.'',-1)+1) ',
'        else mime_type',
'        end as template_type, ',
'        file_content as template_blob',
'  from apex_application_static_files',
' where file_name    = :PXX_YOUR_ITEM',
'   and application_id = :APP_ID',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'When you use your own table (or the one that is provided in the sample AOP app) to store the template documents, this select statement might help:',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(34781594005347378934)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>10
,p_display_sequence=>13
,p_prompt=>'Template Source'
,p_attribute_type=>'PLSQL FUNCTION BODY'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(34881437792619573690)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'PLSQL,PLSQL_SQL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h3>PL/SQL Function (returning SQL)</h3>',
'<pre>',
'declare',
'  l_return clob;',
'begin',
'  l_return := q''[',
'    select',
'      a.TEMPLATE_TYPE as template_type,',
'      apex_web_service.blob2clobbase64(a.TEMPLATE_BLOB) as file',
'     from aop_template a',
'    where id = 1',
'  ]'';',
'  return l_return;',
'end;',
'</pre>',
'',
'<br/><br/>',
'',
'<h3>PL/SQL Function (returning JSON)</h3>',
'<pre>',
'declare ',
'  l_return        clob; ',
'  l_template      clob; ',
'  l_template_type aop_template.template_type%type; ',
'begin ',
'  select template_type, apex_web_service.blob2clobbase64(template_blob) template ',
'    into l_template_type, l_template ',
'    from aop_template ',
'   where id = :p4_template;',
'',
'  l_return := ''{ "file": "'' || replace(l_template,''"'', ''\u0022'') ',
'              || ''",'' || '' "template_type": "'' || replace(l_template_type,''"'', ''\u0022'') ',
'              || ''" }''; ',
'',
'  return l_return;',
'end;',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'By using PL/SQL to create your own SQL or JSON, you''re more flexible. You can use bind variables and page items.',
'</p>',
'<p>',
'The JSON format should be file and template_type. You can use substitution variables in the PL/SQL code. <br/>',
'The structure is like this:',
'</p>',
'<pre>',
'declare ',
'  l_return        clob; ',
'begin ',
'  l_return := ''{ "file": "", "template_type": "docx" }''; ',
'',
'  return l_return; ',
'end;',
'</pre>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(34781596557288431184)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>11
,p_display_sequence=>21
,p_prompt=>'Data Source'
,p_attribute_type=>'SQL'
,p_is_required=>true
,p_sql_min_column_count=>1
,p_sql_max_column_count=>2
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(34916823251441283174)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'SQL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p><b>Cursor syntax:</b></p>',
'<p>List of all customers e.g. to send letter to all</p>',
'<pre>',
'select',
'    ''file1'' as "filename",',
'    cursor',
'    (select ',
'       cursor(select',
'                  c.cust_first_name as "cust_first_name",',
'                  c.cust_last_name as "cust_last_name",',
'                  c.cust_city as "cust_city" ',
'                from demo_customers c) as "customers"',
'       from dual) as "data"',
'from dual ',
'</pre>',
'<p>Details of all orders of a customer e.g. for invoices</p>',
'<pre>',
'select',
'  ''file1'' as "filename", ',
'  cursor(',
'    select',
'      c.cust_first_name as "cust_first_name",',
'      c.cust_last_name as "cust_last_name",',
'      c.cust_city as "cust_city",',
'      cursor(select o.order_total as "order_total", ',
'                    ''Order '' || rownum as "order_name",',
'                cursor(select p.product_name as "product_name", ',
'                              i.quantity as "quantity",',
'                              i.unit_price as "unit_price", ',
'                              APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as "image"',
'                         from demo_order_items i, demo_product_info p',
'                        where o.order_id = i.order_id',
'                          and i.product_id = p.product_id',
'                      ) "product"',
'               from demo_orders o',
'              where c.customer_id = o.customer_id',
'            ) "orders"',
'    from demo_customers c',
'    where customer_id = :P1_CUSTOMER_ID',
'  ) as "data"',
'from dual',
'</pre>',
'',
'<p><b>Native JSON database functionality:</b></p>',
'<p>Details of a customer e.g. for a letter</p>',
'<pre>',
'select ',
'  json_arrayagg( ',
'    json_object( ',
'      ''filename'' value ''file1'', ',
'      ''data''     value (select ',
'                          json_arrayagg(',
'                            json_object( ',
'                              ''cust_first_name'' value c.cust_first_name, ',
'                              ''cust_last_name''  value c.cust_last_name,',
'                              ''cust_city''       value c.cust_city ',
'                            )',
'                          )  ',
'                          from demo_customers c',
'                          where c.customer_id = 1',
'                        )  ',
'    )',
'  ) as aop_json',
'  from dual ',
'</pre>',
'<p>Details of all orders of a customer e.g. for invoices</p>',
'<pre>',
'select ',
'json_arrayagg( ',
'json_object( ',
'''filename'' value ''file1'', ',
'''data''     value (',
'  select ',
'    json_arrayagg(',
'      json_object( ',
'        ''cust_first_name'' value c.cust_first_name, ',
'        ''cust_last_name''  value c.cust_last_name,',
'        ''cust_city''       value c.cust_city, ',
'        ''orders''          value (',
'            select ',
'              json_arrayagg(',
'                json_object(                               ',
'                  ''order_total'' value o.order_total, ',
'                  ''order_name''  value ''Order '' || rownum,',
'                  ''order_lines'' value (',
'                      select ',
'                        json_arrayagg(',
'                          json_object(                               ',
'                            ''product_name'' value p.product_name, ',
'                            ''quantity''     value i.quantity,',
'                            ''unit_price''   value i.unit_price',
'                          )',
'                        returning clob)      ',
'                        from demo_order_items i, demo_product_info p',
'                        where o.order_id = i.order_id',
'                          and i.product_id = p.product_id',
'                    )',
'                )',
'              returning clob)      ',
'              from demo_orders o',
'            where o.customer_id = c.customer_id',
'          )',
'      )',
'    returning clob)  ',
'    from demo_customers c',
'    where c.customer_id = :P1_CUSTOMER_ID',
'  )',
')',
'returning clob) as aop_json',
'from dual',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'A SQL statement is the easiest to use, either by using the cursor syntax or native JSON database functionality.<br/>',
'Images need to be base64 encoded. You can reference items by using :ITEM ',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(34781597006857435530)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>12
,p_display_sequence=>22
,p_prompt=>'Data Source'
,p_attribute_type=>'PLSQL FUNCTION BODY'
,p_is_required=>true
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(34916823251441283174)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'PLSQL,PLSQL_SQL'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<h3>PL/SQL Function (returning SQL)</h3>',
'<pre>',
'declare',
'  l_return clob;',
'begin',
'  l_return := q''[',
'    select',
'      ''file1'' as "filename",',
'      cursor(',
'        select',
'          c.cust_first_name as "cust_first_name",',
'          c.cust_last_name as "cust_last_name",',
'          c.cust_city as "cust_city",',
'          cursor(',
'            select',
'              o.order_total as "order_total",',
'              ''Order '' || rownum as "order_name",',
'              cursor(',
'                select',
'                  p.product_name as "product_name",',
'                  i.quantity as "quantity",',
'                  i.unit_price as "unit_price",',
'                  APEX_WEB_SERVICE.BLOB2CLOBBASE64(p.product_image) as "image"',
'                from',
'                  demo_order_items i, demo_product_info p',
'                where',
'                  o.order_id = i.order_id',
'                  and i.product_id = p.product_id',
'                    ) "product"',
'            from',
'              demo_orders o',
'            where',
'              c.customer_id = o.customer_id',
'                ) "orders"',
'        from',
'          demo_customers c',
'        where',
'          customer_id = :P4_CUSTOMER_ID',
'            ) as "data"',
'    from dual',
'  ]'';',
'  return l_return;',
'end;',
'</pre>',
'',
'<br/><br/>',
'',
'<h3>PL/SQL Function (returning JSON)</h3>',
'<pre>',
'declare',
'  l_cursor sys_refcursor;',
'  l_return clob;',
'begin',
'  apex_json.initialize_clob_output(dbms_lob.call, true, 2) ;',
'  open l_cursor for ',
'  select ''file1'' as "filename",',
'  cursor',
'    (select',
'        c.cust_first_name as "cust_first_name",',
'        c.cust_last_name  as "cust_last_name" ,',
'        c.cust_city       as "cust_city"      ,',
'        cursor',
'        (select',
'            o.order_total      as "order_total",',
'            ''Order '' || rownum as "order_name" ,',
'            cursor',
'            (select',
'                p.product_name                                    as "product_name",',
'                i.quantity                                        as "quantity"    ,',
'                i.unit_price                                      as "unit_price"  ,',
'                apex_web_service.blob2clobbase64(p.product_image) as "image"',
'              from',
'                demo_order_items i,',
'                demo_product_info p',
'              where',
'                o.order_id       = i.order_id',
'                and i.product_id = p.product_id',
'            ) "product"',
'        from',
'          demo_orders o',
'        where',
'          c.customer_id = o.customer_id',
'        ) "orders"',
'      from',
'        demo_customers c',
'      where',
'        customer_id = :P4_CUSTOMER_ID',
'    ) as "data" ',
'  from dual;',
'  apex_json.write(l_cursor) ;',
'  l_return := apex_json.get_clob_output;',
'  return l_return;',
'end;',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'By using PL/SQL to create your own SQL or JSON, you''re more flexible. You can use bind variables and page items.',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(34747727621590328318)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>13
,p_display_sequence=>25
,p_prompt=>'Region Static Id(s)'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(34916823251441283174)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'EQUALS'
,p_depending_on_expression=>'IR'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Define one or more Static Id(s) of the report region. Static ids should be separated by a comma. e.g. ir1,ir2 <br/>',
'You can set the Static ID of the region in the region settings (Advanced section). Under Static ID in the Custom Attributes you can define how AOP should behave: aop-region-as="server_html / client_canvas / client_svg / client_html / client_screensho'
||'t". Depending this setting, AOP will render the HTML from the server or it will take from client the canvas, svg, html or take a screenshot of the region.',
'</p>'))
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(34748112455072694474)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>14
,p_display_sequence=>140
,p_prompt=>'Output To'
,p_attribute_type=>'SELECT LIST'
,p_is_required=>false
,p_is_translatable=>false
,p_lov_type=>'STATIC'
,p_null_text=>'Browser (file)'
,p_help_text=>'By default the file that''s generated by AOP, will be downloaded by the Browser and saved on your harddrive.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34748117578172695898)
,p_plugin_attribute_id=>wwv_flow_imp.id(34748112455072694474)
,p_display_sequence=>10
,p_display_value=>'Procedure'
,p_return_value=>'PROCEDURE'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option will call a procedure in a specific format (see definition in procedure help). This option is useful in case you don''t need the file on your own hard drive, but for example, you want to mail the document automatically or want to store it '
||'in the database.',
'In that case, you can create a procedure that adds the generated document as an attachment to your apex_mail.send.'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(34748117941362697448)
,p_plugin_attribute_id=>wwv_flow_imp.id(34748112455072694474)
,p_display_sequence=>20
,p_display_value=>'Procedure and Browser (file)'
,p_return_value=>'PROCEDURE_BROWSER'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'This option allows you to call a procedure first and next download the file to your hard drive.',
'An example is when you first want to store the generated document in a table before letting the browser download it. (see definition in procedure help)'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33947508131247237416)
,p_plugin_attribute_id=>wwv_flow_imp.id(34748112455072694474)
,p_display_sequence=>30
,p_display_value=>'Inline Region (pdf/html/md/txt only)'
,p_return_value=>'BROWSER_INLINE'
,p_help_text=>'add data-aop-inline-pdf="Name of Dynamic Action" or data-aop-inline-txt="Name of Dynamic Action" to a region, div, textarea of other.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33174917293926108395)
,p_plugin_attribute_id=>wwv_flow_imp.id(34748112455072694474)
,p_display_sequence=>35
,p_display_value=>'Procedure and Inline Region (pdf/html/md/txt only)'
,p_return_value=>'PROCEDURE_INLINE'
,p_help_text=>'This option allows you to call a procedure first and next show the output in a region. Add data-aop-inline-pdf="Name of Dynamic Action" or data-aop-inline-txt="Name of Dynamic Action" to a region, div, textarea of other.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33809429501657359994)
,p_plugin_attribute_id=>wwv_flow_imp.id(34748112455072694474)
,p_display_sequence=>40
,p_display_value=>'Directory (on AOP Server)'
,p_return_value=>'DIRECTORY'
,p_help_text=>'Save the file to a directory specified with g_output_directory. The default directory on the AOP Server is outputfiles.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33366281810844680610)
,p_plugin_attribute_id=>wwv_flow_imp.id(34748112455072694474)
,p_display_sequence=>45
,p_display_value=>'Directory (on Database Server)'
,p_return_value=>'DB_DIRECTORY'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Save the file to a database directory specified with g_output_directory. ',
'<br/>',
'Example how to create Database directory: <br/>',
'CREATE DIRECTORY AOP_TEMPLATE AS ''/home/oracle/aop_output'';'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33462986549307047029)
,p_plugin_attribute_id=>wwv_flow_imp.id(34748112455072694474)
,p_display_sequence=>50
,p_display_value=>'Cloud (Dropbox, Google Drive, OneDrive, Amazon S3)'
,p_return_value=>'CLOUD'
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Save the output straight in a directory on the cloud. <br/>',
'Use following global variables to define the provider and location.',
'<ul>',
'<li>g_cloud_provider (dropbox, gdrive, onedrive, amazon_s3)</li>',
'<li>g_cloud_location (directory, or bucket with directory on Amazon)</li>',
'<li>g_cloud_access_token (oauth token)</li>',
'</ul>'))
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33179297385076101256)
,p_plugin_attribute_id=>wwv_flow_imp.id(34748112455072694474)
,p_display_sequence=>60
,p_display_value=>'Defined in Post Process (e.g. Printer)'
,p_return_value=>'NA'
,p_help_text=>'Use when an external post-process command is specified and the output is only needed to be passed to that process. For example when you want to print directly to a Printer or call an OS command.'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33342927730544473337)
,p_plugin_attribute_id=>wwv_flow_imp.id(34748112455072694474)
,p_display_sequence=>70
,p_display_value=>'Asynchronous (Returns URL)'
,p_return_value=>'ASYNC'
,p_help_text=>'AOP will process the request asynchronously. This is especially useful for long-running processes. A URL will be passed to g_async_url where the file will be available to download when AOP is finished. Use the aop_api_pkg.poll_async_file procedure to'
||' check and download the file. Optionally a procedure can be defined (see definition in procedure help).'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33342937043617400221)
,p_plugin_attribute_id=>wwv_flow_imp.id(34748112455072694474)
,p_display_sequence=>80
,p_display_value=>'Web Service (POST Request)'
,p_return_value=>'WEB_SERVICE'
,p_help_text=>'AOP will call the web service (a POST Request) defined in g_web_service_url once AOP is finished producing the file. Extra headers can be added to the POST request by defining them in g_web_service_headers e.g. {"file_id": "F123", "access_token": "A4'
||'56789"}'
);
wwv_flow_imp_shared.create_plugin_attr_value(
 p_id=>wwv_flow_imp.id(33342937501653353014)
,p_plugin_attribute_id=>wwv_flow_imp.id(34748112455072694474)
,p_display_sequence=>90
,p_display_value=>'APEX Office Edit (AOE)'
,p_return_value=>'APEX_OFFICE_EDIT'
,p_help_text=>'This option allows you to call a procedure first and next show the output in APEX Office Edit (AOE), the editor that can show and edit Word, Excel, PowerPoint, PDF, and Text straight from the browser.'
);
wwv_flow_imp_shared.create_plugin_attribute(
 p_id=>wwv_flow_imp.id(34748118335883728779)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_attribute_scope=>'COMPONENT'
,p_attribute_sequence=>15
,p_display_sequence=>150
,p_prompt=>'Procedure Name'
,p_attribute_type=>'TEXT'
,p_is_required=>false
,p_is_translatable=>false
,p_depending_on_attribute_id=>wwv_flow_imp.id(34748112455072694474)
,p_depending_on_has_to_exist=>true
,p_depending_on_condition_type=>'IN_LIST'
,p_depending_on_expression=>'PROCEDURE,PROCEDURE_BROWSER,PROCEDURE_INLINE,ASYNC,APEX_OFFICE_EDIT'
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<p>',
'Create the following procedure in the database:',
'</p>',
'<pre>',
'create procedure send_email_prc(',
'    p_output_blob      in blob,',
'    p_output_filename  in varchar2,',
'    p_output_mime_type in varchar2)',
'is',
'  l_id   number;',
'  l_to   varchar2(200);',
'  l_from varchar2(200);',
'begin',
'  -- in case you want to reference a page item',
'  l_to := v(''P1_EMAIL'');',
'',
'  -- sending an email with an attachment',
'  l_id := apex_mail.send( ',
'            p_to   => l_to, ',
'            p_from => l_from, ',
'            p_subj => ''Mail from APEX with attachment'', ',
'            p_body => ''Please review the attachment.'', ',
'            p_body_html => ''<b>Please</b> review the attachment.'');',
'',
'  apex_mail.add_attachment( ',
'      p_mail_id    => l_id, ',
'      p_attachment => p_output_blob, ',
'      p_filename   => p_output_filename, ',
'      p_mime_type  => p_output_mime_type) ;',
'',
'  apex_mail.push_queue;    ',
'end send_email_prc;',
'</pre>',
'',
'<br/><br/>',
'',
'<p>',
'Create the following procedure in the database with <b>template cache</b>:',
'</p>',
'<pre>',
'create procedure send_email_prc(',
'    p_output_blob         in blob,',
'    p_output_filename     in varchar2,',
'    p_output_mime_type    in varchar2,',
'    p_template_cache_hash in varchar2)',
'is',
'begin',
'  insert into x (output_blob, output_filename, output_mime_type, template_cache_hash)',
'  values (p_output_blob, p_output_filename, p_output_mime_type, p_template_cache_hash);',
'end send_email_prc;',
'</pre>',
'',
'<br/><br/>',
'<p>',
'Create the following procedure in the database for Output To <b>Asynchronous</b>:',
'</p>',
'<pre>',
'create procedure download_aop_async(',
'  p_async_status     in varchar2, ',
'  p_async_message    in varchar2, ',
'  p_async_url        in varchar2, ',
'  p_output_filename  in varchar2, ',
'  p_output_mime_type in varchar2)',
'is',
'begin',
'  insert into aop_output_async (async_status, async_message, async_url, filename, mime_type, last_update_date)',
'  values (p_async_status, p_async_message, p_async_url, p_output_filename, p_output_mime_type, sysdate);',
'',
'  commit;',
'',
'  -- the p_async_url will contain the URL to download the file once it''s ready.',
'end download_aop_async;',
'</pre>',
'',
'<br/><br/>',
'',
'<p>',
'When Output To <b>APEX Office Edit</b> is set, leave the procedure empty to take the settings defined in the APEX Office Edit region or create the following procedure in the database in case you want to call a custom function:',
'</p>',
'<pre>',
'create procedure download_aop_async(',
'    p_output_blob        in blob,',
'    p_output_filename    in varchar2,',
'    p_output_mime_type   in varchar2,',
'    p_primary_key_values out varchar2)',
'is',
'    v_id                number;',
'    v_session_id        number := v(''APP_SESSION'');',
'    v_version           number := 1;',
'    v_last_update_date  timestamp := systimestamp;',
'    v_blob_owner        varchar2(50) := v(''APP_USER'');',
'begin',
'    insert into aoe_files_custom(',
'      session_id,',
'      content,',
'      filename,',
'      mime_type,',
'      blob_owner,',
'      version,',
'      last_update_date',
'    ) values(',
'      v_session_id,',
'      p_output_blob,',
'      p_output_filename,',
'      p_output_mime_type,',
'      v_blob_owner,',
'      v_version,',
'      v_last_update_date',
'    )',
'    returning id into v_id;',
'    -- return    ',
'    p_primary_key_values := v_id;',
'end download_aop_async;',
'</pre>'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'Enter only the procedure name in this field (so without parameters) for example "download_prc".',
'The procedure in the database needs to be structured with the parameters as in the example. ',
'The procedure name can be any name, but the parameters need to match exactly as in the example.',
'You can add other parameters with a default value. ',
'You can reference page items in the procedure by using the v() function.'))
);
wwv_flow_imp_shared.create_plugin_std_attribute(
 p_id=>wwv_flow_imp.id(33810923703592685265)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_name=>'INIT_JAVASCRIPT_CODE'
,p_is_required=>false
,p_depending_on_has_to_exist=>true
,p_examples=>wwv_flow_string.join(wwv_flow_t_varchar2(
'AOP.gAOPOptions.processingIndicator = {',
'  type: AOP.gAOPOptions.processingType.spinner,',
'  spinnerIcon: ''bounce''',
'};<br>',
'AOP.gAOPOptions.showNotification = false;<br>',
'AOP.gAOPOptions.notificatonMessage = ''An AOP error occurred'';'))
,p_help_text=>wwv_flow_string.join(wwv_flow_t_varchar2(
'<strong>Options</strong><br>',
'<strong>AOP.gAOPOptions.showNotification - Show Notification if something went wrong</strong><br>',
'Values: true (default) / false<br><br>',
'<strong>AOP.gAOPOptions.notificatonMessage - Overrides Server-side Notification Message</strong><br>',
'<strong>AOP.gAOPOptions.processingIndicator - Waiting Indicators</strong><br>',
'<code>',
'-- Only Spinner',
'',
'/* APEX Spinner */',
'AOP.gAOPOptions.processingIndicator = {',
'  type: AOP.gAOPOptions.processingType.spinner,',
'  spinnerIcon: ''APEX''',
'};',
'',
'/* Spinkit Circle Spinner */',
'AOP.gAOPOptions.processingIndicator = {',
'  type: AOP.gAOPOptions.processingType.spinner,',
'  spinnerIcon: ''circle''',
'};',
'',
'-- Spinner with Overlay',
'',
'/* APEX Spinner with Overlay */',
'AOP.gAOPOptions.processingIndicator = {',
'  type: AOP.gAOPOptions.processingType.overlay,',
'  spinnerIcon: ''APEX''',
'};',
'',
'/* Spinkit Circle Spinner with Overlay */',
'AOP.gAOPOptions.processingIndicator = {',
'  type: AOP.gAOPOptions.processingType.overlay,',
'  spinnerIcon: ''circle''',
'};',
'',
'-- Spinner in button',
'',
'/* APEX Spinner Added to a Button */',
'AOP.gAOPOptions.processingIndicator = {',
'  type: AOP.gAOPOptions.processingType.button,',
'  button: ''DOCX'',',
'  spinnerIcon: ''APEX''',
'};',
'',
'/* Spinkit Circle Spinner Added to a Button  */',
'AOP.gAOPOptions.processingIndicator = {',
'  type: AOP.gAOPOptions.processingType.button,',
'  button: ''DOCX'',',
'  spinnerIcon: ''circle''',
'};',
'</code>',
'Available waiting spinners:<br>',
'apex (default), flow, plance, circle-fade, fold, bounce, wave, wander, pulse, chase, circle, grid',
'<br><br>'))
);
wwv_flow_imp_shared.create_plugin_event(
 p_id=>wwv_flow_imp.id(34085408309754422756)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_name=>'aop-file-error'
,p_display_name=>'AOP Print File Error'
);
wwv_flow_imp_shared.create_plugin_event(
 p_id=>wwv_flow_imp.id(34085408780239422756)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_name=>'aop-file-progress'
,p_display_name=>'AOP Print File Progress'
);
wwv_flow_imp_shared.create_plugin_event(
 p_id=>wwv_flow_imp.id(34085409154820422756)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_name=>'aop-file-success'
,p_display_name=>'AOP Print File Success'
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '48544D4C43616E766173456C656D656E742E70726F746F747970652E676574436F6E746578743D66756E6374696F6E2865297B72657475726E2066756E6374696F6E28742C69297B72657475726E22776562676C223D3D3D74262628693D4F626A656374';
wwv_flow_imp.g_varchar2_table(2) := '2E61737369676E287B7D2C692C7B707265736572766544726177696E674275666665723A21307D29292C652E63616C6C28746869732C742C69297D7D2848544D4C43616E766173456C656D656E742E70726F746F747970652E676574436F6E7465787429';
wwv_flow_imp.g_varchar2_table(3) := '2C77696E646F772E414F503D77696E646F772E414F507C7C7B7D2C66756E6374696F6E28652C742C692C612C6F2C732C6E2C722C642C6C297B2275736520737472696374223B652E67414F504F7074696F6E733D7B616A61784964656E7469666965723A';
wwv_flow_imp.g_varchar2_table(4) := '22222C74726967676572456C656D49643A22222C737461746963526567696F6E4964733A22222C6F7574707574546F3A22222C64614E616D653A22222C776169745370696E6E65723A22222C70726F63657373696E67496E64696361746F723A7B7D2C70';
wwv_flow_imp.g_varchar2_table(5) := '726F63657373696E67547970653A7B7370696E6E65723A227370696E6E6572222C6F7665726C61793A226F7665726C6179222C627574746F6E3A22627574746F6E227D2C7370696E6E657249636F6E3A7B617065783A2241504558227D2C73686F774E6F';
wwv_flow_imp.g_varchar2_table(6) := '74696669636174696F6E3A21302C6E6F746966696361746F6E4D6573736167653A22222C7375626D69744974656D7341727261793A5B5D2C7375626D697456616C75657341727261793A5B5D2C4947526567696F6E496473416E6453656C656374656450';
wwv_flow_imp.g_varchar2_table(7) := '4B3A7B7D2C6630313A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630323A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D';
wwv_flow_imp.g_varchar2_table(8) := '617857696474683A302C6D61784865696768743A307D2C6630333A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630343A7B6461746141727261793A5B5D2C';
wwv_flow_imp.g_varchar2_table(9) := '77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630353A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C';
wwv_flow_imp.g_varchar2_table(10) := '6630363A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630373A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D6178576964';
wwv_flow_imp.g_varchar2_table(11) := '74683A302C6D61784865696768743A307D2C6630383A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6630393A7B6461746141727261793A5B5D2C7769647468';
wwv_flow_imp.g_varchar2_table(12) := '3A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6631303A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6631313A7B';
wwv_flow_imp.g_varchar2_table(13) := '6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6631323A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C';
wwv_flow_imp.g_varchar2_table(14) := '6D61784865696768743A307D2C6631333A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6631343A7B6461746141727261793A5B5D2C77696474683A302C6865';
wwv_flow_imp.g_varchar2_table(15) := '696768743A302C6D617857696474683A302C6D61784865696768743A307D2C6631353A7B6461746141727261793A5B5D2C77696474683A302C6865696768743A302C6D617857696474683A302C6D61784865696768743A307D7D2C652E67657442726F77';
wwv_flow_imp.g_varchar2_table(16) := '7365724E616D653D28293D3E7B76617220652C742C693D6E6176696761746F722E757365724167656E742C613D6E6176696761746F722E6170704E616D653B72657475726E2D31213D28743D692E696E6465784F6628224F706572612229293F613D226F';
wwv_flow_imp.g_varchar2_table(17) := '70657261223A2D31213D28743D692E696E6465784F6628224D5349452229297C7C2D31213D28743D692E696E6465784F66282254726964656E742229293F613D226965223A2D31213D28743D692E696E6465784F662822456467652229293F613D226564';
wwv_flow_imp.g_varchar2_table(18) := '6765223A2D31213D28743D692E696E6465784F6628224368726F6D652229293F613D226368726F6D65223A2D31213D28743D692E696E6465784F6628225361666172692229293F613D22736166617269223A2D31213D28743D692E696E6465784F662822';
wwv_flow_imp.g_varchar2_table(19) := '46697265666F782229293F613D2266697265666F78223A28653D692E6C617374496E6465784F6628222022292B31293C28743D692E6C617374496E6465784F6628222F222929262628613D692E737562737472696E6728652C7429292E746F4C6F776572';
wwv_flow_imp.g_varchar2_table(20) := '4361736528293D3D612E746F5570706572436173652829262628613D6E6176696761746F722E6170704E616D65292C617D2C652E73686F774572726F724D6573736167653D653D3E7B7472797B732E636C6561724572726F727328292C732E73686F7745';
wwv_flow_imp.g_varchar2_table(21) := '72726F7273285B7B747970653A226572726F72222C6C6F636174696F6E3A2270616765222C6D6573736167653A652C756E736166653A21317D5D297D63617463682865297B612E696E666F2822414F502073686F774572726F724D657373616765222C65';
wwv_flow_imp.g_varchar2_table(22) := '297D7D2C652E73686F77537563636573734D6573736167653D653D3E7B7472797B732E73686F7750616765537563636573732865297D63617463682865297B612E696E666F2822414F502073686F77537563636573734D657373616765222C65297D7D2C';
wwv_flow_imp.g_varchar2_table(23) := '652E73686F774E6F74696669636174696F6E3D28742C69293D3E7B696628652E67414F504F7074696F6E732E73686F774E6F74696669636174696F6E297B76617220613D652E67414F504F7074696F6E732E6E6F746966696361746F6E4D657373616765';
wwv_flow_imp.g_varchar2_table(24) := '7C7C693B2273756363657373223D3D743F652E73686F77537563636573734D6573736167652861293A226572726F72223D3D742626652E73686F774572726F724D6573736167652861297D7D3B636F6E737420633D28652C742C69293D3E7B636F6E7374';
wwv_flow_imp.g_varchar2_table(25) := '20613D722E68746D6C4275696C64657228293B73776974636828612E6D61726B757028273C64697620636C6173733D22616F702D50726F63657373696E67223E27292C65297B636173652274687265652D626F756E6365223A6361736522666C6F77223A';
wwv_flow_imp.g_varchar2_table(26) := '612E6D61726B757028273C64697620636C6173733D22736B2D666C6F7720736B2D63656E746572223E3C64697620636C6173733D22736B2D666C6F772D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D666C6F772D646F74223E3C2F64';
wwv_flow_imp.g_varchar2_table(27) := '69763E3C64697620636C6173733D22736B2D666C6F772D646F74223E3C2F6469763E3C2F6469763E27293B627265616B3B6361736522726F746174696E672D706C616E65223A6361736522706C616E65223A612E6D61726B757028273C64697620636C61';
wwv_flow_imp.g_varchar2_table(28) := '73733D22736B2D706C616E6520736B2D63656E746572223E3C2F6469763E27293B627265616B3B6361736522666164696E672D636972636C65223A6361736522636972636C652D66616465223A612E6D61726B757028273C64697620636C6173733D2273';
wwv_flow_imp.g_varchar2_table(29) := '6B2D636972636C652D6661646520736B2D63656E746572223E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F646976';
wwv_flow_imp.g_varchar2_table(30) := '3E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D66';
wwv_flow_imp.g_varchar2_table(31) := '6164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173';
wwv_flow_imp.g_varchar2_table(32) := '733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C';
wwv_flow_imp.g_varchar2_table(33) := '2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D666164652D646F74223E3C2F6469763E3C2F6469763E27293B627265616B3B63617365';
wwv_flow_imp.g_varchar2_table(34) := '22666F6C64696E672D63756265223A6361736522666F6C64223A612E6D61726B757028273C64697620636C6173733D22736B2D666F6C6420736B2D63656E746572223E3C64697620636C6173733D22736B2D666F6C642D63756265223E3C2F6469763E3C';
wwv_flow_imp.g_varchar2_table(35) := '64697620636C6173733D22736B2D666F6C642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D666F6C642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D666F6C642D63756265223E3C2F6469763E3C2F646976';
wwv_flow_imp.g_varchar2_table(36) := '3E27293B627265616B3B6361736522646F75626C652D626F756E6365223A6361736522626F756E6365223A612E6D61726B757028273C64697620636C6173733D22736B2D626F756E636520736B2D63656E746572223E3C64697620636C6173733D22736B';
wwv_flow_imp.g_varchar2_table(37) := '2D626F756E63652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D626F756E63652D646F74223E3C2F6469763E3C2F6469763E27293B627265616B3B636173652277617665223A612E6D61726B757028273C64697620636C6173733D22';
wwv_flow_imp.g_varchar2_table(38) := '736B2D7761766520736B2D63656E746572223E3C64697620636C6173733D22736B2D776176652D72656374223E3C2F6469763E3C64697620636C6173733D22736B2D776176652D72656374223E3C2F6469763E3C64697620636C6173733D22736B2D7761';
wwv_flow_imp.g_varchar2_table(39) := '76652D72656374223E3C2F6469763E3C64697620636C6173733D22736B2D776176652D72656374223E3C2F6469763E3C64697620636C6173733D22736B2D776176652D72656374223E3C2F6469763E3C2F6469763E27293B627265616B3B636173652277';
wwv_flow_imp.g_varchar2_table(40) := '616E646572696E672D6375626573223A636173652277616E646572223A612E6D61726B757028273C64697620636C6173733D22736B2D77616E64657220736B2D63656E746572223E3C64697620636C6173733D22736B2D77616E6465722D63756265223E';
wwv_flow_imp.g_varchar2_table(41) := '3C2F6469763E3C64697620636C6173733D22736B2D77616E6465722D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D77616E6465722D63756265223E3C2F6469763E3C2F6469763E27293B627265616B3B636173652270756C736522';
wwv_flow_imp.g_varchar2_table(42) := '3A612E6D61726B757028273C64697620636C6173733D22736B2D70756C736520736B2D63656E746572223E3C2F6469763E27293B627265616B3B636173652263686173696E672D646F7473223A63617365226368617365223A612E6D61726B757028273C';
wwv_flow_imp.g_varchar2_table(43) := '64697620636C6173733D22736B2D636861736520736B2D63656E746572223E3C64697620636C6173733D22736B2D63686173652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D63686173652D646F74223E3C2F6469763E3C64697620';
wwv_flow_imp.g_varchar2_table(44) := '636C6173733D22736B2D63686173652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D63686173652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D63686173652D646F74223E3C2F6469763E3C64697620636C6173';
wwv_flow_imp.g_varchar2_table(45) := '733D22736B2D63686173652D646F74223E3C2F6469763E3C2F6469763E27293B627265616B3B6361736522636972636C65223A612E6D61726B757028273C64697620636C6173733D22736B2D636972636C6520736B2D63656E746572223E3C6469762063';
wwv_flow_imp.g_varchar2_table(46) := '6C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C';
wwv_flow_imp.g_varchar2_table(47) := '6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C61';
wwv_flow_imp.g_varchar2_table(48) := '73733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173';
wwv_flow_imp.g_varchar2_table(49) := '733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C64697620636C6173733D22736B2D636972636C652D646F74223E3C2F6469763E3C2F6469763E27293B62';
wwv_flow_imp.g_varchar2_table(50) := '7265616B3B6361736522637562652D67726964223A636173652267726964223A612E6D61726B757028273C64697620636C6173733D22736B2D6772696420736B2D63656E746572223E3C64697620636C6173733D22736B2D677269642D63756265223E3C';
wwv_flow_imp.g_varchar2_table(51) := '2F6469763E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F646976';
wwv_flow_imp.g_varchar2_table(52) := '3E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C6469';
wwv_flow_imp.g_varchar2_table(53) := '7620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C64697620636C6173733D22736B2D677269642D63756265223E3C2F6469763E3C2F6469763E27293B627265616B3B64656661756C743A612E6D61726B757028223C7370616E22';
wwv_flow_imp.g_varchar2_table(54) := '292E617474722822636C617373222C22752D50726F63657373696E67222B28743F2220222B743A222229292E617474722822726F6C65222C22616C65727422292E6D61726B757028223E22292E6D61726B757028223C7370616E22292E61747472282263';
wwv_flow_imp.g_varchar2_table(55) := '6C617373222C22752D50726F63657373696E672D7370696E6E657222292E6D61726B757028223E22292E6D61726B757028223C2F7370616E3E22292E6D61726B757028223C7370616E22292E617474722822636C617373222C22752D56697375616C6C79';
wwv_flow_imp.g_varchar2_table(56) := '48696464656E22292E6D61726B757028223E22292E636F6E74656E742869292E6D61726B757028223C2F7370616E3E22292E6D61726B757028223C2F7370616E3E22297D72657475726E20612E6D61726B757028223C2F6469763E22292C612E746F5374';
wwv_flow_imp.g_varchar2_table(57) := '72696E6728297D2C673D28652C61293D3E7B636F6E7374206F3D692877696E646F77293B6C657420732C6E2C722C642C6C2C672C703D692E657874656E64287B616C6572743A742E6765744D6573736167652822415045582E50524F43455353494E4722';
wwv_flow_imp.g_varchar2_table(58) := '292C7370696E6E6572436C6173733A22227D2C61292C753D65262621702E66697865643F22737472696E67223D3D747970656F6620653F6928646F63756D656E74292E66696E642865293A692865293A692822626F647922292C763D752E6F6666736574';
wwv_flow_imp.g_varchar2_table(59) := '28292C683D7B746F703A6F2E7363726F6C6C546F7028292C6C6566743A6F2E7363726F6C6C4C65667428297D3B72657475726E20733D69286328702E7370696E6E657249636F6E2C702E7370696E6E6572436C6173732C702E616C65727429292C732E61';
wwv_flow_imp.g_varchar2_table(60) := '7070656E64546F2875292C702E66697865643F28723D286F2E68656967687428292D732E6865696768742829292F322C6E3D286F2E776964746828292D732E77696474682829292F322C732E637373287B706F736974696F6E3A226669786564222C746F';
wwv_flow_imp.g_varchar2_table(61) := '703A722B227078222C6C6566743A6E2B227078227D29293A28682E626F74746F6D3D682E746F702B6F2E68656967687428292C682E72696768743D682E6C6566742B6F2E776964746828292C762E626F74746F6D3D762E746F702B752E6F757465724865';
wwv_flow_imp.g_varchar2_table(62) := '6967687428292C762E72696768743D762E6C6566742B752E6F75746572576964746828292C723D762E746F703E682E746F703F762E746F703A682E746F702C643D762E626F74746F6D3C682E626F74746F6D3F762E626F74746F6D3A682E626F74746F6D';
wwv_flow_imp.g_varchar2_table(63) := '2C6C3D28642D72292F322C673D682E746F702D762E746F702C673E302626286C2B3D67292C732E706F736974696F6E287B6D793A2263656E746572222C61743A226C6566742B35302520746F702B222B6C2B227078222C6F663A752C636F6C6C6973696F';
wwv_flow_imp.g_varchar2_table(64) := '6E3A22666974227D29292C732E617474722822646174612D68746D6C3263616E7661732D69676E6F7265222C227472756522292C737D3B652E73686F775370696E6E65723D28612C6F293D3E7B6C657420732C6E2C723B72657475726E206F2E74797065';
wwv_flow_imp.g_varchar2_table(65) := '3D3D3D652E67414F504F7074696F6E732E70726F63657373696E67547970652E7370696E6E65723F28733D6728612C6F292C7B72656D6F76653A66756E6374696F6E28297B732E72656D6F766528297D7D293A6F2E747970653D3D3D652E67414F504F70';
wwv_flow_imp.g_varchar2_table(66) := '74696F6E732E70726F63657373696E67547970652E6F7665726C61793F28733D6728612C6F292C6E3D2828293D3E7B6C657420653B72657475726E20653D6928273C6469762069643D22617065785F776169745F6F7665726C61792220636C6173733D22';
wwv_flow_imp.g_varchar2_table(67) := '617065785F776169745F6F7665726C617920616F705F776169745F6F7665726C6179223E3C2F6469763E27292E617070656E64546F2822626F647922292C652E617474722822646174612D68746D6C3263616E7661732D69676E6F7265222C2274727565';
wwv_flow_imp.g_varchar2_table(68) := '22292C657D2928292C7B72656D6F76653A66756E6374696F6E28297B6E2E72656D6F766528292C732E72656D6F766528297D7D293A6F2E747970653D3D3D652E67414F504F7074696F6E732E70726F63657373696E67547970652E627574746F6E3F2872';
wwv_flow_imp.g_varchar2_table(69) := '3D28653D3E7B6C657420612C6F3D692E657874656E64287B616C6572743A742E6765744D6573736167652822415045582E50524F43455353494E4722292C7370696E6E6572436C6173733A22227D2C65292C733D652E627574746F6E2C6E3D2273747269';
wwv_flow_imp.g_varchar2_table(70) := '6E67223D3D747970656F6620733F6928646F63756D656E74292E66696E64282223222B73293A692873293B72657475726E206E2E616464436C6173732822617065782D64697361626C656422292E70726F70282264697361626C6564222C2130292E6669';
wwv_flow_imp.g_varchar2_table(71) := '6E642822203E202A22292E616464436C6173732822752D68696464656E22292C613D692863286F2E7370696E6E657249636F6E2C6F2E7370696E6E6572436C6173732C6F2E616C65727429292C612E617070656E64546F286E292C6E7D29286F292C7B72';
wwv_flow_imp.g_varchar2_table(72) := '656D6F76653A66756E6374696F6E28297B722E72656D6F7665436C6173732822617065782D64697361626C656422292E70726F70282264697361626C6564222C2131292C722E66696E642822203E202A22292E72656D6F7665436C6173732822752D6869';
wwv_flow_imp.g_varchar2_table(73) := '6464656E22292C722E66696E6428222E616F702D50726F63657373696E6722292E72656D6F766528297D7D293A766F696420307D2C652E6173796E634C6F6F703D28652C742C69293D3E7B76617220613D302C6F3D21312C733D7B6E6578743A66756E63';
wwv_flow_imp.g_varchar2_table(74) := '74696F6E28297B6F7C7C28613C3D653F28612B2B2C74287329293A286F3D21302C69282929297D2C697465726174696F6E3A66756E6374696F6E28297B72657475726E20612D317D2C627265616B3A66756E6374696F6E28297B6F3D21302C6928297D7D';
wwv_flow_imp.g_varchar2_table(75) := '3B72657475726E20732E6E65787428292C737D2C652E6275696C6441666665637465644974656D41727261793D653D3E7B612E696E666F2822414F5020704166666563746564456C656D656E7473222C65293B76617220743D5B5D3B72657475726E2065';
wwv_flow_imp.g_varchar2_table(76) := '262628743D652E7265706C616365282F5C732F672C2222292E73706C697428222C2229292C747D2C652E6275696C6441666665637465644974656D56616C756541727261793D653D3E7B612E696E666F2822414F50206275696C64416666656374656449';
wwv_flow_imp.g_varchar2_table(77) := '74656D56616C75654172726179222C65293B76617220743D5B5D2C693D5B5D3B69662865297B743D652E7265706C616365282F5C732F672C2222292E73706C697428222C22293B666F7228766172206F3D303B6F3C742E6C656E6774683B6F2B2B29692E';
wwv_flow_imp.g_varchar2_table(78) := '7075736828247628745B6F5D29297D72657475726E20697D2C652E737667456E68616E63653D28742C6F293D3E7B7472797B612E696E666F2822414F5020737667456E68616E6365222C74293B76617220733D692874292E66696E64282273766722292C';
wwv_flow_imp.g_varchar2_table(79) := '6E3D303B612E696E666F2822414F5020737667456E68616E6365222C6E2C732E6C656E677468293B76617220723D66756E6374696F6E28297B6E2B2B2C612E696E666F2822414F5020737667456E68616E636520737667446F6E65222C6E2C732E6C656E';
wwv_flow_imp.g_varchar2_table(80) := '677468292C6E3D3D732E6C656E677468262628612E696E666F2822414F5020737667456E68616E636520737667446F6E652063616C6C6261636B22292C6F2829297D3B732E65616368282866756E6374696F6E28297B612E696E666F2822414F50207376';
wwv_flow_imp.g_varchar2_table(81) := '67456E68616E636520222C74686973293B76617220743D746869732C6F3D692874292E696E6E6572576964746828292C733D692874292E696E6E657248656967687428293B692874292E6174747228227769647468222C6F292C692874292E6174747228';
wwv_flow_imp.g_varchar2_table(82) := '22686569676874222C73292C692874292E617474722822786D6C6E73222C22687474703A2F2F7777772E77332E6F72672F323030302F73766722292C692874292E617474722822786D6C6E733A786C696E6B222C22687474703A2F2F7777772E77332E6F';
wwv_flow_imp.g_varchar2_table(83) := '72672F313939392F786C696E6B22293B666F7228766172206E3D742E676574456C656D656E747342795461674E616D652822696D61676522292C643D302C6C3D303B6C3C6E2E6C656E6774683B6C2B2B292166756E6374696F6E28297B76617220743D6E';
wwv_flow_imp.g_varchar2_table(84) := '5B6C5D3B652E67657442617365363446726F6D55524C28652E6765744162736F6C75746555726C28742E67657441747472696275746528226872656622297C7C742E6765744174747269627574652822786C696E6B3A687265662229292C2866756E6374';
wwv_flow_imp.g_varchar2_table(85) := '696F6E2865297B742E7365744174747269627574652822786C696E6B3A68726566222C65292C742E736574417474726962757465282268726566222C65292C612E696E666F2822414F5020446174612052657475726E65643A222C65292C612E696E666F';
wwv_flow_imp.g_varchar2_table(86) := '2822414F5020737667456E68616E636520696D616765446F6E65222C642C6E2E6C656E677468292C2B2B643E3D6E2E6C656E677468262628612E696E666F2822414F5020737667456E68616E636520696D616765446F6E652063616C6C696E6720737667';
wwv_flow_imp.g_varchar2_table(87) := '446F6E65222C642C6E2E6C656E677468292C722829297D29297D28293B303D3D3D6E2E6C656E67746826267228297D29292C303D3D3D732E6C656E67746826266F28297D63617463682865297B612E696E666F2822414F5020737667456E68616E636520';
wwv_flow_imp.g_varchar2_table(88) := '636175676874206572726F72222C65292C6F28297D7D2C652E63616E76617332446174615552493D28652C74293D3E652E746F4461746155524C2874292C652E64617461555249326261736536343D653D3E652E73756273747228652E696E6465784F66';
wwv_flow_imp.g_varchar2_table(89) := '28222C22292B31292C652E636C6F623241727261793D28652C742C69293D3E7B666F722876617220613D4D6174682E666C6F6F7228652E6C656E6774682F74292B312C6F3D303B6F3C613B6F2B2B29692E7075736828652E736C69636528742A6F2C742A';
wwv_flow_imp.g_varchar2_table(90) := '286F2B312929293B72657475726E20697D2C652E676574496D6167654261736536343D28742C6F293D3E7B76617220732C6E3D692874292C723D6E2E696E6E6572576964746828292C643D6E2E696E6E657248656967687428293B696628733D612E6765';
wwv_flow_imp.g_varchar2_table(91) := '744C6576656C28293E302C22636C69656E745F63616E766173223D3D3D6E5B305D2E6765744174747269627574652822616F702D726567696F6E2D6173222929612E696E666F2822414F5020676574496D6167654261736536342063616C6C696E672074';
wwv_flow_imp.g_varchar2_table(92) := '68652063616E7661732067657420696D616765206F7074696F6E20776974682073656C6563746F72222B742B222063616E766173222C6928742B222063616E76617322295B305D2E746F4461746155524C2829292C6F286928742B222063616E76617322';
wwv_flow_imp.g_varchar2_table(93) := '295B305D2E746F4461746155524C28292E73706C697428223B6261736536342C22295B315D293B656C73657B612E696E666F2822414F5020676574496D6167654261736536342068746D6C3263616E76617320776974682073656C6563746F72222B742B';
wwv_flow_imp.g_varchar2_table(94) := '222022293B766172206C3D6E657720446174653B652E737667456E68616E636528742C2866756E6374696F6E28297B68746D6C3263616E766173286E5B305D2C7B6261636B67726F756E64436F6C6F723A2223666666222C77696474683A722C68656967';
wwv_flow_imp.g_varchar2_table(95) := '68743A642C616C6C6F775461696E743A21312C6C6F6767696E673A732C757365434F52533A21307D292E7468656E282866756E6374696F6E2869297B76617220733D652E63616E766173324461746155524928692C22696D6167652F706E6722292C6E3D';
wwv_flow_imp.g_varchar2_table(96) := '652E64617461555249326261736536342873293B612E696E666F2822414F5020676574496D6167654261736536342068746D6C3263616E76617320776974682073656C6563746F72222B742B2220746F6F6B20222B286E657720446174652D6C292F3165';
wwv_flow_imp.g_varchar2_table(97) := '332B22207322292C6F286E297D29297D29297D7D2C652E676574496D61676542617365363441727261793D28742C692C61293D3E7B652E676574496D61676542617365363428742C2866756E6374696F6E2874297B693D652E636C6F6232417272617928';
wwv_flow_imp.g_varchar2_table(98) := '742C3365342C69292C612869297D29297D2C652E626173653634746F426C6F623D28652C74293D3E7B666F722876617220693D61746F622865292C613D742C6F3D6E657720417272617942756666657228692E6C656E677468292C733D6E65772055696E';
wwv_flow_imp.g_varchar2_table(99) := '74384172726179286F292C6E3D303B6E3C692E6C656E6774683B6E2B2B29735B6E5D3D692E63686172436F64654174286E293B7472797B72657475726E206E657720426C6F62285B6F5D2C7B747970653A617D297D63617463682865297B76617220723D';
wwv_flow_imp.g_varchar2_table(100) := '6E65772877696E646F772E5765624B6974426C6F624275696C6465727C7C77696E646F772E4D6F7A426C6F624275696C6465727C7C77696E646F772E4D53426C6F624275696C646572293B72657475726E20722E617070656E64286F292C722E67657442';
wwv_flow_imp.g_varchar2_table(101) := '6C6F622861297D7D2C652E646F776E6C6F61644261736536343D28742C6F2C73293D3E7B612E696E666F2822414F5020646F776E6C6F61644261736536342064617461222C74293B766172206E3D652E67657442726F777365724E616D6528293B696628';
wwv_flow_imp.g_varchar2_table(102) := '226965223D3D6E7C7C2265646765223D3D6E297B76617220723D652E626173653634746F426C6F6228742C6F293B77696E646F772E6E6176696761746F722E6D7353617665426C6F6228722C73297D656C73657B76617220643D22646174613A222B6F2B';
wwv_flow_imp.g_varchar2_table(103) := '223B6261736536342C222B743B612E696E666F2822414F50204D696D6554797065222C6F293B766172206C3D646F63756D656E742E637265617465456C656D656E7428226122293B646F63756D656E742E626F64792E617070656E644368696C64286C29';
wwv_flow_imp.g_varchar2_table(104) := '2C6C2E7374796C653D22646973706C61793A206E6F6E65222C6C2E7461726765743D225F626C616E6B222C6C2E636C6173734E616D653D22616F705F6C696E6B222C6C2E687265663D642C226368726F6D6522213D6E26262273616661726922213D6E7C';
wwv_flow_imp.g_varchar2_table(105) := '7C286C2E687265663D55524C2E6372656174654F626A65637455524C28652E626173653634746F426C6F6228742C6F2929292C6C2E646F776E6C6F61643D732C6C2E636C69636B28292C692822612E616F705F6C696E6B22292E72656D6F766528297D7D';
wwv_flow_imp.g_varchar2_table(106) := '2C652E6765744162736F6C75746555726C3D28293D3E7B76617220653B72657475726E2066756E6374696F6E2874297B72657475726E28653D657C7C646F63756D656E742E637265617465456C656D656E742822612229292E687265663D742C652E636C';
wwv_flow_imp.g_varchar2_table(107) := '6F6E654E6F6465282131292E687265667D7D2C652E67657442617365363446726F6D55524C3D28652C74293D3E7B612E696E666F2822414F502067657442617365363446726F6D55524C222C65293B76617220693D6E657720584D4C4874747052657175';
wwv_flow_imp.g_varchar2_table(108) := '6573743B692E6F70656E2822474554222C652C2130292C692E726573706F6E7365547970653D226172726179627566666572222C692E6F6E6C6F61643D66756E6374696F6E2865297B76617220693D6E65772055696E7438417272617928746869732E72';
wwv_flow_imp.g_varchar2_table(109) := '6573706F6E7365292C613D537472696E672E66726F6D43686172436F64652E6170706C79286E756C6C2C69292C6F3D62746F612861293B742822646174613A696D6167652F706E673B6261736536342C222B6F297D2C692E73656E6428297D2C652E696E';
wwv_flow_imp.g_varchar2_table(110) := '6C696E654261736536343D28742C612C6F293D3E7B76617220733D652E67414F504F7074696F6E732E64614E616D652C6E3D6928275B646174612D616F702D696E6C696E652D7064663D22272B732B27225D27292C723D6E2E617474722822696422297C';
wwv_flow_imp.g_varchar2_table(111) := '7C22616F70223B6966286E2E68746D6C282222292E616464436C6173732822616F702D496E6C696E655072657669657722292C226965223D3D3D652E67657442726F777365724E616D6528292972657475726E20652E646F776E6C6F6164426173653634';
wwv_flow_imp.g_varchar2_table(112) := '28742C612C6F293B76617220643D652E626173653634746F426C6F6228742C61293B642E6E616D653D6F3B766172206C3D55524C2E6372656174654F626A65637455524C2864293B6C657420633D6928273C627574746F6E20747970653D22627574746F';
wwv_flow_imp.g_varchar2_table(113) := '6E22207469746C653D22446F776E6C6F61642220617269612D6C6162656C3D22446F776E6C6F61642220636C6173733D22616F702D496E6C696E65507265766965772D2D646F776E6C6F6164427574746F6E20742D427574746F6E20742D427574746F6E';
wwv_flow_imp.g_varchar2_table(114) := '2D2D6E6F4C6162656C20742D427574746F6E2D2D69636F6E223E3C7370616E20617269612D68696464656E3D22747275652220636C6173733D22742D49636F6E2066612066612D646F776E6C6F6164223E3C2F7370616E3E3C2F627574746F6E3E27293B';
wwv_flow_imp.g_varchar2_table(115) := '632E616464436C6173732822616F702D496E6C696E65507265766965772D2D646F776E6C6F6164427574746F6E22292C6E2E617070656E642863293B632E636C69636B282866756E6374696F6E28297B2828652C74293D3E7B636F6E737420693D646F63';
wwv_flow_imp.g_varchar2_table(116) := '756D656E742E637265617465456C656D656E7428226122293B646F63756D656E742E626F64792E617070656E644368696C642869292C692E687265663D652C692E646F776E6C6F61643D742C692E636C69636B28292C646F63756D656E742E626F64792E';
wwv_flow_imp.g_varchar2_table(117) := '72656D6F76654368696C642869297D29286C2C6F297D29293B76617220673D6928273C696672616D652069643D22696E6C696E655F7064665F6F626A6563745F272B722B2722207372633D2222207469746C653D22272B6F2B27222077696474683D2231';
wwv_flow_imp.g_varchar2_table(118) := '30302522206865696768743D22313030252220747970653D22272B612B27223E3C2F6F626A6563743E27293B6E2E617070656E642867292C672E617474722822737263222C6C297D2C652E696E6C696E65546578743D28742C612C6F293D3E7B76617220';
wwv_flow_imp.g_varchar2_table(119) := '733D652E6236344465636F6465556E69636F64652874293B6C44614E616D653D652E67414F504F7074696F6E732E64614E616D652C6928275B646174612D616F702D696E6C696E652D7478743D22272B6C44614E616D652B27225D27292E76616C287329';
wwv_flow_imp.g_varchar2_table(120) := '7D2C652E6236344465636F6465556E69636F64653D653D3E6465636F6465555249436F6D706F6E656E742841727261792E70726F746F747970652E6D61702E63616C6C2861746F622865292C2866756E6374696F6E2865297B72657475726E2225222B28';
wwv_flow_imp.g_varchar2_table(121) := '223030222B652E63686172436F646541742830292E746F537472696E6728313629292E736C696365282D32297D29292E6A6F696E28222229292C652E676574496E646976696475616C496D61676555706C6F61644172726179733D28742C6F2C73293D3E';
wwv_flow_imp.g_varchar2_table(122) := '7B7472797B766172206E3D742B312C723D2266222B286E3E3D31303F6E2E746F537472696E6728293A2230222B6E2E746F537472696E672829293B696628612E696E666F2822414F5020676574496E646976696475616C496D61676555706C6F61644172';
wwv_flow_imp.g_varchar2_table(123) := '7261797320636865636B696E6720666F722074797065206F6620726567696F6E20776974682073656C6563746F7220222B6F292C766F696420303D3D3D69286F295B305D2972657475726E20612E696E666F2822414F5020676574496E64697669647561';
wwv_flow_imp.g_varchar2_table(124) := '6C496D61676555706C6F616441727261797320726567696F6E206E6F7420666F756E642069676E6F72696E672C20222B6F292C766F6964207328293B73776974636828612E696E666F2822414F5020676574496E646976696475616C496D61676555706C';
wwv_flow_imp.g_varchar2_table(125) := '6F61644172726179732020222B69286F295B305D2E6765744174747269627574652822616F702D726567696F6E2D617322292C69286F295B305D292C69286F295B305D2E6765744174747269627574652822616F702D726567696F6E2D61732229297B63';
wwv_flow_imp.g_varchar2_table(126) := '617365227365727665725F68746D6C223A6361736522636C69656E745F68746D6C223A612E696E666F2822414F5020676574496E646976696475616C496D61676555706C6F61644172726179732068746D6C20666F756E642070617373696E6720697420';
wwv_flow_imp.g_varchar2_table(127) := '61732069742069732E222C6F293B7472797B612E696E666F2822414F5020676574496E646976696475616C496D61676555706C6F61644172726179732068746D6C2069733A222C69286F2B22202E742D526567696F6E2D626F647922295B305D2E696E6E';
wwv_flow_imp.g_varchar2_table(128) := '657248544D4C292C652E636C6F623241727261792869286F2B22202E742D526567696F6E2D626F647922295B305D2E696E6E657248544D4C2C3365332C652E67414F504F7074696F6E735B725D2E646174614172726179297D63617463682874297B612E';
wwv_flow_imp.g_varchar2_table(129) := '696E666F2822414F5020676574496E646976696475616C496D61676555706C6F61644172726179732068746D6C2069733A222C69286F295B305D2E696E6E657248544D4C292C652E636C6F623241727261792869286F295B305D2E696E6E657248544D4C';
wwv_flow_imp.g_varchar2_table(130) := '2C3365332C652E67414F504F7074696F6E735B725D2E646174614172726179297D7328293B627265616B3B6361736522636C69656E745F737667223A652E737667456E68616E6365286F2C2866756E6374696F6E28297B612E696E666F2822414F502067';
wwv_flow_imp.g_varchar2_table(131) := '6574496E646976696475616C496D61676555706C6F616441727261797320737667206265696E672073656E74222C286E657720584D4C53657269616C697A6572292E73657269616C697A65546F537472696E672869286F2B222073766722295B305D2929';
wwv_flow_imp.g_varchar2_table(132) := '2C652E636C6F6232417272617928286E657720584D4C53657269616C697A6572292E73657269616C697A65546F537472696E672869286F2B222073766722295B305D292C3365332C652E67414F504F7074696F6E735B725D2E646174614172726179292C';
wwv_flow_imp.g_varchar2_table(133) := '652E67414F504F7074696F6E735B725D2E77696474683D69286F292E646174612822616F702D776964746822297C7C69286F292E696E6E6572576964746828292C652E67414F504F7074696F6E735B725D2E6865696768743D69286F292E646174612822';
wwv_flow_imp.g_varchar2_table(134) := '616F702D68656967687422297C7C69286F292E696E6E657248656967687428292C652E67414F504F7074696F6E735B725D2E6D617857696474683D69286F292E646174612822616F702D6D61782D776964746822297C7C652E67414F504F7074696F6E73';
wwv_flow_imp.g_varchar2_table(135) := '5B725D2E77696474682C652E67414F504F7074696F6E735B725D2E6D61784865696768743D69286F292E646174612822616F702D6D61782D68656967687422297C7C652E67414F504F7074696F6E735B725D2E6865696768742C7328297D29293B627265';
wwv_flow_imp.g_varchar2_table(136) := '616B3B64656661756C743A652E676574496D6167654261736536344172726179286F2C652E67414F504F7074696F6E735B725D2E6461746141727261792C2866756E6374696F6E2874297B612E696E666F2822414F5020676574496E646976696475616C';
wwv_flow_imp.g_varchar2_table(137) := '496D61676555706C6F61644172726179732073657474696E6720646174614172726179222C74292C652E67414F504F7074696F6E735B725D2E6461746141727261793D742C652E67414F504F7074696F6E735B725D2E77696474683D69286F292E646174';
wwv_flow_imp.g_varchar2_table(138) := '612822616F702D776964746822297C7C69286F292E696E6E6572576964746828292C652E67414F504F7074696F6E735B725D2E6865696768743D69286F292E646174612822616F702D68656967687422297C7C69286F292E696E6E657248656967687428';
wwv_flow_imp.g_varchar2_table(139) := '292C652E67414F504F7074696F6E735B725D2E6D617857696474683D69286F292E646174612822616F702D6D61782D776964746822297C7C652E67414F504F7074696F6E735B725D2E77696474682C652E67414F504F7074696F6E735B725D2E6D617848';
wwv_flow_imp.g_varchar2_table(140) := '65696768743D69286F292E646174612822616F702D6D61782D68656967687422297C7C652E67414F504F7074696F6E735B725D2E6865696768742C612E696E666F2822414F5020676574496E646976696475616C496D61676555706C6F61644172726179';
wwv_flow_imp.g_varchar2_table(141) := '732063616C6C696E67206E65787420737465702061667465722067657474696E6720696D616765206461746122292C7328297D29297D7D63617463682865297B612E696E666F2822414F5020457863657074696F6E3A222C65292C7328297D7D2C652E67';
wwv_flow_imp.g_varchar2_table(142) := '6574416C6C496D61676555706C6F61644172726179733D28742C69293D3E7B612E696E666F2822414F5020676574416C6C496D61676555706C6F6164417261797320526567696F6E204944204172726179222C74293B766172206F3B6F3D742E6C656E67';
wwv_flow_imp.g_varchar2_table(143) := '74683E31353F31353A742E6C656E6774682C612E696E666F2822414F5020676574416C6C496D61676555706C6F616441727261797320526567696F6E204172726179204C656E677468222C6F293B666F722876617220733D302C6E3D66756E6374696F6E';
wwv_flow_imp.g_varchar2_table(144) := '28297B2B2B733D3D6F26266928297D2C723D303B723C6F3B722B2B29612E696E666F2822414F5020676574416C6C496D61676555706C6F616441727261797320526567696F6E204172726179204C6F6F7020697465726174696F6E222C72292C745B725D';
wwv_flow_imp.g_varchar2_table(145) := '2626652E676574496E646976696475616C496D61676555706C6F616441727261797328722C2223222B745B725D2C6E297D2C652E646F776E6C6F6164414F5046696C653D743D3E7B612E696E666F2822414F5020646F776E6C6F6164414F5046696C6520';
wwv_flow_imp.g_varchar2_table(146) := '414F502E67414F504F7074696F6E73222C652E67414F504F7074696F6E73293B666F722876617220733D5B5D2C6E3D5B5D2C723D5B5D2C633D5B5D2C673D7B705F7769646765745F616374696F6E3A22414F50222C705F726571756573743A22504C5547';
wwv_flow_imp.g_varchar2_table(147) := '494E3D222B652E67414F504F7074696F6E732E616A61784964656E7469666965722C705F666C6F775F69643A2476282270466C6F77496422292C705F666C6F775F737465705F69643A2476282270466C6F7753746570496422292C705F696E7374616E63';
wwv_flow_imp.g_varchar2_table(148) := '653A2476282270496E7374616E636522292C705F64656275673A2476282270646562756722292C705F6172675F6E616D65733A652E67414F504F7074696F6E732E7375626D69744974656D7341727261792C705F6172675F76616C7565733A652E67414F';
wwv_flow_imp.g_varchar2_table(149) := '504F7074696F6E732E7375626D697456616C75657341727261792C7830313A652E67414F504F7074696F6E732E737461746963526567696F6E4964732C7830323A652E67414F504F7074696F6E732E4947526567696F6E496473416E6453656C65637465';
wwv_flow_imp.g_varchar2_table(150) := '64504B7D2C703D313B703C3D31353B702B2B297B76617220753D2266222B28703E3D31303F702E746F537472696E6728293A2230222B702E746F537472696E672829293B732E7075736828652E67414F504F7074696F6E735B755D2E7769647468292C6E';
wwv_flow_imp.g_varchar2_table(151) := '2E7075736828652E67414F504F7074696F6E735B755D2E686569676874292C722E7075736828652E67414F504F7074696F6E735B755D2E6D61785769647468292C632E7075736828652E67414F504F7074696F6E735B755D2E6D6178486569676874292C';
wwv_flow_imp.g_varchar2_table(152) := '675B755D3D652E67414F504F7074696F6E735B755D2E6461746141727261797D672E6631363D732C672E6631373D6E2C672E6631383D722C672E6631393D632C692E616A6178287B64617461547970653A2274657874222C747970653A22504F5354222C';
wwv_flow_imp.g_varchar2_table(153) := '75726C3A77696E646F772E6C6F636174696F6E2E687265662E73756273747228302C77696E646F772E6C6F636174696F6E2E687265662E696E6465784F6628222F663F703D22292B31292B227777765F666C6F772E73686F77222C6173796E633A21302C';
wwv_flow_imp.g_varchar2_table(154) := '747261646974696F6E616C3A21302C646174613A672C737563636573733A66756E6374696F6E28732C6E2C72297B76617220633B7472797B633D6A51756572792E70617273654A534F4E2873297D63617463682865297B612E6C6F672822414F5020646F';
wwv_flow_imp.g_varchar2_table(155) := '776E6C6F6164414F5046696C6520526573706F6E73652050617273654572726F72222C65293B76617220673D6928223C6469763E3C2F6469763E22293B672E68746D6C2873293B76617220703D6928222E742D416C6572742D626F6479206833222C6729';
wwv_flow_imp.g_varchar2_table(156) := '2E7465787428293B22223D3D28703D28703D702E7265706C616365282F222F672C275C5C222729292E7265706C616365282F5C6E2F672C2220222929262628703D22414F5020414A41582043616C6C6261636B2069737375652E22292C633D6A51756572';
wwv_flow_imp.g_varchar2_table(157) := '792E70617273654A534F4E28277B2022737461747573223A20226572726F72222C20226D657373616765223A2022526573706F6E73652050617273654572726F72222C2022636F6465223A2022414A41582043616C6C6261636B20287044617461292050';
wwv_flow_imp.g_varchar2_table(158) := '617273654572726F72222C20226E6F74696669636174696F6E223A22272B702B2722207D27297D696628226572726F72223D3D632E73746174757329612E6C6F672822414F5020646F776E6C6F6164414F5046696C65204572726F72222C632E6D657373';
wwv_flow_imp.g_varchar2_table(159) := '6167652C632E636F6465292C6F2E7472696767657228652E67414F504F7074696F6E732E74726967676572456C656D49642C22616F702D66696C652D6572726F72222C63292C652E73686F774E6F74696669636174696F6E28226572726F72222C632E6E';
wwv_flow_imp.g_varchar2_table(160) := '6F74696669636174696F6E292C7428293B656C7365206966282273756363657373223D3D632E737461747573297B696628612E6C6F672822414F5020646F776E6C6F6164414F5046696C65205375636365737322292C6F2E7472696767657228652E6741';
wwv_flow_imp.g_varchar2_table(161) := '4F504F7074696F6E732E74726967676572456C656D49642C22616F702D66696C652D73756363657373222C63292C612E6C6F672822414F5020646F776E6C6F6164414F5046696C6520446F776E6C6F6164696E672066696C6522292C224449524543544F';
wwv_flow_imp.g_varchar2_table(162) := '5259223D3D652E67414F504F7074696F6E732E6F7574707574546F262622746578742F706C61696E223D3D632E6D696D657479706529612E6C6F672822414F503A204F757470757420746F206469726563746F727922292C652E73686F774E6F74696669';
wwv_flow_imp.g_varchar2_table(163) := '636174696F6E282273756363657373222C632E64617461293B656C7365206966282242524F57534552223D3D652E67414F504F7074696F6E732E6F7574707574546F7C7C2250524F4345445552455F42524F57534552223D3D652E67414F504F7074696F';
wwv_flow_imp.g_varchar2_table(164) := '6E732E6F7574707574546F7C7C224449524543544F5259223D3D652E67414F504F7074696F6E732E6F7574707574546F29612E6C6F672822414F5020646F776E6C6F6164414F5046696C6520646F776E6C6F616442617365363422292C652E646F776E6C';
wwv_flow_imp.g_varchar2_table(165) := '6F616442617365363428632E646174612C632E6D696D65747970652C632E66696C656E616D65293B656C7365206966282242524F575345525F494E4C494E4522213D652E67414F504F7074696F6E732E6F7574707574546F7C7C226170706C6963617469';
wwv_flow_imp.g_varchar2_table(166) := '6F6E2F70646622213D632E6D696D6574797065262622746578742F68746D6C22213D632E6D696D6574797065296966282242524F575345525F494E4C494E4522213D652E67414F504F7074696F6E732E6F7574707574546F7C7C22746578742F6D61726B';
wwv_flow_imp.g_varchar2_table(167) := '646F776E22213D632E6D696D6574797065262622746578742F706C61696E22213D632E6D696D6574797065262622746578742F63737622213D632E6D696D6574797065296966282250524F4345445552455F494E4C494E4522213D652E67414F504F7074';
wwv_flow_imp.g_varchar2_table(168) := '696F6E732E6F7574707574546F7C7C226170706C69636174696F6E2F70646622213D632E6D696D6574797065262622746578742F68746D6C22213D632E6D696D6574797065296966282250524F4345445552455F494E4C494E4522213D652E67414F504F';
wwv_flow_imp.g_varchar2_table(169) := '7074696F6E732E6F7574707574546F7C7C22746578742F6D61726B646F776E22213D632E6D696D6574797065262622746578742F706C61696E22213D632E6D696D6574797065262622746578742F63737622213D632E6D696D6574797065296966282243';
wwv_flow_imp.g_varchar2_table(170) := '4C4F5544223D3D652E67414F504F7074696F6E732E6F7574707574546F29612E6C6F672822414F503A204F757470757420746F20636C6F756422292C652E73686F774E6F74696669636174696F6E282273756363657373222C22446F63756D656E742073';
wwv_flow_imp.g_varchar2_table(171) := '6176656420746F20636C6F75642E22293B656C736520696628224153594E43223D3D652E67414F504F7074696F6E732E6F7574707574546F29612E6C6F672822414F503A204F757470757420746F204173796E6368726F6E6F757322292C652E73686F77';
wwv_flow_imp.g_varchar2_table(172) := '4E6F74696669636174696F6E282273756363657373222C22446F63756D656E742077696C6C20626520726561647920666F7220646F776E6C6F616420736F6F6E2E22293B656C736520696628225745425F53455256494345223D3D652E67414F504F7074';
wwv_flow_imp.g_varchar2_table(173) := '696F6E732E6F7574707574546F29612E6C6F672822414F503A204F757470757420746F20576562205365727669636522292C652E73686F774E6F74696669636174696F6E282273756363657373222C22446F63756D656E742077696C6C2062652073656E';
wwv_flow_imp.g_varchar2_table(174) := '7420746F20746865205765622053657276696365206F6E63652072656164792E22293B656C73652069662822415045585F4F46464943455F45444954223D3D652E67414F504F7074696F6E732E6F7574707574546F297B612E6C6F672822414F503A204F';
wwv_flow_imp.g_varchar2_table(175) := '757470757420746F2041504558204F6666696365204564697422292C612E6C6F672822414F503A20726567696F6E3A20222B632E726567696F6E292C612E6C6F672822414F503A206974656D733A20222B632E6974656D73293B666F722876617220753D';
wwv_flow_imp.g_varchar2_table(176) := '303B753C632E6974656D732E6C656E6774683B752B2B296428632E6974656D735B755D2E6974656D292E73657456616C756528632E6974656D735B755D2E76616C7565293B6C28632E726567696F6E292E7265667265736828297D656C736520612E6C6F';
wwv_flow_imp.g_varchar2_table(177) := '672822414F503A204E6F20737570706F72746564206F7574707574206D6574686F6422293B656C736520612E6C6F672822414F5020646F776E6C6F6164414F5046696C6520696E6C696E655465787422292C652E696E6C696E655465787428632E646174';
wwv_flow_imp.g_varchar2_table(178) := '612C632E6D696D65747970652C632E66696C656E616D65293B656C736520612E6C6F672822414F5020646F776E6C6F6164414F5046696C6520696E6C696E6542617365363422292C652E696E6C696E6542617365363428632E646174612C632E6D696D65';
wwv_flow_imp.g_varchar2_table(179) := '747970652C632E66696C656E616D65293B656C736520612E6C6F672822414F5020646F776E6C6F6164414F5046696C6520696E6C696E655465787422292C652E696E6C696E655465787428632E646174612C632E6D696D65747970652C632E66696C656E';
wwv_flow_imp.g_varchar2_table(180) := '616D65293B656C736520612E6C6F672822414F5020646F776E6C6F6164414F5046696C6520696E6C696E6542617365363422292C652E696E6C696E6542617365363428632E646174612C632E6D696D65747970652C632E66696C656E616D65293B742863';
wwv_flow_imp.g_varchar2_table(181) := '297D7D2C6572726F723A66756E6374696F6E28692C73297B612E6C6F672822414F5020646F776E6C6F6164414F5046696C65204572726F72222C73292C6F2E7472696767657228652E67414F504F7074696F6E732E74726967676572456C656D49642C22';
wwv_flow_imp.g_varchar2_table(182) := '616F702D66696C652D6572726F72222C73292C652E73686F774E6F74696669636174696F6E28226572726F72222C73292C7428297D2C7868723A66756E6374696F6E28297B76617220743D692E616A617853657474696E67732E78687228293B72657475';
wwv_flow_imp.g_varchar2_table(183) := '726E20742E75706C6F61643F742E75706C6F61642E6164644576656E744C697374656E6572282270726F6772657373222C2866756E6374696F6E2874297B696628742E6C656E677468436F6D70757461626C65297B76617220693D742E6C6F616465642F';
wwv_flow_imp.g_varchar2_table(184) := '742E746F74616C2A3130303B6F2E7472696767657228652E67414F504F7074696F6E732E74726967676572456C656D49642C22616F702D66696C652D70726F6772657373222C69297D7D292C2131293A612E6C6F672822414F5020646F776E6C6F616441';
wwv_flow_imp.g_varchar2_table(185) := '4F5046696C6520584852222C2250726F6772657373206973206E6F7420737570706F727465642062792042726F777365722E22292C747D7D297D2C652E63616C6C414F503D66756E6374696F6E28297B7472797B50726F6D6973657C7C2850726F6D6973';
wwv_flow_imp.g_varchar2_table(186) := '653D45533650726F6D697365297D63617463682865297B50726F6D6973653D45533650726F6D6973657D76617220742C733D746869732C723D732E616374696F6E2E616A61784964656E7469666965722C643D732E616374696F6E2E6174747269627574';
wwv_flow_imp.g_varchar2_table(187) := '6530312C633D732E616374696F6E2E61747472696275746530352C673D732E616374696F6E2E61747472696275746531322C703D732E616374696F6E2E61747472696275746531332C753D732E616374696F6E2E61747472696275746531342C763D732E';
wwv_flow_imp.g_varchar2_table(188) := '74726967676572696E67456C656D656E743B743D692876292E697328225B69645D22293F2223222B692876292E617474722822696422293A22626F6479223B76617220683D5B5D3B70262628683D702E73706C697428222C2229293B76617220663D5B5D';
wwv_flow_imp.g_varchar2_table(189) := '3B67262628663D672E73706C697428222C2229292C652E67414F504F7074696F6E732E616A61784964656E7469666965723D722C652E67414F504F7074696F6E732E74726967676572456C656D49643D742C652E67414F504F7074696F6E732E73746174';
wwv_flow_imp.g_varchar2_table(190) := '6963526567696F6E4964733D702C652E67414F504F7074696F6E732E64614E616D653D642C652E67414F504F7074696F6E732E6F7574707574546F3D752C224954454D223D3D732E616374696F6E2E6166666563746564456C656D656E74735479706526';
wwv_flow_imp.g_varchar2_table(191) := '2628652E67414F504F7074696F6E732E7375626D69744974656D7341727261793D652E6275696C6441666665637465644974656D417272617928732E616374696F6E2E6166666563746564456C656D656E7473292C652E67414F504F7074696F6E732E73';
wwv_flow_imp.g_varchar2_table(192) := '75626D697456616C75657341727261793D652E6275696C6441666665637465644974656D56616C7565417272617928732E616374696F6E2E6166666563746564456C656D656E747329293B666F7228766172204F3D313B4F3C3D31353B4F2B2B297B7661';
wwv_flow_imp.g_varchar2_table(193) := '7220413D2266222B284F3E3D31303F4F2E746F537472696E6728293A2230222B4F2E746F537472696E672829293B652E67414F504F7074696F6E735B415D2E6461746141727261793D5B5D2C652E67414F504F7074696F6E735B415D2E77696474683D30';
wwv_flow_imp.g_varchar2_table(194) := '2C652E67414F504F7074696F6E735B415D2E6865696768743D302C652E67414F504F7074696F6E735B415D2E6D617857696474683D302C652E67414F504F7074696F6E735B415D2E6D61784865696768743D307D6C6574206D3B612E696E666F2822414F';
wwv_flow_imp.g_varchar2_table(195) := '502076416A61784964656E746966696572222C72292C612E696E666F2822414F50207654726967676572456C656D4964222C74292C612E696E666F2822414F50207644614E616D65222C64292C612E696E666F2822414F5020764461746154797065222C';
wwv_flow_imp.g_varchar2_table(196) := '63292C612E696E666F2822414F502076526567696F6E496473222C70292C612E696E666F2822414F5020764F7574707574546F222C75292C612E696E666F2822414F5020414F502E67414F504F7074696F6E73222C652E67414F504F7074696F6E73292C';
wwv_flow_imp.g_varchar2_table(197) := '652E67414F504F7074696F6E732E776169745370696E6E65722E6C656E6774683E303F28612E7761726E2822414F5020596F75277265207573696E672061206C6567616379207370696E6E6572206F7074696F6E2E20506C656173652075706461746520';
wwv_flow_imp.g_varchar2_table(198) := '796F757220636F646520746F2075736520746865206E65772070726F63657373696E67496E64696361746F72206174747269627574652E22292C6D3D7B747970653A652E67414F504F7074696F6E732E70726F63657373696E67547970652E7370696E6E';
wwv_flow_imp.g_varchar2_table(199) := '65722C7370696E6E657249636F6E3A652E67414F504F7074696F6E732E776169745370696E6E65727D293A6D3D692E657874656E64287B747970653A652E67414F504F7074696F6E732E70726F63657373696E67547970652E7370696E6E65722C737069';
wwv_flow_imp.g_varchar2_table(200) := '6E6E657249636F6E3A2241504558227D2C652E67414F504F7074696F6E732E70726F63657373696E67496E64696361746F72293B6C657420503D652E73686F775370696E6E657228692822626F647922292C6D293B7472797B612E696E666F2822414F50';
wwv_flow_imp.g_varchar2_table(201) := '206C4947526567696F6E4964733A222C66292C652E67414F504F7074696F6E732E4947526567696F6E496473416E6453656C6563746564504B3D7B7D2C662E666F7245616368282866756E6374696F6E2874297B7472797B76617220693D6C2874292E77';
wwv_flow_imp.g_varchar2_table(202) := '696467657428292C6F3D692E696E7465726163746976654772696428226765745669657773222C226772696422292C733D692E696E7465726163746976654772696428226765745669657773222C226772696422292E6D6F64656C2C6E3D5B5D3B6F2E67';
wwv_flow_imp.g_varchar2_table(203) := '657453656C65637465645265636F72647328292E666F7245616368282866756E6374696F6E2865297B6E2E7075736828732E5F6765745072696D6172794B65792865295B305D297D29292C652E67414F504F7074696F6E732E4947526567696F6E496473';
wwv_flow_imp.g_varchar2_table(204) := '416E6453656C6563746564504B5B745D3D6E2C612E696E666F2822414F5020494720526567696F6E2053656C656374696F6E3A222C742C6E297D63617463682865297B7D7D29292C652E67414F504F7074696F6E732E4947526567696F6E496473416E64';
wwv_flow_imp.g_varchar2_table(205) := '53656C6563746564504B3D4A534F4E2E737472696E6769667928652E67414F504F7074696F6E732E4947526567696F6E496473416E6453656C6563746564504B292C612E696E666F2822414F50204947526567696F6E496473416E6453656C6563746564';
wwv_flow_imp.g_varchar2_table(206) := '504B3A222C652E67414F504F7074696F6E732E4947526567696F6E496473416E6453656C6563746564504B292C224952223D3D632626703F28612E696E666F2822414F502047657474696E6720746865206461746120666F722076526567696F6E496473';
wwv_flow_imp.g_varchar2_table(207) := '222C70292C652E676574416C6C496D61676555706C6F616441727261797328682C2866756E6374696F6E28297B652E646F776E6C6F6164414F5046696C65282866756E6374696F6E28297B502E72656D6F766528292C6E2E726573756D6528732E726573';
wwv_flow_imp.g_varchar2_table(208) := '756D6543616C6C6261636B2C2131297D29297D2929293A652E646F776E6C6F6164414F5046696C65282866756E6374696F6E28297B502E72656D6F766528292C6E2E726573756D6528732E726573756D6543616C6C6261636B2C2131297D29297D636174';
wwv_flow_imp.g_varchar2_table(209) := '63682874297B6F2E7472696767657228652E67414F504F7074696F6E732E74726967676572456C656D49642C22616F702D66696C652D6572726F7222292C502E72656D6F766528292C6E2E726573756D6528732E726573756D6543616C6C6261636B2C21';
wwv_flow_imp.g_varchar2_table(210) := '31297D7D7D28414F502C617065782E6C616E672C617065782E6A51756572792C617065782E64656275672C617065782E6576656E742C617065782E6D6573736167652C617065782E64612C617065782E7574696C2C617065782E6974656D2C617065782E';
wwv_flow_imp.g_varchar2_table(211) := '726567696F6E293B';
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(33400401271866247561)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_file_name=>'js/aop_da.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2E616F702D50726F63657373696E677B7A2D696E6465783A39393939393939397D2E742D427574746F6E202E616F702D50726F63657373696E677B2D2D736B2D73697A653A766172282D2D612D627574746F6E2D666F6E742D73697A652C203230707829';
wwv_flow_imp.g_varchar2_table(2) := '7D';
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(33400401745790248636)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_file_name=>'css/spinkit-aop.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '3A726F6F747B2D2D736B2D73697A653A343070783B2D2D736B2D636F6C6F723A233333337D2E736B2D63656E7465727B6D617267696E3A6175746F7D2E736B2D706C616E657B77696474683A766172282D2D736B2D73697A65293B6865696768743A7661';
wwv_flow_imp.g_varchar2_table(2) := '72282D2D736B2D73697A65293B6261636B67726F756E642D636F6C6F723A766172282D2D736B2D636F6C6F72293B616E696D6174696F6E3A736B2D706C616E6520312E327320696E66696E69746520656173652D696E2D6F75747D406B65796672616D65';
wwv_flow_imp.g_varchar2_table(3) := '7320736B2D706C616E657B30257B7472616E73666F726D3A70657273706563746976652831323070782920726F746174655828302920726F74617465592830297D3530257B7472616E73666F726D3A70657273706563746976652831323070782920726F';
wwv_flow_imp.g_varchar2_table(4) := '7461746558282D3138302E316465672920726F74617465592830297D313030257B7472616E73666F726D3A70657273706563746976652831323070782920726F7461746558282D3138306465672920726F7461746559282D3137392E39646567297D7D2E';
wwv_flow_imp.g_varchar2_table(5) := '736B2D63686173657B77696474683A766172282D2D736B2D73697A65293B6865696768743A766172282D2D736B2D73697A65293B706F736974696F6E3A72656C61746976653B616E696D6174696F6E3A736B2D636861736520322E357320696E66696E69';
wwv_flow_imp.g_varchar2_table(6) := '7465206C696E65617220626F74687D2E736B2D63686173652D646F747B77696474683A313030253B6865696768743A313030253B706F736974696F6E3A6162736F6C7574653B6C6566743A303B746F703A303B616E696D6174696F6E3A736B2D63686173';
wwv_flow_imp.g_varchar2_table(7) := '652D646F7420322E307320696E66696E69746520656173652D696E2D6F757420626F74687D2E736B2D63686173652D646F743A6265666F72657B636F6E74656E743A27273B646973706C61793A626C6F636B3B77696474683A3235253B6865696768743A';
wwv_flow_imp.g_varchar2_table(8) := '3235253B6261636B67726F756E642D636F6C6F723A766172282D2D736B2D636F6C6F72293B626F726465722D7261646975733A313030253B616E696D6174696F6E3A736B2D63686173652D646F742D6265666F726520322E307320696E66696E69746520';
wwv_flow_imp.g_varchar2_table(9) := '656173652D696E2D6F757420626F74687D2E736B2D63686173652D646F743A6E74682D6368696C642831297B616E696D6174696F6E2D64656C61793A2D312E31737D2E736B2D63686173652D646F743A6E74682D6368696C642832297B616E696D617469';
wwv_flow_imp.g_varchar2_table(10) := '6F6E2D64656C61793A2D312E30737D2E736B2D63686173652D646F743A6E74682D6368696C642833297B616E696D6174696F6E2D64656C61793A2D302E39737D2E736B2D63686173652D646F743A6E74682D6368696C642834297B616E696D6174696F6E';
wwv_flow_imp.g_varchar2_table(11) := '2D64656C61793A2D302E38737D2E736B2D63686173652D646F743A6E74682D6368696C642835297B616E696D6174696F6E2D64656C61793A2D302E37737D2E736B2D63686173652D646F743A6E74682D6368696C642836297B616E696D6174696F6E2D64';
wwv_flow_imp.g_varchar2_table(12) := '656C61793A2D302E36737D2E736B2D63686173652D646F743A6E74682D6368696C642831293A6265666F72657B616E696D6174696F6E2D64656C61793A2D312E31737D2E736B2D63686173652D646F743A6E74682D6368696C642832293A6265666F7265';
wwv_flow_imp.g_varchar2_table(13) := '7B616E696D6174696F6E2D64656C61793A2D312E30737D2E736B2D63686173652D646F743A6E74682D6368696C642833293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E39737D2E736B2D63686173652D646F743A6E74682D636869';
wwv_flow_imp.g_varchar2_table(14) := '6C642834293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E38737D2E736B2D63686173652D646F743A6E74682D6368696C642835293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E37737D2E736B2D6368617365';
wwv_flow_imp.g_varchar2_table(15) := '2D646F743A6E74682D6368696C642836293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E36737D406B65796672616D657320736B2D63686173657B313030257B7472616E73666F726D3A726F7461746528333630646567297D7D406B';
wwv_flow_imp.g_varchar2_table(16) := '65796672616D657320736B2D63686173652D646F747B3830252C313030257B7472616E73666F726D3A726F7461746528333630646567297D7D406B65796672616D657320736B2D63686173652D646F742D6265666F72657B3530257B7472616E73666F72';
wwv_flow_imp.g_varchar2_table(17) := '6D3A7363616C6528302E34297D313030252C30257B7472616E73666F726D3A7363616C6528312E30297D7D2E736B2D626F756E63657B77696474683A766172282D2D736B2D73697A65293B6865696768743A766172282D2D736B2D73697A65293B706F73';
wwv_flow_imp.g_varchar2_table(18) := '6974696F6E3A72656C61746976657D2E736B2D626F756E63652D646F747B77696474683A313030253B6865696768743A313030253B626F726465722D7261646975733A3530253B6261636B67726F756E642D636F6C6F723A766172282D2D736B2D636F6C';
wwv_flow_imp.g_varchar2_table(19) := '6F72293B6F7061636974793A2E363B706F736974696F6E3A6162736F6C7574653B746F703A303B6C6566743A303B616E696D6174696F6E3A736B2D626F756E636520327320696E66696E6974652063756269632D62657A69657228302E3435352C302E30';
wwv_flow_imp.g_varchar2_table(20) := '332C302E3531352C302E393535297D2E736B2D626F756E63652D646F743A6E74682D6368696C642832297B616E696D6174696F6E2D64656C61793A2D312E30737D406B65796672616D657320736B2D626F756E63657B30252C313030257B7472616E7366';
wwv_flow_imp.g_varchar2_table(21) := '6F726D3A7363616C652830297D3435252C3535257B7472616E73666F726D3A7363616C652831297D7D2E736B2D776176657B77696474683A766172282D2D736B2D73697A65293B6865696768743A766172282D2D736B2D73697A65293B646973706C6179';
wwv_flow_imp.g_varchar2_table(22) := '3A666C65783B6A7573746966792D636F6E74656E743A73706163652D6265747765656E7D2E736B2D776176652D726563747B6261636B67726F756E642D636F6C6F723A766172282D2D736B2D636F6C6F72293B6865696768743A313030253B7769647468';
wwv_flow_imp.g_varchar2_table(23) := '3A3135253B616E696D6174696F6E3A736B2D7761766520312E327320696E66696E69746520656173652D696E2D6F75747D2E736B2D776176652D726563743A6E74682D6368696C642831297B616E696D6174696F6E2D64656C61793A2D312E32737D2E73';
wwv_flow_imp.g_varchar2_table(24) := '6B2D776176652D726563743A6E74682D6368696C642832297B616E696D6174696F6E2D64656C61793A2D312E31737D2E736B2D776176652D726563743A6E74682D6368696C642833297B616E696D6174696F6E2D64656C61793A2D312E30737D2E736B2D';
wwv_flow_imp.g_varchar2_table(25) := '776176652D726563743A6E74682D6368696C642834297B616E696D6174696F6E2D64656C61793A2D302E39737D2E736B2D776176652D726563743A6E74682D6368696C642835297B616E696D6174696F6E2D64656C61793A2D302E38737D406B65796672';
wwv_flow_imp.g_varchar2_table(26) := '616D657320736B2D776176657B30252C3430252C313030257B7472616E73666F726D3A7363616C655928302E34297D3230257B7472616E73666F726D3A7363616C65592831297D7D2E736B2D70756C73657B77696474683A766172282D2D736B2D73697A';
wwv_flow_imp.g_varchar2_table(27) := '65293B6865696768743A766172282D2D736B2D73697A65293B6261636B67726F756E642D636F6C6F723A766172282D2D736B2D636F6C6F72293B626F726465722D7261646975733A313030253B616E696D6174696F6E3A736B2D70756C736520312E3273';
wwv_flow_imp.g_varchar2_table(28) := '20696E66696E6974652063756269632D62657A69657228302E3435352C302E30332C302E3531352C302E393535297D406B65796672616D657320736B2D70756C73657B30257B7472616E73666F726D3A7363616C652830297D313030257B7472616E7366';
wwv_flow_imp.g_varchar2_table(29) := '6F726D3A7363616C652831293B6F7061636974793A307D7D2E736B2D666C6F777B77696474683A63616C6328766172282D2D736B2D73697A6529202A20312E33293B6865696768743A63616C6328766172282D2D736B2D73697A6529202A20312E33293B';
wwv_flow_imp.g_varchar2_table(30) := '646973706C61793A666C65783B6A7573746966792D636F6E74656E743A73706163652D6265747765656E7D2E736B2D666C6F772D646F747B77696474683A3235253B6865696768743A3235253B6261636B67726F756E642D636F6C6F723A766172282D2D';
wwv_flow_imp.g_varchar2_table(31) := '736B2D636F6C6F72293B626F726465722D7261646975733A3530253B616E696D6174696F6E3A736B2D666C6F7720312E34732063756269632D62657A69657228302E3435352C302E30332C302E3531352C302E3935352920307320696E66696E69746520';
wwv_flow_imp.g_varchar2_table(32) := '626F74687D2E736B2D666C6F772D646F743A6E74682D6368696C642831297B616E696D6174696F6E2D64656C61793A2D302E3330737D2E736B2D666C6F772D646F743A6E74682D6368696C642832297B616E696D6174696F6E2D64656C61793A2D302E31';
wwv_flow_imp.g_varchar2_table(33) := '35737D406B65796672616D657320736B2D666C6F777B30252C3830252C313030257B7472616E73666F726D3A7363616C6528302E33297D3430257B7472616E73666F726D3A7363616C652831297D7D2E736B2D7377696E677B77696474683A766172282D';
wwv_flow_imp.g_varchar2_table(34) := '2D736B2D73697A65293B6865696768743A766172282D2D736B2D73697A65293B706F736974696F6E3A72656C61746976653B616E696D6174696F6E3A736B2D7377696E6720312E387320696E66696E697465206C696E6561727D2E736B2D7377696E672D';
wwv_flow_imp.g_varchar2_table(35) := '646F747B77696474683A3435253B6865696768743A3435253B706F736974696F6E3A6162736F6C7574653B746F703A303B6C6566743A303B72696768743A303B6D617267696E3A6175746F3B6261636B67726F756E642D636F6C6F723A766172282D2D73';
wwv_flow_imp.g_varchar2_table(36) := '6B2D636F6C6F72293B626F726465722D7261646975733A313030253B616E696D6174696F6E3A736B2D7377696E672D646F7420327320696E66696E69746520656173652D696E2D6F75747D2E736B2D7377696E672D646F743A6E74682D6368696C642832';
wwv_flow_imp.g_varchar2_table(37) := '297B746F703A6175746F3B626F74746F6D3A303B616E696D6174696F6E2D64656C61793A2D31737D406B65796672616D657320736B2D7377696E677B313030257B7472616E73666F726D3A726F7461746528333630646567297D7D406B65796672616D65';
wwv_flow_imp.g_varchar2_table(38) := '7320736B2D7377696E672D646F747B30252C313030257B7472616E73666F726D3A7363616C6528302E32297D3530257B7472616E73666F726D3A7363616C652831297D7D2E736B2D636972636C657B77696474683A766172282D2D736B2D73697A65293B';
wwv_flow_imp.g_varchar2_table(39) := '6865696768743A766172282D2D736B2D73697A65293B706F736974696F6E3A72656C61746976657D2E736B2D636972636C652D646F747B77696474683A313030253B6865696768743A313030253B706F736974696F6E3A6162736F6C7574653B6C656674';
wwv_flow_imp.g_varchar2_table(40) := '3A303B746F703A307D2E736B2D636972636C652D646F743A6265666F72657B636F6E74656E743A27273B646973706C61793A626C6F636B3B77696474683A3135253B6865696768743A3135253B6261636B67726F756E642D636F6C6F723A766172282D2D';
wwv_flow_imp.g_varchar2_table(41) := '736B2D636F6C6F72293B626F726465722D7261646975733A313030253B616E696D6174696F6E3A736B2D636972636C6520312E327320696E66696E69746520656173652D696E2D6F757420626F74687D2E736B2D636972636C652D646F743A6E74682D63';
wwv_flow_imp.g_varchar2_table(42) := '68696C642831297B7472616E73666F726D3A726F74617465283330646567297D2E736B2D636972636C652D646F743A6E74682D6368696C642832297B7472616E73666F726D3A726F74617465283630646567297D2E736B2D636972636C652D646F743A6E';
wwv_flow_imp.g_varchar2_table(43) := '74682D6368696C642833297B7472616E73666F726D3A726F74617465283930646567297D2E736B2D636972636C652D646F743A6E74682D6368696C642834297B7472616E73666F726D3A726F7461746528313230646567297D2E736B2D636972636C652D';
wwv_flow_imp.g_varchar2_table(44) := '646F743A6E74682D6368696C642835297B7472616E73666F726D3A726F7461746528313530646567297D2E736B2D636972636C652D646F743A6E74682D6368696C642836297B7472616E73666F726D3A726F7461746528313830646567297D2E736B2D63';
wwv_flow_imp.g_varchar2_table(45) := '6972636C652D646F743A6E74682D6368696C642837297B7472616E73666F726D3A726F7461746528323130646567297D2E736B2D636972636C652D646F743A6E74682D6368696C642838297B7472616E73666F726D3A726F746174652832343064656729';
wwv_flow_imp.g_varchar2_table(46) := '7D2E736B2D636972636C652D646F743A6E74682D6368696C642839297B7472616E73666F726D3A726F7461746528323730646567297D2E736B2D636972636C652D646F743A6E74682D6368696C64283130297B7472616E73666F726D3A726F7461746528';
wwv_flow_imp.g_varchar2_table(47) := '333030646567297D2E736B2D636972636C652D646F743A6E74682D6368696C64283131297B7472616E73666F726D3A726F7461746528333330646567297D2E736B2D636972636C652D646F743A6E74682D6368696C642831293A6265666F72657B616E69';
wwv_flow_imp.g_varchar2_table(48) := '6D6174696F6E2D64656C61793A2D312E31737D2E736B2D636972636C652D646F743A6E74682D6368696C642832293A6265666F72657B616E696D6174696F6E2D64656C61793A2D31737D2E736B2D636972636C652D646F743A6E74682D6368696C642833';
wwv_flow_imp.g_varchar2_table(49) := '293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E39737D2E736B2D636972636C652D646F743A6E74682D6368696C642834293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E38737D2E736B2D636972636C652D64';
wwv_flow_imp.g_varchar2_table(50) := '6F743A6E74682D6368696C642835293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E37737D2E736B2D636972636C652D646F743A6E74682D6368696C642836293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E36';
wwv_flow_imp.g_varchar2_table(51) := '737D2E736B2D636972636C652D646F743A6E74682D6368696C642837293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E35737D2E736B2D636972636C652D646F743A6E74682D6368696C642838293A6265666F72657B616E696D6174';
wwv_flow_imp.g_varchar2_table(52) := '696F6E2D64656C61793A2D302E34737D2E736B2D636972636C652D646F743A6E74682D6368696C642839293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E33737D2E736B2D636972636C652D646F743A6E74682D6368696C64283130';
wwv_flow_imp.g_varchar2_table(53) := '293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E32737D2E736B2D636972636C652D646F743A6E74682D6368696C64283131293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E31737D406B65796672616D657320';
wwv_flow_imp.g_varchar2_table(54) := '736B2D636972636C657B30252C3830252C313030257B7472616E73666F726D3A7363616C652830297D3430257B7472616E73666F726D3A7363616C652831297D7D2E736B2D636972636C652D666164657B77696474683A766172282D2D736B2D73697A65';
wwv_flow_imp.g_varchar2_table(55) := '293B6865696768743A766172282D2D736B2D73697A65293B706F736974696F6E3A72656C61746976657D2E736B2D636972636C652D666164652D646F747B77696474683A313030253B6865696768743A313030253B706F736974696F6E3A6162736F6C75';
wwv_flow_imp.g_varchar2_table(56) := '74653B6C6566743A303B746F703A307D2E736B2D636972636C652D666164652D646F743A6265666F72657B636F6E74656E743A27273B646973706C61793A626C6F636B3B77696474683A3135253B6865696768743A3135253B6261636B67726F756E642D';
wwv_flow_imp.g_varchar2_table(57) := '636F6C6F723A766172282D2D736B2D636F6C6F72293B626F726465722D7261646975733A313030253B616E696D6174696F6E3A736B2D636972636C652D6661646520312E327320696E66696E69746520656173652D696E2D6F757420626F74687D2E736B';
wwv_flow_imp.g_varchar2_table(58) := '2D636972636C652D666164652D646F743A6E74682D6368696C642831297B7472616E73666F726D3A726F74617465283330646567297D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642832297B7472616E73666F726D3A726F74';
wwv_flow_imp.g_varchar2_table(59) := '617465283630646567297D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642833297B7472616E73666F726D3A726F74617465283930646567297D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C64283429';
wwv_flow_imp.g_varchar2_table(60) := '7B7472616E73666F726D3A726F7461746528313230646567297D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642835297B7472616E73666F726D3A726F7461746528313530646567297D2E736B2D636972636C652D666164652D';
wwv_flow_imp.g_varchar2_table(61) := '646F743A6E74682D6368696C642836297B7472616E73666F726D3A726F7461746528313830646567297D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642837297B7472616E73666F726D3A726F7461746528323130646567297D';
wwv_flow_imp.g_varchar2_table(62) := '2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642838297B7472616E73666F726D3A726F7461746528323430646567297D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642839297B7472616E73666F726D';
wwv_flow_imp.g_varchar2_table(63) := '3A726F7461746528323730646567297D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C64283130297B7472616E73666F726D3A726F7461746528333030646567297D2E736B2D636972636C652D666164652D646F743A6E74682D63';
wwv_flow_imp.g_varchar2_table(64) := '68696C64283131297B7472616E73666F726D3A726F7461746528333330646567297D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642831293A6265666F72657B616E696D6174696F6E2D64656C61793A2D312E31737D2E736B2D';
wwv_flow_imp.g_varchar2_table(65) := '636972636C652D666164652D646F743A6E74682D6368696C642832293A6265666F72657B616E696D6174696F6E2D64656C61793A2D312E30737D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642833293A6265666F72657B616E';
wwv_flow_imp.g_varchar2_table(66) := '696D6174696F6E2D64656C61793A2D302E39737D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642834293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E38737D2E736B2D636972636C652D666164652D646F';
wwv_flow_imp.g_varchar2_table(67) := '743A6E74682D6368696C642835293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E37737D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642836293A6265666F72657B616E696D6174696F6E2D64656C61793A';
wwv_flow_imp.g_varchar2_table(68) := '2D302E36737D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642837293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E35737D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C64283829';
wwv_flow_imp.g_varchar2_table(69) := '3A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E34737D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C642839293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E33737D2E736B2D63697263';
wwv_flow_imp.g_varchar2_table(70) := '6C652D666164652D646F743A6E74682D6368696C64283130293A6265666F72657B616E696D6174696F6E2D64656C61793A2D302E32737D2E736B2D636972636C652D666164652D646F743A6E74682D6368696C64283131293A6265666F72657B616E696D';
wwv_flow_imp.g_varchar2_table(71) := '6174696F6E2D64656C61793A2D302E31737D406B65796672616D657320736B2D636972636C652D666164657B30252C3339252C313030257B6F7061636974793A303B7472616E73666F726D3A7363616C6528302E36297D3430257B6F7061636974793A31';
wwv_flow_imp.g_varchar2_table(72) := '3B7472616E73666F726D3A7363616C652831297D7D2E736B2D677269647B77696474683A766172282D2D736B2D73697A65293B6865696768743A766172282D2D736B2D73697A65297D2E736B2D677269642D637562657B77696474683A33332E3333253B';
wwv_flow_imp.g_varchar2_table(73) := '6865696768743A33332E3333253B6261636B67726F756E642D636F6C6F723A766172282D2D736B2D636F6C6F72293B666C6F61743A6C6566743B616E696D6174696F6E3A736B2D6772696420312E337320696E66696E69746520656173652D696E2D6F75';
wwv_flow_imp.g_varchar2_table(74) := '747D2E736B2D677269642D637562653A6E74682D6368696C642831297B616E696D6174696F6E2D64656C61793A2E32737D2E736B2D677269642D637562653A6E74682D6368696C642832297B616E696D6174696F6E2D64656C61793A2E33737D2E736B2D';
wwv_flow_imp.g_varchar2_table(75) := '677269642D637562653A6E74682D6368696C642833297B616E696D6174696F6E2D64656C61793A2E34737D2E736B2D677269642D637562653A6E74682D6368696C642834297B616E696D6174696F6E2D64656C61793A2E31737D2E736B2D677269642D63';
wwv_flow_imp.g_varchar2_table(76) := '7562653A6E74682D6368696C642835297B616E696D6174696F6E2D64656C61793A2E32737D2E736B2D677269642D637562653A6E74682D6368696C642836297B616E696D6174696F6E2D64656C61793A2E33737D2E736B2D677269642D637562653A6E74';
wwv_flow_imp.g_varchar2_table(77) := '682D6368696C642837297B616E696D6174696F6E2D64656C61793A30737D2E736B2D677269642D637562653A6E74682D6368696C642838297B616E696D6174696F6E2D64656C61793A2E31737D2E736B2D677269642D637562653A6E74682D6368696C64';
wwv_flow_imp.g_varchar2_table(78) := '2839297B616E696D6174696F6E2D64656C61793A2E32737D406B65796672616D657320736B2D677269647B30252C3730252C313030257B7472616E73666F726D3A7363616C65334428312C312C31297D3335257B7472616E73666F726D3A7363616C6533';
wwv_flow_imp.g_varchar2_table(79) := '4428302C302C31297D7D2E736B2D666F6C647B77696474683A766172282D2D736B2D73697A65293B6865696768743A766172282D2D736B2D73697A65293B706F736974696F6E3A72656C61746976653B7472616E73666F726D3A726F746174655A283435';
wwv_flow_imp.g_varchar2_table(80) := '646567297D2E736B2D666F6C642D637562657B666C6F61743A6C6566743B77696474683A3530253B6865696768743A3530253B706F736974696F6E3A72656C61746976653B7472616E73666F726D3A7363616C6528312E31297D2E736B2D666F6C642D63';
wwv_flow_imp.g_varchar2_table(81) := '7562653A6265666F72657B636F6E74656E743A27273B706F736974696F6E3A6162736F6C7574653B746F703A303B6C6566743A303B77696474683A313030253B6865696768743A313030253B6261636B67726F756E642D636F6C6F723A766172282D2D73';
wwv_flow_imp.g_varchar2_table(82) := '6B2D636F6C6F72293B616E696D6174696F6E3A736B2D666F6C6420322E347320696E66696E697465206C696E65617220626F74683B7472616E73666F726D2D6F726967696E3A3130302520313030257D2E736B2D666F6C642D637562653A6E74682D6368';
wwv_flow_imp.g_varchar2_table(83) := '696C642832297B7472616E73666F726D3A7363616C6528312E312920726F746174655A283930646567297D2E736B2D666F6C642D637562653A6E74682D6368696C642834297B7472616E73666F726D3A7363616C6528312E312920726F746174655A2831';
wwv_flow_imp.g_varchar2_table(84) := '3830646567297D2E736B2D666F6C642D637562653A6E74682D6368696C642833297B7472616E73666F726D3A7363616C6528312E312920726F746174655A28323730646567297D2E736B2D666F6C642D637562653A6E74682D6368696C642832293A6265';
wwv_flow_imp.g_varchar2_table(85) := '666F72657B616E696D6174696F6E2D64656C61793A2E33737D2E736B2D666F6C642D637562653A6E74682D6368696C642834293A6265666F72657B616E696D6174696F6E2D64656C61793A2E36737D2E736B2D666F6C642D637562653A6E74682D636869';
wwv_flow_imp.g_varchar2_table(86) := '6C642833293A6265666F72657B616E696D6174696F6E2D64656C61793A2E39737D406B65796672616D657320736B2D666F6C647B30252C3130257B7472616E73666F726D3A70657273706563746976652831343070782920726F7461746558282D313830';
wwv_flow_imp.g_varchar2_table(87) := '646567293B6F7061636974793A307D3235252C3735257B7472616E73666F726D3A70657273706563746976652831343070782920726F74617465582830293B6F7061636974793A317D3930252C313030257B7472616E73666F726D3A7065727370656374';
wwv_flow_imp.g_varchar2_table(88) := '6976652831343070782920726F746174655928313830646567293B6F7061636974793A307D7D2E736B2D77616E6465727B77696474683A766172282D2D736B2D73697A65293B6865696768743A766172282D2D736B2D73697A65293B706F736974696F6E';
wwv_flow_imp.g_varchar2_table(89) := '3A72656C61746976657D2E736B2D77616E6465722D637562657B6261636B67726F756E642D636F6C6F723A766172282D2D736B2D636F6C6F72293B77696474683A3230253B6865696768743A3230253B706F736974696F6E3A6162736F6C7574653B746F';
wwv_flow_imp.g_varchar2_table(90) := '703A303B6C6566743A303B2D2D736B2D77616E6465722D64697374616E63653A63616C6328766172282D2D736B2D73697A6529202A20302E3735293B616E696D6174696F6E3A736B2D77616E64657220322E307320656173652D696E2D6F7574202D322E';
wwv_flow_imp.g_varchar2_table(91) := '307320696E66696E69746520626F74687D2E736B2D77616E6465722D637562653A6E74682D6368696C642832297B616E696D6174696F6E2D64656C61793A2D302E35737D2E736B2D77616E6465722D637562653A6E74682D6368696C642833297B616E69';
wwv_flow_imp.g_varchar2_table(92) := '6D6174696F6E2D64656C61793A2D312E30737D406B65796672616D657320736B2D77616E6465727B30257B7472616E73666F726D3A726F746174652830297D3235257B7472616E73666F726D3A7472616E736C6174655828766172282D2D736B2D77616E';
wwv_flow_imp.g_varchar2_table(93) := '6465722D64697374616E6365292920726F74617465282D393064656729207363616C6528302E36297D3530257B7472616E73666F726D3A7472616E736C6174655828766172282D2D736B2D77616E6465722D64697374616E63652929207472616E736C61';
wwv_flow_imp.g_varchar2_table(94) := '74655928766172282D2D736B2D77616E6465722D64697374616E6365292920726F74617465282D313739646567297D35302E31257B7472616E73666F726D3A7472616E736C6174655828766172282D2D736B2D77616E6465722D64697374616E63652929';
wwv_flow_imp.g_varchar2_table(95) := '207472616E736C6174655928766172282D2D736B2D77616E6465722D64697374616E6365292920726F74617465282D313830646567297D3735257B7472616E73666F726D3A7472616E736C61746558283029207472616E736C6174655928766172282D2D';
wwv_flow_imp.g_varchar2_table(96) := '736B2D77616E6465722D64697374616E6365292920726F74617465282D32373064656729207363616C6528302E36297D313030257B7472616E73666F726D3A726F74617465282D333630646567297D7D0A';
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(33400402009772248638)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_file_name=>'css/spinkit.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2E616F702D50726F63657373696E677B7A2D696E6465783A39393939393939397D2E742D427574746F6E202E616F702D50726F63657373696E677B2D2D736B2D73697A653A766172282D2D612D627574746F6E2D666F6E742D73697A652C203230707829';
wwv_flow_imp.g_varchar2_table(2) := '7D2E616F702D496E6C696E65507265766965777B646973706C61793A666C65783B666C65782D646972656374696F6E3A636F6C756D6E7D2E616F702D496E6C696E6550726576696577202E616F702D496E6C696E65507265766965772D2D646F776E6C6F';
wwv_flow_imp.g_varchar2_table(3) := '6164427574746F6E7B6D617267696E2D626F74746F6D3A3870783B616C69676E2D73656C663A666C65782D656E647D';
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(33400717311707236059)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_file_name=>'css/aop.min.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2866756E6374696F6E28742C65297B226F626A656374223D3D747970656F66206578706F727473262622756E646566696E656422213D747970656F66206D6F64756C653F6D6F64756C652E6578706F7274733D6528293A2266756E6374696F6E223D3D74';
wwv_flow_imp.g_varchar2_table(2) := '7970656F6620646566696E652626646566696E652E616D643F646566696E652865293A742E45533650726F6D6973653D6528297D2928746869732C66756E6374696F6E28297B2275736520737472696374223B66756E6374696F6E20742874297B766172';
wwv_flow_imp.g_varchar2_table(3) := '20653D747970656F6620743B72657475726E206E756C6C213D3D74262628226F626A656374223D3D3D657C7C2266756E6374696F6E223D3D3D65297D66756E6374696F6E20652874297B72657475726E2266756E6374696F6E223D3D747970656F662074';
wwv_flow_imp.g_varchar2_table(4) := '7D66756E6374696F6E206E2874297B423D747D66756E6374696F6E20722874297B473D747D66756E6374696F6E206F28297B72657475726E2066756E6374696F6E28297B72657475726E2070726F636573732E6E6578745469636B2861297D7D66756E63';
wwv_flow_imp.g_varchar2_table(5) := '74696F6E206928297B72657475726E22756E646566696E656422213D747970656F66207A3F66756E6374696F6E28297B7A2861297D3A6328297D66756E6374696F6E207328297B76617220743D302C653D6E6577204A2861292C6E3D646F63756D656E74';
wwv_flow_imp.g_varchar2_table(6) := '2E637265617465546578744E6F6465282222293B72657475726E20652E6F627365727665286E2C7B636861726163746572446174613A21307D292C66756E6374696F6E28297B6E2E646174613D743D2B2B7425327D7D66756E6374696F6E207528297B76';
wwv_flow_imp.g_varchar2_table(7) := '617220743D6E6577204D6573736167654368616E6E656C3B72657475726E20742E706F7274312E6F6E6D6573736167653D612C66756E6374696F6E28297B72657475726E20742E706F7274322E706F73744D6573736167652830297D7D66756E6374696F';
wwv_flow_imp.g_varchar2_table(8) := '6E206328297B76617220743D73657454696D656F75743B72657475726E2066756E6374696F6E28297B72657475726E207428612C31297D7D66756E6374696F6E206128297B666F722876617220743D303B743C573B742B3D32297B76617220653D565B74';
wwv_flow_imp.g_varchar2_table(9) := '5D2C6E3D565B742B315D3B65286E292C565B745D3D766F696420302C565B742B315D3D766F696420307D573D307D66756E6374696F6E206628297B7472797B76617220743D46756E6374696F6E282272657475726E2074686973222928292E7265717569';
wwv_flow_imp.g_varchar2_table(10) := '72652822766572747822293B72657475726E207A3D742E72756E4F6E4C6F6F707C7C742E72756E4F6E436F6E746578742C6928297D63617463682874297B72657475726E206328297D7D66756E6374696F6E206C28742C65297B766172206E3D74686973';
wwv_flow_imp.g_varchar2_table(11) := '2C723D6E657720746869732E636F6E7374727563746F722870293B766F696420303D3D3D725B5A5D26264F2872293B766172206F3D6E2E5F73746174653B6966286F297B76617220693D617267756D656E74735B6F2D315D3B472866756E6374696F6E28';
wwv_flow_imp.g_varchar2_table(12) := '297B72657475726E2050286F2C722C692C6E2E5F726573756C74297D297D656C73652045286E2C722C742C65293B72657475726E20727D66756E6374696F6E20682874297B76617220653D746869733B696628742626226F626A656374223D3D74797065';
wwv_flow_imp.g_varchar2_table(13) := '6F6620742626742E636F6E7374727563746F723D3D3D652972657475726E20743B766172206E3D6E657720652870293B72657475726E2067286E2C74292C6E7D66756E6374696F6E207028297B7D66756E6374696F6E207628297B72657475726E206E65';
wwv_flow_imp.g_varchar2_table(14) := '7720547970654572726F722822596F752063616E6E6F74207265736F6C766520612070726F6D697365207769746820697473656C6622297D66756E6374696F6E206428297B72657475726E206E657720547970654572726F722822412070726F6D697365';
wwv_flow_imp.g_varchar2_table(15) := '732063616C6C6261636B2063616E6E6F742072657475726E20746861742073616D652070726F6D6973652E22297D66756E6374696F6E205F2874297B7472797B72657475726E20742E7468656E7D63617463682874297B72657475726E206E742E657272';
wwv_flow_imp.g_varchar2_table(16) := '6F723D742C6E747D7D66756E6374696F6E207928742C652C6E2C72297B7472797B742E63616C6C28652C6E2C72297D63617463682874297B72657475726E20747D7D66756E6374696F6E206D28742C652C6E297B472866756E6374696F6E2874297B7661';
wwv_flow_imp.g_varchar2_table(17) := '7220723D21312C6F3D79286E2C652C66756E6374696F6E286E297B727C7C28723D21302C65213D3D6E3F6728742C6E293A5328742C6E29297D2C66756E6374696F6E2865297B727C7C28723D21302C6A28742C6529297D2C22536574746C653A20222B28';
wwv_flow_imp.g_varchar2_table(18) := '742E5F6C6162656C7C7C2220756E6B6E6F776E2070726F6D6973652229293B217226266F262628723D21302C6A28742C6F29297D2C74297D66756E6374696F6E206228742C65297B652E5F73746174653D3D3D74743F5328742C652E5F726573756C7429';
wwv_flow_imp.g_varchar2_table(19) := '3A652E5F73746174653D3D3D65743F6A28742C652E5F726573756C74293A4528652C766F696420302C66756E6374696F6E2865297B72657475726E206728742C65297D2C66756E6374696F6E2865297B72657475726E206A28742C65297D297D66756E63';
wwv_flow_imp.g_varchar2_table(20) := '74696F6E207728742C6E2C72297B6E2E636F6E7374727563746F723D3D3D742E636F6E7374727563746F722626723D3D3D6C26266E2E636F6E7374727563746F722E7265736F6C76653D3D3D683F6228742C6E293A723D3D3D6E743F286A28742C6E742E';
wwv_flow_imp.g_varchar2_table(21) := '6572726F72292C6E742E6572726F723D6E756C6C293A766F696420303D3D3D723F5328742C6E293A652872293F6D28742C6E2C72293A5328742C6E297D66756E6374696F6E206728652C6E297B653D3D3D6E3F6A28652C762829293A74286E293F772865';
wwv_flow_imp.g_varchar2_table(22) := '2C6E2C5F286E29293A5328652C6E297D66756E6374696F6E20412874297B742E5F6F6E6572726F722626742E5F6F6E6572726F7228742E5F726573756C74292C542874297D66756E6374696F6E205328742C65297B742E5F73746174653D3D3D24262628';
wwv_flow_imp.g_varchar2_table(23) := '742E5F726573756C743D652C742E5F73746174653D74742C30213D3D742E5F73756273637269626572732E6C656E67746826264728542C7429297D66756E6374696F6E206A28742C65297B742E5F73746174653D3D3D24262628742E5F73746174653D65';
wwv_flow_imp.g_varchar2_table(24) := '742C742E5F726573756C743D652C4728412C7429297D66756E6374696F6E204528742C652C6E2C72297B766172206F3D742E5F73756273637269626572732C693D6F2E6C656E6774683B742E5F6F6E6572726F723D6E756C6C2C6F5B695D3D652C6F5B69';
wwv_flow_imp.g_varchar2_table(25) := '2B74745D3D6E2C6F5B692B65745D3D722C303D3D3D692626742E5F737461746526264728542C74297D66756E6374696F6E20542874297B76617220653D742E5F73756273637269626572732C6E3D742E5F73746174653B69662830213D3D652E6C656E67';
wwv_flow_imp.g_varchar2_table(26) := '7468297B666F722876617220723D766F696420302C6F3D766F696420302C693D742E5F726573756C742C733D303B733C652E6C656E6774683B732B3D3329723D655B735D2C6F3D655B732B6E5D2C723F50286E2C722C6F2C69293A6F2869293B742E5F73';
wwv_flow_imp.g_varchar2_table(27) := '756273637269626572732E6C656E6774683D307D7D66756E6374696F6E204D28742C65297B7472797B72657475726E20742865297D63617463682874297B72657475726E206E742E6572726F723D742C6E747D7D66756E6374696F6E205028742C6E2C72';
wwv_flow_imp.g_varchar2_table(28) := '2C6F297B76617220693D652872292C733D766F696420302C753D766F696420302C633D766F696420302C613D766F696420303B69662869297B696628733D4D28722C6F292C733D3D3D6E743F28613D21302C753D732E6572726F722C732E6572726F723D';
wwv_flow_imp.g_varchar2_table(29) := '6E756C6C293A633D21302C6E3D3D3D732972657475726E20766F6964206A286E2C642829297D656C736520733D6F2C633D21303B6E2E5F7374617465213D3D247C7C28692626633F67286E2C73293A613F6A286E2C75293A743D3D3D74743F53286E2C73';
wwv_flow_imp.g_varchar2_table(30) := '293A743D3D3D657426266A286E2C7329297D66756E6374696F6E207828742C65297B7472797B652866756E6374696F6E2865297B6728742C65297D2C66756E6374696F6E2865297B6A28742C65297D297D63617463682865297B6A28742C65297D7D6675';
wwv_flow_imp.g_varchar2_table(31) := '6E6374696F6E204328297B72657475726E2072742B2B7D66756E6374696F6E204F2874297B745B5A5D3D72742B2B2C742E5F73746174653D766F696420302C742E5F726573756C743D766F696420302C742E5F73756273637269626572733D5B5D7D6675';
wwv_flow_imp.g_varchar2_table(32) := '6E6374696F6E206B28297B72657475726E206E6577204572726F7228224172726179204D6574686F6473206D7573742062652070726F766964656420616E20417272617922297D66756E6374696F6E20462874297B72657475726E206E6577206F742874';
wwv_flow_imp.g_varchar2_table(33) := '6869732C74292E70726F6D6973657D66756E6374696F6E20592874297B76617220653D746869733B72657475726E206E6577206528552874293F66756E6374696F6E286E2C72297B666F7228766172206F3D742E6C656E6774682C693D303B693C6F3B69';
wwv_flow_imp.g_varchar2_table(34) := '2B2B29652E7265736F6C766528745B695D292E7468656E286E2C72297D3A66756E6374696F6E28742C65297B72657475726E2065286E657720547970654572726F722822596F75206D757374207061737320616E20617272617920746F20726163652E22';
wwv_flow_imp.g_varchar2_table(35) := '29297D297D66756E6374696F6E20712874297B76617220653D746869732C6E3D6E657720652870293B72657475726E206A286E2C74292C6E7D66756E6374696F6E204428297B7468726F77206E657720547970654572726F722822596F75206D75737420';
wwv_flow_imp.g_varchar2_table(36) := '706173732061207265736F6C7665722066756E6374696F6E2061732074686520666972737420617267756D656E7420746F207468652070726F6D69736520636F6E7374727563746F7222297D66756E6374696F6E204B28297B7468726F77206E65772054';
wwv_flow_imp.g_varchar2_table(37) := '7970654572726F7228224661696C656420746F20636F6E737472756374202750726F6D697365273A20506C65617365207573652074686520276E657727206F70657261746F722C2074686973206F626A65637420636F6E7374727563746F722063616E6E';
wwv_flow_imp.g_varchar2_table(38) := '6F742062652063616C6C656420617320612066756E6374696F6E2E22297D66756E6374696F6E204C28297B76617220743D766F696420303B69662822756E646566696E656422213D747970656F6620676C6F62616C29743D676C6F62616C3B656C736520';
wwv_flow_imp.g_varchar2_table(39) := '69662822756E646566696E656422213D747970656F662073656C6629743D73656C663B656C7365207472797B743D46756E6374696F6E282272657475726E2074686973222928297D63617463682874297B7468726F77206E6577204572726F722822706F';
wwv_flow_imp.g_varchar2_table(40) := '6C7966696C6C206661696C6564206265636175736520676C6F62616C206F626A65637420697320756E617661696C61626C6520696E207468697320656E7669726F6E6D656E7422297D76617220653D742E50726F6D6973653B69662865297B766172206E';
wwv_flow_imp.g_varchar2_table(41) := '3D6E756C6C3B7472797B6E3D4F626A6563742E70726F746F747970652E746F537472696E672E63616C6C28652E7265736F6C76652829297D63617463682874297B7D696628225B6F626A6563742050726F6D6973655D223D3D3D6E262621652E63617374';
wwv_flow_imp.g_varchar2_table(42) := '2972657475726E7D742E50726F6D6973653D69747D766172204E3D766F696420303B4E3D41727261792E697341727261793F41727261792E697341727261793A66756E6374696F6E2874297B72657475726E225B6F626A6563742041727261795D223D3D';
wwv_flow_imp.g_varchar2_table(43) := '3D4F626A6563742E70726F746F747970652E746F537472696E672E63616C6C2874297D3B76617220553D4E2C573D302C7A3D766F696420302C423D766F696420302C473D66756E6374696F6E28742C65297B565B575D3D742C565B572B315D3D652C572B';
wwv_flow_imp.g_varchar2_table(44) := '3D322C323D3D3D57262628423F422861293A582829297D2C483D22756E646566696E656422213D747970656F662077696E646F773F77696E646F773A766F696420302C493D487C7C7B7D2C4A3D492E4D75746174696F6E4F627365727665727C7C492E57';
wwv_flow_imp.g_varchar2_table(45) := '65624B69744D75746174696F6E4F627365727665722C513D22756E646566696E6564223D3D747970656F662073656C66262622756E646566696E656422213D747970656F662070726F636573732626225B6F626A6563742070726F636573735D223D3D3D';
wwv_flow_imp.g_varchar2_table(46) := '7B7D2E746F537472696E672E63616C6C2870726F63657373292C523D22756E646566696E656422213D747970656F662055696E7438436C616D7065644172726179262622756E646566696E656422213D747970656F6620696D706F727453637269707473';
wwv_flow_imp.g_varchar2_table(47) := '262622756E646566696E656422213D747970656F66204D6573736167654368616E6E656C2C563D6E657720417272617928316533292C583D766F696420303B583D513F6F28293A4A3F7328293A523F7528293A766F696420303D3D3D4826262266756E63';
wwv_flow_imp.g_varchar2_table(48) := '74696F6E223D3D747970656F6620726571756972653F6628293A6328293B766172205A3D4D6174682E72616E646F6D28292E746F537472696E67283336292E737562737472696E672832292C243D766F696420302C74743D312C65743D322C6E743D7B65';
wwv_flow_imp.g_varchar2_table(49) := '72726F723A6E756C6C7D2C72743D302C6F743D66756E6374696F6E28297B66756E6374696F6E207428742C65297B746869732E5F696E7374616E6365436F6E7374727563746F723D742C746869732E70726F6D6973653D6E657720742870292C74686973';
wwv_flow_imp.g_varchar2_table(50) := '2E70726F6D6973655B5A5D7C7C4F28746869732E70726F6D697365292C552865293F28746869732E6C656E6774683D652E6C656E6774682C746869732E5F72656D61696E696E673D652E6C656E6774682C746869732E5F726573756C743D6E6577204172';
wwv_flow_imp.g_varchar2_table(51) := '72617928746869732E6C656E677468292C303D3D3D746869732E6C656E6774683F5328746869732E70726F6D6973652C746869732E5F726573756C74293A28746869732E6C656E6774683D746869732E6C656E6774687C7C302C746869732E5F656E756D';
wwv_flow_imp.g_varchar2_table(52) := '65726174652865292C303D3D3D746869732E5F72656D61696E696E6726265328746869732E70726F6D6973652C746869732E5F726573756C742929293A6A28746869732E70726F6D6973652C6B2829297D72657475726E20742E70726F746F747970652E';
wwv_flow_imp.g_varchar2_table(53) := '5F656E756D65726174653D66756E6374696F6E2874297B666F722876617220653D303B746869732E5F73746174653D3D3D242626653C742E6C656E6774683B652B2B29746869732E5F65616368456E74727928745B655D2C65297D2C742E70726F746F74';
wwv_flow_imp.g_varchar2_table(54) := '7970652E5F65616368456E7472793D66756E6374696F6E28742C65297B766172206E3D746869732E5F696E7374616E6365436F6E7374727563746F722C723D6E2E7265736F6C76653B696628723D3D3D68297B766172206F3D5F2874293B6966286F3D3D';
wwv_flow_imp.g_varchar2_table(55) := '3D6C2626742E5F7374617465213D3D2429746869732E5F736574746C6564417428742E5F73746174652C652C742E5F726573756C74293B656C7365206966282266756E6374696F6E22213D747970656F66206F29746869732E5F72656D61696E696E672D';
wwv_flow_imp.g_varchar2_table(56) := '2D2C746869732E5F726573756C745B655D3D743B656C7365206966286E3D3D3D6974297B76617220693D6E6577206E2870293B7728692C742C6F292C746869732E5F77696C6C536574746C65417428692C65297D656C736520746869732E5F77696C6C53';
wwv_flow_imp.g_varchar2_table(57) := '6574746C654174286E6577206E2866756E6374696F6E2865297B72657475726E20652874297D292C65297D656C736520746869732E5F77696C6C536574746C65417428722874292C65297D2C742E70726F746F747970652E5F736574746C656441743D66';
wwv_flow_imp.g_varchar2_table(58) := '756E6374696F6E28742C652C6E297B76617220723D746869732E70726F6D6973653B722E5F73746174653D3D3D24262628746869732E5F72656D61696E696E672D2D2C743D3D3D65743F6A28722C6E293A746869732E5F726573756C745B655D3D6E292C';
wwv_flow_imp.g_varchar2_table(59) := '303D3D3D746869732E5F72656D61696E696E6726265328722C746869732E5F726573756C74297D2C742E70726F746F747970652E5F77696C6C536574746C6541743D66756E6374696F6E28742C65297B766172206E3D746869733B4528742C766F696420';
wwv_flow_imp.g_varchar2_table(60) := '302C66756E6374696F6E2874297B72657475726E206E2E5F736574746C656441742874742C652C74297D2C66756E6374696F6E2874297B72657475726E206E2E5F736574746C656441742865742C652C74297D297D2C747D28292C69743D66756E637469';
wwv_flow_imp.g_varchar2_table(61) := '6F6E28297B66756E6374696F6E20742865297B746869735B5A5D3D4328292C746869732E5F726573756C743D746869732E5F73746174653D766F696420302C746869732E5F73756273637269626572733D5B5D2C70213D3D652626282266756E6374696F';
wwv_flow_imp.g_varchar2_table(62) := '6E22213D747970656F66206526264428292C7468697320696E7374616E63656F6620743F7828746869732C65293A4B2829297D72657475726E20742E70726F746F747970652E63617463683D66756E6374696F6E2874297B72657475726E20746869732E';
wwv_flow_imp.g_varchar2_table(63) := '7468656E286E756C6C2C74297D2C742E70726F746F747970652E66696E616C6C793D66756E6374696F6E2874297B76617220653D746869732C6E3D652E636F6E7374727563746F723B72657475726E20652E7468656E2866756E6374696F6E2865297B72';
wwv_flow_imp.g_varchar2_table(64) := '657475726E206E2E7265736F6C766528742829292E7468656E2866756E6374696F6E28297B72657475726E20657D297D2C66756E6374696F6E2865297B72657475726E206E2E7265736F6C766528742829292E7468656E2866756E6374696F6E28297B74';
wwv_flow_imp.g_varchar2_table(65) := '68726F7720657D297D297D2C747D28293B72657475726E2069742E70726F746F747970652E7468656E3D6C2C69742E616C6C3D462C69742E726163653D592C69742E7265736F6C76653D682C69742E72656A6563743D712C69742E5F7365745363686564';
wwv_flow_imp.g_varchar2_table(66) := '756C65723D6E2C69742E5F736574417361703D722C69742E5F617361703D472C69742E706F6C7966696C6C3D4C2C69742E50726F6D6973653D69742C69747D293B';
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(33947448582741006740)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_file_name=>'js/es6-promise.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.g_varchar2_table := wwv_flow_imp.empty_varchar2_table;
wwv_flow_imp.g_varchar2_table(1) := '2F2A210A202A2068746D6C3263616E76617320312E342E31203C68747470733A2F2F68746D6C3263616E7661732E686572747A656E2E636F6D3E0A202A20436F70797269676874202863292032303232204E696B6C617320766F6E20486572747A656E20';
wwv_flow_imp.g_varchar2_table(2) := '3C68747470733A2F2F686572747A656E2E636F6D3E0A202A2052656C656173656420756E646572204D4954204C6963656E73650A202A2F0A2166756E6374696F6E28412C65297B226F626A656374223D3D747970656F66206578706F727473262622756E';
wwv_flow_imp.g_varchar2_table(3) := '646566696E656422213D747970656F66206D6F64756C653F6D6F64756C652E6578706F7274733D6528293A2266756E6374696F6E223D3D747970656F6620646566696E652626646566696E652E616D643F646566696E652865293A28413D22756E646566';
wwv_flow_imp.g_varchar2_table(4) := '696E656422213D747970656F6620676C6F62616C546869733F676C6F62616C546869733A417C7C73656C66292E68746D6C3263616E7661733D6528297D28746869732C66756E6374696F6E28297B2275736520737472696374223B0A2F2A21202A2A2A2A';
wwv_flow_imp.g_varchar2_table(5) := '2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A0A20202020436F7079726967687420286329204D6963726F736F66';
wwv_flow_imp.g_varchar2_table(6) := '7420436F72706F726174696F6E2E0A0A202020205065726D697373696F6E20746F207573652C20636F70792C206D6F646966792C20616E642F6F722064697374726962757465207468697320736F66747761726520666F7220616E790A20202020707572';
wwv_flow_imp.g_varchar2_table(7) := '706F73652077697468206F7220776974686F75742066656520697320686572656279206772616E7465642E0A0A2020202054484520534F4654574152452049532050524F5649444544202241532049532220414E442054484520415554484F5220444953';
wwv_flow_imp.g_varchar2_table(8) := '434C41494D5320414C4C2057415252414E5449455320574954480A2020202052454741524420544F205448495320534F46545741524520494E434C5544494E4720414C4C20494D504C4945442057415252414E54494553204F46204D45524348414E5441';
wwv_flow_imp.g_varchar2_table(9) := '42494C4954590A20202020414E44204649544E4553532E20494E204E4F204556454E54205348414C4C2054484520415554484F52204245204C4941424C4520464F5220414E59205350454349414C2C204449524543542C0A20202020494E444952454354';
wwv_flow_imp.g_varchar2_table(10) := '2C204F5220434F4E53455155454E5449414C2044414D41474553204F5220414E592044414D414745532057484154534F4556455220524553554C54494E472046524F4D0A202020204C4F5353204F46205553452C2044415441204F522050524F46495453';
wwv_flow_imp.g_varchar2_table(11) := '2C205748455448455220494E20414E20414354494F4E204F4620434F4E54524143542C204E45474C4947454E4345204F520A202020204F5448455220544F5254494F555320414354494F4E2C2041524953494E47204F5554204F46204F5220494E20434F';
wwv_flow_imp.g_varchar2_table(12) := '4E4E454354494F4E20574954482054484520555345204F520A20202020504552464F524D414E4345204F46205448495320534F4654574152452E0A202020202A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A';
wwv_flow_imp.g_varchar2_table(13) := '2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A2A202A2F76617220723D66756E6374696F6E28412C65297B72657475726E28723D4F626A6563742E73657450726F746F747970654F667C7C7B5F5F7072';
wwv_flow_imp.g_varchar2_table(14) := '6F746F5F5F3A5B5D7D696E7374616E63656F66204172726179262666756E6374696F6E28412C65297B412E5F5F70726F746F5F5F3D657D7C7C66756E6374696F6E28412C65297B666F7228766172207420696E2065294F626A6563742E70726F746F7479';
wwv_flow_imp.g_varchar2_table(15) := '70652E6861734F776E50726F70657274792E63616C6C28652C7429262628415B745D3D655B745D297D2928412C65297D3B66756E6374696F6E204128412C65297B6966282266756E6374696F6E22213D747970656F66206526266E756C6C213D3D652974';
wwv_flow_imp.g_varchar2_table(16) := '68726F77206E657720547970654572726F722822436C61737320657874656E64732076616C756520222B537472696E672865292B22206973206E6F74206120636F6E7374727563746F72206F72206E756C6C22293B66756E6374696F6E207428297B7468';
wwv_flow_imp.g_varchar2_table(17) := '69732E636F6E7374727563746F723D417D7228412C65292C412E70726F746F747970653D6E756C6C3D3D3D653F4F626A6563742E6372656174652865293A28742E70726F746F747970653D652E70726F746F747970652C6E65772074297D76617220683D';
wwv_flow_imp.g_varchar2_table(18) := '66756E6374696F6E28297B72657475726E28683D4F626A6563742E61737369676E7C7C66756E6374696F6E2841297B666F722876617220652C743D312C723D617267756D656E74732E6C656E6774683B743C723B742B2B29666F7228766172204220696E';
wwv_flow_imp.g_varchar2_table(19) := '20653D617267756D656E74735B745D294F626A6563742E70726F746F747970652E6861734F776E50726F70657274792E63616C6C28652C4229262628415B425D3D655B425D293B72657475726E20417D292E6170706C7928746869732C617267756D656E';
wwv_flow_imp.g_varchar2_table(20) := '7473297D3B66756E6374696F6E206128412C732C6F2C69297B72657475726E206E6577286F3D6F7C7C50726F6D697365292866756E6374696F6E28742C65297B66756E6374696F6E20722841297B7472797B6E28692E6E657874284129297D6361746368';
wwv_flow_imp.g_varchar2_table(21) := '2841297B652841297D7D66756E6374696F6E20422841297B7472797B6E28692E7468726F77284129297D63617463682841297B652841297D7D66756E6374696F6E206E2841297B76617220653B412E646F6E653F7428412E76616C7565293A2828653D41';
wwv_flow_imp.g_varchar2_table(22) := '2E76616C756529696E7374616E63656F66206F3F653A6E6577206F2866756E6374696F6E2841297B412865297D29292E7468656E28722C42297D6E2828693D692E6170706C7928412C737C7C5B5D29292E6E6578742829297D297D66756E6374696F6E20';
wwv_flow_imp.g_varchar2_table(23) := '4828742C72297B76617220422C6E2C732C6F3D7B6C6162656C3A302C73656E743A66756E6374696F6E28297B6966283126735B305D297468726F7720735B315D3B72657475726E20735B315D7D2C747279733A5B5D2C6F70733A5B5D7D2C413D7B6E6578';
wwv_flow_imp.g_varchar2_table(24) := '743A652830292C7468726F773A652831292C72657475726E3A652832297D3B72657475726E2266756E6374696F6E223D3D747970656F662053796D626F6C262628415B53796D626F6C2E6974657261746F725D3D66756E6374696F6E28297B7265747572';
wwv_flow_imp.g_varchar2_table(25) := '6E20746869737D292C413B66756E6374696F6E20652865297B72657475726E2066756E6374696F6E2841297B72657475726E2066756E6374696F6E2865297B69662842297468726F77206E657720547970654572726F72282247656E657261746F722069';
wwv_flow_imp.g_varchar2_table(26) := '7320616C726561647920657865637574696E672E22293B666F72283B6F3B297472797B696628423D312C6E262628733D3226655B305D3F6E2E72657475726E3A655B305D3F6E2E7468726F777C7C2828733D6E2E72657475726E292626732E63616C6C28';
wwv_flow_imp.g_varchar2_table(27) := '6E292C30293A6E2E6E6578742926262128733D732E63616C6C286E2C655B315D29292E646F6E652972657475726E20733B737769746368286E3D302C28653D733F5B3226655B305D2C732E76616C75655D3A65295B305D297B6361736520303A63617365';
wwv_flow_imp.g_varchar2_table(28) := '20313A733D653B627265616B3B6361736520343A72657475726E206F2E6C6162656C2B2B2C7B76616C75653A655B315D2C646F6E653A21317D3B6361736520353A6F2E6C6162656C2B2B2C6E3D655B315D2C653D5B305D3B636F6E74696E75653B636173';
wwv_flow_imp.g_varchar2_table(29) := '6520373A653D6F2E6F70732E706F7028292C6F2E747279732E706F7028293B636F6E74696E75653B64656661756C743A6966282128733D303C28733D6F2E74727973292E6C656E6774682626735B732E6C656E6774682D315D29262628363D3D3D655B30';
wwv_flow_imp.g_varchar2_table(30) := '5D7C7C323D3D3D655B305D29297B6F3D303B636F6E74696E75657D696628333D3D3D655B305D26262821737C7C655B315D3E735B305D2626655B315D3C735B335D29297B6F2E6C6162656C3D655B315D3B627265616B7D696628363D3D3D655B305D2626';
wwv_flow_imp.g_varchar2_table(31) := '6F2E6C6162656C3C735B315D297B6F2E6C6162656C3D735B315D2C733D653B627265616B7D6966287326266F2E6C6162656C3C735B325D297B6F2E6C6162656C3D735B325D2C6F2E6F70732E707573682865293B627265616B7D735B325D26266F2E6F70';
wwv_flow_imp.g_varchar2_table(32) := '732E706F7028292C6F2E747279732E706F7028293B636F6E74696E75657D653D722E63616C6C28742C6F297D63617463682841297B653D5B362C415D2C6E3D307D66696E616C6C797B423D733D307D6966283526655B305D297468726F7720655B315D3B';
wwv_flow_imp.g_varchar2_table(33) := '72657475726E7B76616C75653A655B305D3F655B315D3A766F696420302C646F6E653A21307D7D285B652C415D297D7D7D66756E6374696F6E207428412C652C74297B696628747C7C323D3D3D617267756D656E74732E6C656E67746829666F72287661';
wwv_flow_imp.g_varchar2_table(34) := '7220722C423D302C6E3D652E6C656E6774683B423C6E3B422B2B29217226264220696E20657C7C2828723D727C7C41727261792E70726F746F747970652E736C6963652E63616C6C28652C302C4229295B425D3D655B425D293B72657475726E20412E63';
wwv_flow_imp.g_varchar2_table(35) := '6F6E63617428727C7C65297D76617220643D28422E70726F746F747970652E6164643D66756E6374696F6E28412C652C742C72297B72657475726E206E6577204228746869732E6C6566742B412C746869732E746F702B652C746869732E77696474682B';
wwv_flow_imp.g_varchar2_table(36) := '742C746869732E6865696768742B72297D2C422E66726F6D436C69656E74526563743D66756E6374696F6E28412C65297B72657475726E206E6577204228652E6C6566742B412E77696E646F77426F756E64732E6C6566742C652E746F702B412E77696E';
wwv_flow_imp.g_varchar2_table(37) := '646F77426F756E64732E746F702C652E77696474682C652E686569676874297D2C422E66726F6D444F4D526563744C6973743D66756E6374696F6E28412C65297B653D41727261792E66726F6D2865292E66696E642866756E6374696F6E2841297B7265';
wwv_flow_imp.g_varchar2_table(38) := '7475726E2030213D3D412E77696474687D293B72657475726E20653F6E6577204228652E6C6566742B412E77696E646F77426F756E64732E6C6566742C652E746F702B412E77696E646F77426F756E64732E746F702C652E77696474682C652E68656967';
wwv_flow_imp.g_varchar2_table(39) := '6874293A422E454D5054597D2C422E454D5054593D6E6577204228302C302C302C30292C42293B66756E6374696F6E204228412C652C742C72297B746869732E6C6566743D412C746869732E746F703D652C746869732E77696474683D742C746869732E';
wwv_flow_imp.g_varchar2_table(40) := '6865696768743D727D666F722876617220663D66756E6374696F6E28412C65297B72657475726E20642E66726F6D436C69656E745265637428412C652E676574426F756E64696E67436C69656E74526563742829297D2C513D66756E6374696F6E284129';
wwv_flow_imp.g_varchar2_table(41) := '7B666F722876617220653D5B5D2C743D302C723D412E6C656E6774683B743C723B297B76617220422C6E3D412E63686172436F6465417428742B2B293B35353239363C3D6E26266E3C3D35363331392626743C723F35363332303D3D2836343531322628';
wwv_flow_imp.g_varchar2_table(42) := '423D412E63686172436F6465417428742B2B2929293F652E7075736828282831303233266E293C3C3130292B28313032332642292B3635353336293A28652E70757368286E292C742D2D293A652E70757368286E297D72657475726E20657D2C673D6675';
wwv_flow_imp.g_varchar2_table(43) := '6E6374696F6E28297B666F722876617220413D5B5D2C653D303B653C617267756D656E74732E6C656E6774683B652B2B29415B655D3D617267756D656E74735B655D3B696628537472696E672E66726F6D436F6465506F696E742972657475726E205374';
wwv_flow_imp.g_varchar2_table(44) := '72696E672E66726F6D436F6465506F696E742E6170706C7928537472696E672C41293B76617220743D412E6C656E6774683B69662821742972657475726E22223B666F722876617220723D5B5D2C423D2D312C6E3D22223B2B2B423C743B297B76617220';
wwv_flow_imp.g_varchar2_table(45) := '733D415B425D3B733C3D36353533353F722E707573682873293A28732D3D36353533362C722E707573682835353239362B28733E3E3130292C7325313032342B353633323029292C28422B313D3D3D747C7C31363338343C722E6C656E67746829262628';
wwv_flow_imp.g_varchar2_table(46) := '6E2B3D537472696E672E66726F6D43686172436F64652E6170706C7928537472696E672C72292C722E6C656E6774683D30297D72657475726E206E7D2C653D224142434445464748494A4B4C4D4E4F505152535455565758595A6162636465666768696A';
wwv_flow_imp.g_varchar2_table(47) := '6B6C6D6E6F707172737475767778797A303132333435363738392B2F222C6E3D22756E646566696E6564223D3D747970656F662055696E743841727261793F5B5D3A6E65772055696E7438417272617928323536292C733D303B733C652E6C656E677468';
wwv_flow_imp.g_varchar2_table(48) := '3B732B2B296E5B652E63686172436F646541742873295D3D733B666F7228766172206F3D224142434445464748494A4B4C4D4E4F505152535455565758595A6162636465666768696A6B6C6D6E6F707172737475767778797A303132333435363738392B';
wwv_flow_imp.g_varchar2_table(49) := '2F222C633D22756E646566696E6564223D3D747970656F662055696E743841727261793F5B5D3A6E65772055696E7438417272617928323536292C693D303B693C6F2E6C656E6774683B692B2B29635B6F2E63686172436F646541742869295D3D693B66';
wwv_flow_imp.g_varchar2_table(50) := '756E6374696F6E207728412C652C74297B72657475726E20412E736C6963653F412E736C69636528652C74293A6E65772055696E74313641727261792841727261792E70726F746F747970652E736C6963652E63616C6C28412C652C7429297D76617220';
wwv_flow_imp.g_varchar2_table(51) := '553D286C2E70726F746F747970652E6765743D66756E6374696F6E2841297B76617220653B696628303C3D41297B696628413C35353239367C7C35363331393C412626413C3D36353533352972657475726E20653D746869732E696E6465785B413E3E35';
wwv_flow_imp.g_varchar2_table(52) := '5D2C746869732E646174615B653D28653C3C32292B2833312641295D3B696628413C3D36353533352972657475726E20653D746869732E696E6465785B323034382B28412D35353239363E3E35295D2C746869732E646174615B653D28653C3C32292B28';
wwv_flow_imp.g_varchar2_table(53) := '33312641295D3B696628413C746869732E6869676853746172742972657475726E20653D746869732E696E6465785B653D323038302B28413E3E3131295D2C653D746869732E696E6465785B652B3D413E3E352636335D2C746869732E646174615B653D';
wwv_flow_imp.g_varchar2_table(54) := '28653C3C32292B2833312641295D3B696628413C3D313131343131312972657475726E20746869732E646174615B746869732E6869676856616C7565496E6465785D7D72657475726E20746869732E6572726F7256616C75657D2C6C293B66756E637469';
wwv_flow_imp.g_varchar2_table(55) := '6F6E206C28412C652C742C722C422C6E297B746869732E696E697469616C56616C75653D412C746869732E6572726F7256616C75653D652C746869732E6869676853746172743D742C746869732E6869676856616C7565496E6465783D722C746869732E';
wwv_flow_imp.g_varchar2_table(56) := '696E6465783D422C746869732E646174613D6E7D666F722876617220433D224142434445464748494A4B4C4D4E4F505152535455565758595A6162636465666768696A6B6C6D6E6F707172737475767778797A303132333435363738392B2F222C753D22';
wwv_flow_imp.g_varchar2_table(57) := '756E646566696E6564223D3D747970656F662055696E743841727261793F5B5D3A6E65772055696E7438417272617928323536292C463D303B463C432E6C656E6774683B462B2B29755B432E63686172436F646541742846295D3D463B66756E6374696F';
wwv_flow_imp.g_varchar2_table(58) := '6E207028412C652C742C72297B76617220423D725B745D3B69662841727261792E697341727261792841293F2D31213D3D412E696E6465784F662842293A413D3D3D4229666F7228766172206E3D743B6E3C3D722E6C656E6774683B297B696628286F3D';
wwv_flow_imp.g_varchar2_table(59) := '725B2B2B6E5D293D3D3D652972657475726E20313B6966286F213D3D4429627265616B7D696628423D3D3D4429666F72286E3D743B303C6E3B297B76617220733D725B2D2D6E5D3B69662841727261792E697341727261792841293F2D31213D3D412E69';
wwv_flow_imp.g_varchar2_table(60) := '6E6465784F662873293A413D3D3D7329666F7228766172206F2C693D743B693C3D722E6C656E6774683B297B696628286F3D725B2B2B695D293D3D3D652972657475726E20313B6966286F213D3D4429627265616B7D69662873213D3D4429627265616B';
wwv_flow_imp.g_varchar2_table(61) := '7D7D66756E6374696F6E204528412C65297B666F722876617220743D413B303C3D743B297B76617220723D655B745D3B69662872213D3D442972657475726E20723B742D2D7D72657475726E20307D66756E6374696F6E204928742C41297B7661722065';
wwv_flow_imp.g_varchar2_table(62) := '3D28423D66756E6374696F6E28412C72297B766F696420303D3D3D72262628723D2273747269637422293B76617220423D5B5D2C6E3D5B5D2C733D5B5D3B72657475726E20412E666F72456163682866756E6374696F6E28412C65297B76617220743D72';
wwv_flow_imp.g_varchar2_table(63) := '412E6765742841293B69662835303C743F28732E70757368282130292C742D3D3530293A732E70757368282131292C2D31213D3D5B226E6F726D616C222C226175746F222C226C6F6F7365225D2E696E6465784F6628722926262D31213D3D5B38323038';
wwv_flow_imp.g_varchar2_table(64) := '2C383231312C31323331362C31323434385D2E696E6465784F662841292972657475726E206E2E707573682865292C422E70757368283136293B69662834213D3D7426263131213D3D742972657475726E206E2E707573682865292C33313D3D3D743F42';
wwv_flow_imp.g_varchar2_table(65) := '2E707573682822737472696374223D3D3D723F4F3A71293A743D3D3D41417C7C32393D3D3D743F422E70757368284A293A34333D3D3D743F3133313037323C3D412626413C3D3139363630357C7C3139363630383C3D412626413C3D3236323134313F42';
wwv_flow_imp.g_varchar2_table(66) := '2E707573682871293A422E70757368284A293A766F696420422E707573682874293B696628303D3D3D652972657475726E206E2E707573682865292C422E70757368284A293B743D425B652D315D3B72657475726E2D313D3D3D69412E696E6465784F66';
wwv_flow_imp.g_varchar2_table(67) := '2874293F286E2E70757368286E5B652D315D292C422E70757368287429293A286E2E707573682865292C422E70757368284A29297D292C5B6E2C422C735D7D28742C28413D417C7C7B6C696E65427265616B3A226E6F726D616C222C776F726442726561';
wwv_flow_imp.g_varchar2_table(68) := '6B3A226E6F726D616C227D292E6C696E65427265616B29295B305D2C723D425B315D2C423D425B325D3B72657475726E5B652C723D22627265616B2D616C6C223D3D3D412E776F7264427265616B7C7C22627265616B2D776F7264223D3D3D412E776F72';
wwv_flow_imp.g_varchar2_table(69) := '64427265616B3F722E6D61702866756E6374696F6E2841297B72657475726E2D31213D3D5B522C4A2C41415D2E696E6465784F662841293F713A417D293A722C226B6565702D616C6C223D3D3D412E776F7264427265616B3F422E6D61702866756E6374';
wwv_flow_imp.g_varchar2_table(70) := '696F6E28412C65297B72657475726E2041262631393936383C3D745B655D2626745B655D3C3D34303935397D293A766F696420305D7D76617220792C4B2C6D2C4C2C622C443D31302C763D31332C783D31352C4D3D31372C533D31382C543D31392C473D';
wwv_flow_imp.g_varchar2_table(71) := '32302C4F3D32312C563D32322C6B3D32342C523D32352C4E3D32362C503D32372C583D32382C4A3D33302C593D33322C573D33332C5A3D33342C5F3D33352C713D33372C6A3D33382C7A3D33392C243D34302C41413D34322C65413D5B393030312C3635';
wwv_flow_imp.g_varchar2_table(72) := '3238385D2C74413D22C397222C72413D286D3D66756E6374696F6E2841297B76617220652C742C722C422C6E3D2E37352A412E6C656E6774682C733D412E6C656E6774682C6F3D303B223D223D3D3D415B412E6C656E6774682D315D2626286E2D2D2C22';
wwv_flow_imp.g_varchar2_table(73) := '3D223D3D3D415B412E6C656E6774682D325D26266E2D2D293B666F7228766172206E3D6E65772822756E646566696E656422213D747970656F66204172726179427566666572262622756E646566696E656422213D747970656F662055696E7438417272';
wwv_flow_imp.g_varchar2_table(74) := '61792626766F69642030213D3D55696E743841727261792E70726F746F747970652E736C6963653F41727261794275666665723A417272617929286E292C693D41727261792E69734172726179286E293F6E3A6E65772055696E74384172726179286E29';
wwv_flow_imp.g_varchar2_table(75) := '2C513D303B513C733B512B3D3429653D635B412E63686172436F646541742851295D2C743D635B412E63686172436F6465417428512B31295D2C723D635B412E63686172436F6465417428512B32295D2C423D635B412E63686172436F6465417428512B';
wwv_flow_imp.g_varchar2_table(76) := '33295D2C695B6F2B2B5D3D653C3C327C743E3E342C695B6F2B2B5D3D2831352674293C3C347C723E3E322C695B6F2B2B5D3D28332672293C3C367C363326423B72657475726E206E7D28793D224B77414141414141414141414341344155443041414441';
wwv_flow_imp.g_varchar2_table(77) := '674141414341414141414141494142414147414241414567415541425941474141614142674147674159674271414638415A77426741476741635142354148554166514346414930416C514364414B494171674379414C6F415941426F41474141614142';
wwv_flow_imp.g_varchar2_table(78) := '67414767417767444B4147414161414447414D344130774462414F45413651447841506B414151454A4151384246774631414830414841456B415377424E414536415549425151464A415645425751466841576742634146344154414167414747415934';
wwv_flow_imp.g_varchar2_table(79) := '426C514758415A3842707747764162554276514846416330423077486241654D423677487841666B424151494A417645424551495A416945434B514978416A674351414A47416B344356674A65416D514362414A30416E774367514B4A417045436D514B';
wwv_flow_imp.g_varchar2_table(80) := '674171674373414B344172774378414977414D774330774C62416A414134774C7241764D432B4149414177634444774D774142634448514D6C417930444E514E314144304451514E4A41306B4453514E524131454456774E5A41316B4464514231414745';
wwv_flow_imp.g_varchar2_table(81) := '44645142704132304464514E31414873446451434241346B446B514E31414855416D514F68413355416451423141485541645142314148554164514231414855416451423141485541645142314148554164514231414B594472674E314148554174674F';
wwv_flow_imp.g_varchar2_table(82) := '2B413859447A675057417863443367506A412B734438774E31414855412B774D4442416B456451414E424255454851516C42436F4546774D7942446745594142414242634453415251424667455941526F424441416341517A4158674567415349424A41';
wwv_flow_imp.g_varchar2_table(83) := '4564514358424855416E77536E424B344574675336424D49457941523141485541645142314148554164514356414E41455941426741474141594142674147414159414267414E674559414463424F514559414473425051452F41514542517746464155';
wwv_flow_imp.g_varchar2_table(84) := '63425351464C41553042575145504156454255734655775662425741415967566741476F46636756364259494669675752425741416D51576642615946594142674147414159414267414B6F465941437842624146755157364263454677515848426345';
wwv_flow_imp.g_varchar2_table(85) := '467751585042644D463277586A42656F4638675836425149474367595342686F4749675971426A49474F675A674144344752675A4D426D414155775A61426D41415941426741474141594142674147414159414267414741415941426741474947594142';
wwv_flow_imp.g_varchar2_table(86) := '70426E414759414267414741415941426741474141594142674147414159414234426E384768515A674147414159414231414863444651534C426D414159414267414A4D4764514139413355416D77616A4271734771776156414C4D4775776244426A41';
wwv_flow_imp.g_varchar2_table(87) := '417977625342744947315162534274494730676253427449473067626442754D473677627A427673474177634C42784D484177636242794D484A776373427977484D516373423949474F4164414230674854676653426B67485667665342744947306762';
wwv_flow_imp.g_varchar2_table(88) := '5342744947306762534274494730676253426977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977';
wwv_flow_imp.g_varchar2_table(89) := '484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C4163';
wwv_flow_imp.g_varchar2_table(90) := '73427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977';
wwv_flow_imp.g_varchar2_table(91) := '484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C4163';
wwv_flow_imp.g_varchar2_table(92) := '73427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977';
wwv_flow_imp.g_varchar2_table(93) := '484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416467414741414C416373427977484C416373427977484C416373427977484C4163';
wwv_flow_imp.g_varchar2_table(94) := '73427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977';
wwv_flow_imp.g_varchar2_table(95) := '484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C4163';
wwv_flow_imp.g_varchar2_table(96) := '73427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977';
wwv_flow_imp.g_varchar2_table(97) := '484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C4163';
wwv_flow_imp.g_varchar2_table(98) := '73427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977';
wwv_flow_imp.g_varchar2_table(99) := '484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C4163';
wwv_flow_imp.g_varchar2_table(100) := '73427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977';
wwv_flow_imp.g_varchar2_table(101) := '484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C4163';
wwv_flow_imp.g_varchar2_table(102) := '73427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977';
wwv_flow_imp.g_varchar2_table(103) := '484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C4163';
wwv_flow_imp.g_varchar2_table(104) := '73427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977';
wwv_flow_imp.g_varchar2_table(105) := '484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C4163';
wwv_flow_imp.g_varchar2_table(106) := '73427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977';
wwv_flow_imp.g_varchar2_table(107) := '484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C4163';
wwv_flow_imp.g_varchar2_table(108) := '73427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977';
wwv_flow_imp.g_varchar2_table(109) := '484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C4163';
wwv_flow_imp.g_varchar2_table(110) := '73427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977';
wwv_flow_imp.g_varchar2_table(111) := '484C416373427977484C416373427977484C41646242324D484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C4163';
wwv_flow_imp.g_varchar2_table(112) := '73427977484C416373427977484C41637342326B4830675A774236344564514231414855416451423141485541645142314148554866516467414955486A516431414855416C516564423241415941436C423673485941437A4237594876676647423355';
wwv_flow_imp.g_varchar2_table(113) := '417A676657427A4D423367666D4231454237676631422F30486C51454E4151554944516831414255494851676C434263444C516731434430495251684E4345454455776831414855416451426243474D495A41686C434759495A77686F43476B49597768';
wwv_flow_imp.g_varchar2_table(114) := '6B434755495A67686E434767496151686A434751495A51686D434763496141687043474D495A41686C434759495A77686F43476B495977686B434755495A67686E434767496151686A434751495A51686D434763496141687043474D495A41686C434759';
wwv_flow_imp.g_varchar2_table(115) := '495A77686F43476B495977686B434755495A67686E434767496151686A434751495A51686D434763496141687043474D495A41686C434759495A77686F43476B495977686B434755495A67686E434767496151686A434751495A51686D43476349614168';
wwv_flow_imp.g_varchar2_table(116) := '7043474D495A41686C434759495A77686F43476B495977686B434755495A67686E434767496151686A434751495A51686D434763496141687043474D495A41686C434759495A77686F43476B495977686B434755495A67686E434767496151686A434751';
wwv_flow_imp.g_varchar2_table(117) := '495A51686D434763496141687043474D495A41686C434759495A77686F43476B495977686B434755495A67686E434767496151686A434751495A51686D434763496141687043474D495A41686C434759495A77686F43476B495977686B434755495A6768';
wwv_flow_imp.g_varchar2_table(118) := '6E434767496151686A434751495A51686D434763496141687043474D495A41686C434759495A77686F43476B495977686B434755495A67686E434767496151686A434751495A51686D434763496141687043474D495A41686C434759495A77686F43476B';
wwv_flow_imp.g_varchar2_table(119) := '495977686B434755495A67686E434767496151686A434751495A51686D434763496141687043474D495A41686C434759495A77686F43476B495977686B434755495A67686E434767496151686A434751495A51686D434763496141687043474D495A4168';
wwv_flow_imp.g_varchar2_table(120) := '6C434759495A77686F43476B495977686B434755495A67686E434767496151686A434751495A51686D434763496141687043474D495A41686C434759495A77686F43476B495977686B434755495A67686E434767496151686A434751495A51686D434763';
wwv_flow_imp.g_varchar2_table(121) := '496141687043474D495A41686C434759495A77686F43476B495977686B434755495A67686E434767496151686A434751495A51686D434763496141687043474D495A41686C434759495A77686F43476B495977686B434755495A67686E43476749615168';
wwv_flow_imp.g_varchar2_table(122) := '6A434751495A51686D434763496141687043474D495A41686C434759495A77686F43476B495977686B434755495A67686E434767496151686A434751495A51686D434763496141687043474D495A41686C434759495A77686F43476B495977686B434755';
wwv_flow_imp.g_varchar2_table(123) := '495A67686E434767496341683343486F494D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D4141';
wwv_flow_imp.g_varchar2_table(124) := '7741494949676769434349494967676943434949496767694343494949676769434349494967676943434949496767694343494949676769434349494967676943434949496767694343494949676769434349494967676777414441414D414177414441';
wwv_flow_imp.g_varchar2_table(125) := '414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D4141';
wwv_flow_imp.g_varchar2_table(126) := '77414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441';
wwv_flow_imp.g_varchar2_table(127) := '414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D4141';
wwv_flow_imp.g_varchar2_table(128) := '77414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441';
wwv_flow_imp.g_varchar2_table(129) := '414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D4141';
wwv_flow_imp.g_varchar2_table(130) := '77414441414D414177414441414D414177414441414C416373427977484C416373427977484C416373427977484C41637342346F494C4163734234344930676157434A344970676831414855417167697943485541645142314148554164514231414855';
wwv_flow_imp.g_varchar2_table(131) := '416451423141485541747768384158554176776831414D554979516A52434E6B4934416A6F4348554164514231414F344939676A2B4341594A44676B544353304847776B6A43594949676769434349494967676943434949496767694343494949676769';
wwv_flow_imp.g_varchar2_table(132) := '4343494949676769434349494967676943434949496767694343494949676769434349494967676943434949496767694343494949676769414149414141414641415941426741474941587742674148454164514246414A55416F674379414B41415941';
wwv_flow_imp.g_varchar2_table(133) := '42674145494134414247414E4D4134514478414D454244774531414677424C4145364151454255514634516B68436D454B6F517268436741484951734142304D4C414163414277414841416544433641426F41484443774D4D4141634142774148414164';
wwv_flow_imp.g_varchar2_table(134) := '4444474D4D4141634142364D4D3477776A44574D4E6F77336A446141426F414767416141426F414767416141426F414767416141426F414767416141426F414767416141426F414767416141426F41456A44714142577736624471414270673667416141';
wwv_flow_imp.g_varchar2_table(135) := '426F4148634476774F50412B674161414266412F384476774F2F4137384476774F2F4137384476774F2F4137384476774F2F4137384476774F2F4137384476774F2F4137384476774F2F4137384476774F2F4137384476774F2F41373844706350414163';
wwv_flow_imp.g_varchar2_table(136) := '41427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741';
wwv_flow_imp.g_varchar2_table(137) := '48414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163';
wwv_flow_imp.g_varchar2_table(138) := '41427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741';
wwv_flow_imp.g_varchar2_table(139) := '48414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163';
wwv_flow_imp.g_varchar2_table(140) := '41427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741';
wwv_flow_imp.g_varchar2_table(141) := '48414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163';
wwv_flow_imp.g_varchar2_table(142) := '41427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741';
wwv_flow_imp.g_varchar2_table(143) := '48414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163';
wwv_flow_imp.g_varchar2_table(144) := '41427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341423963504B776B7943546F4A4D414231414855416451424343556F4A54516C314146554A58416C6A4357634A61776B77414441';
wwv_flow_imp.g_varchar2_table(145) := '414D41417741484D4A645142324358344A6451434543596F4A6A676D57435855416E676B7741474141594142784148554170676E334136344A74416C31414C6B4A64514441435441414D4141774144414164514231414855416451423141485541645142';
wwv_flow_imp.g_varchar2_table(146) := '31414855416F77594E424D55494D414177414441414D4144494363734A30776E5A4352554534516B77414F6B4A38416E34435441414D4142314141414B767768314141674B44776F584368384B645141774143634B4C6770314144594B71416D49435434';
wwv_flow_imp.g_varchar2_table(147) := '4B52676F7741444141645142314145344B4D4142314146594B64514265436E55415A516F77414441414D414177414441414D414177414441414D4141564248554162516F7741444141645143354358554B4D414177414877427841696A426F67454D6746';
wwv_flow_imp.g_varchar2_table(148) := '39436F514B6941534D4370514B6D677149424B494B71677175436F6745445147324372344B7867724C436A41414D4144544374734B4367486A4375734B385172354367454C4D414177414441414D4142314149734543517352433355414E41455A437A41';
wwv_flow_imp.g_varchar2_table(149) := '414D414177414441414D4142314143454C4B517377414855414E414578437A6B4C6451424243306B4C4D41425243316B4C4D414177414441414D4141774144414164514268437A41414D41417741474141594142704333454C6477742F437A41414D4143';
wwv_flow_imp.g_varchar2_table(150) := '484334734C6B7775624335384C70777431414B344C74677431415073444D414177414441414D414177414441414D414177414C344C7777764C4339494C31777664437A41414D41446C432B6B4C38517635432F384C53517377414441414D414177414441';
wwv_flow_imp.g_varchar2_table(151) := '414D414177414441414D414148444441414D414177414441414D41414F4442594D48677831414855416451423141485541645142314148554164514231414855416451423141485541645142314148554164514231414855416451423141485541645142';
wwv_flow_imp.g_varchar2_table(152) := '3141485541645142314143594D4D4141774144414164514231414855414C67783141485541645142314148554164514132444441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441';
wwv_flow_imp.g_varchar2_table(153) := '414D4141774148554164514231414855416451423141485541645142314148554164514231414855416451423141485541645142314144344D645142474448554164514231414855416451423141456B4D6451423141485541645142314146414D4D4141';
wwv_flow_imp.g_varchar2_table(154) := '77414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D41417741485541645142314148554164514231414855';
wwv_flow_imp.g_varchar2_table(155) := '41645142314148554164514231414855416451425944485541645142314146384D4D414177414441414D414177414441414D414177414441414D414177414441414D41423141485541645142314148554164514231414855416451423141485541645142';
wwv_flow_imp.g_varchar2_table(156) := '314148554164514231414855412B774D564247634D4D41417741487742627778314148634D667779484449384D4D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441';
wwv_flow_imp.g_varchar2_table(157) := '4159414267414A634D4D4141774144414164514231414A384D6C51436C444441414D414374444377484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C4163';
wwv_flow_imp.g_varchar2_table(158) := '73427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977';
wwv_flow_imp.g_varchar2_table(159) := '484C4163734237554D4C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C41637342797748645142314148554164514231414855416451423141485541645142';
wwv_flow_imp.g_varchar2_table(160) := '314148554164514231414130454D414339444441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414173427977484C416373427977484C416373427977';
wwv_flow_imp.g_varchar2_table(161) := '484C516377414D454D79417773427977484C416373427977484C416373427977484C416373427977487A417777414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D4141';
wwv_flow_imp.g_varchar2_table(162) := '77414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D4141774148554164514231414E514D32517A68444441414D414177414441414D414177414441414D414177414441414D414177414441';
wwv_flow_imp.g_varchar2_table(163) := '414D414177414441414D414177414441414D414177414441414D414177414441414D41426741474141594142674147414159414267414F6B4D59414478444741412B4177414451594E59414268435741415941414F445441414D41417741444141466731';
wwv_flow_imp.g_varchar2_table(164) := '674147414148673337417A41414D41417741444141594142674143594E594141734454514E5041316741454D4E5067314C44574141594142674147414159414267414741415941426741474141556731614459734756676C684456304E6351426E445730';
wwv_flow_imp.g_varchar2_table(165) := '4E6451313544574141594142674147414159414267414741415941426741474141594142674147414159414267414741416C514342445A554169413250445A634E4D414177414441414D414177414441414D414177414441414D414177414441414D4141';
wwv_flow_imp.g_varchar2_table(166) := '77414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441416E77326E445441414D414177414441414D414177414855';
wwv_flow_imp.g_varchar2_table(167) := '4172773233445441414D414177414441414D414177414441414D414177414441414D414231414C384E4D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D4141';
wwv_flow_imp.g_varchar2_table(168) := '77414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414231414855416451423141485541645144484454414159414267414D384E4D414177414441414D414177414441414D414177414441';
wwv_flow_imp.g_varchar2_table(169) := '414D414177414441414D414177414441414D414177414441414D414177414441414D4141774144414131773131414E774E4D4141774144304235413077414441414D414177414441414D4144734466514E2F4130454467774F464134774142734F4D4141';
wwv_flow_imp.g_varchar2_table(170) := '77414441414D414177414441414D414177414E4947306762534274494730676253427449473067596A4469674F77515575447345464D773753426A6F4F30676253427449473067625342744947306762534274494730676253427449475167354B446C49';
wwv_flow_imp.g_varchar2_table(171) := '4F56673753427449475867356C446D304F645137534274494766513645446F6F4F6A513655447449476D673668447449473067616F4471774F306761304472774F30675A674147414159414445446D41415941416B427449477A413567414E494F594144';
wwv_flow_imp.g_varchar2_table(172) := '61446F6B4F306762534274384F357737534275384F306762314476774F30675A674147414178413753427449473067625342744947594142674147414159414145443241417341554D443949473067625342744947306762534274494730676253427449';
wwv_flow_imp.g_varchar2_table(173) := '47306762534274494730676253427449473067625342744947306762534274494730676253427449473067625342744947306762534274494746413873427977484C416373427977484C416373427977484C416373427977484C416373427977484C4163';
wwv_flow_imp.g_varchar2_table(174) := '73427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977';
wwv_flow_imp.g_varchar2_table(175) := '484C416363443949474C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C4163';
wwv_flow_imp.g_varchar2_table(176) := '73427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484A413873427977484C416373427977484C416363447977484C416373427977484C416373427977';
wwv_flow_imp.g_varchar2_table(177) := '484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C4163';
wwv_flow_imp.g_varchar2_table(178) := '73427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977504C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977';
wwv_flow_imp.g_varchar2_table(179) := '484C416373427977484C416373427977484C416373427977484C416373427977484C416330443949473067625342744947306762534274494730676253427449473067625342744947306762534274494730676253427449473067625342744947306762';
wwv_flow_imp.g_varchar2_table(180) := '53427449473067625342744947306762534274494730676253427449473067625342744947306762534274494730676253427449473067625342744947306762534274494730676253427449473067625342744947306762534274494730676253427449';
wwv_flow_imp.g_varchar2_table(181) := '4730676253427449474C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C4163634439494730676253427449473067625342744947306762534274494730676253427449473067625342744947306762';
wwv_flow_imp.g_varchar2_table(182) := '534274494730676253427449473067625342744947306762534274494730676253427449473067625342744947306762534274494730676253427449473067625342744947306762534274494746413873427977484C416373427977484C416373427977';
wwv_flow_imp.g_varchar2_table(183) := '484C416373427977484C416373427977484C416373427977484C416373427977484C416373427977484C4163734279774850412F534274494730676253427449473067625342744947306762534274494730676253427449473067625342744947306762';
wwv_flow_imp.g_varchar2_table(184) := '53427449473067625342744947306762534274494730676253427449473067625342744947306762534274494730676253427449473067625342744947306762534274494730676253427449473067625342744947306762534274494730676253427449';
wwv_flow_imp.g_varchar2_table(185) := '473067625342744947306762534274494730675955443051506C514356414A55414D414177414441414D414356414A55416C514356414A55416C514356414577504D414177414441414D414177414441414D414177414441414D414177414441414D4141';
wwv_flow_imp.g_varchar2_table(186) := '77414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441412F2F3845414151';
wwv_flow_imp.g_varchar2_table(187) := '41424141454141514142414145414151414241414E41414D41415141424141494142414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514143674154414263414867416241426F41486741';
wwv_flow_imp.g_varchar2_table(188) := '5841425941456741654142734147414150414267414841424C414573415377424C414573415377424C414573415377424C414267414741416541423441486741544142344155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(189) := '41554142514146414155414251414641415541425141464141554142514146414155414251414259414777415341423441486741654146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(190) := '51414641415541425141464141554142514146414155414157414130414551416541415141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(191) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(192) := '414141414141414172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(193) := '414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741724141514142414145414151414241414641415141424141';
wwv_flow_imp.g_varchar2_table(194) := '454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414A4142594147674162414273414777416541423041485141654145384146774165414130';
wwv_flow_imp.g_varchar2_table(195) := '414867416541426F4147774250414538414467425141423041485141644145384154774158414538415477425041425941554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(196) := '51414641415541425141423041486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674164414641';
wwv_flow_imp.g_varchar2_table(197) := '41554142514146414155414251414641415541416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(198) := '65414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414641';
wwv_flow_imp.g_varchar2_table(199) := '41486741654142344148674165414234414867416541423441486741654142344148674165414234414867425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(200) := '51414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(201) := '41554142514146414155414251414641415541416541423441486741654146414154774241414538415477425041454141547742514146414154774251414234414867416541423441486741654142304148514164414230414867416441423441446742';
wwv_flow_imp.g_varchar2_table(202) := '51414641415541425141464141486741654142344148674165414234414867425141423441554141654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441424141454141514142414145414151';
wwv_flow_imp.g_varchar2_table(203) := '41424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(204) := '454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414A414151414241414541415141424141454141514142414145414151414241414541416B';
wwv_flow_imp.g_varchar2_table(205) := '414351414A41416B414351414A41416B4142414145414151414241414541415141424141454141514142414145414151414241416541423441486741654146414148674165414234414B77417241464141554142514146414147414251414373414B7741';
wwv_flow_imp.g_varchar2_table(206) := '72414373414867416541464141486742514146414155414172414641414B774165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414B7741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(207) := '41486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441424141454141514142414145414151414241416541423441486741';
wwv_flow_imp.g_varchar2_table(208) := '65414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(209) := '41486741654142344148674165414234414867416541423441486741654142344148674172414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(210) := '51414641415541417241437341554141654142344148674165414234414867425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(211) := '415541425141464141554142514146414155414159414130414B7741724142344148674162414373414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(212) := '45414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141445141454142344142414145414234414241414541424D4142414172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(213) := '414B774172414373415667425741465941566742574146594156674257414659415667425741465941566742574146594156674257414659415667425741465941566742574146594156674257414659414B774172414373414B77425741465941566742';
wwv_flow_imp.g_varchar2_table(214) := '574142344148674172414373414B774172414373414B774172414373414B774172414373414867416541423441486741654142344148674165414234414767416141426F4147414159414234414867414541415141424141454141514142414145414151';
wwv_flow_imp.g_varchar2_table(215) := '41424141454141514145774145414373414577415441464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(216) := '5141464141554142514146414155414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241424C414573415377424C414573415377424C414573415377424C41426F';
wwv_flow_imp.g_varchar2_table(217) := '414751415A41423441554142514141514155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141424D4155414145414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(218) := '45414234414867414541415141424141454141514142414251414641414241414541423441424141454141514142414251414641415377424C414573415377424C414573415377424C414573415377425141464141554141654142344155414165414234';
wwv_flow_imp.g_varchar2_table(219) := '4148674165414234414867416541423441486741654142344148674165414234414B774165414641414241425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(220) := '51414641415541425141464141554142514146414155414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414373414B77425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(221) := '41554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(222) := '51414641415541425141464141554142514146414142414145414151414241414541415141424141454141514142414145414641414B774172414373414B774172414373414B774172414373414B774172414373414B774172414573415377424C414573';
wwv_flow_imp.g_varchar2_table(223) := '415377424C414573415377424C414573415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(224) := '514146414142414145414151414241414541415141424141454141514155414251414234414867415941424D4155414172414373414241416241427341554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(225) := '415541425141464141554142514146414155414145414151414241414541464141424141454141514142414145414641414241414541415141554141454141514142414145414151414B7741724142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(226) := '65414234414867416541423441486741654143734155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554141454141514142414172414373';
wwv_flow_imp.g_varchar2_table(227) := '41486741724146414155414251414641415541425141464141554142514146414155414172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B77425141464141554142';
wwv_flow_imp.g_varchar2_table(228) := '51414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414172414641415541425141464141554142514146414155414251414641414B774172414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(229) := '414B7741724141514142414145414151414241414541415141424141454141514142414145414151414241414541423441424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(230) := '45414151414241414541415141424141454141514142414145414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(231) := '41554142514141514142414145414641414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151415541414541415141424141454141514142414145414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(232) := '5141464141554142514146414142414145414130414451424C414573415377424C414573415377424C414573415377424C414234415541425141464141554142514146414155414251414641415541425141464141554142514146414155414145414151';
wwv_flow_imp.g_varchar2_table(233) := '41424141724146414155414251414641415541425141464141554141724143734155414251414373414B7742514146414155414251414641415541425141464141554142514146414155414251414641414B774251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(234) := '514143734155414172414373414B7742514146414155414251414373414B7741454146414142414145414151414241414541415141424141724143734142414145414373414B7741454141514142414251414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(235) := '414B774145414373414B774172414373415541425141437341554142514146414142414145414373414B77424C414573415377424C414573415377424C414573415377424C414641415541416141426F4155414251414641415541425141457741486741';
wwv_flow_imp.g_varchar2_table(236) := '624146414148674145414373414B774145414151414241417241464141554142514146414155414251414373414B7741724143734155414251414373414B7742514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(237) := '414B77425141464141554142514146414155414251414373415541425141437341554142514143734155414251414373414B77414541437341424141454141514142414145414373414B7741724143734142414145414373414B77414541415141424141';
wwv_flow_imp.g_varchar2_table(238) := '72414373414B774145414373414B774172414373414B77417241437341554142514146414155414172414641414B774172414373414B774172414373414B77424C414573415377424C414573415377424C414573415377424C4141514142414251414641';
wwv_flow_imp.g_varchar2_table(239) := '4155414145414234414B774172414373414B774172414373414B774172414373414B77414541415141424141724146414155414251414641415541425141464141554142514143734155414251414641414B774251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(240) := '5141464141554142514146414155414251414641414B77425141464141554142514146414155414251414373415541425141437341554142514146414155414251414373414B774145414641414241414541415141424141454141514142414145414373';
wwv_flow_imp.g_varchar2_table(241) := '4142414145414151414B77414541415141424141724143734155414172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7742514146414142414145414373414B77424C414573415377424C41457341537742';
wwv_flow_imp.g_varchar2_table(242) := '4C414573415377424C4142344147774172414373414B774172414373414B77417241464141424141454141514142414145414151414B77414541415141424141724146414155414251414641415541425141464141554141724143734155414251414373';
wwv_flow_imp.g_varchar2_table(243) := '414B7742514146414155414251414641415541425141464141554142514146414155414251414151414241414541415141424141724143734142414145414373414B7741454141514142414172414373414B774172414373414B77417241415141424141';
wwv_flow_imp.g_varchar2_table(244) := '45414373414B774172414373415541425141437341554142514146414142414145414373414B77424C414573415377424C414573415377424C414573415377424C414234415541425141464141554142514146414155414172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(245) := '414B774172414373414B774172414151415541417241464141554142514146414155414251414373414B774172414641415541425141437341554142514146414155414172414373414B774251414641414B7742514143734155414251414373414B7741';
wwv_flow_imp.g_varchar2_table(246) := '724146414155414172414373414B7742514146414155414172414373414B7742514146414155414251414641415541425141464141554142514146414155414172414373414B77417241415141424141454141514142414172414373414B774145414151';
wwv_flow_imp.g_varchar2_table(247) := '41424141724141514142414145414151414B774172414641414B774172414373414B7741724143734142414172414373414B774172414373414B774172414373414B774172414573415377424C414573415377424C414573415377424C41457341554142';
wwv_flow_imp.g_varchar2_table(248) := '51414641414867416541423441486741654142344147774165414373414B774172414373414B77414541415141424141454141514155414251414641415541425141464141554142514143734155414251414641414B7742514146414155414251414641';
wwv_flow_imp.g_varchar2_table(249) := '415541425141464141554142514146414155414251414641415541417241464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B7741724143734155414145414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(250) := '454143734142414145414151414B7741454141514142414145414373414B774172414373414B77417241437341424141454143734155414251414641414B774172414373414B7741724146414155414145414151414B774172414573415377424C414573';
wwv_flow_imp.g_varchar2_table(251) := '415377424C414573415377424C414573414B774172414373414B774172414373414B77414F414641415541425141464141554142514146414148674251414151414241414541413441554142514146414155414251414641415541425141437341554142';
wwv_flow_imp.g_varchar2_table(252) := '51414641414B77425141464141554142514146414155414251414641415541425141464141554142514146414155414172414641415541425141464141554142514146414155414251414641414B7742514146414155414251414641414B774172414151';
wwv_flow_imp.g_varchar2_table(253) := '4155414145414151414241414541415141424141454143734142414145414151414B7741454141514142414145414373414B774172414373414B7741724143734142414145414373414B774172414373414B774172414373415541417241464141554141';
wwv_flow_imp.g_varchar2_table(254) := '45414151414B774172414573415377424C414573415377424C414573415377424C414573414B774251414641414B774172414373414B774172414373414B774172414373414B774172414373414B77414541415141424141454146414155414251414641';
wwv_flow_imp.g_varchar2_table(255) := '415541425141464141554142514143734155414251414641414B7742514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(256) := '514146414142414145414641414241414541415141424141454141514142414172414151414241414541437341424141454141514142414251414234414B774172414373414B774251414641415541414541464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(257) := '41554142514146414142414145414373414B77424C414573415377424C414573415377424C414573415377424C41464141554142514146414155414251414641415541425141426F41554142514146414155414251414641414B77414541415141424141';
wwv_flow_imp.g_varchar2_table(258) := '72414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414373414B77417241464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(259) := '415541425141464141554141724146414155414251414641415541425141464141554142514143734155414172414373415541425141464141554142514146414155414172414373414B774145414373414B774172414373414241414541415141424141';
wwv_flow_imp.g_varchar2_table(260) := '45414151414B774145414373414241414541415141424141454141514142414145414373414B774172414373414B774172414573415377424C414573415377424C414573415377424C414573414B7741724141514142414165414373414B774172414373';
wwv_flow_imp.g_varchar2_table(261) := '414B774172414373414B774172414373414B77417241467741584142634146774158414263414677415841426341467741584142634146774158414263414677415841426341467741584142634146774158414263414677415841426341467741584142';
wwv_flow_imp.g_varchar2_table(262) := '634146774158414171414677415841417141436F414B67417141436F414B674171414373414B77417241437341477742634146774158414263414677415841426341436F414B67417141436F414B67417141436F414B674165414573415377424C414573';
wwv_flow_imp.g_varchar2_table(263) := '415377424C414573415377424C414573414451414E414373414B774172414373414B774263414677414B77426341437341584142634146774158414263414373415841426341467741584142634146774158414263414677415841426341467741584142';
wwv_flow_imp.g_varchar2_table(264) := '63414677415841426341467741584142634143734158414172414677415841426341467741584142634146774158414263414677414B674263414677414B67417141436F414B67417141436F414B67417141436F41584141724143734158414263414677';
wwv_flow_imp.g_varchar2_table(265) := '4158414263414373415841417241436F414B67417141436F414B674171414373414B77424C414573415377424C414573415377424C414573415377424C414373414B7742634146774158414263414641414467414F414134414467416541413441446741';
wwv_flow_imp.g_varchar2_table(266) := '4A414134414467414E41416B414577415441424D414577415441416B4148674154414234414867416541415141424141654142344148674165414234414867424C414573415377424C414573415377424C414573415377424C4146414155414251414641';
wwv_flow_imp.g_varchar2_table(267) := '41554142514146414155414251414641414451414541423441424141654141514146674152414259414551414541415141554142514146414155414251414641415541425141437341554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(268) := '514146414155414251414641415541425141464141554142514146414155414251414641414B774172414373414B774145414151414241414541415141424141454141514142414145414151414241414541415141445141454141514142414145414151';
wwv_flow_imp.g_varchar2_table(269) := '41445141454141514155414251414641415541425141415141424141454141514142414145414151414241414541415141424141724141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(270) := '4541415141424141454141514142414145414151414241414541415141424141454141514142414172414130414451416541423441486741654142344148674145414234414867416541423441486741654143734148674165414134414467414E414134';
wwv_flow_imp.g_varchar2_table(271) := '4148674165414234414867416541416B4143514172414373414B7741724143734158414263414677415841426341467741584142634146774158414263414677415841426341467741584142634146774158414263414677415841426341467741584142';
wwv_flow_imp.g_varchar2_table(272) := '6341467741584142634146774158414263414677415841426341436F414B67417141436F414B67417141436F414B67417141436F414B67417141436F414B67417141436F414B67417141436F414B674263414573415377424C414573415377424C414573';
wwv_flow_imp.g_varchar2_table(273) := '415377424C414573414451414E414234414867416541423441584142634146774158414263414677414B67417141436F414B674263414677415841426341436F414B674171414677414B67417141436F415841426341436F414B67417141436F414B6741';
wwv_flow_imp.g_varchar2_table(274) := '7141436F4158414263414677414B67417141436F414B674263414677415841426341467741584142634146774158414263414677415841426341436F414B67417141436F414B67417141436F414B67417141436F414B674171414677414B67424C414573';
wwv_flow_imp.g_varchar2_table(275) := '415377424C414573415377424C414573415377424C41436F414B67417141436F414B674171414641415541425141464141554142514143734155414172414373414B77417241437341554141724143734155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(276) := '51414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414867425141464141554142514146674157414259414667415741425941466741574142594146674157414259414667';
wwv_flow_imp.g_varchar2_table(277) := '415741425941466741574142594146674157414259414667415741425941466741574142594146674157414259414667415741425A41466B415751425A41466B415751425A41466B415751425A41466B415751425A41466B415751425A41466B41575142';
wwv_flow_imp.g_varchar2_table(278) := '5A41466B415751425A41466B415751425A41466B415751425A41466B415751425A41466B415767426141466F415767426141466F415767426141466F415767426141466F415767426141466F415767426141466F415767426141466F415767426141466F';
wwv_flow_imp.g_varchar2_table(279) := '415767426141466F415767426141466F415767426141464141554142514146414155414251414641415541425141437341554142514146414155414172414373415541425141464141554142514146414155414172414641414B77425141464141554142';
wwv_flow_imp.g_varchar2_table(280) := '51414373414B7742514146414155414251414641415541425141464141554141724146414155414251414641414B774172414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414172414641';
wwv_flow_imp.g_varchar2_table(281) := '4155414251414641414B77417241464141554142514146414155414251414641414B7742514143734155414251414641415541417241437341554142514146414155414251414641415541425141464141554142514146414155414251414641414B7742';
wwv_flow_imp.g_varchar2_table(282) := '5141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B7742514146414155414251414373414B7742514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(283) := '415541425141464141554142514146414155414251414641415541425141464141554141724143734142414145414151414867414E4142344148674165414234414867416541423441554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(284) := '51414641415541425141464141554142514146414155414251414373414B77417241464141554142514146414155414251414641415541425141464141554142514146414155414251414641414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(285) := '4148674172414373414B774172414373414B7742514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414373414B774251414641415541425141464141554141';
wwv_flow_imp.g_varchar2_table(286) := '72414373414451425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414148674165414641';
wwv_flow_imp.g_varchar2_table(287) := '41554142514146414155414251414641415541425141464141554142514146414155414251414641415541414E41464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(288) := '5141464141554142514146414155414157414245414B7741724143734155414251414641415541425141464141554142514146414155414251414130414451414E4146414155414251414641415541425141464141554142514146414155414172414373';
wwv_flow_imp.g_varchar2_table(289) := '414B774172414373414B7741724146414155414251414641415541425141464141554142514146414155414251414641414B77425141464141554142514141514142414145414373414B774172414373414B774172414373414B774172414373414B7742';
wwv_flow_imp.g_varchar2_table(290) := '51414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414145414151414241414E414130414B774172414373414B774172414373414B77417241437341554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(291) := '41554142514146414155414251414641415541425141464141554142514146414142414145414373414B774172414373414B774172414373414B774172414373414B77417241464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(292) := '51414641414B77425141464141554141724141514142414172414373414B774172414373414B774172414373414B774172414373414B77426341467741584142634146774158414263414677415841426341467741584142634146774158414263414677';
wwv_flow_imp.g_varchar2_table(293) := '4158414263414677414B67417141436F414B67417141436F414B67417141436F414B67417141436F414B67417141436F414B67417141436F414B67417141413041445141564146774144514165414130414777426341436F414B77417241457341537742';
wwv_flow_imp.g_varchar2_table(294) := '4C414573415377424C414573415377424C414573414B774172414373414B7741724143734155414251414641415541425141464141554142514146414155414172414373414B774172414373414B7741654142344145774154414130414451414F414234';
wwv_flow_imp.g_varchar2_table(295) := '414577415441423441424141454141514143514172414573415377424C414573415377424C414573415377424C414573414B774172414373414B774172414373415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(296) := '514146414155414251414641415541425141464141554142514146414155414172414373414B774172414373414B774172414641415541425141464141554141454141514155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(297) := '415541425141464141554142514146414155414251414641415541425141464141554142514141514155414172414373414B7741724143734155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(298) := '5141464141554142514146414155414172414373414B774172414373414B774172414373414B7741724146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(299) := '415541425141464141554142514146414155414251414641414B7741454141514142414145414151414241414541415141424141454141514142414172414373414B77417241415141424141454141514142414145414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(300) := '45414373414B7741724143734148674172414373414B77415441424D415377424C414573415377424C414573415377424C414573415377426341467741584142634146774158414263414677415841426341467741584142634146774158414263414677';
wwv_flow_imp.g_varchar2_table(301) := '415841417241437341584142634146774158414263414373414B774172414373414B774172414373414B774172414373414B7742634146774158414263414677415841426341467741584142634146774158414172414373414B77417241467741584142';
wwv_flow_imp.g_varchar2_table(302) := '6341467741584142634146774158414263414677415841426341467741584142634146774158414263414373414B774172414373414B774172414573415377424C414573415377424C414573415377424C4145734158414172414373414B77417141436F';
wwv_flow_imp.g_varchar2_table(303) := '41554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414151414241414541415141424141724143734148674165414677415841426341467741584142';
wwv_flow_imp.g_varchar2_table(304) := '634146774158414263414677415841426341467741584142634146774158414263414677415841426341436F414B67417141436F414B67417141436F414B67417141436F414B77417141436F414B67417141436F414B67417141436F414B67417141436F';
wwv_flow_imp.g_varchar2_table(305) := '414B67417141436F414B67417141436F414B67417141436F414B67417141436F414B67417141436F414B67417141436F414B774172414151415377424C414573415377424C414573415377424C4145734153774172414373414B774172414373414B7742';
wwv_flow_imp.g_varchar2_table(306) := '4C414573415377424C414573415377424C414573415377424C414373414B774172414373414B77417241436F414B67417141436F414B67417141436F415841417141436F414B67417141436F414B67417241437341424141454141514142414145414151';
wwv_flow_imp.g_varchar2_table(307) := '4142414145414151414241414541415141424141454141514142414145414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(308) := '72414373414B77417241437341424141454141514142414145414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414151';
wwv_flow_imp.g_varchar2_table(309) := '4142414145414151414241425141464141554142514146414155414251414373414B774172414373415377424C414573415377424C414573415377424C414573415377414E414130414867414E414130414451414E414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(310) := '654142344148674165414234414241414541415141424141454141514142414145414151414867416541423441486741654142344148674165414234414B7741724143734142414145414151415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(311) := '41554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414142414145414151414241414541415141424141454141514142414145414151414241425141464141537742';
wwv_flow_imp.g_varchar2_table(312) := '4C414573415377424C414573415377424C41457341537742514146414155414251414641415541425141464141424141454141514142414145414151414241414541415141424141454141514142414145414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(313) := '414B774165414234414867416541464141554142514146414142414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414373414B774172414130414451414E41413041445142';
wwv_flow_imp.g_varchar2_table(314) := '4C414573415377424C414573415377424C414573415377424C414373414B7741724146414155414251414573415377424C414573415377424C414573415377424C4145734155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(315) := '41554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514141304144514251414641415541425141464141554142514146414155414172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(316) := '72414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414373414B77425141464141554141654142344148674165414234';
wwv_flow_imp.g_varchar2_table(317) := '4148674165414234414B774172414373414B774172414373414B7741724141514142414145414234414241414541415141424141454141514142414145414151414241414541415141424142514146414155414251414151415541425141464141554142';
wwv_flow_imp.g_varchar2_table(318) := '51414641414241425141464141424141454141514155414172414373414B77417241437341424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151';
wwv_flow_imp.g_varchar2_table(319) := '4142414145414373414241414541415141424141454142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414B774172414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(320) := '51414373414B77425141464141554142514146414155414251414641414B7742514143734155414172414641414B774165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(321) := '4148674165414234414867416541423441486741654142344148674165414373414B774165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867417241423441486741';
wwv_flow_imp.g_varchar2_table(322) := '65414234414867416541423441486742514142344148674165414641415541425141437341486741654142344148674165414234414867416541423441486742514146414155414251414373414B77416541423441486741654142344148674172414234';
wwv_flow_imp.g_varchar2_table(323) := '414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414B774172414641415541425141437341486741654142344148674165414234414867414F414234414B77414E41413041445141';
wwv_flow_imp.g_varchar2_table(324) := '4E414130414451414E41416B414451414E41413041434141454141734142414145414130414351414E414130414441416441423041486741584142634146674158414263414677415741426341485141644142344148674155414251414641414E414145';
wwv_flow_imp.g_varchar2_table(325) := '41415141454141514142414145414151414351416141426F414767416141426F414767416141426F414867415841426341485141564142554148674165414234414867416541423441474141574142454146514156414255414867416541423441486741';
wwv_flow_imp.g_varchar2_table(326) := '65414234414867416541423441486741654142344144514165414130414451414E414130414867414E41413041445141484142344148674165414234414B7741454141514142414145414151414241414541415141424141454146414155414172414373';
wwv_flow_imp.g_varchar2_table(327) := '415477425141464141554142514146414148674165414234414667415241453841554142504145384154774250414641415541425141464141554141654142344148674157414245414B7742514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(328) := '514146414155414251414373414B77417241427341477741624142734147774162414273414767416241427341477741624142734147774162414273414777416241427341477741624142734147674162414273414777416241426F414777416241426F';
wwv_flow_imp.g_varchar2_table(329) := '41477741624142734147774162414273414777416241427341477741624142734147774162414273414777416241415141424141454141514142414145414151414241414541415141424141454141514142414145414151414867416541464141476741';
wwv_flow_imp.g_varchar2_table(330) := '65414230414867425141423441476741654142344148674165414234414867416541423441486742504142344155414162414234414867425141464141554142514146414148674165414234414851416441423441554141654146414148674251414234';
wwv_flow_imp.g_varchar2_table(331) := '41554142504146414155414165414234414867416541423441486741654146414155414251414641415541416541423441486741654142344148674165414234414867416541423441486741654142344148674165414641414867425141464141554142';
wwv_flow_imp.g_varchar2_table(332) := '51414538415477425141464141554142514146414154774251414641415477425141453841547742504145384154774250414538415477425041453841547742504146414155414251414641415477425041453841547742504145384154774250414538';
wwv_flow_imp.g_varchar2_table(333) := '4154774251414641415541425141464141554142514146414155414165414234415541425141464141554142504142344148674172414373414B774172414230414851416441423041485141644142304148514164414230414867416541423441486741';
wwv_flow_imp.g_varchar2_table(334) := '65414234414867416541423441486741654142344148674165414234414867416541423441486741654142304148674164414234414867416541423441486741654142344148674165414234414867416441423441485141644142344148674165414230';
wwv_flow_imp.g_varchar2_table(335) := '41485141654142344148514165414234414867416441423441485141624142734148674164414234414867416541423441485141654142344148514164414230414851416541423441485141654142304148674164414230414851416441423041485141';
wwv_flow_imp.g_varchar2_table(336) := '65414230414867416541423441486741654142304148514164414230414867416541423441486741644142304148674165414234414867416541423441486741654142344148674164414234414867416541423041486741654142344148674165414230';
wwv_flow_imp.g_varchar2_table(337) := '41486741654142344148674165414234414867416541423441486741654142344148674164414230414867416541423041485141644142304148674165414230414851416541423441485141644142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(338) := '65414234414867416541423441486741654142344148674165414230414851416541423441485141644142344148674165414234414867416541423441486741654142344148674165414234414851416541423441486741644142344148674165414234';
wwv_flow_imp.g_varchar2_table(339) := '41486741654142344148514165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142304148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(340) := '65414234414867416541423441486741654142344146414165414234414867416541423441486741654142344148674165414234414867416541423441486741654142594145514157414245414867416541423441486741654142344148514165414234';
wwv_flow_imp.g_varchar2_table(341) := '41486741654142344148674165414355414A51416541423441486741654142344148674165414234414867415741424541486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(342) := '65414234414A51416C414355414A51416541423441486741654142344148674165414234414867416541423441486741654142344148674172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(343) := '414B774172414373414B774172414373414B77417241453841547742504145384154774250414538415477425041453841547742504145384154774250414538415477425041453841547742504145384154774250414538415477425041453841547742';
wwv_flow_imp.g_varchar2_table(344) := '50414538415477416441423041485141644142304148514164414230414851416441423041485141644142304148514164414230414851416441423041485141644142304148514164414230414851416441423041485141644142304148514164414538';
wwv_flow_imp.g_varchar2_table(345) := '41547742504145384154774250414538415477425041453841547742504145384154774250414538415477425041453841547742504146414148514164414230414851416441423041485141644142304148514164414230414867416541423441486741';
wwv_flow_imp.g_varchar2_table(346) := '64414230414851416441423041485141644142304148514164414230414851416441423041485141644142304148514164414230414851416541423441486741654142344148674165414234414867416541423441485141644142304148514164414230';
wwv_flow_imp.g_varchar2_table(347) := '41485141644142304148514164414230414851416441423041485141654142344148514164414230414851416541423441486741654142344148674165414234414867416541423041485141654142304148514164414230414851416441423041486741';
wwv_flow_imp.g_varchar2_table(348) := '65414234414867416541423441486741654142304148514165414234414851416441423441486741654142344148514164414234414867416541423441485141644142304148674165414230414867416541423041485141644142304148674165414234';
wwv_flow_imp.g_varchar2_table(349) := '41486741654142344148674165414234414867416541423441486741654142344148674164414230414851416441423441486741654142344148674165414234414867416541423041486741654142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(350) := '654142344148674165414234414867416C414355414A51416C41423441485141644142344148674164414234414867416541423441485141644142344148674165414234414A51416C414230414851416C414234414A51416C414355414941416C414355';
wwv_flow_imp.g_varchar2_table(351) := '41486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416C414355414A5141654142344148674165414230414867416441423441486741';
wwv_flow_imp.g_varchar2_table(352) := '6541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416441423041486741644142304148514165414230414A514164414230';
wwv_flow_imp.g_varchar2_table(353) := '41486741644142304148674164414234414867416541423441486741654142344148674165414234414867416541423441486741654143554148674165414234414867416541423441486741654142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(354) := '65414234414867416541423441486741654142344148674165414234414867416541423441485141644142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(355) := '41486741654142344148674165414234414867416C414355414A51416C414355414A51416C414355414A51416C414355414A5141644142304148514164414355414867416C414355414A514164414355414A514164414230414851416C41435541485141';
wwv_flow_imp.g_varchar2_table(356) := '644143554148514164414355414A51416C41423441485141654142344148674165414230414851416C41423041485141644142304148514164414355414A51416C414355414A514164414355414A5141674143554148514164414355414A51416C414355';
wwv_flow_imp.g_varchar2_table(357) := '414A51416C414355414A514165414234414867416C41435541494141674143414149414165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(358) := '65414230414867416541423441467741584142634146774158414263414867415441424D414A5141654142344148674157414245414667415241425941455141574142454146674152414259414551415741424541547742504145384154774250414538';
wwv_flow_imp.g_varchar2_table(359) := '41547742504145384154774250414538415477425041453841547742504145384154774250414538415477416541423441486741654142344148674165414234414867416541423441486741654142594145514165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(360) := '65414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867415741424541466741524142594145514157414245414667415241423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(361) := '41486741654142344148674165414234414867416541423441486741654142344146674152414259414551415741424541466741524142594145514157414245414667415241425941455141574142454146674152414259414551416541423441486741';
wwv_flow_imp.g_varchar2_table(362) := '65414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741574142454146674152414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(363) := '41486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441466741524142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(364) := '65414234414867416541423441486741644142304148514164414230414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741724143734148674165414234';
wwv_flow_imp.g_varchar2_table(365) := '4148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414B774165414234414867416541423441486741654142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(366) := '65414234414867416541423441486741654142344148674165414234414867416541423441554142514146414155414165414234414867416541423441486741654142344148674165414234414867416541423441486741454141514142414165414234';
wwv_flow_imp.g_varchar2_table(367) := '414B774172414373414B77417241424D414451414E4141304155414154414130415541425141464141554142514146414155414251414373414B774172414373414B774172414373415541414E414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(368) := '72414373414B774172414373414B77414541464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414172414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(369) := '414B7742514146414155414251414641415541425141437341554142514146414155414251414641415541417241464141554142514146414155414251414641414B77425141464141554142514146414155414251414373414677415841426341467741';
wwv_flow_imp.g_varchar2_table(370) := '58414263414677415841426341467741584142634146774158414130414451414E414130414451414E4141304144514165414130414667414E41423441486741584142634148674165414263414677415741424541466741524142594145514157414245';
wwv_flow_imp.g_varchar2_table(371) := '414451414E4141304144514154414641414451414E414234414451414E4142344148674165414234414867414D414177414451414E414130414867414E414130414667414E414130414451414E414130414451414E414130414867414E41423441445141';
wwv_flow_imp.g_varchar2_table(372) := '4E4142344148674165414373414B774172414373414B774172414373414B774172414373414B774172414373414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355';
wwv_flow_imp.g_varchar2_table(373) := '414A51416C414355414A51416C414373414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A5141';
wwv_flow_imp.g_varchar2_table(374) := '6C414355414B774172414373414B774172414373414B774172414373414B774172414373414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A514172414373';
wwv_flow_imp.g_varchar2_table(375) := '414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B77416C414355414A51416C414355414A51416C414355414A51416C414355414A514172414373414B7741724141304145514152414355414A5142';
wwv_flow_imp.g_varchar2_table(376) := '484146634156774157414245414667415241425941455141574142454146674152414355414A514157414245414667415241425941455141574142454146514157414245414551416C414663415677425841466341567742584146634156774258414151';
wwv_flow_imp.g_varchar2_table(377) := '4142414145414151414241414541435541567742584146634156774132414355414A5142584146634156774248414563414A51416C414355414B774252414663415551425841464541567742524146634155514258414663415677425841466341567742';
wwv_flow_imp.g_varchar2_table(378) := '58414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414645415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663';
wwv_flow_imp.g_varchar2_table(379) := '41567742584146634156774258414663415677425841466341567742584146634156774252414663415551425841464541567742584146634156774258414663415551425841466341567742584146634156774252414645414B77417241415141424141';
wwv_flow_imp.g_varchar2_table(380) := '56414255415277424841466341465142524146634155514258414645415677425241466341555142584146634156774258414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663';
wwv_flow_imp.g_varchar2_table(381) := '41567742584146454156774252414663415551425841466341567742584146634156774252414663415677425841466341567742584146454155514258414663415677425841425541555142484145634156774172414373414B77417241437341567742';
wwv_flow_imp.g_varchar2_table(382) := '5841466341567742584146634156774258414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663414B774258414663415677425841466341567742584146634156774258414663';
wwv_flow_imp.g_varchar2_table(383) := '415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663414B77416C4143554156774258414663415677416C414355414A5141';
wwv_flow_imp.g_varchar2_table(384) := '6C414355414A51416C414355414A51416C414373414B774172414373414B774172414373414B774172414373414B77417241464541555142524146454155514252414645415551425241464541555142524146454155514252414645414A51416C414355';
wwv_flow_imp.g_varchar2_table(385) := '414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A5141724146634156774258414663415677425841466341567742';
wwv_flow_imp.g_varchar2_table(386) := '58414663414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51425041453841547742504145384154774250414538414A5142584146634156774258414663';
wwv_flow_imp.g_varchar2_table(387) := '415677425841466341567742584146634156774258414663415677416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C41435541567742584146634156774258414663415677425841466341567742';
wwv_flow_imp.g_varchar2_table(388) := '584146634156774258414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414355414A51416C4146634156774258414663415677425841466341567742584146634156774258414663';
wwv_flow_imp.g_varchar2_table(389) := '41567742584146634156774258414663415677425841456341567742584146634156774258414663415677425841466341567742584146634156774258414663414B774172414373414A51416C414355414A51416C414355414A51416C414355414A5141';
wwv_flow_imp.g_varchar2_table(390) := '6C414355414A51416C414355414A51416C414355414A514172414373414B774172414373414B774172414373414B774251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414144514154414130';
wwv_flow_imp.g_varchar2_table(391) := '41554142514146414155414251414641415541425141464141554142514146414155414251414641415541424C414573415377424C414573415377424C414573415377424C4146414155414172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(392) := '72414373414B774172414373414B774172414373414B774172414373414867416541423441486741654142344148674165414234414867416541423441486741654146414142414145414151414241416541415141424141454141514142414145414151';
wwv_flow_imp.g_varchar2_table(393) := '41424141454141514148674251414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234415541425141415141424142';
wwv_flow_imp.g_varchar2_table(394) := '51414641415541425141464141554142514146414155414251414641415541425141464141554142514141514142414165414130414451414E4141304144514172414373414B774172414373414B77417241437341486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(395) := '41486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541464141554142514146414155414251414641415541425141423441486741654142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(396) := '65414234414867416541423441554141654142344148674165414234414867416541423441486741654142344148674165414234414867425141423441486741654142344148674165414641414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(397) := '414867416541423441486741654142344148674172414373414867416541423441486741654142344148674165414234414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(398) := '72414373414B77416541423441554142514146414155414251414641415541425141464141554142514141514155414251414641414241425141464141554142514141514155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(399) := '4155414251414641415541425141464141554142514146414155414251414151414241414541415141424141654142344148674165414151414B77417241437341554142514146414155414251414641414867416541426F4148674172414373414B7741';
wwv_flow_imp.g_varchar2_table(400) := '72414373414B774251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414467414F41424D4145774172414373414B774172414373414B7741724143734142414145414641';
wwv_flow_imp.g_varchar2_table(401) := '415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141415141424141454141514142414145414373414B7741';
wwv_flow_imp.g_varchar2_table(402) := '72414373414B774172414373414B77414E414130415377424C414573415377424C414573415377424C4145734153774172414373414B774172414373414B7741454141514142414145414151414241414541415141424141454141514142414145414151';
wwv_flow_imp.g_varchar2_table(403) := '41424141454141514142414251414641415541425141464141554141654142344148674251414134415541425141415141554142514146414155414251414641414241414541415141424141454141514142414145414130414451425141464141554142';
wwv_flow_imp.g_varchar2_table(404) := '51414641415541425141464141554142514146414155414251414641415541425141464141554142514141514142414145414151414241414541415141424141454141514142414145414151414B774172414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(405) := '414B7741724142344157414259414667415741425941466741574142594146674157414259414667415741425941466741574142594146674157414259414667415741425941466741574142594146674157414259414373414B77417241415141486741';
wwv_flow_imp.g_varchar2_table(406) := '654142344148674165414234414451414E41413041486741654142344148674172414641415377424C414573415377424C414573415377424C4145734153774172414373414B77417241423441486742634146774158414263414677414B674263414677';
wwv_flow_imp.g_varchar2_table(407) := '415841426341467741584142634146774158414263414573415377424C414573415377424C414573415377424C41457341584142634146774158414263414373415541425141464141554142514146414155414251414641414241414541415141424141';
wwv_flow_imp.g_varchar2_table(408) := '45414151414241414541415141424141454141514142414145414373414B774172414373414B774172414373414B77417241464141554142514141514155414251414641415541425141464141554142514141514142414172414373415377424C414573';
wwv_flow_imp.g_varchar2_table(409) := '415377424C414573415377424C4145734153774172414373414867414E41413041445142634146774158414263414677415841426341467741584142634146774158414263414677415841426341467741584142634146774158414263414677414B6741';
wwv_flow_imp.g_varchar2_table(410) := '7141436F415841417141436F414B674263414677415841426341467741584142634146774158414263414677415841426341467741584142634146774158414171414677414B67417141436F415841426341436F414B6742634146774158414263414677';
wwv_flow_imp.g_varchar2_table(411) := '414B674171414677414B674263414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414677415841426341436F414B67425141464141554142';
wwv_flow_imp.g_varchar2_table(412) := '51414641415541425141464141554142514146414142414145414151414241414541413041445142514146414155414145414151414B774172414373414B774172414373414B774172414373414B77425141464141554142514146414155414172414373';
wwv_flow_imp.g_varchar2_table(413) := '41554142514146414155414251414641414B77417241464141554142514146414155414251414373414B774172414373414B774172414373414B77417241464141554142514146414155414251414641414B774251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(414) := '514143734155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414148674165414373414B7741724143734155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(415) := '415541425141464141554142514146414155414145414151414241414541415141424141454141514144514145414151414B774172414573415377424C414573415377424C414573415377424C414573414B774172414373414B77417241437341564142';
wwv_flow_imp.g_varchar2_table(416) := '56414655415651425641465541565142564146554156514256414655415651425641465541565142564146554156514256414655415651425641465541565142564146554156514255414655415651425641465541565142564146554156514256414655';
wwv_flow_imp.g_varchar2_table(417) := '415651425641465541565142564146554156514256414655415651425641465541565142564146554156514256414373414B774172414373414B774172414373414B774172414373414B77417241466B415751425A41466B415751425A41466B41575142';
wwv_flow_imp.g_varchar2_table(418) := '5A41466B415751425A41466B415751425A41466B415751425A41466B414B774172414373414B77426141466F415767426141466F415767426141466F415767426141466F415767426141466F415767426141466F415767426141466F415767426141466F';
wwv_flow_imp.g_varchar2_table(419) := '415767426141466F415767426141466F414B774172414373414B7741474141594142674147414159414267414741415941426741474141594142674147414159414267414741415941426741474141594142674147414159414267414741415941426741';
wwv_flow_imp.g_varchar2_table(420) := '47414159414267414741415941567742584146634156774258414663415677425841466341567742584146634156774258414355414A51425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663';
wwv_flow_imp.g_varchar2_table(421) := '415677425841466341567742584146634156774258414663414A51416C414355414A51416C414355415541425141464141554142514146414155414172414373414B774172414373414B774172414373414B774172414373414B77425141464141554142';
wwv_flow_imp.g_varchar2_table(422) := '51414641414B774172414373414B7741724146594142414257414659415667425741465941566742574146594156674257414234415667425741465941566742574146594156674257414659415667425741465941566741724146594156674257414659';
wwv_flow_imp.g_varchar2_table(423) := '4156674172414659414B774257414659414B774257414659414B7742574146594156674257414659415667425741465941566742574146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(424) := '5141423441486741654142344148674165414234414867416541423441486741654142344148674165414234414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741724146414155414251414641';
wwv_flow_imp.g_varchar2_table(425) := '41554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141455141574146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(426) := '5141464141554142514146414155414251414641414B77417241464141554142514146414155414251414641415541425141464141554142514146414155414172414373414B774172414373414B774172414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(427) := '414B774172414373414B774172414373414B774172414373414B7742514146414155414251414641415541425141464141554142514146414155414161414234414B77417241415141424141454141514142414145414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(428) := '4541415141424141454141514147414152414245414741415941424D41457741574142454146414172414373414B774172414373414B77414541415141424141454141514142414145414151414241414541415141424141454141514142414145414355';
wwv_flow_imp.g_varchar2_table(429) := '414A51416C414355414A514157414245414667415241425941455141574142454146674152414259414551416C4143554146674152414355414A51416C414355414A51416C414355414551416C414245414B774156414255414577415441435541466741';
wwv_flow_imp.g_varchar2_table(430) := '524142594145514157414245414A51416C414355414A51416C414355414A51416C414373414A51416241426F414A514172414373414B77417241464141554142514146414155414172414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(431) := '4155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B774172414163414B774154414355414A51416241426F414A51416C414259414551416C41435541455141';
wwv_flow_imp.g_varchar2_table(432) := '6C414245414A514258414663415677425841466341567742584146634156774258414255414651416C414355414A514154414355415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663';
wwv_flow_imp.g_varchar2_table(433) := '415677425841466341567742584146634156774258414259414A514152414355414A51416C414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663415677425841466341567742';
wwv_flow_imp.g_varchar2_table(434) := '584146634156774157414355414551416C4142594145514152414259414551415241425541567742524146454155514252414645415551425241464541555142524146634156774258414663415677425841466341567742584146634156774258414663';
wwv_flow_imp.g_varchar2_table(435) := '4156774258414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414563415277417241437341567742584146634156774258414663414B774172414663415677425841466341567742';
wwv_flow_imp.g_varchar2_table(436) := '58414373414B774258414663415677425841466341567741724143734156774258414663414B7741724143734147674162414355414A51416C414273414777417241423441486741654142344148674165414234414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(437) := '414B774172414373414B7741454141514142414151414230414B7741724146414155414251414641415541425141464141554142514146414155414251414373415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(438) := '51414641415541425141464141554142514146414155414172414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B774251414641414B7742514146414155414251414641';
wwv_flow_imp.g_varchar2_table(439) := '415541425141464141554142514146414155414251414641415541417241437341554142514146414155414251414641415541425141464141554142514146414155414251414373414B7742514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(440) := '51414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414172414373414B774172414373414451414E414130414B774172414373414B77425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(441) := '415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414373414B7741724142344148674165414234414867416541423441486741654146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(442) := '5141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414867416541423441486741654142344148674165414234414867416541423441486742514146414148674165414234414B774165414234';
wwv_flow_imp.g_varchar2_table(443) := '4148674165414234414867416541423441486741654142344148674165414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(444) := '72414373414B7741724143734148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414151414B774172414641';
wwv_flow_imp.g_varchar2_table(445) := '4155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(446) := '72414373414B774172414373414B774145414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414373414B774172414373';
wwv_flow_imp.g_varchar2_table(447) := '414B774172414373414B7741724146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B774172414373414B774172414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(448) := '514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141424141454141514142414145414373414B774172414373414B774251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(449) := '415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541417241413041554142514146414155414172414373414B7741724146414155414251414641415541425141464141554141';
wwv_flow_imp.g_varchar2_table(450) := '4E41464141554142514146414155414172414373414B774172414373414B774172414373414B7741724146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(451) := '415541425141464141554142514146414155414251414373414B774251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B774172414373414B77425141464141554142';
wwv_flow_imp.g_varchar2_table(452) := '5141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414373414B774172414373414B774172414373414B7742514146414155414251414641';
wwv_flow_imp.g_varchar2_table(453) := '4155414251414641415541425141464141554142514146414155414251414373414B774172414373414B774172414373414B774172414373414B774165414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(454) := '7241437341554142514146414155414251414641414B774172414641414B77425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414172414641';
wwv_flow_imp.g_varchar2_table(455) := '4155414172414373414B774251414373414B7742514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B77414E414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(456) := '51414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414165414234415541425141464141554142514146414155414172414373414B774172414373414B7741724146414155414251414641';
wwv_flow_imp.g_varchar2_table(457) := '41554142514146414155414251414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741724143734155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(458) := '5141464141554141724146414155414172414373414B774172414373415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(459) := '4155414251414373414B774172414130415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(460) := '6541464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414373414B774172414373415541425141464141554142514141514142414145414373';
wwv_flow_imp.g_varchar2_table(461) := '4142414145414373414B774172414373414B77414541415141424141454146414155414251414641414B77425141464141554141724146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(462) := '5141464141554142514146414155414251414641414B7741724141514142414145414373414B7741724143734142414251414641415541425141464141554142514146414155414172414373414B774172414373414B774172414130414451414E414130';
wwv_flow_imp.g_varchar2_table(463) := '414451414E4141304144514165414373414B774172414373414B7741724143734155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(464) := '51414641415541425141464141554141654146414155414251414641415541425141464141554141654146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(465) := '41554142514141514142414172414373414B7741724146414155414251414641415541414E414130414451414E4141304144514155414373414B774172414373414B774172414373414B7741724146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(466) := '514146414155414251414641415541425141464141554142514146414155414251414641414B774172414373414451414E414130414451414E41413041445142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(467) := '41554142514146414155414172414373414B774172414373414B7741724142344148674165414234414B774172414373414B774172414373414B774172414373414B774172414373415541425141464141554142514146414155414172414373414B7741';
wwv_flow_imp.g_varchar2_table(468) := '72414373414B774172414373414B774172414373414B774172414373414B774172414641415541425141464141554142514146414155414251414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(469) := '414B774172414373414B774172414373414B774251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414373414B774172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(470) := '724143734155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414172414373414B774172414373414B774172414641415541425141464141554142514141514142414145414151';
wwv_flow_imp.g_varchar2_table(471) := '414B774172414373414B774172414373414B774172414573415377424C414573415377424C414573415377424C414573414B774172414373414B774172414373415541425141464141554142514146414155414251414641415541417241415141424141';
wwv_flow_imp.g_varchar2_table(472) := '4E414373414B774251414641414B774172414373414B774172414373414B774172414373414B774172414373414B774172414641415541425141464141554142514141514142414145414151414241414541415141424141454141514142414251414641';
wwv_flow_imp.g_varchar2_table(473) := '415541425141423441486741654142344148674172414373414B774172414373414B7741454141514142414145414151414241414541413041445141654142344148674165414234414B774172414373414B774251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(474) := '51414641415541425141464141554142514146414155414251414573415377424C414573415377424C414573415377424C414573414B774172414373414B774172414373414B774172414373414B774172414373414B7741724143734142414251414641';
wwv_flow_imp.g_varchar2_table(475) := '415541425141464141554142514146414155414251414641415541425141464141554142514141514142414145414151414241414541415141424141454141514142414165414234414867414E414130414451414E414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(476) := '72414373414B774172414373414B774165414373414B77425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B774172414373414B774172414373414B77424C414573415377424C414573';
wwv_flow_imp.g_varchar2_table(477) := '415377424C414573415377424C414373414B774172414373414B7741724146414155414251414641415541425141464141424141454141514142414145414151414241414541415141424141454141514142414145414373415377424C41457341537742';
wwv_flow_imp.g_varchar2_table(478) := '4C414573415377424C414573415377414E414130414451414E4146414142414145414641414B774172414373414B774172414373414B77417241464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(479) := '415541425141464141424141654141344155414172414373414B774172414373414B774172414373414B7741454146414155414251414641414451414E414234414451414541415141424141454142344142414145414573415377424C41457341537742';
wwv_flow_imp.g_varchar2_table(480) := '4C414573415377424C414573415541414F414641414451414E414130414B774251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(481) := '414B774172414373414B774172414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414373415541425141464141554142514146414155414251414641415541425141464141554141';
wwv_flow_imp.g_varchar2_table(482) := '45414151414241414541415141424141454141514142414145414151414241414E414130414867414E4141304148674145414373415541425141464141554142514146414155414172414641414B77425141464141554142514143734155414251414641';
wwv_flow_imp.g_varchar2_table(483) := '4155414251414641415541425141464141554142514146414155414251414641414B774251414641415541425141464141554142514146414155414251414130414B774172414373414B7741724143734155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(484) := '51414641415541425141464141554142514146414155414145414151414241414541415141424141454141514142414145414151414B774172414373414B774172414573415377424C414573415377424C414573415377424C414573414B774172414373';
wwv_flow_imp.g_varchar2_table(485) := '414B774172414373414241414541415141424141724146414155414251414641415541425141464141554141724143734155414251414373414B7742514146414155414251414641415541425141464141554142514146414155414251414641414B7742';
wwv_flow_imp.g_varchar2_table(486) := '514146414155414251414641415541425141437341554142514143734155414251414641415541425141437341424141454146414142414145414151414241414541415141424141724143734142414145414373414B7741454141514142414172414373';
wwv_flow_imp.g_varchar2_table(487) := '4155414172414373414B774172414373414B774145414373414B774172414373414B77425141464141554142514146414142414145414373414B77414541415141424141454141514142414145414373414B774172414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(488) := '72414373414B774172414373414B774172414373414B7741724143734142414145414151414241414541415141424142514146414155414251414130414451414E414130414867424C414573415377424C414573415377424C414573415377424C414130';
wwv_flow_imp.g_varchar2_table(489) := '414451417241423441424142514146414155414172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(490) := '4541415141424141454146414155414165414641414B774172414373414B774172414373414B774172414573415377424C414573415377424C414573415377424C414573414B774172414373414B77417241437341554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(491) := '415541425141464141554142514146414155414251414641414241414541415141424141454141514142414172414373414241414541415141424141454141514142414145414151414467414E4141304145774154414234414867416541413041445141';
wwv_flow_imp.g_varchar2_table(492) := '4E414130414451414E414130414451414E414130414451414E414130414451414E41464141554142514146414142414145414373414B7741454141304144514165414641414B774172414373414B774172414373414B774172414373414B774172414573';
wwv_flow_imp.g_varchar2_table(493) := '415377424C414573415377424C414573415377424C414573414B774172414373414B774172414373414467414F414134414467414F414134414467414F414134414467414F4141344144674172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(494) := '72414373414B774172414373414B774172414373414B77417241464141554142514146414155414251414641415541425141464141554141454141514142414145414151414241414541415141424141454141514142414145414641414B774172414373';
wwv_flow_imp.g_varchar2_table(495) := '414B774172414373414B77424C414573415377424C414573415377424C414573415377424C414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B77417241437341584142';
wwv_flow_imp.g_varchar2_table(496) := '6341467741584142634146774158414263414677415841426341467741584142634146774158414263414677415841426341467741584142634146774158414263414677414B77417241436F414B67417141436F414B67417141436F414B67417141436F';
wwv_flow_imp.g_varchar2_table(497) := '414B67417141436F414B674171414373414B774172414373415377424C414573415377424C414573415377424C4145734153774263414677414451414E414130414B67425141464141554142514146414155414251414641415541425141464141554141';
wwv_flow_imp.g_varchar2_table(498) := '4541415141424141454141514142414145414151414241414541415141424141454141514142414165414373414B774172414373415377424C414573415377424C414573415377424C414573415377425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(499) := '4155414172414373414B774172414373414B774172414373414B774172414373414B77425141464141554142514146414155414251414641414B774172414641414B77417241464141554142514146414155414251414641415541417241464141554141';
wwv_flow_imp.g_varchar2_table(500) := '724146414155414251414641415541425141464141554142514146414155414251414641415541425141464141424141454141514142414145414151414B774145414151414B774172414151414241414541415141554141454146414142414145414130';
wwv_flow_imp.g_varchar2_table(501) := '414451414E414373414B774172414373414B774172414373414B774172414573415377424C414573415377424C414573415377424C414573414B774172414373414B774172414373415541425141464141554142514146414155414251414373414B7742';
wwv_flow_imp.g_varchar2_table(502) := '51414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141424141454141514142414145414151414241417241437341424141454141514142414145414151';
wwv_flow_imp.g_varchar2_table(503) := '41424142514141344155414145414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414641414241414541415141424141';
wwv_flow_imp.g_varchar2_table(504) := '45414151414241414541415141424142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541414541415141424141454141514142414145414641';
wwv_flow_imp.g_varchar2_table(505) := '4142414145414151414241414F414234414451414E414130414451414F4142344142414172414373414B774172414373414B7741724143734155414145414151414241414541415141424141454141514142414145414151415541425141464141554142';
wwv_flow_imp.g_varchar2_table(506) := '514146414155414251414641415541414541415141424141454141514142414145414151414241414541415141424141454141514142414145414130414451414E414641414467414F414134414451414E414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(507) := '414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774251414641415541425141464141554142514146414155414172414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(508) := '51414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414241414541415141424141454141514142414145414373414241414541415141424141454141514142414145414641';
wwv_flow_imp.g_varchar2_table(509) := '414451414E414130414451414E414373414B774172414373414B774172414373414B774172414373415377424C414573415377424C414573415377424C414573415377425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(510) := '514146414155414172414373414B77414F41424D415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B774172414151414241414541415141424141454141514142414145414151';
wwv_flow_imp.g_varchar2_table(511) := '4142414145414151414241417241415141424141454141514142414145414151414241414541415141424141454141514142414172414373414B774172414373414B774172414373414B7742514146414155414251414641415541425141437341554142';
wwv_flow_imp.g_varchar2_table(512) := '514143734155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541414541415141424141454141514142414172414373414B7741454143734142414145414373';
wwv_flow_imp.g_varchar2_table(513) := '414241414541415141424141454141514142414251414151414B774172414373414B774172414373414B774172414573415377424C414573415377424C414573415377424C414573414B774172414373414B774172414373415541425141464141554142';
wwv_flow_imp.g_varchar2_table(514) := '51414641414B774251414641414B774251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554141454141514142414145414151414B774145414151';
wwv_flow_imp.g_varchar2_table(515) := '414B77414541415141424141454141514155414172414373414B774172414373414B774172414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414241414541415141424141';
wwv_flow_imp.g_varchar2_table(516) := '65414234414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774251414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414641';
wwv_flow_imp.g_varchar2_table(517) := '415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141423441486741654142344148674165414234414867416141426F4147674161414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(518) := '654142344148674165414234414867416541423441486741654142344148674172414373414B774172414373414B774172414373414B774172414373414B7741724141304155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(519) := '41554142514146414155414251414641415541425141464141554142514146414155414251414373414B774172414373414B7741724146414155414251414641415541425141464141554142514146414155414251414641415541425141437341445141';
wwv_flow_imp.g_varchar2_table(520) := '4E414130414451414E414373414B774172414373414B774172414373414B774172414373414B7742514146414155414251414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(521) := '414B774172414373414B774172414373414B77417241437341554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415341424941456741517742';
wwv_flow_imp.g_varchar2_table(522) := '4441454D415541425141464141554142444146414155414251414567415177424941454D41554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(523) := '4155414251414641415341424441454D41554142514146414155414251414641415541425141464141554142514146414155414251414641414B77414A41416B414351414A41416B414351414A4142594145514172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(524) := '724146414155414251414641415541425141464141554142514146414155414251414641415541424941454D4155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414172414373';
wwv_flow_imp.g_varchar2_table(525) := '414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414573415377424C414573415377424C414573415377424C414573414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(526) := '4E414130414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7742514146414155414251414641415541425141464141554142514146414155414251414641414B7741724141514142414145414151';
wwv_flow_imp.g_varchar2_table(527) := '414241414E414373414B774172414373414B774172414373414B7741724143734155414251414641415541425141464141554142514146414155414251414641415541425141464141554141454141514142414145414151414241414541413041445141';
wwv_flow_imp.g_varchar2_table(528) := '4E4142344148674165414234414867416541464141554142514146414144514165414373414B774172414373414B774172414373414B774172414373415377424C414573415377424C414573415377424C41457341537741724146414155414251414641';
wwv_flow_imp.g_varchar2_table(529) := '4155414251414641414B7742514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414172414373414B7741724143734155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(530) := '514146414155414251414641415541425141464141554142514146414155414172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(531) := '4155414251414641415541425141464141554142514146414155414251414641415541414E4141304148674165414373414B774172414373414B774251414641415541425141464141554142514146414155414251414641414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(532) := '4541464141424141454141514142414145414151414241414541415141424141454141514142414145414151414B774172414373414B774172414373414B7741454141514142414145414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(533) := '41554142514146414152774248414255415277414A414373414B774172414373414B774172414373414B774172414373414B774145414151414B774172414373414B774172414373414B774172414373414B774172414373414B77417241466341567742';
wwv_flow_imp.g_varchar2_table(534) := '584146634156774258414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414373414B774172414373414B774172414373414B77425841466341567742584146634156774258414663';
wwv_flow_imp.g_varchar2_table(535) := '4156774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741724143734155514252414645414B774172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(536) := '72414373414B7742524146454155514252414373414B774172414373414B774172414373414B7742584146634156774258414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663';
wwv_flow_imp.g_varchar2_table(537) := '41567742584146634156774258414373414B7741724143734155414251414641415541425141464141554142514146414155414251414373414B774172414373414B77425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(538) := '51414373414B774172414373414B7741724143734155414251414641415541425141464141554142514146414155414172414373414867414541415141445141454141514142414145414373414B774172414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(539) := '414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B77417241437341486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(540) := '654142344148674172414373414B774172414373414B774172414373414B77417241423441486741654142344148674165414234414B77417241423441486741654142344148674165414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(541) := '41486741654142344148674165414234414867416541415141424141454141514142414165414234414867414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(542) := '45414234414867414541415141424141454141514142414145414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441424141454141514142414165414234';
wwv_flow_imp.g_varchar2_table(543) := '41486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441424141454141514148674172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(544) := '72414373414B774172414373414B774172414373414B7741724143734155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414373414B774172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(545) := '414B774172414373414B77417241423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674172414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(546) := '65414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867417241423441486741654142344148674165414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(547) := '41486741654142344148674165414234414867416541423441486741654142344148674165414234414B774251414641414B774172414641414B774172414641415541417241437341554142514146414155414172414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(548) := '6541423441486741654142344148674165414373415541417241464141554142514146414155414251414641414B774165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(549) := '414867416541423441486741654142344148674165414234414B7742514146414155414251414373414B77425141464141554142514146414155414251414641414B77425141464141554142514146414155414251414373414867416541464141554142';
wwv_flow_imp.g_varchar2_table(550) := '514146414155414172414641414B77417241437341554142514146414155414251414641415541417241423441486741654142344148674165414234414867416541423441486741654142344148674165414234414B7741724146414155414251414641';
wwv_flow_imp.g_varchar2_table(551) := '41554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414148674251414641415541425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(552) := '51414641415541425141464141554142514146414155414251414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486742514146414155414251414641';
wwv_flow_imp.g_varchar2_table(553) := '41554142514146414155414251414641414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(554) := '51414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414234414867416541423441486741654142344148674165414373414B77424C414573415377424C414573415377424C414573';
wwv_flow_imp.g_varchar2_table(555) := '415377424C414573415377424C414573415377424C414573415377424C414573415377424C414573415377424C414573415377424C414573415377424C414573415377424C41415141424141454141514142414145414151414241414541415141424141';
wwv_flow_imp.g_varchar2_table(556) := '45414151414241414541415141424141454141514142414145414151414241416541423441486741654141514142414145414151414241414541415141424141454141514142414145414151414241416541423441486741654142344148674165414234';
wwv_flow_imp.g_varchar2_table(557) := '41424141654142344148674165414234414867416541423441486741654141514148674165414130414451414E4141304148674172414373414B774172414373414B774172414373414B774172414373414B774172414373414B77414541415141424141';
wwv_flow_imp.g_varchar2_table(558) := '45414151414B77414541415141424141454141514142414145414151414241414541415141424141454141514142414172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741724141514142414145414151';
wwv_flow_imp.g_varchar2_table(559) := '4142414145414151414B77414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414B77417241415141424141454141514142414145414151414B774145414151414B77414541415141424141';
wwv_flow_imp.g_varchar2_table(560) := '45414151414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B77417241437341554142514146414155414251414641415541425141464141554142514146414155414172414373';
wwv_flow_imp.g_varchar2_table(561) := '414B7741454141514142414145414151414241414541464141554142514146414155414251414641414B774172414573415377424C414573415377424C414573415377424C414573414B774172414373414B774251414234414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(562) := '72414373414B774172414373414B774172414373414B774172414373414B77425141464141554142514146414155414251414641415541425141464141554141454141514142414145414573415377424C414573415377424C414573415377424C414573';
wwv_flow_imp.g_varchar2_table(563) := '414B774172414373414B77417241427341554142514146414155414251414373414B77425141464141554142514146414155414251414641415541414541415141424141454141514142414145414373414B774172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(564) := '724142344148674165414234414241414541415141424141454141514142414251414373414B774172414373415377424C414573415377424C414573415377424C4145734153774172414373414B7741724142594146674172414373414B774172414373';
wwv_flow_imp.g_varchar2_table(565) := '414B774172414373414B774172414373414B774172414373414B77417241437341554142514146414155414251414641415541425141464141554142514146414155414251414641414767425141464141554141614146414155414251414641414B7741';
wwv_flow_imp.g_varchar2_table(566) := '72414373414B774172414373414B774172414373414B774172414641415541425141464141554142514146414155414251414641415541425141464141554141654146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(567) := '4155414251414373414B7742514146414155414251414373415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641414B7742';
wwv_flow_imp.g_varchar2_table(568) := '51414641414B774251414373414B77425141437341554142514146414155414251414641415541425141464141554141724146414155414251414641414B7742514143734155414172414373414B774172414373414B774251414373414B774172414373';
wwv_flow_imp.g_varchar2_table(569) := '4155414172414641414B7742514143734155414251414641414B774251414641414B774251414373414B7742514143734155414172414641414B77425141437341554141724146414155414172414641414B7741724146414155414251414641414B7742';
wwv_flow_imp.g_varchar2_table(570) := '5141464141554142514146414155414251414373415541425141464141554141724146414155414251414641414B774251414373415541425141464141554142514146414155414251414641415541417241464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(571) := '4155414251414641415541425141464141554142514146414155414172414373414B7741724143734155414251414641414B7742514146414155414251414641414B77425141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(572) := '514146414155414251414641414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774165414234414B774172414373414B774172414373414B774172414373414B774172414373414B774172414538';
wwv_flow_imp.g_varchar2_table(573) := '4154774250414538415477425041453841547742504145384154774250414538414A51416C414355414851416441423041485141644142304148514164414230414851416441423041485141644142304148514164414230414867416541423041485141';
wwv_flow_imp.g_varchar2_table(574) := '64414230414851416441423041485141644142304148514164414230414851416441423041485141644142344148674165414355414A51416C41423041485141644142304148514164414230414851416441423041485141644142304148514164414230';
wwv_flow_imp.g_varchar2_table(575) := '414851416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51417041436B414B51417041436B414B51417041436B414B51417041436B414B51417041436B414B5141';
wwv_flow_imp.g_varchar2_table(576) := '7041436B414B51417041436B414B51417041436B414B51417041436B414A51416C414355414A51416C414341414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355';
wwv_flow_imp.g_varchar2_table(577) := '414A514165414234414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414234414867416C414355414A51416C414355414867416C414355414A5141';
wwv_flow_imp.g_varchar2_table(578) := '6C4143554149414167414341414A51416C414341414A51416C4143414149414167414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355';
wwv_flow_imp.g_varchar2_table(579) := '414A51416C414355414A51416C4143454149514168414345414951416C4143554149414167414355414A514167414341414941416741434141494141674143414149414167414341414A51416C414355414A51416C414355414A51416C414355414A5141';
wwv_flow_imp.g_varchar2_table(580) := '6C414355414A51416C414355414A51416C414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414A51416C414355414941416C414355414A51416C4143414149414167414355';
wwv_flow_imp.g_varchar2_table(581) := '4149414167414341414A51416C414355414A51416C414355414A514167414355414941416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414867416C414234414A514165414355414A51416C414355414A5141';
wwv_flow_imp.g_varchar2_table(582) := '67414355414A51416C414355414867416C414234414867416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C41423441486741654142344148674165414234414A51416C414355414A51416C414355414A51416C414355';
wwv_flow_imp.g_varchar2_table(583) := '414A51416C414355414A51416C414355414A514165414234414867416541423441486741654142344148674165414355414A51416C414355414A51416C414355414A51416C414355414A51416C4143554148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(584) := '6541423441486741654142344148674165414234414867416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414341414941416C414355414A51416C414341';
wwv_flow_imp.g_varchar2_table(585) := '414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414341414A51416C414355414A514167414341414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A5141';
wwv_flow_imp.g_varchar2_table(586) := '6C414355414A51416C414355414A51416C414355414867416541423441486741654142344148674165414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A514165414234';
wwv_flow_imp.g_varchar2_table(587) := '4148674165414234414867416C414355414A51416C414355414A51416C4143414149414167414355414A51416C41434141494141674143414149414165414234414867416541423441486741654142344148674165414234414867416541423441486741';
wwv_flow_imp.g_varchar2_table(588) := '6541423441486741654142344148674165414263414677415841425541465141564142344148674165414234414A51416C414355414941416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414341';
wwv_flow_imp.g_varchar2_table(589) := '4149414167414355414A51416C414355414A51416C414355414A51416C414341414A51416C414355414A51416C414355414A51416C414355414A51416C414341414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A5141';
wwv_flow_imp.g_varchar2_table(590) := '6C414355414A51416C414355414A514165414234414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414A51416C414355414A51416C414355414A51416C414355414A51416C414355';
wwv_flow_imp.g_varchar2_table(591) := '4148674165414234414867416541423441486741654142344148674165414234414A51416C414355414A51416541423441486741654142344148674165414234414867416541423441486741654142344148674165414355414A51416C414355414A5141';
wwv_flow_imp.g_varchar2_table(592) := '6C414355414A514165414234414867416541423441486741654142344148674165414355414A51416C414355414A51416C41423441486741654142344148674165414234414867416C414355414A51416C414355414A51416C4143554148674165414234';
wwv_flow_imp.g_varchar2_table(593) := '41486741654142344148674165414234414867416541423441486741654142344148674167414355414A514167414355414A51416C414355414A51416C414355414A51416741434141494141674143414149414167414341414A51416C414355414A5141';
wwv_flow_imp.g_varchar2_table(594) := '6C414355414941416C414355414A51416C414355414A51416C414355414A514167414341414941416741434141494141674143414149414167414355414A514167414341414941416C414355414A51416C414355414A51416C414355414A51416C414355';
wwv_flow_imp.g_varchar2_table(595) := '414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A514167414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C41434141494141';
wwv_flow_imp.g_varchar2_table(596) := '6C414341414941416C414341414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A514167414341414941416C4143414149414167414341414941416741434141494141674143414149414167414341414A51416C414234';
wwv_flow_imp.g_varchar2_table(597) := '414867416541423441486741654142344148674165414234414867416541423441486741654142344148674165414234414B7741654142344148674165414234414867416541423441486741654142344148674172414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(598) := '72414373414B774172414373414B774172414373414B774172414573415377424C414573415377424C414573415377424C414573414B774172414373414B774172414373414A51416C414355414A51416C414355414A51416C414355414A51416C414355';
wwv_flow_imp.g_varchar2_table(599) := '414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414B7741724146634156774258414663415677425841466341567742584146634156774258414663415677425841466341567742';
wwv_flow_imp.g_varchar2_table(600) := '584146634156774258414663415677425841466341567742584146634156774258414355414A514258414663415677425841466341567742584146634156774258414663415677425841466341567742584146634156774258414663415677416C414355';
wwv_flow_imp.g_varchar2_table(601) := '414A51416C414355414A51416C414355414A51416C4143554156774258414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51425841466341567742584146634156774258414663415677425841466341567742';
wwv_flow_imp.g_varchar2_table(602) := '584146634156774258414663414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A514258414663';
wwv_flow_imp.g_varchar2_table(603) := '415677425841466341567742584146634156774258414663414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414A51416C414355414B774145414373414B774172414373414B7741';
wwv_flow_imp.g_varchar2_table(604) := '72414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B7741724141514142414145414151414241414541415141424141454141514142414145414151';
wwv_flow_imp.g_varchar2_table(605) := '4142414145414151414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B774172414373414B77417241413D3D22292C4C3D41727261792E69734172726179286D293F66756E6374696F6E2841297B66';
wwv_flow_imp.g_varchar2_table(606) := '6F722876617220653D412E6C656E6774682C743D5B5D2C723D303B723C653B722B3D3429742E7075736828415B722B335D3C3C32347C415B722B325D3C3C31367C415B722B315D3C3C387C415B725D293B72657475726E20747D286D293A6E6577205569';
wwv_flow_imp.g_varchar2_table(607) := '6E7433324172726179286D292C623D41727261792E69734172726179286D293F66756E6374696F6E2841297B666F722876617220653D412E6C656E6774682C743D5B5D2C723D303B723C653B722B3D3229742E7075736828415B722B315D3C3C387C415B';
wwv_flow_imp.g_varchar2_table(608) := '725D293B72657475726E20747D286D293A6E65772055696E7431364172726179286D292C793D7728622C31322C4C5B345D2F32292C4B3D323D3D3D4C5B355D3F7728622C2832342B4C5B345D292F32293A286D3D4C2C623D4D6174682E6365696C282832';
wwv_flow_imp.g_varchar2_table(609) := '342B4C5B345D292F34292C6D2E736C6963653F6D2E736C69636528622C4B293A6E65772055696E74333241727261792841727261792E70726F746F747970652E736C6963652E63616C6C286D2C622C4B2929292C6E65772055284C5B305D2C4C5B315D2C';
wwv_flow_imp.g_varchar2_table(610) := '4C5B325D2C4C5B335D2C792C4B29292C42413D5B4A2C33365D2C6E413D5B312C322C332C355D2C73413D5B442C385D2C6F413D5B502C4E5D2C69413D6E412E636F6E636174287341292C51413D5B6A2C7A2C242C5A2C5F5D2C63413D5B782C765D2C6141';
wwv_flow_imp.g_varchar2_table(611) := '3D2867412E70726F746F747970652E736C6963653D66756E6374696F6E28297B72657475726E20672E6170706C7928766F696420302C746869732E636F6465506F696E74732E736C69636528746869732E73746172742C746869732E656E6429297D2C67';
wwv_flow_imp.g_varchar2_table(612) := '41293B66756E6374696F6E20674128412C652C742C72297B746869732E636F6465506F696E74733D412C746869732E72657175697265643D2221223D3D3D652C746869732E73746172743D742C746869732E656E643D727D66756E6374696F6E20774128';
wwv_flow_imp.g_varchar2_table(613) := '412C65297B76617220743D512841292C723D28653D4928742C6529295B305D2C423D655B315D2C6E3D655B325D2C733D742E6C656E6774682C6F3D302C693D303B72657475726E7B6E6578743A66756E6374696F6E28297B696628733C3D692972657475';
wwv_flow_imp.g_varchar2_table(614) := '726E7B646F6E653A21302C76616C75653A6E756C6C7D3B666F722876617220413D74413B693C73262628413D66756E6374696F6E28412C652C742C722C42297B696628303D3D3D745B725D2972657475726E2074413B766172206E3D722D313B69662841';
wwv_flow_imp.g_varchar2_table(615) := '727261792E69734172726179284229262621303D3D3D425B6E5D2972657475726E2074413B76617220733D6E2D312C6F3D312B6E2C693D655B6E5D2C723D303C3D733F655B735D3A302C423D655B6F5D3B696628323D3D3D692626333D3D3D4229726574';
wwv_flow_imp.g_varchar2_table(616) := '75726E2074413B6966282D31213D3D6E412E696E6465784F662869292972657475726E2221223B6966282D31213D3D6E412E696E6465784F662842292972657475726E2074413B6966282D31213D3D73412E696E6465784F662842292972657475726E20';
wwv_flow_imp.g_varchar2_table(617) := '74413B696628383D3D3D45286E2C65292972657475726E22C3B7223B69662831313D3D3D72412E67657428415B6E5D292972657475726E2074413B69662828693D3D3D597C7C693D3D3D5729262631313D3D3D72412E67657428415B6F5D292972657475';
wwv_flow_imp.g_varchar2_table(618) := '726E2074413B696628373D3D3D697C7C373D3D3D422972657475726E2074413B696628393D3D3D692972657475726E2074413B6966282D313D3D3D5B442C762C785D2E696E6465784F662869292626393D3D3D422972657475726E2074413B6966282D31';
wwv_flow_imp.g_varchar2_table(619) := '213D3D5B4D2C532C542C6B2C585D2E696E6465784F662842292972657475726E2074413B69662845286E2C65293D3D3D562972657475726E2074413B696628702832332C562C6E2C65292972657475726E2074413B69662870285B4D2C535D2C4F2C6E2C';
wwv_flow_imp.g_varchar2_table(620) := '65292972657475726E2074413B696628702831322C31322C6E2C65292972657475726E2074413B696628693D3D3D442972657475726E22C3B7223B69662832333D3D3D697C7C32333D3D3D422972657475726E2074413B69662831363D3D3D427C7C3136';
wwv_flow_imp.g_varchar2_table(621) := '3D3D3D692972657475726E22C3B7223B6966282D31213D3D5B762C782C4F5D2E696E6465784F662842297C7C31343D3D3D692972657475726E2074413B69662833363D3D3D7226262D31213D3D63412E696E6465784F662869292972657475726E207441';
wwv_flow_imp.g_varchar2_table(622) := '3B696628693D3D3D58262633363D3D3D422972657475726E2074413B696628423D3D3D472972657475726E2074413B6966282D31213D3D42412E696E6465784F662842292626693D3D3D527C7C2D31213D3D42412E696E6465784F662869292626423D3D';
wwv_flow_imp.g_varchar2_table(623) := '3D522972657475726E2074413B696628693D3D3D5026262D31213D3D5B712C592C575D2E696E6465784F662842297C7C2D31213D3D5B712C592C575D2E696E6465784F662869292626423D3D3D4E2972657475726E2074413B6966282D31213D3D42412E';
wwv_flow_imp.g_varchar2_table(624) := '696E6465784F6628692926262D31213D3D6F412E696E6465784F662842297C7C2D31213D3D6F412E696E6465784F6628692926262D31213D3D42412E696E6465784F662842292972657475726E2074413B6966282D31213D3D5B502C4E5D2E696E646578';
wwv_flow_imp.g_varchar2_table(625) := '4F66286929262628423D3D3D527C7C2D31213D3D5B562C785D2E696E6465784F662842292626655B312B6F5D3D3D3D52297C7C2D31213D3D5B562C785D2E696E6465784F662869292626423D3D3D527C7C693D3D3D5226262D31213D3D5B522C582C6B5D';
wwv_flow_imp.g_varchar2_table(626) := '2E696E6465784F662842292972657475726E2074413B6966282D31213D3D5B522C582C6B2C4D2C535D2E696E6465784F6628422929666F722876617220513D6E3B303C3D513B297B69662828633D655B515D293D3D3D522972657475726E2074413B6966';
wwv_flow_imp.g_varchar2_table(627) := '282D313D3D3D5B582C6B5D2E696E6465784F6628632929627265616B3B512D2D7D6966282D31213D3D5B502C4E5D2E696E6465784F6628422929666F722876617220632C513D2D31213D3D5B4D2C535D2E696E6465784F662869293F733A6E3B303C3D51';
wwv_flow_imp.g_varchar2_table(628) := '3B297B69662828633D655B515D293D3D3D522972657475726E2074413B6966282D313D3D3D5B582C6B5D2E696E6465784F6628632929627265616B3B512D2D7D6966286A3D3D3D6926262D31213D3D5B6A2C7A2C5A2C5F5D2E696E6465784F662842297C';
wwv_flow_imp.g_varchar2_table(629) := '7C2D31213D3D5B7A2C5A5D2E696E6465784F6628692926262D31213D3D5B7A2C245D2E696E6465784F662842297C7C2D31213D3D5B242C5F5D2E696E6465784F662869292626423D3D3D242972657475726E2074413B6966282D31213D3D51412E696E64';
wwv_flow_imp.g_varchar2_table(630) := '65784F6628692926262D31213D3D5B472C4E5D2E696E6465784F662842297C7C2D31213D3D51412E696E6465784F662842292626693D3D3D502972657475726E2074413B6966282D31213D3D42412E696E6465784F6628692926262D31213D3D42412E69';
wwv_flow_imp.g_varchar2_table(631) := '6E6465784F662842292972657475726E2074413B696628693D3D3D6B26262D31213D3D42412E696E6465784F662842292972657475726E2074413B6966282D31213D3D42412E636F6E6361742852292E696E6465784F662869292626423D3D3D5626262D';
wwv_flow_imp.g_varchar2_table(632) := '313D3D3D65412E696E6465784F6628415B6F5D297C7C2D31213D3D42412E636F6E6361742852292E696E6465784F662842292626693D3D3D532972657475726E2074413B69662834313D3D3D69262634313D3D3D42297B666F722876617220613D745B6E';
wwv_flow_imp.g_varchar2_table(633) := '5D2C673D313B303C61262634313D3D3D655B2D2D615D3B29672B2B3B696628672532213D302972657475726E2074417D72657475726E20693D3D3D592626423D3D3D573F74413A22C3B7227D28742C422C722C2B2B692C6E29293D3D3D74413B293B6966';
wwv_flow_imp.g_varchar2_table(634) := '28413D3D3D7441262669213D3D732972657475726E7B646F6E653A21302C76616C75653A6E756C6C7D3B76617220653D6E657720614128742C412C6F2C69293B72657475726E206F3D692C7B76616C75653A652C646F6E653A21317D7D7D7D66756E6374';
wwv_flow_imp.g_varchar2_table(635) := '696F6E2055412841297B72657475726E2034383C3D412626413C3D35377D66756E6374696F6E206C412841297B72657475726E2055412841297C7C36353C3D412626413C3D37307C7C39373C3D412626413C3D3130327D66756E6374696F6E2043412841';
wwv_flow_imp.g_varchar2_table(636) := '297B72657475726E2031303D3D3D417C7C393D3D3D417C7C33323D3D3D417D66756E6374696F6E2075412841297B72657475726E2039373C3D28743D653D41292626743C3D3132327C7C36353C3D28653D65292626653C3D39307C7C3132383C3D417C7C';
wwv_flow_imp.g_varchar2_table(637) := '39353D3D3D413B76617220652C747D66756E6374696F6E2046412841297B72657475726E2075412841297C7C55412841297C7C34353D3D3D417D66756E6374696F6E20684128412C65297B72657475726E2039323D3D3D4126263130213D3D657D66756E';
wwv_flow_imp.g_varchar2_table(638) := '6374696F6E20644128412C652C74297B72657475726E2034353D3D3D413F75412865297C7C684128652C74293A212175412841297C7C39323D3D3D4126263130213D3D657D66756E6374696F6E20664128412C652C74297B72657475726E2034333D3D3D';
wwv_flow_imp.g_varchar2_table(639) := '417C7C34353D3D3D413F212155412865297C7C34363D3D3D65262655412874293A55412834363D3D3D413F653A41297D7661722048413D7B747970653A327D2C70413D7B747970653A337D2C45413D7B747970653A347D2C49413D7B747970653A31337D';
wwv_flow_imp.g_varchar2_table(640) := '2C79413D7B747970653A387D2C4B413D7B747970653A32317D2C6D413D7B747970653A397D2C4C413D7B747970653A31307D2C62413D7B747970653A31317D2C44413D7B747970653A31327D2C76413D7B747970653A31347D2C78413D7B747970653A32';
wwv_flow_imp.g_varchar2_table(641) := '337D2C4D413D7B747970653A317D2C53413D7B747970653A32357D2C54413D7B747970653A32347D2C47413D7B747970653A32367D2C4F413D7B747970653A32377D2C56413D7B747970653A32387D2C6B413D7B747970653A32397D2C52413D7B747970';
wwv_flow_imp.g_varchar2_table(642) := '653A33317D2C4E413D7B747970653A33327D2C50413D2858412E70726F746F747970652E77726974653D66756E6374696F6E2841297B746869732E5F76616C75653D746869732E5F76616C75652E636F6E6361742851284129297D2C58412E70726F746F';
wwv_flow_imp.g_varchar2_table(643) := '747970652E726561643D66756E6374696F6E28297B666F722876617220413D5B5D2C653D746869732E636F6E73756D65546F6B656E28293B65213D3D4E413B29412E707573682865292C653D746869732E636F6E73756D65546F6B656E28293B72657475';
wwv_flow_imp.g_varchar2_table(644) := '726E20417D2C58412E70726F746F747970652E636F6E73756D65546F6B656E3D66756E6374696F6E28297B76617220413D746869732E636F6E73756D65436F6465506F696E7428293B7377697463682841297B636173652033343A72657475726E207468';
wwv_flow_imp.g_varchar2_table(645) := '69732E636F6E73756D65537472696E67546F6B656E283334293B636173652033353A76617220653D746869732E7065656B436F6465506F696E742830292C743D746869732E7065656B436F6465506F696E742831292C723D746869732E7065656B436F64';
wwv_flow_imp.g_varchar2_table(646) := '65506F696E742832293B69662846412865297C7C684128742C7229297B76617220423D644128652C742C72293F323A313B72657475726E7B747970653A352C76616C75653A746869732E636F6E73756D654E616D6528292C666C6167733A427D7D627265';
wwv_flow_imp.g_varchar2_table(647) := '616B3B636173652033363A69662836313D3D3D746869732E7065656B436F6465506F696E742830292972657475726E20746869732E636F6E73756D65436F6465506F696E7428292C49413B627265616B3B636173652033393A72657475726E2074686973';
wwv_flow_imp.g_varchar2_table(648) := '2E636F6E73756D65537472696E67546F6B656E283339293B636173652034303A72657475726E2048413B636173652034313A72657475726E2070413B636173652034323A69662836313D3D3D746869732E7065656B436F6465506F696E74283029297265';
wwv_flow_imp.g_varchar2_table(649) := '7475726E20746869732E636F6E73756D65436F6465506F696E7428292C76413B627265616B3B636173652034333A696628664128412C746869732E7065656B436F6465506F696E742830292C746869732E7065656B436F6465506F696E74283129292972';
wwv_flow_imp.g_varchar2_table(650) := '657475726E20746869732E7265636F6E73756D65436F6465506F696E742841292C746869732E636F6E73756D654E756D65726963546F6B656E28293B627265616B3B636173652034343A72657475726E2045413B636173652034353A76617220723D412C';
wwv_flow_imp.g_varchar2_table(651) := '423D746869732E7065656B436F6465506F696E742830292C6E3D746869732E7065656B436F6465506F696E742831293B696628664128722C422C6E292972657475726E20746869732E7265636F6E73756D65436F6465506F696E742841292C746869732E';
wwv_flow_imp.g_varchar2_table(652) := '636F6E73756D654E756D65726963546F6B656E28293B696628644128722C422C6E292972657475726E20746869732E7265636F6E73756D65436F6465506F696E742841292C746869732E636F6E73756D654964656E744C696B65546F6B656E28293B6966';
wwv_flow_imp.g_varchar2_table(653) := '2834353D3D3D42262636323D3D3D6E2972657475726E20746869732E636F6E73756D65436F6465506F696E7428292C746869732E636F6E73756D65436F6465506F696E7428292C54413B627265616B3B636173652034363A696628664128412C74686973';
wwv_flow_imp.g_varchar2_table(654) := '2E7065656B436F6465506F696E742830292C746869732E7065656B436F6465506F696E74283129292972657475726E20746869732E7265636F6E73756D65436F6465506F696E742841292C746869732E636F6E73756D654E756D65726963546F6B656E28';
wwv_flow_imp.g_varchar2_table(655) := '293B627265616B3B636173652034373A69662834323D3D3D746869732E7065656B436F6465506F696E7428302929666F7228746869732E636F6E73756D65436F6465506F696E7428293B3B297B76617220733D746869732E636F6E73756D65436F646550';
wwv_flow_imp.g_varchar2_table(656) := '6F696E7428293B69662834323D3D3D73262634373D3D3D28733D746869732E636F6E73756D65436F6465506F696E742829292972657475726E20746869732E636F6E73756D65546F6B656E28293B6966282D313D3D3D732972657475726E20746869732E';
wwv_flow_imp.g_varchar2_table(657) := '636F6E73756D65546F6B656E28297D627265616B3B636173652035383A72657475726E2047413B636173652035393A72657475726E204F413B636173652036303A69662833333D3D3D746869732E7065656B436F6465506F696E74283029262634353D3D';
wwv_flow_imp.g_varchar2_table(658) := '3D746869732E7065656B436F6465506F696E74283129262634353D3D3D746869732E7065656B436F6465506F696E742832292972657475726E20746869732E636F6E73756D65436F6465506F696E7428292C746869732E636F6E73756D65436F6465506F';
wwv_flow_imp.g_varchar2_table(659) := '696E7428292C53413B627265616B3B636173652036343A766172206E3D746869732E7065656B436F6465506F696E742830292C6F3D746869732E7065656B436F6465506F696E742831292C693D746869732E7065656B436F6465506F696E742832293B69';
wwv_flow_imp.g_varchar2_table(660) := '66286441286E2C6F2C69292972657475726E7B747970653A372C76616C75653A746869732E636F6E73756D654E616D6528297D3B627265616B3B636173652039313A72657475726E2056413B636173652039323A696628684128412C746869732E706565';
wwv_flow_imp.g_varchar2_table(661) := '6B436F6465506F696E74283029292972657475726E20746869732E7265636F6E73756D65436F6465506F696E742841292C746869732E636F6E73756D654964656E744C696B65546F6B656E28293B627265616B3B636173652039333A72657475726E206B';
wwv_flow_imp.g_varchar2_table(662) := '413B636173652036313A69662836313D3D3D746869732E7065656B436F6465506F696E742830292972657475726E20746869732E636F6E73756D65436F6465506F696E7428292C79413B627265616B3B63617365203132333A72657475726E2062413B63';
wwv_flow_imp.g_varchar2_table(663) := '617365203132353A72657475726E2044413B63617365203131373A636173652038353A6F3D746869732E7065656B436F6465506F696E742830292C693D746869732E7065656B436F6465506F696E742831293B72657475726E203433213D3D6F7C7C216C';
wwv_flow_imp.g_varchar2_table(664) := '4128692926263633213D3D697C7C28746869732E636F6E73756D65436F6465506F696E7428292C746869732E636F6E73756D65556E69636F646552616E6765546F6B656E2829292C746869732E7265636F6E73756D65436F6465506F696E742841292C74';
wwv_flow_imp.g_varchar2_table(665) := '6869732E636F6E73756D654964656E744C696B65546F6B656E28293B63617365203132343A69662836313D3D3D746869732E7065656B436F6465506F696E742830292972657475726E20746869732E636F6E73756D65436F6465506F696E7428292C6D41';
wwv_flow_imp.g_varchar2_table(666) := '3B6966283132343D3D3D746869732E7065656B436F6465506F696E742830292972657475726E20746869732E636F6E73756D65436F6465506F696E7428292C4B413B627265616B3B63617365203132363A69662836313D3D3D746869732E7065656B436F';
wwv_flow_imp.g_varchar2_table(667) := '6465506F696E742830292972657475726E20746869732E636F6E73756D65436F6465506F696E7428292C4C413B627265616B3B636173652D313A72657475726E204E417D72657475726E2043412841293F28746869732E636F6E73756D65576869746553';
wwv_flow_imp.g_varchar2_table(668) := '7061636528292C5241293A55412841293F28746869732E7265636F6E73756D65436F6465506F696E742841292C746869732E636F6E73756D654E756D65726963546F6B656E2829293A75412841293F28746869732E7265636F6E73756D65436F6465506F';
wwv_flow_imp.g_varchar2_table(669) := '696E742841292C746869732E636F6E73756D654964656E744C696B65546F6B656E2829293A7B747970653A362C76616C75653A672841297D7D2C58412E70726F746F747970652E636F6E73756D65436F6465506F696E743D66756E6374696F6E28297B76';
wwv_flow_imp.g_varchar2_table(670) := '617220413D746869732E5F76616C75652E736869667428293B72657475726E20766F696420303D3D3D413F2D313A417D2C58412E70726F746F747970652E7265636F6E73756D65436F6465506F696E743D66756E6374696F6E2841297B746869732E5F76';
wwv_flow_imp.g_varchar2_table(671) := '616C75652E756E73686966742841297D2C58412E70726F746F747970652E7065656B436F6465506F696E743D66756E6374696F6E2841297B72657475726E20413E3D746869732E5F76616C75652E6C656E6774683F2D313A746869732E5F76616C75655B';
wwv_flow_imp.g_varchar2_table(672) := '415D7D2C58412E70726F746F747970652E636F6E73756D65556E69636F646552616E6765546F6B656E3D66756E6374696F6E28297B666F722876617220413D5B5D2C653D746869732E636F6E73756D65436F6465506F696E7428293B6C41286529262641';
wwv_flow_imp.g_varchar2_table(673) := '2E6C656E6774683C363B29412E707573682865292C653D746869732E636F6E73756D65436F6465506F696E7428293B666F722876617220743D21313B36333D3D3D652626412E6C656E6774683C363B29412E707573682865292C653D746869732E636F6E';
wwv_flow_imp.g_varchar2_table(674) := '73756D65436F6465506F696E7428292C743D21303B696628742972657475726E7B747970653A33302C73746172743A7061727365496E7428672E6170706C7928766F696420302C412E6D61702866756E6374696F6E2841297B72657475726E2036333D3D';
wwv_flow_imp.g_varchar2_table(675) := '3D413F34383A417D29292C3136292C656E643A7061727365496E7428672E6170706C7928766F696420302C412E6D61702866756E6374696F6E2841297B72657475726E2036333D3D3D413F37303A417D29292C3136297D3B76617220723D706172736549';
wwv_flow_imp.g_varchar2_table(676) := '6E7428672E6170706C7928766F696420302C41292C3136293B69662834353D3D3D746869732E7065656B436F6465506F696E7428302926266C4128746869732E7065656B436F6465506F696E7428312929297B746869732E636F6E73756D65436F646550';
wwv_flow_imp.g_varchar2_table(677) := '6F696E7428293B666F722876617220653D746869732E636F6E73756D65436F6465506F696E7428292C423D5B5D3B6C412865292626422E6C656E6774683C363B29422E707573682865292C653D746869732E636F6E73756D65436F6465506F696E742829';
wwv_flow_imp.g_varchar2_table(678) := '3B72657475726E7B747970653A33302C73746172743A722C656E643A7061727365496E7428672E6170706C7928766F696420302C42292C3136297D7D72657475726E7B747970653A33302C73746172743A722C656E643A727D7D2C58412E70726F746F74';
wwv_flow_imp.g_varchar2_table(679) := '7970652E636F6E73756D654964656E744C696B65546F6B656E3D66756E6374696F6E28297B76617220413D746869732E636F6E73756D654E616D6528293B72657475726E2275726C223D3D3D412E746F4C6F776572436173652829262634303D3D3D7468';
wwv_flow_imp.g_varchar2_table(680) := '69732E7065656B436F6465506F696E742830293F28746869732E636F6E73756D65436F6465506F696E7428292C746869732E636F6E73756D6555726C546F6B656E2829293A34303D3D3D746869732E7065656B436F6465506F696E742830293F28746869';
wwv_flow_imp.g_varchar2_table(681) := '732E636F6E73756D65436F6465506F696E7428292C7B747970653A31392C76616C75653A417D293A7B747970653A32302C76616C75653A417D7D2C58412E70726F746F747970652E636F6E73756D6555726C546F6B656E3D66756E6374696F6E28297B76';
wwv_flow_imp.g_varchar2_table(682) := '617220413D5B5D3B696628746869732E636F6E73756D655768697465537061636528292C2D313D3D3D746869732E7065656B436F6465506F696E742830292972657475726E7B747970653A32322C76616C75653A22227D3B76617220652C743D74686973';
wwv_flow_imp.g_varchar2_table(683) := '2E7065656B436F6465506F696E742830293B69662833393D3D3D747C7C33343D3D3D74297B743D746869732E636F6E73756D65537472696E67546F6B656E28746869732E636F6E73756D65436F6465506F696E742829293B72657475726E20303D3D3D74';
wwv_flow_imp.g_varchar2_table(684) := '2E74797065262628746869732E636F6E73756D655768697465537061636528292C2D313D3D3D746869732E7065656B436F6465506F696E742830297C7C34313D3D3D746869732E7065656B436F6465506F696E74283029293F28746869732E636F6E7375';
wwv_flow_imp.g_varchar2_table(685) := '6D65436F6465506F696E7428292C7B747970653A32322C76616C75653A742E76616C75657D293A28746869732E636F6E73756D6542616455726C52656D6E616E747328292C7841297D666F72283B3B297B76617220723D746869732E636F6E73756D6543';
wwv_flow_imp.g_varchar2_table(686) := '6F6465506F696E7428293B6966282D313D3D3D727C7C34313D3D3D722972657475726E7B747970653A32322C76616C75653A672E6170706C7928766F696420302C41297D3B69662843412872292972657475726E20746869732E636F6E73756D65576869';
wwv_flow_imp.g_varchar2_table(687) := '7465537061636528292C2D313D3D3D746869732E7065656B436F6465506F696E742830297C7C34313D3D3D746869732E7065656B436F6465506F696E742830293F28746869732E636F6E73756D65436F6465506F696E7428292C7B747970653A32322C76';
wwv_flow_imp.g_varchar2_table(688) := '616C75653A672E6170706C7928766F696420302C41297D293A28746869732E636F6E73756D6542616455726C52656D6E616E747328292C7841293B69662833343D3D3D727C7C33393D3D3D727C7C34303D3D3D727C7C28303C3D28653D72292626653C3D';
wwv_flow_imp.g_varchar2_table(689) := '387C7C31313D3D3D657C7C31343C3D652626653C3D33317C7C3132373D3D3D65292972657475726E20746869732E636F6E73756D6542616455726C52656D6E616E747328292C78413B69662839323D3D3D72297B69662821684128722C746869732E7065';
wwv_flow_imp.g_varchar2_table(690) := '656B436F6465506F696E74283029292972657475726E20746869732E636F6E73756D6542616455726C52656D6E616E747328292C78413B412E7075736828746869732E636F6E73756D6545736361706564436F6465506F696E742829297D656C73652041';
wwv_flow_imp.g_varchar2_table(691) := '2E707573682872297D7D2C58412E70726F746F747970652E636F6E73756D65576869746553706163653D66756E6374696F6E28297B666F72283B434128746869732E7065656B436F6465506F696E74283029293B29746869732E636F6E73756D65436F64';
wwv_flow_imp.g_varchar2_table(692) := '65506F696E7428297D2C58412E70726F746F747970652E636F6E73756D6542616455726C52656D6E616E74733D66756E6374696F6E28297B666F72283B3B297B76617220413D746869732E636F6E73756D65436F6465506F696E7428293B69662834313D';
wwv_flow_imp.g_varchar2_table(693) := '3D3D417C7C2D313D3D3D412972657475726E3B684128412C746869732E7065656B436F6465506F696E74283029292626746869732E636F6E73756D6545736361706564436F6465506F696E7428297D7D2C58412E70726F746F747970652E636F6E73756D';
wwv_flow_imp.g_varchar2_table(694) := '65537472696E67536C6963653D66756E6374696F6E2841297B666F722876617220653D22223B303C413B297B76617220743D4D6174682E6D696E283565342C41293B652B3D672E6170706C7928766F696420302C746869732E5F76616C75652E73706C69';
wwv_flow_imp.g_varchar2_table(695) := '636528302C7429292C412D3D747D72657475726E20746869732E5F76616C75652E736869667428292C657D2C58412E70726F746F747970652E636F6E73756D65537472696E67546F6B656E3D66756E6374696F6E2841297B666F722876617220653D2222';
wwv_flow_imp.g_varchar2_table(696) := '2C743D303B3B297B76617220722C423D746869732E5F76616C75655B745D3B6966282D313D3D3D427C7C766F696420303D3D3D427C7C423D3D3D412972657475726E7B747970653A302C76616C75653A652B3D746869732E636F6E73756D65537472696E';
wwv_flow_imp.g_varchar2_table(697) := '67536C6963652874297D3B69662831303D3D3D422972657475726E20746869732E5F76616C75652E73706C69636528302C74292C4D413B3932213D3D427C7C2D31213D3D28723D746869732E5F76616C75655B742B315D292626766F69642030213D3D72';
wwv_flow_imp.g_varchar2_table(698) := '26262831303D3D3D723F28652B3D746869732E636F6E73756D65537472696E67536C6963652874292C743D2D312C746869732E5F76616C75652E73686966742829293A684128422C7229262628652B3D746869732E636F6E73756D65537472696E67536C';
wwv_flow_imp.g_varchar2_table(699) := '6963652874292C652B3D6728746869732E636F6E73756D6545736361706564436F6465506F696E742829292C743D2D3129292C742B2B7D7D2C58412E70726F746F747970652E636F6E73756D654E756D6265723D66756E6374696F6E28297B7661722041';
wwv_flow_imp.g_varchar2_table(700) := '3D5B5D2C653D343B666F72283433213D3D28743D746869732E7065656B436F6465506F696E742830292926263435213D3D747C7C412E7075736828746869732E636F6E73756D65436F6465506F696E742829293B554128746869732E7065656B436F6465';
wwv_flow_imp.g_varchar2_table(701) := '506F696E74283029293B29412E7075736828746869732E636F6E73756D65436F6465506F696E742829293B76617220743D746869732E7065656B436F6465506F696E742830292C723D746869732E7065656B436F6465506F696E742831293B6966283436';
wwv_flow_imp.g_varchar2_table(702) := '3D3D3D742626554128722929666F7228412E7075736828746869732E636F6E73756D65436F6465506F696E7428292C746869732E636F6E73756D65436F6465506F696E742829292C653D383B554128746869732E7065656B436F6465506F696E74283029';
wwv_flow_imp.g_varchar2_table(703) := '293B29412E7075736828746869732E636F6E73756D65436F6465506F696E742829293B743D746869732E7065656B436F6465506F696E742830293B76617220723D746869732E7065656B436F6465506F696E742831292C423D746869732E7065656B436F';
wwv_flow_imp.g_varchar2_table(704) := '6465506F696E742832293B6966282836393D3D3D747C7C3130313D3D3D74292626282834333D3D3D727C7C34353D3D3D7229262655412842297C7C55412872292929666F7228412E7075736828746869732E636F6E73756D65436F6465506F696E742829';
wwv_flow_imp.g_varchar2_table(705) := '2C746869732E636F6E73756D65436F6465506F696E742829292C653D383B554128746869732E7065656B436F6465506F696E74283029293B29412E7075736828746869732E636F6E73756D65436F6465506F696E742829293B72657475726E5B66756E63';
wwv_flow_imp.g_varchar2_table(706) := '74696F6E2841297B76617220653D302C743D313B3433213D3D415B655D26263435213D3D415B655D7C7C2834353D3D3D415B655D262628743D2D31292C652B2B293B666F722876617220723D5B5D3B554128415B655D293B29722E7075736828415B652B';
wwv_flow_imp.g_varchar2_table(707) := '2B5D293B76617220423D722E6C656E6774683F7061727365496E7428672E6170706C7928766F696420302C72292C3130293A303B34363D3D3D415B655D2626652B2B3B666F7228766172206E3D5B5D3B554128415B655D293B296E2E7075736828415B65';
wwv_flow_imp.g_varchar2_table(708) := '2B2B5D293B76617220733D6E2E6C656E6774682C6F3D733F7061727365496E7428672E6170706C7928766F696420302C6E292C3130293A303B3639213D3D415B655D2626313031213D3D415B655D7C7C652B2B3B76617220693D313B3433213D3D415B65';
wwv_flow_imp.g_varchar2_table(709) := '5D26263435213D3D415B655D7C7C2834353D3D3D415B655D262628693D2D31292C652B2B293B666F722876617220513D5B5D3B554128415B655D293B29512E7075736828415B652B2B5D293B76617220633D512E6C656E6774683F7061727365496E7428';
wwv_flow_imp.g_varchar2_table(710) := '672E6170706C7928766F696420302C51292C3130293A303B72657475726E20742A28422B6F2A4D6174682E706F772831302C2D7329292A4D6174682E706F772831302C692A63297D2841292C655D7D2C58412E70726F746F747970652E636F6E73756D65';
wwv_flow_imp.g_varchar2_table(711) := '4E756D65726963546F6B656E3D66756E6374696F6E28297B76617220413D746869732E636F6E73756D654E756D62657228292C653D415B305D2C743D415B315D2C723D746869732E7065656B436F6465506F696E742830292C423D746869732E7065656B';
wwv_flow_imp.g_varchar2_table(712) := '436F6465506F696E742831292C413D746869732E7065656B436F6465506F696E742832293B72657475726E20644128722C422C41293F7B747970653A31352C6E756D6265723A652C666C6167733A742C756E69743A746869732E636F6E73756D654E616D';
wwv_flow_imp.g_varchar2_table(713) := '6528297D3A33373D3D3D723F28746869732E636F6E73756D65436F6465506F696E7428292C7B747970653A31362C6E756D6265723A652C666C6167733A747D293A7B747970653A31372C6E756D6265723A652C666C6167733A747D7D2C58412E70726F74';
wwv_flow_imp.g_varchar2_table(714) := '6F747970652E636F6E73756D6545736361706564436F6465506F696E743D66756E6374696F6E28297B76617220412C653D746869732E636F6E73756D65436F6465506F696E7428293B6966286C41286529297B666F722876617220743D672865293B6C41';
wwv_flow_imp.g_varchar2_table(715) := '28746869732E7065656B436F6465506F696E74283029292626742E6C656E6774683C363B29742B3D6728746869732E636F6E73756D65436F6465506F696E742829293B434128746869732E7065656B436F6465506F696E74283029292626746869732E63';
wwv_flow_imp.g_varchar2_table(716) := '6F6E73756D65436F6465506F696E7428293B76617220723D7061727365496E7428742C3136293B72657475726E20303D3D3D727C7C35353239363C3D28413D72292626413C3D35373334337C7C313131343131313C723F36353533333A727D7265747572';
wwv_flow_imp.g_varchar2_table(717) := '6E2D313D3D3D653F36353533333A657D2C58412E70726F746F747970652E636F6E73756D654E616D653D66756E6374696F6E28297B666F722876617220413D22223B3B297B76617220653D746869732E636F6E73756D65436F6465506F696E7428293B69';
wwv_flow_imp.g_varchar2_table(718) := '6628464128652929412B3D672865293B656C73657B69662821684128652C746869732E7065656B436F6465506F696E74283029292972657475726E20746869732E7265636F6E73756D65436F6465506F696E742865292C413B412B3D6728746869732E63';
wwv_flow_imp.g_varchar2_table(719) := '6F6E73756D6545736361706564436F6465506F696E742829297D7D7D2C5841293B66756E6374696F6E20584128297B746869732E5F76616C75653D5B5D7D766172204A413D2859412E6372656174653D66756E6374696F6E2841297B76617220653D6E65';
wwv_flow_imp.g_varchar2_table(720) := '772050413B72657475726E20652E77726974652841292C6E657720594128652E726561642829297D2C59412E706172736556616C75653D66756E6374696F6E2841297B72657475726E2059412E6372656174652841292E7061727365436F6D706F6E656E';
wwv_flow_imp.g_varchar2_table(721) := '7456616C756528297D2C59412E706172736556616C7565733D66756E6374696F6E2841297B72657475726E2059412E6372656174652841292E7061727365436F6D706F6E656E7456616C75657328297D2C59412E70726F746F747970652E706172736543';
wwv_flow_imp.g_varchar2_table(722) := '6F6D706F6E656E7456616C75653D66756E6374696F6E28297B666F722876617220413D746869732E636F6E73756D65546F6B656E28293B33313D3D3D412E747970653B29413D746869732E636F6E73756D65546F6B656E28293B69662833323D3D3D412E';
wwv_flow_imp.g_varchar2_table(723) := '74797065297468726F77206E65772053796E7461784572726F7228224572726F722070617273696E672043535320636F6D706F6E656E742076616C75652C20756E657870656374656420454F4622293B746869732E7265636F6E73756D65546F6B656E28';
wwv_flow_imp.g_varchar2_table(724) := '41293B666F722876617220653D746869732E636F6E73756D65436F6D706F6E656E7456616C756528293B33313D3D3D28413D746869732E636F6E73756D65546F6B656E2829292E747970653B293B69662833323D3D3D412E747970652972657475726E20';
wwv_flow_imp.g_varchar2_table(725) := '653B7468726F77206E65772053796E7461784572726F7228224572726F722070617273696E672043535320636F6D706F6E656E742076616C75652C206D756C7469706C652076616C75657320666F756E64207768656E20657870656374696E67206F6E6C';
wwv_flow_imp.g_varchar2_table(726) := '79206F6E6522297D2C59412E70726F746F747970652E7061727365436F6D706F6E656E7456616C7565733D66756E6374696F6E28297B666F722876617220413D5B5D3B3B297B76617220653D746869732E636F6E73756D65436F6D706F6E656E7456616C';
wwv_flow_imp.g_varchar2_table(727) := '756528293B69662833323D3D3D652E747970652972657475726E20413B412E707573682865292C412E7075736828297D7D2C59412E70726F746F747970652E636F6E73756D65436F6D706F6E656E7456616C75653D66756E6374696F6E28297B76617220';
wwv_flow_imp.g_varchar2_table(728) := '413D746869732E636F6E73756D65546F6B656E28293B73776974636828412E74797065297B636173652031313A636173652032383A6361736520323A72657475726E20746869732E636F6E73756D6553696D706C65426C6F636B28412E74797065293B63';
wwv_flow_imp.g_varchar2_table(729) := '6173652031393A72657475726E20746869732E636F6E73756D6546756E6374696F6E2841297D72657475726E20417D2C59412E70726F746F747970652E636F6E73756D6553696D706C65426C6F636B3D66756E6374696F6E2841297B666F722876617220';
wwv_flow_imp.g_varchar2_table(730) := '653D7B747970653A412C76616C7565733A5B5D7D2C743D746869732E636F6E73756D65546F6B656E28293B3B297B69662833323D3D3D742E747970657C7C636528742C41292972657475726E20653B746869732E7265636F6E73756D65546F6B656E2874';
wwv_flow_imp.g_varchar2_table(731) := '292C652E76616C7565732E7075736828746869732E636F6E73756D65436F6D706F6E656E7456616C75652829292C743D746869732E636F6E73756D65546F6B656E28297D7D2C59412E70726F746F747970652E636F6E73756D6546756E6374696F6E3D66';
wwv_flow_imp.g_varchar2_table(732) := '756E6374696F6E2841297B666F722876617220653D7B6E616D653A412E76616C75652C76616C7565733A5B5D2C747970653A31387D3B3B297B76617220743D746869732E636F6E73756D65546F6B656E28293B69662833323D3D3D742E747970657C7C33';
wwv_flow_imp.g_varchar2_table(733) := '3D3D3D742E747970652972657475726E20653B746869732E7265636F6E73756D65546F6B656E2874292C652E76616C7565732E7075736828746869732E636F6E73756D65436F6D706F6E656E7456616C75652829297D7D2C59412E70726F746F74797065';
wwv_flow_imp.g_varchar2_table(734) := '2E636F6E73756D65546F6B656E3D66756E6374696F6E28297B76617220413D746869732E5F746F6B656E732E736869667428293B72657475726E20766F696420303D3D3D413F4E413A417D2C59412E70726F746F747970652E7265636F6E73756D65546F';
wwv_flow_imp.g_varchar2_table(735) := '6B656E3D66756E6374696F6E2841297B746869732E5F746F6B656E732E756E73686966742841297D2C5941293B66756E6374696F6E2059412841297B746869732E5F746F6B656E733D417D66756E6374696F6E2057412841297B72657475726E2031353D';
wwv_flow_imp.g_varchar2_table(736) := '3D3D412E747970657D66756E6374696F6E205A412841297B72657475726E2031373D3D3D412E747970657D66756E6374696F6E205F412841297B72657475726E2032303D3D3D412E747970657D66756E6374696F6E2071412841297B72657475726E2030';
wwv_flow_imp.g_varchar2_table(737) := '3D3D3D412E747970657D66756E6374696F6E206A4128412C65297B72657475726E205F412841292626412E76616C75653D3D3D657D66756E6374696F6E207A412841297B72657475726E203331213D3D412E747970657D66756E6374696F6E2024412841';
wwv_flow_imp.g_varchar2_table(738) := '297B72657475726E203331213D3D412E74797065262634213D3D412E747970657D66756E6374696F6E2041652841297B76617220653D5B5D2C743D5B5D3B72657475726E20412E666F72456163682866756E6374696F6E2841297B696628343D3D3D412E';
wwv_flow_imp.g_varchar2_table(739) := '74797065297B696628303D3D3D742E6C656E677468297468726F77206E6577204572726F7228224572726F722070617273696E672066756E6374696F6E20617267732C207A65726F20746F6B656E7320666F722061726722293B72657475726E20652E70';
wwv_flow_imp.g_varchar2_table(740) := '7573682874292C766F696428743D5B5D297D3331213D3D412E747970652626742E707573682841297D292C742E6C656E6774682626652E707573682874292C657D66756E6374696F6E2065652841297B72657475726E2031373D3D3D412E747970657C7C';
wwv_flow_imp.g_varchar2_table(741) := '31353D3D3D412E747970657D66756E6374696F6E2074652841297B72657475726E2031363D3D3D412E747970657C7C65652841297D66756E6374696F6E2072652841297B72657475726E20313C412E6C656E6774683F5B415B305D2C415B315D5D3A5B41';
wwv_flow_imp.g_varchar2_table(742) := '5B305D5D7D66756E6374696F6E20426528412C652C74297B76617220723D415B305D2C413D415B315D3B72657475726E5B556528722C65292C556528766F69642030213D3D413F413A722C74295D7D66756E6374696F6E206E652841297B72657475726E';
wwv_flow_imp.g_varchar2_table(743) := '2031353D3D3D412E7479706526262822646567223D3D3D412E756E69747C7C2267726164223D3D3D412E756E69747C7C22726164223D3D3D412E756E69747C7C227475726E223D3D3D412E756E6974297D66756E6374696F6E2073652841297B73776974';
wwv_flow_imp.g_varchar2_table(744) := '636828412E66696C746572285F41292E6D61702866756E6374696F6E2841297B72657475726E20412E76616C75657D292E6A6F696E2822202229297B6361736522746F20626F74746F6D207269676874223A6361736522746F20726967687420626F7474';
wwv_flow_imp.g_varchar2_table(745) := '6F6D223A63617365226C65667420746F70223A6361736522746F70206C656674223A72657475726E5B61652C61655D3B6361736522746F20746F70223A6361736522626F74746F6D223A72657475726E2043652830293B6361736522746F20626F74746F';
wwv_flow_imp.g_varchar2_table(746) := '6D206C656674223A6361736522746F206C65667420626F74746F6D223A6361736522726967687420746F70223A6361736522746F70207269676874223A72657475726E5B61652C77655D3B6361736522746F207269676874223A63617365226C65667422';
wwv_flow_imp.g_varchar2_table(747) := '3A72657475726E204365283930293B6361736522746F20746F70206C656674223A6361736522746F206C65667420746F70223A6361736522726967687420626F74746F6D223A6361736522626F74746F6D207269676874223A72657475726E5B77652C77';
wwv_flow_imp.g_varchar2_table(748) := '655D3B6361736522746F20626F74746F6D223A6361736522746F70223A72657475726E20436528313830293B6361736522746F20746F70207269676874223A6361736522746F20726967687420746F70223A63617365226C65667420626F74746F6D223A';
wwv_flow_imp.g_varchar2_table(749) := '6361736522626F74746F6D206C656674223A72657475726E5B77652C61655D3B6361736522746F206C656674223A63617365227269676874223A72657475726E20436528323730297D72657475726E20307D66756E6374696F6E206F652841297B726574';
wwv_flow_imp.g_varchar2_table(750) := '75726E20303D3D283235352641297D66756E6374696F6E2069652841297B76617220653D32353526412C743D32353526413E3E382C723D32353526413E3E31362C413D32353526413E3E32343B72657475726E20653C3235353F227267626128222B412B';
wwv_flow_imp.g_varchar2_table(751) := '222C222B722B222C222B742B222C222B652F3235352B2229223A2272676228222B412B222C222B722B222C222B742B2229227D66756E6374696F6E20516528412C65297B69662831373D3D3D412E747970652972657475726E20412E6E756D6265723B69';
wwv_flow_imp.g_varchar2_table(752) := '66283136213D3D412E747970652972657475726E20303B76617220743D333D3D3D653F313A3235353B72657475726E20333D3D3D653F412E6E756D6265722F3130302A743A4D6174682E726F756E6428412E6E756D6265722F3130302A74297D76617220';
wwv_flow_imp.g_varchar2_table(753) := '63653D66756E6374696F6E28412C65297B72657475726E2031313D3D3D65262631323D3D3D412E747970657C7C2832383D3D3D65262632393D3D3D412E747970657C7C323D3D3D652626333D3D3D412E74797065297D2C61653D7B747970653A31372C6E';
wwv_flow_imp.g_varchar2_table(754) := '756D6265723A302C666C6167733A347D2C67653D7B747970653A31362C6E756D6265723A35302C666C6167733A347D2C77653D7B747970653A31362C6E756D6265723A3130302C666C6167733A347D2C55653D66756E6374696F6E28412C65297B696628';
wwv_flow_imp.g_varchar2_table(755) := '31363D3D3D412E747970652972657475726E20412E6E756D6265722F3130302A653B69662857412841292973776974636828412E756E6974297B636173652272656D223A6361736522656D223A72657475726E2031362A412E6E756D6265723B64656661';
wwv_flow_imp.g_varchar2_table(756) := '756C743A72657475726E20412E6E756D6265727D72657475726E20412E6E756D6265727D2C6C653D66756E6374696F6E28412C65297B69662831353D3D3D652E747970652973776974636828652E756E6974297B6361736522646567223A72657475726E';
wwv_flow_imp.g_varchar2_table(757) := '204D6174682E50492A652E6E756D6265722F3138303B636173652267726164223A72657475726E204D6174682E50492F3230302A652E6E756D6265723B6361736522726164223A72657475726E20652E6E756D6265723B63617365227475726E223A7265';
wwv_flow_imp.g_varchar2_table(758) := '7475726E20322A4D6174682E50492A652E6E756D6265727D7468726F77206E6577204572726F722822556E737570706F7274656420616E676C65207479706522297D2C43653D66756E6374696F6E2841297B72657475726E204D6174682E50492A412F31';
wwv_flow_imp.g_varchar2_table(759) := '38307D2C75653D66756E6374696F6E28412C65297B69662831383D3D3D652E74797065297B76617220743D6D655B652E6E616D655D3B696628766F696420303D3D3D74297468726F77206E6577204572726F722827417474656D7074696E6720746F2070';
wwv_flow_imp.g_varchar2_table(760) := '6172736520616E20756E737570706F7274656420636F6C6F722066756E6374696F6E2022272B652E6E616D652B272227293B72657475726E207428412C652E76616C756573297D696628353D3D3D652E74797065297B696628333D3D3D652E76616C7565';
wwv_flow_imp.g_varchar2_table(761) := '2E6C656E677468297B76617220723D652E76616C75652E737562737472696E6728302C31292C423D652E76616C75652E737562737472696E6728312C32292C6E3D652E76616C75652E737562737472696E6728322C33293B72657475726E204665287061';
wwv_flow_imp.g_varchar2_table(762) := '727365496E7428722B722C3136292C7061727365496E7428422B422C3136292C7061727365496E74286E2B6E2C3136292C31297D696628343D3D3D652E76616C75652E6C656E677468297B76617220723D652E76616C75652E737562737472696E672830';
wwv_flow_imp.g_varchar2_table(763) := '2C31292C423D652E76616C75652E737562737472696E6728312C32292C6E3D652E76616C75652E737562737472696E6728322C33292C733D652E76616C75652E737562737472696E6728332C34293B72657475726E204665287061727365496E7428722B';
wwv_flow_imp.g_varchar2_table(764) := '722C3136292C7061727365496E7428422B422C3136292C7061727365496E74286E2B6E2C3136292C7061727365496E7428732B732C3136292F323535297D696628363D3D3D652E76616C75652E6C656E677468297B723D652E76616C75652E7375627374';
wwv_flow_imp.g_varchar2_table(765) := '72696E6728302C32292C423D652E76616C75652E737562737472696E6728322C34292C6E3D652E76616C75652E737562737472696E6728342C36293B72657475726E204665287061727365496E7428722C3136292C7061727365496E7428422C3136292C';
wwv_flow_imp.g_varchar2_table(766) := '7061727365496E74286E2C3136292C31297D696628383D3D3D652E76616C75652E6C656E677468297B723D652E76616C75652E737562737472696E6728302C32292C423D652E76616C75652E737562737472696E6728322C34292C6E3D652E76616C7565';
wwv_flow_imp.g_varchar2_table(767) := '2E737562737472696E6728342C36292C733D652E76616C75652E737562737472696E6728362C38293B72657475726E204665287061727365496E7428722C3136292C7061727365496E7428422C3136292C7061727365496E74286E2C3136292C70617273';
wwv_flow_imp.g_varchar2_table(768) := '65496E7428732C3136292F323535297D7D69662832303D3D3D652E74797065297B653D4C655B652E76616C75652E746F55707065724361736528295D3B696628766F69642030213D3D652972657475726E20657D72657475726E204C652E5452414E5350';
wwv_flow_imp.g_varchar2_table(769) := '4152454E547D2C46653D66756E6374696F6E28412C652C742C72297B72657475726E28413C3C32347C653C3C31367C743C3C387C4D6174682E726F756E64283235352A72293C3C30293E3E3E307D2C68653D66756E6374696F6E28412C65297B653D652E';
wwv_flow_imp.g_varchar2_table(770) := '66696C746572282441293B696628333D3D3D652E6C656E677468297B76617220743D652E6D6170285165292C723D745B305D2C423D745B315D2C743D745B325D3B72657475726E20466528722C422C742C31297D69662834213D3D652E6C656E67746829';
wwv_flow_imp.g_varchar2_table(771) := '72657475726E20303B653D652E6D6170285165292C723D655B305D2C423D655B315D2C743D655B325D2C653D655B335D3B72657475726E20466528722C422C742C65297D3B66756E6374696F6E20646528412C652C74297B72657475726E20743C302626';
wwv_flow_imp.g_varchar2_table(772) := '28742B3D31292C313C3D7426262D2D742C743C312F363F28652D41292A742A362B413A743C2E353F653A743C322F333F362A28652D41292A28322F332D74292B413A417D66756E6374696F6E20666528412C65297B72657475726E20756528412C4A412E';
wwv_flow_imp.g_varchar2_table(773) := '6372656174652865292E7061727365436F6D706F6E656E7456616C75652829297D66756E6374696F6E20486528412C65297B72657475726E20413D756528412C655B305D292C28653D655B315D29262674652865293F7B636F6C6F723A412C73746F703A';
wwv_flow_imp.g_varchar2_table(774) := '657D3A7B636F6C6F723A412C73746F703A6E756C6C7D7D66756E6374696F6E20706528412C74297B76617220653D415B305D2C723D415B412E6C656E6774682D315D3B6E756C6C3D3D3D652E73746F70262628652E73746F703D6165292C6E756C6C3D3D';
wwv_flow_imp.g_varchar2_table(775) := '3D722E73746F70262628722E73746F703D7765293B666F722876617220423D5B5D2C6E3D302C733D303B733C412E6C656E6774683B732B2B297B766172206F3D415B735D2E73746F703B6E756C6C213D3D6F3F286E3C286F3D5565286F2C7429293F422E';
wwv_flow_imp.g_varchar2_table(776) := '70757368286F293A422E70757368286E292C6E3D6F293A422E70757368286E756C6C297D666F722876617220693D6E756C6C2C733D303B733C422E6C656E6774683B732B2B297B76617220513D425B735D3B6966286E756C6C3D3D3D51296E756C6C3D3D';
wwv_flow_imp.g_varchar2_table(777) := '3D69262628693D73293B656C7365206966286E756C6C213D3D69297B666F722876617220633D732D692C613D28512D425B692D315D292F28312B63292C673D313B673C3D633B672B2B29425B692B672D315D3D612A673B693D6E756C6C7D7D7265747572';
wwv_flow_imp.g_varchar2_table(778) := '6E20412E6D61702866756E6374696F6E28412C65297B72657475726E7B636F6C6F723A412E636F6C6F722C73746F703A4D6174682E6D6178284D6174682E6D696E28312C425B655D2F74292C30297D7D297D66756E6374696F6E20456528412C652C7429';
wwv_flow_imp.g_varchar2_table(779) := '7B76617220723D226E756D626572223D3D747970656F6620413F413A28733D652F322C723D286E3D74292F322C733D55652828423D41295B305D2C65292D732C6E3D722D556528425B315D2C6E292C284D6174682E6174616E32286E2C73292B322A4D61';
wwv_flow_imp.g_varchar2_table(780) := '74682E5049292528322A4D6174682E504929292C423D4D6174682E61627328652A4D6174682E73696E287229292B4D6174682E61627328742A4D6174682E636F73287229292C6E3D652F322C733D742F322C653D422F322C743D4D6174682E73696E2872';
wwv_flow_imp.g_varchar2_table(781) := '2D4D6174682E50492F32292A652C653D4D6174682E636F7328722D4D6174682E50492F32292A653B72657475726E5B422C6E2D652C6E2B652C732D742C732B745D7D66756E6374696F6E20496528412C65297B72657475726E204D6174682E7371727428';
wwv_flow_imp.g_varchar2_table(782) := '412A412B652A65297D66756E6374696F6E20796528412C652C422C6E2C73297B72657475726E5B5B302C305D2C5B302C655D2C5B412C305D2C5B412C655D5D2E7265647563652866756E6374696F6E28412C65297B76617220743D655B305D2C723D655B';
wwv_flow_imp.g_varchar2_table(783) := '315D2C723D496528422D742C6E2D72293B72657475726E28733F723C412E6F7074696D756D44697374616E63653A723E412E6F7074696D756D44697374616E6365293F7B6F7074696D756D436F726E65723A652C6F7074696D756D44697374616E63653A';
wwv_flow_imp.g_varchar2_table(784) := '727D3A417D2C7B6F7074696D756D44697374616E63653A733F312F303A2D312F302C6F7074696D756D436F726E65723A6E756C6C7D292E6F7074696D756D436F726E65727D766172204B653D66756E6374696F6E28412C65297B76617220743D652E6669';
wwv_flow_imp.g_varchar2_table(785) := '6C746572282441292C723D745B305D2C423D745B315D2C6E3D745B325D2C653D745B335D2C743D2831373D3D3D722E747970653F436528722E6E756D626572293A6C6528412C7229292F28322A4D6174682E5049292C413D74652842293F422E6E756D62';
wwv_flow_imp.g_varchar2_table(786) := '65722F3130303A302C723D7465286E293F6E2E6E756D6265722F3130303A302C423D766F69642030213D3D65262674652865293F556528652C31293A313B696628303D3D412972657475726E204665283235352A722C3235352A722C3235352A722C3129';
wwv_flow_imp.g_varchar2_table(787) := '3B6E3D723C3D2E353F722A28312B41293A722B412D722A412C653D322A722D6E2C413D646528652C6E2C742B312F33292C723D646528652C6E2C74292C743D646528652C6E2C742D312F33293B72657475726E204665283235352A412C3235352A722C32';
wwv_flow_imp.g_varchar2_table(788) := '35352A742C42297D2C6D653D7B68736C3A4B652C68736C613A4B652C7267623A68652C726762613A68657D2C4C653D7B414C494345424C55453A343034323835303330332C414E544951554557484954453A343230393736303235352C415155413A3136';
wwv_flow_imp.g_varchar2_table(789) := '3737373231352C415155414D4152494E453A323134373437323633392C415A5552453A343034333330393035352C42454947453A343132363533303831352C4249535155453A343239333138323731392C424C41434B3A3235352C424C414E4348454441';
wwv_flow_imp.g_varchar2_table(790) := '4C4D4F4E443A343239333634333737352C424C55453A36353533352C424C554556494F4C45543A323331383133313936372C42524F574E3A323737313030343135392C4255524C59574F4F443A333733363633353339312C4341444554424C55453A3136';
wwv_flow_imp.g_varchar2_table(791) := '30343233313432332C434841525452455553453A323134373431383336372C43484F434F4C4154453A333533303130343537352C434F52414C3A343238363533333838372C434F524E464C4F574552424C55453A313638373534373339312C434F524E53';
wwv_flow_imp.g_varchar2_table(792) := '494C4B3A343239343439393538332C4352494D534F4E3A333639323331333835352C4359414E3A31363737373231352C4441524B424C55453A33353833392C4441524B4359414E3A393134353334332C4441524B474F4C44454E524F443A333039353833';
wwv_flow_imp.g_varchar2_table(793) := '373639352C4441524B475241593A323834363436383630372C4441524B475245454E3A363535333835352C4441524B475245593A323834363436383630372C4441524B4B48414B493A333138323931343535392C4441524B4D4147454E54413A32333332';
wwv_flow_imp.g_varchar2_table(794) := '3036383836332C4441524B4F4C495645475245454E3A313433333038373939392C4441524B4F52414E47453A343238373336353337352C4441524B4F52434849443A323537303234333332372C4441524B5245443A323333323033333237392C4441524B';
wwv_flow_imp.g_varchar2_table(795) := '53414C4D4F4E3A333931383935333231352C4441524B534541475245454E3A323431313439393531392C4441524B534C415445424C55453A313231313939333038372C4441524B534C415445475241593A3739333732363937352C4441524B534C415445';
wwv_flow_imp.g_varchar2_table(796) := '475245593A3739333732363937352C4441524B54555251554F4953453A31333535343137352C4441524B56494F4C45543A323438333038323233392C4445455050494E4B3A343237393533383638372C44454550534B59424C55453A3132353832393131';
wwv_flow_imp.g_varchar2_table(797) := '2C44494D475241593A313736383531363039352C44494D475245593A313736383531363039352C444F44474552424C55453A3531323831393139392C46495245425249434B3A323938383538313633312C464C4F52414C57484954453A34323934363335';
wwv_flow_imp.g_varchar2_table(798) := '3737352C464F52455354475245454E3A3537393534333830372C465543485349413A343237383235353631352C4741494E53424F524F3A333730353436323031352C47484F535457484954453A343137373036383033312C474F4C443A34323932323830';
wwv_flow_imp.g_varchar2_table(799) := '3537352C474F4C44454E524F443A333636383235343937352C475241593A323135353930353237392C475245454E3A383338383836332C475245454E59454C4C4F573A323931393138323333352C475245593A323135353930353237392C484F4E455944';
wwv_flow_imp.g_varchar2_table(800) := '45573A343034333330353231352C484F5450494E4B3A343238353131373639352C494E4449414E5245443A333434353338323339392C494E4449474F3A313235383332343733352C49564F52593A343239343936333435352C4B48414B493A3430343136';
wwv_flow_imp.g_varchar2_table(801) := '34313231352C4C4156454E4445523A333837333839373231352C4C4156454E444552424C5553483A343239333938313639352C4C41574E475245454E3A323039363839303131312C4C454D4F4E43484946464F4E3A343239343632363831352C4C494748';
wwv_flow_imp.g_varchar2_table(802) := '54424C55453A323931363637333237392C4C49474854434F52414C3A343033343935333437312C4C494748544359414E3A333737343837333539392C4C49474854474F4C44454E524F4459454C4C4F573A343231303734323031352C4C49474854475241';
wwv_flow_imp.g_varchar2_table(803) := '593A333535333837343934332C4C49474854475245454E3A323433313535333739312C4C49474854475245593A333535333837343934332C4C4947485450494E4B3A343239303136373239352C4C4947485453414C4D4F4E3A343238383730373332372C';
wwv_flow_imp.g_varchar2_table(804) := '4C49474854534541475245454E3A3534383538303039352C4C49474854534B59424C55453A323237383438383833312C4C49474854534C415445475241593A323030353434313032332C4C49474854534C415445475245593A323030353434313032332C';
wwv_flow_imp.g_varchar2_table(805) := '4C49474854535445454C424C55453A323936353639323135392C4C4947485459454C4C4F573A343239343935393335392C4C494D453A31363731313933352C4C494D45475245454E3A3835323330383733352C4C494E454E3A343231303039313737352C';
wwv_flow_imp.g_varchar2_table(806) := '4D4147454E54413A343237383235353631352C4D41524F4F4E3A323134373438333930332C4D454449554D415155414D4152494E453A313732343735343638372C4D454449554D424C55453A35323733352C4D454449554D4F52434849443A3331323631';
wwv_flow_imp.g_varchar2_table(807) := '38373030372C4D454449554D505552504C453A323437333634373130332C4D454449554D534541475245454E3A313031383339333038372C4D454449554D534C415445424C55453A323037303437343439352C4D454449554D535052494E47475245454E';
wwv_flow_imp.g_varchar2_table(808) := '3A31363432333637392C4D454449554D54555251554F4953453A313232313730393035352C4D454449554D56494F4C45545245443A333334303037363534332C4D49444E49474854424C55453A3432313039373732372C4D494E54435245414D3A343132';
wwv_flow_imp.g_varchar2_table(809) := '373139333835352C4D49535459524F53453A343239333139303134332C4D4F43434153494E3A343239333137383837392C4E4156414A4F57484954453A343239323738333631352C4E4156593A33333032332C4F4C444C4143453A343236303735313130';
wwv_flow_imp.g_varchar2_table(810) := '332C4F4C4956453A323135353837323531312C4F4C495645445241423A313830343437373433392C4F52414E47453A343238393030333737352C4F52414E47455245443A343238323731323331392C4F52434849443A333636343832383135392C50414C';
wwv_flow_imp.g_varchar2_table(811) := '45474F4C44454E524F443A343030383232353533352C50414C45475245454E3A323536363632353533352C50414C4554555251554F4953453A323935313637313535312C50414C4556494F4C45545245443A333638313538383232332C50415041594157';
wwv_flow_imp.g_varchar2_table(812) := '4849503A343239333930373936372C5045414348505546463A343239323532343534332C504552553A333434383036313935312C50494E4B3A343239303832353231352C504C554D3A333731383330373332372C504F57444552424C55453A3239363735';
wwv_flow_imp.g_varchar2_table(813) := '32393231352C505552504C453A323134373531363637312C52454245434341505552504C453A313731343635373739312C5245443A343237383139303333352C524F535942524F574E3A333136333532353131392C524F59414C424C55453A3130393734';
wwv_flow_imp.g_varchar2_table(814) := '35383137352C534144444C4542524F574E3A323333363536303132372C53414C4D4F4E3A343230323732323034372C53414E445942524F574E3A343130343431333433392C534541475245454E3A3738303838333936372C5345415348454C4C3A343239';
wwv_flow_imp.g_varchar2_table(815) := '343330373538332C5349454E4E413A323638393734303238372C53494C5645523A333233333835373739312C534B59424C55453A323237383438343939312C534C415445424C55453A313738343333353837312C534C415445475241593A313838373437';
wwv_flow_imp.g_varchar2_table(816) := '333931392C534C415445475245593A313838373437333931392C534E4F573A343239343633383333352C535052494E47475245454E3A31363734343434372C535445454C424C55453A313138323937313133352C54414E3A333533353034373933352C54';
wwv_flow_imp.g_varchar2_table(817) := '45414C3A383432313633312C54484953544C453A333633363435313538332C544F4D41544F3A343238343639363537352C5452414E53504152454E543A302C54555251554F4953453A313038383437353339312C56494F4C45543A343030313535383237';
wwv_flow_imp.g_varchar2_table(818) := '312C57484541543A343132353031323939312C57484954453A343239343936373239352C5748495445534D4F4B453A343132363533373231352C59454C4C4F573A343239343930323031352C59454C4C4F57475245454E3A323539373133393139397D2C';
wwv_flow_imp.g_varchar2_table(819) := '62653D7B6E616D653A226261636B67726F756E642D636C6970222C696E697469616C56616C75653A22626F726465722D626F78222C7072656669783A21312C747970653A312C70617273653A66756E6374696F6E28412C65297B72657475726E20652E6D';
wwv_flow_imp.g_varchar2_table(820) := '61702866756E6374696F6E2841297B6966285F412841292973776974636828412E76616C7565297B636173652270616464696E672D626F78223A72657475726E20313B6361736522636F6E74656E742D626F78223A72657475726E20327D72657475726E';
wwv_flow_imp.g_varchar2_table(821) := '20307D297D7D2C44653D7B6E616D653A226261636B67726F756E642D636F6C6F72222C696E697469616C56616C75653A227472616E73706172656E74222C7072656669783A21312C747970653A332C666F726D61743A22636F6C6F72227D2C4B653D6675';
wwv_flow_imp.g_varchar2_table(822) := '6E6374696F6E28742C41297B76617220723D436528313830292C423D5B5D3B72657475726E2041652841292E666F72456163682866756E6374696F6E28412C65297B696628303D3D3D65297B653D415B305D3B69662832303D3D3D652E7479706526262D';
wwv_flow_imp.g_varchar2_table(823) := '31213D3D5B22746F70222C226C656674222C227269676874222C22626F74746F6D225D2E696E6465784F6628652E76616C7565292972657475726E20766F696428723D7365284129293B6966286E652865292972657475726E20766F696428723D286C65';
wwv_flow_imp.g_varchar2_table(824) := '28742C65292B43652832373029292543652833363029297D413D486528742C41293B422E707573682841297D292C7B616E676C653A722C73746F70733A422C747970653A317D7D2C76653D22636C6F736573742D73696465222C78653D22666172746865';
wwv_flow_imp.g_varchar2_table(825) := '73742D73696465222C4D653D22636C6F736573742D636F726E6572222C53653D2266617274686573742D636F726E6572222C54653D22656C6C69707365222C47653D22636F6E7461696E222C68653D66756E6374696F6E28722C41297B76617220423D30';
wwv_flow_imp.g_varchar2_table(826) := '2C6E3D332C733D5B5D2C6F3D5B5D3B72657475726E2041652841292E666F72456163682866756E6374696F6E28412C65297B76617220743D21303B303D3D3D653F743D412E7265647563652866756E6374696F6E28412C65297B6966285F412865292973';
wwv_flow_imp.g_varchar2_table(827) := '776974636828652E76616C7565297B636173652263656E746572223A72657475726E206F2E70757368286765292C21313B6361736522746F70223A63617365226C656674223A72657475726E206F2E70757368286165292C21313B636173652272696768';
wwv_flow_imp.g_varchar2_table(828) := '74223A6361736522626F74746F6D223A72657475726E206F2E70757368287765292C21317D656C73652069662874652865297C7C65652865292972657475726E206F2E707573682865292C21313B72657475726E20417D2C74293A313D3D3D6526262874';
wwv_flow_imp.g_varchar2_table(829) := '3D412E7265647563652866756E6374696F6E28412C65297B6966285F412865292973776974636828652E76616C7565297B6361736522636972636C65223A72657475726E20423D302C21313B636173652054653A72657475726E2128423D31293B636173';
wwv_flow_imp.g_varchar2_table(830) := '652047653A636173652076653A72657475726E206E3D302C21313B636173652078653A72657475726E21286E3D31293B63617365204D653A72657475726E21286E3D32293B6361736522636F766572223A636173652053653A72657475726E21286E3D33';
wwv_flow_imp.g_varchar2_table(831) := '297D656C73652069662865652865297C7C74652865292972657475726E286E3D2141727261792E69734172726179286E293F5B5D3A6E292E707573682865292C21313B72657475726E20417D2C7429292C74262628413D486528722C41292C732E707573';
wwv_flow_imp.g_varchar2_table(832) := '68284129297D292C7B73697A653A6E2C73686170653A422C73746F70733A732C706F736974696F6E3A6F2C747970653A327D7D2C4F653D66756E6374696F6E28412C65297B69662832323D3D3D652E74797065297B76617220743D7B75726C3A652E7661';
wwv_flow_imp.g_varchar2_table(833) := '6C75652C747970653A307D3B72657475726E20412E63616368652E616464496D61676528652E76616C7565292C747D6966283138213D3D652E74797065297468726F77206E6577204572726F722822556E737570706F7274656420696D61676520747970';
wwv_flow_imp.g_varchar2_table(834) := '6520222B652E74797065293B743D6B655B652E6E616D655D3B696628766F696420303D3D3D74297468726F77206E6577204572726F722827417474656D7074696E6720746F20706172736520616E20756E737570706F7274656420696D6167652066756E';
wwv_flow_imp.g_varchar2_table(835) := '6374696F6E2022272B652E6E616D652B272227293B72657475726E207428412C652E76616C756573297D3B7661722056652C6B653D7B226C696E6561722D6772616469656E74223A66756E6374696F6E28742C41297B76617220723D436528313830292C';
wwv_flow_imp.g_varchar2_table(836) := '423D5B5D3B72657475726E2041652841292E666F72456163682866756E6374696F6E28412C65297B696628303D3D3D65297B653D415B305D3B69662832303D3D3D652E74797065262622746F223D3D3D652E76616C75652972657475726E20766F696428';
wwv_flow_imp.g_varchar2_table(837) := '723D7365284129293B6966286E652865292972657475726E20766F696428723D6C6528742C6529297D413D486528742C41293B422E707573682841297D292C7B616E676C653A722C73746F70733A422C747970653A317D7D2C222D6D6F7A2D6C696E6561';
wwv_flow_imp.g_varchar2_table(838) := '722D6772616469656E74223A4B652C222D6D732D6C696E6561722D6772616469656E74223A4B652C222D6F2D6C696E6561722D6772616469656E74223A4B652C222D7765626B69742D6C696E6561722D6772616469656E74223A4B652C2272616469616C';
wwv_flow_imp.g_varchar2_table(839) := '2D6772616469656E74223A66756E6374696F6E28422C41297B766172206E3D302C733D332C6F3D5B5D2C693D5B5D3B72657475726E2041652841292E666F72456163682866756E6374696F6E28412C65297B76617220742C723D21303B303D3D3D652626';
wwv_flow_imp.g_varchar2_table(840) := '28743D21312C723D412E7265647563652866756E6374696F6E28412C65297B69662874296966285F412865292973776974636828652E76616C7565297B636173652263656E746572223A72657475726E20692E70757368286765292C413B636173652274';
wwv_flow_imp.g_varchar2_table(841) := '6F70223A63617365226C656674223A72657475726E20692E70757368286165292C413B63617365227269676874223A6361736522626F74746F6D223A72657475726E20692E70757368287765292C417D656C73652874652865297C7C6565286529292626';
wwv_flow_imp.g_varchar2_table(842) := '692E707573682865293B656C7365206966285F412865292973776974636828652E76616C7565297B6361736522636972636C65223A72657475726E206E3D302C21313B636173652054653A72657475726E21286E3D31293B63617365226174223A726574';
wwv_flow_imp.g_varchar2_table(843) := '75726E2128743D2130293B636173652076653A72657475726E20733D302C21313B6361736522636F766572223A636173652078653A72657475726E2128733D31293B636173652047653A63617365204D653A72657475726E2128733D32293B6361736520';
wwv_flow_imp.g_varchar2_table(844) := '53653A72657475726E2128733D33297D656C73652069662865652865297C7C74652865292972657475726E28733D2141727261792E697341727261792873293F5B5D3A73292E707573682865292C21313B72657475726E20417D2C7229292C7226262841';
wwv_flow_imp.g_varchar2_table(845) := '3D486528422C41292C6F2E70757368284129297D292C7B73697A653A732C73686170653A6E2C73746F70733A6F2C706F736974696F6E3A692C747970653A327D7D2C222D6D6F7A2D72616469616C2D6772616469656E74223A68652C222D6D732D726164';
wwv_flow_imp.g_varchar2_table(846) := '69616C2D6772616469656E74223A68652C222D6F2D72616469616C2D6772616469656E74223A68652C222D7765626B69742D72616469616C2D6772616469656E74223A68652C222D7765626B69742D6772616469656E74223A66756E6374696F6E28722C';
wwv_flow_imp.g_varchar2_table(847) := '41297B76617220653D436528313830292C423D5B5D2C6E3D313B72657475726E2041652841292E666F72456163682866756E6374696F6E28412C65297B76617220742C413D415B305D3B696628303D3D3D65297B6966285F412841292626226C696E6561';
wwv_flow_imp.g_varchar2_table(848) := '72223D3D3D412E76616C75652972657475726E20766F6964286E3D31293B6966285F4128412926262272616469616C223D3D3D412E76616C75652972657475726E20766F6964286E3D32297D31383D3D3D412E747970652626282266726F6D223D3D3D41';
wwv_flow_imp.g_varchar2_table(849) := '2E6E616D653F28743D756528722C412E76616C7565735B305D292C422E70757368287B73746F703A61652C636F6C6F723A747D29293A22746F223D3D3D412E6E616D653F28743D756528722C412E76616C7565735B305D292C422E70757368287B73746F';
wwv_flow_imp.g_varchar2_table(850) := '703A77652C636F6C6F723A747D29293A22636F6C6F722D73746F7022213D3D412E6E616D657C7C323D3D3D28413D412E76616C7565732E66696C74657228244129292E6C656E677468262628743D756528722C415B315D292C413D415B305D2C5A412841';
wwv_flow_imp.g_varchar2_table(851) := '292626422E70757368287B73746F703A7B747970653A31362C6E756D6265723A3130302A412E6E756D6265722C666C6167733A412E666C6167737D2C636F6C6F723A747D2929297D292C313D3D3D6E3F7B616E676C653A28652B43652831383029292543';
wwv_flow_imp.g_varchar2_table(852) := '6528333630292C73746F70733A422C747970653A6E7D3A7B73697A653A332C73686170653A302C73746F70733A422C706F736974696F6E3A5B5D2C747970653A6E7D7D7D2C52653D7B6E616D653A226261636B67726F756E642D696D616765222C696E69';
wwv_flow_imp.g_varchar2_table(853) := '7469616C56616C75653A226E6F6E65222C747970653A312C7072656669783A21312C70617273653A66756E6374696F6E28652C41297B696628303D3D3D412E6C656E6774682972657475726E5B5D3B76617220743D415B305D3B72657475726E2032303D';
wwv_flow_imp.g_varchar2_table(854) := '3D3D742E747970652626226E6F6E65223D3D3D742E76616C75653F5B5D3A412E66696C7465722866756E6374696F6E2841297B72657475726E2024412841292626212832303D3D3D28413D41292E747970652626226E6F6E65223D3D3D412E76616C7565';
wwv_flow_imp.g_varchar2_table(855) := '7C7C31383D3D3D412E747970652626216B655B412E6E616D655D297D292E6D61702866756E6374696F6E2841297B72657475726E204F6528652C41297D297D7D2C4E653D7B6E616D653A226261636B67726F756E642D6F726967696E222C696E69746961';
wwv_flow_imp.g_varchar2_table(856) := '6C56616C75653A22626F726465722D626F78222C7072656669783A21312C747970653A312C70617273653A66756E6374696F6E28412C65297B72657475726E20652E6D61702866756E6374696F6E2841297B6966285F412841292973776974636828412E';
wwv_flow_imp.g_varchar2_table(857) := '76616C7565297B636173652270616464696E672D626F78223A72657475726E20313B6361736522636F6E74656E742D626F78223A72657475726E20327D72657475726E20307D297D7D2C50653D7B6E616D653A226261636B67726F756E642D706F736974';
wwv_flow_imp.g_varchar2_table(858) := '696F6E222C696E697469616C56616C75653A223025203025222C747970653A312C7072656669783A21312C70617273653A66756E6374696F6E28412C65297B72657475726E2041652865292E6D61702866756E6374696F6E2841297B72657475726E2041';
wwv_flow_imp.g_varchar2_table(859) := '2E66696C746572287465297D292E6D6170287265297D7D2C58653D7B6E616D653A226261636B67726F756E642D726570656174222C696E697469616C56616C75653A22726570656174222C7072656669783A21312C747970653A312C70617273653A6675';
wwv_flow_imp.g_varchar2_table(860) := '6E6374696F6E28412C65297B72657475726E2041652865292E6D61702866756E6374696F6E2841297B72657475726E20412E66696C746572285F41292E6D61702866756E6374696F6E2841297B72657475726E20412E76616C75657D292E6A6F696E2822';
wwv_flow_imp.g_varchar2_table(861) := '2022297D292E6D6170284A65297D7D2C4A653D66756E6374696F6E2841297B7377697463682841297B63617365226E6F2D726570656174223A72657475726E20313B63617365227265706561742D78223A6361736522726570656174206E6F2D72657065';
wwv_flow_imp.g_varchar2_table(862) := '6174223A72657475726E20323B63617365227265706561742D79223A63617365226E6F2D72657065617420726570656174223A72657475726E20333B64656661756C743A72657475726E20307D7D3B2868653D56653D56657C7C7B7D292E4155544F3D22';
wwv_flow_imp.g_varchar2_table(863) := '6175746F222C68652E434F4E5441494E3D22636F6E7461696E223B66756E6374696F6E20596528412C65297B72657475726E205F412841292626226E6F726D616C223D3D3D412E76616C75653F312E322A653A31373D3D3D412E747970653F652A412E6E';
wwv_flow_imp.g_varchar2_table(864) := '756D6265723A74652841293F556528412C65293A657D7661722057652C5A652C5F653D7B6E616D653A226261636B67726F756E642D73697A65222C696E697469616C56616C75653A2230222C7072656669783A212868652E434F5645523D22636F766572';
wwv_flow_imp.g_varchar2_table(865) := '22292C747970653A312C70617273653A66756E6374696F6E28412C65297B72657475726E2041652865292E6D61702866756E6374696F6E2841297B72657475726E20412E66696C746572287165297D297D7D2C71653D66756E6374696F6E2841297B7265';
wwv_flow_imp.g_varchar2_table(866) := '7475726E205F412841297C7C74652841297D2C68653D66756E6374696F6E2841297B72657475726E7B6E616D653A22626F726465722D222B412B222D636F6C6F72222C696E697469616C56616C75653A227472616E73706172656E74222C707265666978';
wwv_flow_imp.g_varchar2_table(867) := '3A21312C747970653A332C666F726D61743A22636F6C6F72227D7D2C6A653D68652822746F7022292C7A653D68652822726967687422292C24653D68652822626F74746F6D22292C41743D686528226C65667422292C68653D66756E6374696F6E284129';
wwv_flow_imp.g_varchar2_table(868) := '7B72657475726E7B6E616D653A22626F726465722D7261646975732D222B412C696E697469616C56616C75653A22302030222C7072656669783A21312C747970653A312C70617273653A66756E6374696F6E28412C65297B72657475726E20726528652E';
wwv_flow_imp.g_varchar2_table(869) := '66696C74657228746529297D7D7D2C65743D68652822746F702D6C65667422292C74743D68652822746F702D726967687422292C72743D68652822626F74746F6D2D726967687422292C42743D68652822626F74746F6D2D6C65667422292C68653D6675';
wwv_flow_imp.g_varchar2_table(870) := '6E6374696F6E2841297B72657475726E7B6E616D653A22626F726465722D222B412B222D7374796C65222C696E697469616C56616C75653A22736F6C6964222C7072656669783A21312C747970653A322C70617273653A66756E6374696F6E28412C6529';
wwv_flow_imp.g_varchar2_table(871) := '7B7377697463682865297B63617365226E6F6E65223A72657475726E20303B6361736522646173686564223A72657475726E20323B6361736522646F74746564223A72657475726E20333B6361736522646F75626C65223A72657475726E20347D726574';
wwv_flow_imp.g_varchar2_table(872) := '75726E20317D7D7D2C6E743D68652822746F7022292C73743D68652822726967687422292C6F743D68652822626F74746F6D22292C69743D686528226C65667422292C68653D66756E6374696F6E2841297B72657475726E7B6E616D653A22626F726465';
wwv_flow_imp.g_varchar2_table(873) := '722D222B412B222D7769647468222C696E697469616C56616C75653A2230222C747970653A302C7072656669783A21312C70617273653A66756E6374696F6E28412C65297B72657475726E2057412865293F652E6E756D6265723A307D7D7D2C51743D68';
wwv_flow_imp.g_varchar2_table(874) := '652822746F7022292C63743D68652822726967687422292C61743D68652822626F74746F6D22292C67743D686528226C65667422292C77743D7B6E616D653A22636F6C6F72222C696E697469616C56616C75653A227472616E73706172656E74222C7072';
wwv_flow_imp.g_varchar2_table(875) := '656669783A21312C747970653A332C666F726D61743A22636F6C6F72227D2C55743D7B6E616D653A22646972656374696F6E222C696E697469616C56616C75653A226C7472222C7072656669783A21312C747970653A322C70617273653A66756E637469';
wwv_flow_imp.g_varchar2_table(876) := '6F6E28412C65297B72657475726E2272746C22213D3D653F303A317D7D2C6C743D7B6E616D653A22646973706C6179222C696E697469616C56616C75653A22696E6C696E652D626C6F636B222C7072656669783A21312C747970653A312C70617273653A';
wwv_flow_imp.g_varchar2_table(877) := '66756E6374696F6E28412C65297B72657475726E20652E66696C746572285F41292E7265647563652866756E6374696F6E28412C65297B72657475726E20417C437428652E76616C7565297D2C30297D7D2C43743D66756E6374696F6E2841297B737769';
wwv_flow_imp.g_varchar2_table(878) := '7463682841297B6361736522626C6F636B223A63617365222D7765626B69742D626F78223A72657475726E20323B6361736522696E6C696E65223A72657475726E20343B636173652272756E2D696E223A72657475726E20383B6361736522666C6F7722';
wwv_flow_imp.g_varchar2_table(879) := '3A72657475726E2031363B6361736522666C6F772D726F6F74223A72657475726E2033323B63617365227461626C65223A72657475726E2036343B6361736522666C6578223A63617365222D7765626B69742D666C6578223A72657475726E203132383B';
wwv_flow_imp.g_varchar2_table(880) := '636173652267726964223A63617365222D6D732D67726964223A72657475726E203235363B636173652272756279223A72657475726E203531323B636173652273756267726964223A72657475726E20313032343B63617365226C6973742D6974656D22';
wwv_flow_imp.g_varchar2_table(881) := '3A72657475726E20323034383B63617365227461626C652D726F772D67726F7570223A72657475726E20343039363B63617365227461626C652D6865616465722D67726F7570223A72657475726E20383139323B63617365227461626C652D666F6F7465';
wwv_flow_imp.g_varchar2_table(882) := '722D67726F7570223A72657475726E2031363338343B63617365227461626C652D726F77223A72657475726E2033323736383B63617365227461626C652D63656C6C223A72657475726E2036353533363B63617365227461626C652D636F6C756D6E2D67';
wwv_flow_imp.g_varchar2_table(883) := '726F7570223A72657475726E203133313037323B63617365227461626C652D636F6C756D6E223A72657475726E203236323134343B63617365227461626C652D63617074696F6E223A72657475726E203532343238383B6361736522727562792D626173';
wwv_flow_imp.g_varchar2_table(884) := '65223A72657475726E20313034383537363B6361736522727562792D74657874223A72657475726E20323039373135323B6361736522727562792D626173652D636F6E7461696E6572223A72657475726E20343139343330343B6361736522727562792D';
wwv_flow_imp.g_varchar2_table(885) := '746578742D636F6E7461696E6572223A72657475726E20383338383630383B6361736522636F6E74656E7473223A72657475726E2031363737373231363B6361736522696E6C696E652D626C6F636B223A72657475726E2033333535343433323B636173';
wwv_flow_imp.g_varchar2_table(886) := '6522696E6C696E652D6C6973742D6974656D223A72657475726E2036373130383836343B6361736522696E6C696E652D7461626C65223A72657475726E203133343231373732383B6361736522696E6C696E652D666C6578223A72657475726E20323638';
wwv_flow_imp.g_varchar2_table(887) := '3433353435363B6361736522696E6C696E652D67726964223A72657475726E203533363837303931327D72657475726E20307D2C75743D7B6E616D653A22666C6F6174222C696E697469616C56616C75653A226E6F6E65222C7072656669783A21312C74';
wwv_flow_imp.g_varchar2_table(888) := '7970653A322C70617273653A66756E6374696F6E28412C65297B7377697463682865297B63617365226C656674223A72657475726E20313B63617365227269676874223A72657475726E20323B6361736522696E6C696E652D7374617274223A72657475';
wwv_flow_imp.g_varchar2_table(889) := '726E20333B6361736522696E6C696E652D656E64223A72657475726E20347D72657475726E20307D7D2C46743D7B6E616D653A226C65747465722D73706163696E67222C696E697469616C56616C75653A2230222C7072656669783A21312C747970653A';
wwv_flow_imp.g_varchar2_table(890) := '302C70617273653A66756E6374696F6E28412C65297B72657475726E212832303D3D3D652E747970652626226E6F726D616C223D3D3D652E76616C75657C7C3137213D3D652E7479706526263135213D3D652E74797065293F652E6E756D6265723A307D';
wwv_flow_imp.g_varchar2_table(891) := '7D2C68743D7B6E616D653A226C696E652D627265616B222C696E697469616C56616C75653A2868653D57653D57657C7C7B7D292E4E4F524D414C3D226E6F726D616C222C7072656669783A212868652E5354524943543D2273747269637422292C747970';
wwv_flow_imp.g_varchar2_table(892) := '653A322C70617273653A66756E6374696F6E28412C65297B72657475726E2273747269637422213D3D653F57652E4E4F524D414C3A57652E5354524943547D7D2C64743D7B6E616D653A226C696E652D686569676874222C696E697469616C56616C7565';
wwv_flow_imp.g_varchar2_table(893) := '3A226E6F726D616C222C7072656669783A21312C747970653A347D2C66743D7B6E616D653A226C6973742D7374796C652D696D616765222C696E697469616C56616C75653A226E6F6E65222C747970653A302C7072656669783A21312C70617273653A66';
wwv_flow_imp.g_varchar2_table(894) := '756E6374696F6E28412C65297B72657475726E2032303D3D3D652E747970652626226E6F6E65223D3D3D652E76616C75653F6E756C6C3A4F6528412C65297D7D2C48743D7B6E616D653A226C6973742D7374796C652D706F736974696F6E222C696E6974';
wwv_flow_imp.g_varchar2_table(895) := '69616C56616C75653A226F757473696465222C7072656669783A21312C747970653A322C70617273653A66756E6374696F6E28412C65297B72657475726E22696E7369646522213D3D653F313A307D7D2C70743D7B6E616D653A226C6973742D7374796C';
wwv_flow_imp.g_varchar2_table(896) := '652D74797065222C696E697469616C56616C75653A226E6F6E65222C7072656669783A21312C747970653A322C70617273653A66756E6374696F6E28412C65297B7377697463682865297B636173652264697363223A72657475726E20303B6361736522';
wwv_flow_imp.g_varchar2_table(897) := '636972636C65223A72657475726E20313B6361736522737175617265223A72657475726E20323B6361736522646563696D616C223A72657475726E20333B6361736522636A6B2D646563696D616C223A72657475726E20343B6361736522646563696D61';
wwv_flow_imp.g_varchar2_table(898) := '6C2D6C656164696E672D7A65726F223A72657475726E20353B63617365226C6F7765722D726F6D616E223A72657475726E20363B636173652275707065722D726F6D616E223A72657475726E20373B63617365226C6F7765722D677265656B223A726574';
wwv_flow_imp.g_varchar2_table(899) := '75726E20383B63617365226C6F7765722D616C706861223A72657475726E20393B636173652275707065722D616C706861223A72657475726E2031303B63617365226172616269632D696E646963223A72657475726E2031313B636173652261726D656E';
wwv_flow_imp.g_varchar2_table(900) := '69616E223A72657475726E2031323B636173652262656E67616C69223A72657475726E2031333B636173652263616D626F6469616E223A72657475726E2031343B6361736522636A6B2D65617274686C792D6272616E6368223A72657475726E2031353B';
wwv_flow_imp.g_varchar2_table(901) := '6361736522636A6B2D68656176656E6C792D7374656D223A72657475726E2031363B6361736522636A6B2D6964656F67726170686963223A72657475726E2031373B6361736522646576616E6167617269223A72657475726E2031383B63617365226574';
wwv_flow_imp.g_varchar2_table(902) := '68696F7069632D6E756D65726963223A72657475726E2031393B636173652267656F726769616E223A72657475726E2032303B636173652267756A6172617469223A72657475726E2032313B63617365226775726D756B6869223A636173652268656272';
wwv_flow_imp.g_varchar2_table(903) := '6577223A72657475726E2032323B63617365226869726167616E61223A72657475726E2032333B63617365226869726167616E612D69726F6861223A72657475726E2032343B63617365226A6170616E6573652D666F726D616C223A72657475726E2032';
wwv_flow_imp.g_varchar2_table(904) := '353B63617365226A6170616E6573652D696E666F726D616C223A72657475726E2032363B63617365226B616E6E616461223A72657475726E2032373B63617365226B6174616B616E61223A72657475726E2032383B63617365226B6174616B616E612D69';
wwv_flow_imp.g_varchar2_table(905) := '726F6861223A72657475726E2032393B63617365226B686D6572223A72657475726E2033303B63617365226B6F7265616E2D68616E67756C2D666F726D616C223A72657475726E2033313B63617365226B6F7265616E2D68616E6A612D666F726D616C22';
wwv_flow_imp.g_varchar2_table(906) := '3A72657475726E2033323B63617365226B6F7265616E2D68616E6A612D696E666F726D616C223A72657475726E2033333B63617365226C616F223A72657475726E2033343B63617365226C6F7765722D61726D656E69616E223A72657475726E2033353B';
wwv_flow_imp.g_varchar2_table(907) := '63617365226D616C6179616C616D223A72657475726E2033363B63617365226D6F6E676F6C69616E223A72657475726E2033373B63617365226D79616E6D6172223A72657475726E2033383B63617365226F72697961223A72657475726E2033393B6361';
wwv_flow_imp.g_varchar2_table(908) := '7365227065727369616E223A72657475726E2034303B636173652273696D702D6368696E6573652D666F726D616C223A72657475726E2034313B636173652273696D702D6368696E6573652D696E666F726D616C223A72657475726E2034323B63617365';
wwv_flow_imp.g_varchar2_table(909) := '2274616D696C223A72657475726E2034333B636173652274656C756775223A72657475726E2034343B636173652274686169223A72657475726E2034353B63617365227469626574616E223A72657475726E2034363B6361736522747261642D6368696E';
wwv_flow_imp.g_varchar2_table(910) := '6573652D666F726D616C223A72657475726E2034373B6361736522747261642D6368696E6573652D696E666F726D616C223A72657475726E2034383B636173652275707065722D61726D656E69616E223A72657475726E2034393B636173652264697363';
wwv_flow_imp.g_varchar2_table(911) := '6C6F737572652D6F70656E223A72657475726E2035303B6361736522646973636C6F737572652D636C6F736564223A72657475726E2035313B64656661756C743A72657475726E2D317D7D7D2C68653D66756E6374696F6E2841297B72657475726E7B6E';
wwv_flow_imp.g_varchar2_table(912) := '616D653A226D617267696E2D222B412C696E697469616C56616C75653A2230222C7072656669783A21312C747970653A347D7D2C45743D68652822746F7022292C49743D68652822726967687422292C79743D68652822626F74746F6D22292C4B743D68';
wwv_flow_imp.g_varchar2_table(913) := '6528226C65667422292C6D743D7B6E616D653A226F766572666C6F77222C696E697469616C56616C75653A2276697369626C65222C7072656669783A21312C747970653A312C70617273653A66756E6374696F6E28412C65297B72657475726E20652E66';
wwv_flow_imp.g_varchar2_table(914) := '696C746572285F41292E6D61702866756E6374696F6E2841297B73776974636828412E76616C7565297B636173652268696464656E223A72657475726E20313B63617365227363726F6C6C223A72657475726E20323B6361736522636C6970223A726574';
wwv_flow_imp.g_varchar2_table(915) := '75726E20333B63617365226175746F223A72657475726E20343B64656661756C743A72657475726E20307D7D297D7D2C4C743D7B6E616D653A226F766572666C6F772D77726170222C696E697469616C56616C75653A226E6F726D616C222C7072656669';
wwv_flow_imp.g_varchar2_table(916) := '783A21312C747970653A322C70617273653A66756E6374696F6E28412C65297B72657475726E22627265616B2D776F726422213D3D653F226E6F726D616C223A22627265616B2D776F7264227D7D2C68653D66756E6374696F6E2841297B72657475726E';
wwv_flow_imp.g_varchar2_table(917) := '7B6E616D653A2270616464696E672D222B412C696E697469616C56616C75653A2230222C7072656669783A21312C747970653A332C666F726D61743A226C656E6774682D70657263656E74616765227D7D2C62743D68652822746F7022292C44743D6865';
wwv_flow_imp.g_varchar2_table(918) := '2822726967687422292C76743D68652822626F74746F6D22292C78743D686528226C65667422292C4D743D7B6E616D653A22746578742D616C69676E222C696E697469616C56616C75653A226C656674222C7072656669783A21312C747970653A322C70';
wwv_flow_imp.g_varchar2_table(919) := '617273653A66756E6374696F6E28412C65297B7377697463682865297B63617365227269676874223A72657475726E20323B636173652263656E746572223A63617365226A757374696679223A72657475726E20313B64656661756C743A72657475726E';
wwv_flow_imp.g_varchar2_table(920) := '20307D7D7D2C53743D7B6E616D653A22706F736974696F6E222C696E697469616C56616C75653A22737461746963222C7072656669783A21312C747970653A322C70617273653A66756E6374696F6E28412C65297B7377697463682865297B6361736522';
wwv_flow_imp.g_varchar2_table(921) := '72656C6174697665223A72657475726E20313B63617365226162736F6C757465223A72657475726E20323B63617365226669786564223A72657475726E20333B6361736522737469636B79223A72657475726E20347D72657475726E20307D7D2C54743D';
wwv_flow_imp.g_varchar2_table(922) := '7B6E616D653A22746578742D736861646F77222C696E697469616C56616C75653A226E6F6E65222C747970653A312C7072656669783A21312C70617273653A66756E6374696F6E286E2C41297B72657475726E20313D3D3D412E6C656E67746826266A41';
wwv_flow_imp.g_varchar2_table(923) := '28415B305D2C226E6F6E6522293F5B5D3A41652841292E6D61702866756E6374696F6E2841297B666F722876617220653D7B636F6C6F723A4C652E5452414E53504152454E542C6F6666736574583A61652C6F6666736574593A61652C626C75723A6165';
wwv_flow_imp.g_varchar2_table(924) := '7D2C743D302C723D303B723C412E6C656E6774683B722B2B297B76617220423D415B725D3B65652842293F28303D3D3D743F652E6F6666736574583D423A313D3D3D743F652E6F6666736574593D423A652E626C75723D422C742B2B293A652E636F6C6F';
wwv_flow_imp.g_varchar2_table(925) := '723D7565286E2C42297D72657475726E20657D297D7D2C47743D7B6E616D653A22746578742D7472616E73666F726D222C696E697469616C56616C75653A226E6F6E65222C7072656669783A21312C747970653A322C70617273653A66756E6374696F6E';
wwv_flow_imp.g_varchar2_table(926) := '28412C65297B7377697463682865297B6361736522757070657263617365223A72657475726E20323B63617365226C6F77657263617365223A72657475726E20313B63617365226361706974616C697A65223A72657475726E20337D72657475726E2030';
wwv_flow_imp.g_varchar2_table(927) := '7D7D2C4F743D7B6E616D653A227472616E73666F726D222C696E697469616C56616C75653A226E6F6E65222C7072656669783A21302C747970653A302C70617273653A66756E6374696F6E28412C65297B69662832303D3D3D652E747970652626226E6F';
wwv_flow_imp.g_varchar2_table(928) := '6E65223D3D3D652E76616C75652972657475726E206E756C6C3B6966283138213D3D652E747970652972657475726E206E756C6C3B76617220743D56745B652E6E616D655D3B696628766F696420303D3D3D74297468726F77206E6577204572726F7228';
wwv_flow_imp.g_varchar2_table(929) := '27417474656D7074696E6720746F20706172736520616E20756E737570706F72746564207472616E73666F726D2066756E6374696F6E2022272B652E6E616D652B272227293B72657475726E207428652E76616C756573297D7D2C56743D7B6D61747269';
wwv_flow_imp.g_varchar2_table(930) := '783A66756E6374696F6E2841297B413D412E66696C7465722866756E6374696F6E2841297B72657475726E2031373D3D3D412E747970657D292E6D61702866756E6374696F6E2841297B72657475726E20412E6E756D6265727D293B72657475726E2036';
wwv_flow_imp.g_varchar2_table(931) := '3D3D3D412E6C656E6774683F413A6E756C6C7D2C6D617472697833643A66756E6374696F6E2841297B76617220653D412E66696C7465722866756E6374696F6E2841297B72657475726E2031373D3D3D412E747970657D292E6D61702866756E6374696F';
wwv_flow_imp.g_varchar2_table(932) := '6E2841297B72657475726E20412E6E756D6265727D292C743D655B305D2C723D655B315D3B655B325D2C655B335D3B76617220423D655B345D2C6E3D655B355D3B655B365D2C655B375D2C655B385D2C655B395D2C655B31305D2C655B31315D3B766172';
wwv_flow_imp.g_varchar2_table(933) := '20733D655B31325D2C413D655B31335D3B72657475726E20655B31345D2C655B31355D2C31363D3D3D652E6C656E6774683F5B742C722C422C6E2C732C415D3A6E756C6C7D7D2C68653D7B747970653A31362C6E756D6265723A35302C666C6167733A34';
wwv_flow_imp.g_varchar2_table(934) := '7D2C6B743D5B68652C68655D2C52743D7B6E616D653A227472616E73666F726D2D6F726967696E222C696E697469616C56616C75653A2235302520353025222C7072656669783A21302C747970653A312C70617273653A66756E6374696F6E28412C6529';
wwv_flow_imp.g_varchar2_table(935) := '7B653D652E66696C746572287465293B72657475726E2032213D3D652E6C656E6774683F6B743A5B655B305D2C655B315D5D7D7D2C4E743D7B6E616D653A2276697369626C65222C696E697469616C56616C75653A226E6F6E65222C7072656669783A21';
wwv_flow_imp.g_varchar2_table(936) := '312C747970653A322C70617273653A66756E6374696F6E28412C65297B7377697463682865297B636173652268696464656E223A72657475726E20313B6361736522636F6C6C61707365223A72657475726E20323B64656661756C743A72657475726E20';
wwv_flow_imp.g_varchar2_table(937) := '307D7D7D3B2868653D5A653D5A657C7C7B7D292E4E4F524D414C3D226E6F726D616C222C68652E425245414B5F414C4C3D22627265616B2D616C6C223B66756E6374696F6E20507428412C65297B72657475726E2030213D28412665297D66756E637469';
wwv_flow_imp.g_varchar2_table(938) := '6F6E20587428412C652C74297B72657475726E28413D412626415B4D6174682E6D696E28652C412E6C656E6774682D31295D293F743F412E6F70656E3A412E636C6F73653A22227D766172204A743D7B6E616D653A22776F72642D627265616B222C696E';
wwv_flow_imp.g_varchar2_table(939) := '697469616C56616C75653A226E6F726D616C222C7072656669783A212868652E4B4545505F414C4C3D226B6565702D616C6C22292C747970653A322C70617273653A66756E6374696F6E28412C65297B7377697463682865297B6361736522627265616B';
wwv_flow_imp.g_varchar2_table(940) := '2D616C6C223A72657475726E205A652E425245414B5F414C4C3B63617365226B6565702D616C6C223A72657475726E205A652E4B4545505F414C4C3B64656661756C743A72657475726E205A652E4E4F524D414C7D7D7D2C59743D7B6E616D653A227A2D';
wwv_flow_imp.g_varchar2_table(941) := '696E646578222C696E697469616C56616C75653A226175746F222C7072656669783A21312C747970653A302C70617273653A66756E6374696F6E28412C65297B69662832303D3D3D652E747970652972657475726E7B6175746F3A21302C6F726465723A';
wwv_flow_imp.g_varchar2_table(942) := '307D3B6966285A412865292972657475726E7B6175746F3A21312C6F726465723A652E6E756D6265727D3B7468726F77206E6577204572726F722822496E76616C6964207A2D696E646578206E756D6265722070617273656422297D7D2C57743D66756E';
wwv_flow_imp.g_varchar2_table(943) := '6374696F6E28412C65297B69662831353D3D3D652E747970652973776974636828652E756E69742E746F4C6F776572436173652829297B636173652273223A72657475726E203165332A652E6E756D6265723B63617365226D73223A72657475726E2065';
wwv_flow_imp.g_varchar2_table(944) := '2E6E756D6265727D7468726F77206E6577204572726F722822556E737570706F727465642074696D65207479706522297D2C5A743D7B6E616D653A226F706163697479222C696E697469616C56616C75653A2231222C747970653A302C7072656669783A';
wwv_flow_imp.g_varchar2_table(945) := '21312C70617273653A66756E6374696F6E28412C65297B72657475726E205A412865293F652E6E756D6265723A317D7D2C5F743D7B6E616D653A22746578742D6465636F726174696F6E2D636F6C6F72222C696E697469616C56616C75653A227472616E';
wwv_flow_imp.g_varchar2_table(946) := '73706172656E74222C7072656669783A21312C747970653A332C666F726D61743A22636F6C6F72227D2C71743D7B6E616D653A22746578742D6465636F726174696F6E2D6C696E65222C696E697469616C56616C75653A226E6F6E65222C707265666978';
wwv_flow_imp.g_varchar2_table(947) := '3A21312C747970653A312C70617273653A66756E6374696F6E28412C65297B72657475726E20652E66696C746572285F41292E6D61702866756E6374696F6E2841297B73776974636828412E76616C7565297B6361736522756E6465726C696E65223A72';
wwv_flow_imp.g_varchar2_table(948) := '657475726E20313B63617365226F7665726C696E65223A72657475726E20323B63617365226C696E652D7468726F756768223A72657475726E20333B63617365226E6F6E65223A72657475726E20347D72657475726E20307D292E66696C746572286675';
wwv_flow_imp.g_varchar2_table(949) := '6E6374696F6E2841297B72657475726E2030213D3D417D297D7D2C6A743D7B6E616D653A22666F6E742D66616D696C79222C696E697469616C56616C75653A22222C7072656669783A21312C747970653A312C70617273653A66756E6374696F6E28412C';
wwv_flow_imp.g_varchar2_table(950) := '65297B76617220743D5B5D2C723D5B5D3B72657475726E20652E666F72456163682866756E6374696F6E2841297B73776974636828412E74797065297B636173652032303A6361736520303A742E7075736828412E76616C7565293B627265616B3B6361';
wwv_flow_imp.g_varchar2_table(951) := '73652031373A742E7075736828412E6E756D6265722E746F537472696E672829293B627265616B3B6361736520343A722E7075736828742E6A6F696E2822202229292C742E6C656E6774683D307D7D292C742E6C656E6774682626722E7075736828742E';
wwv_flow_imp.g_varchar2_table(952) := '6A6F696E2822202229292C722E6D61702866756E6374696F6E2841297B72657475726E2D313D3D3D412E696E6465784F6628222022293F413A2227222B412B2227227D297D7D2C7A743D7B6E616D653A22666F6E742D73697A65222C696E697469616C56';
wwv_flow_imp.g_varchar2_table(953) := '616C75653A2230222C7072656669783A21312C747970653A332C666F726D61743A226C656E677468227D2C24743D7B6E616D653A22666F6E742D776569676874222C696E697469616C56616C75653A226E6F726D616C222C747970653A302C7072656669';
wwv_flow_imp.g_varchar2_table(954) := '783A21312C70617273653A66756E6374696F6E28412C65297B72657475726E205A412865293F652E6E756D6265723A215F412865297C7C22626F6C6422213D3D652E76616C75653F3430303A3730307D7D2C41723D7B6E616D653A22666F6E742D766172';
wwv_flow_imp.g_varchar2_table(955) := '69616E74222C696E697469616C56616C75653A226E6F6E65222C747970653A312C7072656669783A21312C70617273653A66756E6374696F6E28412C65297B72657475726E20652E66696C746572285F41292E6D61702866756E6374696F6E2841297B72';
wwv_flow_imp.g_varchar2_table(956) := '657475726E20412E76616C75657D297D7D2C65723D7B6E616D653A22666F6E742D7374796C65222C696E697469616C56616C75653A226E6F726D616C222C7072656669783A21312C747970653A322C70617273653A66756E6374696F6E28412C65297B73';
wwv_flow_imp.g_varchar2_table(957) := '77697463682865297B63617365226F626C69717565223A72657475726E226F626C69717565223B63617365226974616C6963223A72657475726E226974616C6963223B64656661756C743A72657475726E226E6F726D616C227D7D7D2C74723D7B6E616D';
wwv_flow_imp.g_varchar2_table(958) := '653A22636F6E74656E74222C696E697469616C56616C75653A226E6F6E65222C747970653A312C7072656669783A21312C70617273653A66756E6374696F6E28412C65297B696628303D3D3D652E6C656E6774682972657475726E5B5D3B76617220743D';
wwv_flow_imp.g_varchar2_table(959) := '655B305D3B72657475726E2032303D3D3D742E747970652626226E6F6E65223D3D3D742E76616C75653F5B5D3A657D7D2C72723D7B6E616D653A22636F756E7465722D696E6372656D656E74222C696E697469616C56616C75653A226E6F6E65222C7072';
wwv_flow_imp.g_varchar2_table(960) := '656669783A21302C747970653A312C70617273653A66756E6374696F6E28412C65297B696628303D3D3D652E6C656E6774682972657475726E206E756C6C3B76617220743D655B305D3B69662832303D3D3D742E747970652626226E6F6E65223D3D3D74';
wwv_flow_imp.g_varchar2_table(961) := '2E76616C75652972657475726E206E756C6C3B666F722876617220723D5B5D2C423D652E66696C746572287A41292C6E3D303B6E3C422E6C656E6774683B6E2B2B297B76617220733D425B6E5D2C6F3D425B6E2B315D3B32303D3D3D732E747970652626';
wwv_flow_imp.g_varchar2_table(962) := '286F3D6F26265A41286F293F6F2E6E756D6265723A312C722E70757368287B636F756E7465723A732E76616C75652C696E6372656D656E743A6F7D29297D72657475726E20727D7D2C42723D7B6E616D653A22636F756E7465722D7265736574222C696E';
wwv_flow_imp.g_varchar2_table(963) := '697469616C56616C75653A226E6F6E65222C7072656669783A21302C747970653A312C70617273653A66756E6374696F6E28412C65297B696628303D3D3D652E6C656E6774682972657475726E5B5D3B666F722876617220743D5B5D2C723D652E66696C';
wwv_flow_imp.g_varchar2_table(964) := '746572287A41292C423D303B423C722E6C656E6774683B422B2B297B766172206E3D725B425D2C733D725B422B315D3B5F41286E292626226E6F6E6522213D3D6E2E76616C7565262628733D7326265A412873293F732E6E756D6265723A302C742E7075';
wwv_flow_imp.g_varchar2_table(965) := '7368287B636F756E7465723A6E2E76616C75652C72657365743A737D29297D72657475726E20747D7D2C6E723D7B6E616D653A226475726174696F6E222C696E697469616C56616C75653A223073222C7072656669783A21312C747970653A312C706172';
wwv_flow_imp.g_varchar2_table(966) := '73653A66756E6374696F6E28652C41297B72657475726E20412E66696C746572285741292E6D61702866756E6374696F6E2841297B72657475726E20577428652C41297D297D7D2C73723D7B6E616D653A2271756F746573222C696E697469616C56616C';
wwv_flow_imp.g_varchar2_table(967) := '75653A226E6F6E65222C7072656669783A21302C747970653A312C70617273653A66756E6374696F6E28412C65297B696628303D3D3D652E6C656E6774682972657475726E206E756C6C3B76617220743D655B305D3B69662832303D3D3D742E74797065';
wwv_flow_imp.g_varchar2_table(968) := '2626226E6F6E65223D3D3D742E76616C75652972657475726E206E756C6C3B76617220723D5B5D2C423D652E66696C746572287141293B696628422E6C656E6774682532213D302972657475726E206E756C6C3B666F7228766172206E3D303B6E3C422E';
wwv_flow_imp.g_varchar2_table(969) := '6C656E6774683B6E2B3D32297B76617220733D425B6E5D2E76616C75652C6F3D425B6E2B315D2E76616C75653B722E70757368287B6F70656E3A732C636C6F73653A6F7D297D72657475726E20727D7D2C6F723D7B6E616D653A22626F782D736861646F';
wwv_flow_imp.g_varchar2_table(970) := '77222C696E697469616C56616C75653A226E6F6E65222C747970653A312C7072656669783A21312C70617273653A66756E6374696F6E286E2C41297B72657475726E20313D3D3D412E6C656E67746826266A4128415B305D2C226E6F6E6522293F5B5D3A';
wwv_flow_imp.g_varchar2_table(971) := '41652841292E6D61702866756E6374696F6E2841297B666F722876617220653D7B636F6C6F723A3235352C6F6666736574583A61652C6F6666736574593A61652C626C75723A61652C7370726561643A61652C696E7365743A21317D2C743D302C723D30';
wwv_flow_imp.g_varchar2_table(972) := '3B723C412E6C656E6774683B722B2B297B76617220423D415B725D3B6A4128422C22696E73657422293F652E696E7365743D21303A65652842293F28303D3D3D743F652E6F6666736574583D423A313D3D3D743F652E6F6666736574593D423A323D3D3D';
wwv_flow_imp.g_varchar2_table(973) := '743F652E626C75723D423A652E7370726561643D422C742B2B293A652E636F6C6F723D7565286E2C42297D72657475726E20657D297D7D2C69723D7B6E616D653A227061696E742D6F72646572222C696E697469616C56616C75653A226E6F726D616C22';
wwv_flow_imp.g_varchar2_table(974) := '2C7072656669783A21312C747970653A312C70617273653A66756E6374696F6E28412C65297B76617220743D5B5D3B72657475726E20652E66696C746572285F41292E666F72456163682866756E6374696F6E2841297B73776974636828412E76616C75';
wwv_flow_imp.g_varchar2_table(975) := '65297B63617365227374726F6B65223A742E707573682831293B627265616B3B636173652266696C6C223A742E707573682830293B627265616B3B63617365226D61726B657273223A742E707573682832297D7D292C5B302C312C325D2E666F72456163';
wwv_flow_imp.g_varchar2_table(976) := '682866756E6374696F6E2841297B2D313D3D3D742E696E6465784F662841292626742E707573682841297D292C747D7D2C51723D7B6E616D653A222D7765626B69742D746578742D7374726F6B652D636F6C6F72222C696E697469616C56616C75653A22';
wwv_flow_imp.g_varchar2_table(977) := '63757272656E74636F6C6F72222C7072656669783A21312C747970653A332C666F726D61743A22636F6C6F72227D2C63723D7B6E616D653A222D7765626B69742D746578742D7374726F6B652D7769647468222C696E697469616C56616C75653A223022';
wwv_flow_imp.g_varchar2_table(978) := '2C747970653A302C7072656669783A21312C70617273653A66756E6374696F6E28412C65297B72657475726E2057412865293F652E6E756D6265723A307D7D2C61723D2867722E70726F746F747970652E697356697369626C653D66756E6374696F6E28';
wwv_flow_imp.g_varchar2_table(979) := '297B72657475726E20303C746869732E646973706C61792626303C746869732E6F7061636974792626303D3D3D746869732E7669736962696C6974797D2C67722E70726F746F747970652E69735472616E73706172656E743D66756E6374696F6E28297B';
wwv_flow_imp.g_varchar2_table(980) := '72657475726E206F6528746869732E6261636B67726F756E64436F6C6F72297D2C67722E70726F746F747970652E69735472616E73666F726D65643D66756E6374696F6E28297B72657475726E206E756C6C213D3D746869732E7472616E73666F726D7D';
wwv_flow_imp.g_varchar2_table(981) := '2C67722E70726F746F747970652E6973506F736974696F6E65643D66756E6374696F6E28297B72657475726E2030213D3D746869732E706F736974696F6E7D2C67722E70726F746F747970652E6973506F736974696F6E6564576974685A496E6465783D';
wwv_flow_imp.g_varchar2_table(982) := '66756E6374696F6E28297B72657475726E20746869732E6973506F736974696F6E65642829262621746869732E7A496E6465782E6175746F7D2C67722E70726F746F747970652E6973466C6F6174696E673D66756E6374696F6E28297B72657475726E20';
wwv_flow_imp.g_varchar2_table(983) := '30213D3D746869732E666C6F61747D2C67722E70726F746F747970652E6973496E6C696E654C6576656C3D66756E6374696F6E28297B72657475726E20507428746869732E646973706C61792C34297C7C507428746869732E646973706C61792C333335';
wwv_flow_imp.g_varchar2_table(984) := '3534343332297C7C507428746869732E646973706C61792C323638343335343536297C7C507428746869732E646973706C61792C353336383730393132297C7C507428746869732E646973706C61792C3637313038383634297C7C507428746869732E64';
wwv_flow_imp.g_varchar2_table(985) := '6973706C61792C313334323137373238297D2C6772293B66756E6374696F6E20677228412C65297B746869732E616E696D6174696F6E4475726174696F6E3D6C7228412C6E722C652E616E696D6174696F6E4475726174696F6E292C746869732E626163';
wwv_flow_imp.g_varchar2_table(986) := '6B67726F756E64436C69703D6C7228412C62652C652E6261636B67726F756E64436C6970292C746869732E6261636B67726F756E64436F6C6F723D6C7228412C44652C652E6261636B67726F756E64436F6C6F72292C746869732E6261636B67726F756E';
wwv_flow_imp.g_varchar2_table(987) := '64496D6167653D6C7228412C52652C652E6261636B67726F756E64496D616765292C746869732E6261636B67726F756E644F726967696E3D6C7228412C4E652C652E6261636B67726F756E644F726967696E292C746869732E6261636B67726F756E6450';
wwv_flow_imp.g_varchar2_table(988) := '6F736974696F6E3D6C7228412C50652C652E6261636B67726F756E64506F736974696F6E292C746869732E6261636B67726F756E645265706561743D6C7228412C58652C652E6261636B67726F756E64526570656174292C746869732E6261636B67726F';
wwv_flow_imp.g_varchar2_table(989) := '756E6453697A653D6C7228412C5F652C652E6261636B67726F756E6453697A65292C746869732E626F72646572546F70436F6C6F723D6C7228412C6A652C652E626F72646572546F70436F6C6F72292C746869732E626F726465725269676874436F6C6F';
wwv_flow_imp.g_varchar2_table(990) := '723D6C7228412C7A652C652E626F726465725269676874436F6C6F72292C746869732E626F72646572426F74746F6D436F6C6F723D6C7228412C24652C652E626F72646572426F74746F6D436F6C6F72292C746869732E626F726465724C656674436F6C';
wwv_flow_imp.g_varchar2_table(991) := '6F723D6C7228412C41742C652E626F726465724C656674436F6C6F72292C746869732E626F72646572546F704C6566745261646975733D6C7228412C65742C652E626F72646572546F704C656674526164697573292C746869732E626F72646572546F70';
wwv_flow_imp.g_varchar2_table(992) := '52696768745261646975733D6C7228412C74742C652E626F72646572546F705269676874526164697573292C746869732E626F72646572426F74746F6D52696768745261646975733D6C7228412C72742C652E626F72646572426F74746F6D5269676874';
wwv_flow_imp.g_varchar2_table(993) := '526164697573292C746869732E626F72646572426F74746F6D4C6566745261646975733D6C7228412C42742C652E626F72646572426F74746F6D4C656674526164697573292C746869732E626F72646572546F705374796C653D6C7228412C6E742C652E';
wwv_flow_imp.g_varchar2_table(994) := '626F72646572546F705374796C65292C746869732E626F7264657252696768745374796C653D6C7228412C73742C652E626F7264657252696768745374796C65292C746869732E626F72646572426F74746F6D5374796C653D6C7228412C6F742C652E62';
wwv_flow_imp.g_varchar2_table(995) := '6F72646572426F74746F6D5374796C65292C746869732E626F726465724C6566745374796C653D6C7228412C69742C652E626F726465724C6566745374796C65292C746869732E626F72646572546F7057696474683D6C7228412C51742C652E626F7264';
wwv_flow_imp.g_varchar2_table(996) := '6572546F705769647468292C746869732E626F72646572526967687457696474683D6C7228412C63742C652E626F7264657252696768745769647468292C746869732E626F72646572426F74746F6D57696474683D6C7228412C61742C652E626F726465';
wwv_flow_imp.g_varchar2_table(997) := '72426F74746F6D5769647468292C746869732E626F726465724C65667457696474683D6C7228412C67742C652E626F726465724C6566745769647468292C746869732E626F78536861646F773D6C7228412C6F722C652E626F78536861646F77292C7468';
wwv_flow_imp.g_varchar2_table(998) := '69732E636F6C6F723D6C7228412C77742C652E636F6C6F72292C746869732E646972656374696F6E3D6C7228412C55742C652E646972656374696F6E292C746869732E646973706C61793D6C7228412C6C742C652E646973706C6179292C746869732E66';
wwv_flow_imp.g_varchar2_table(999) := '6C6F61743D6C7228412C75742C652E637373466C6F6174292C746869732E666F6E7446616D696C793D6C7228412C6A742C652E666F6E7446616D696C79292C746869732E666F6E7453697A653D6C7228412C7A742C652E666F6E7453697A65292C746869';
wwv_flow_imp.g_varchar2_table(1000) := '732E666F6E745374796C653D6C7228412C65722C652E666F6E745374796C65292C746869732E666F6E7456617269616E743D6C7228412C41722C652E666F6E7456617269616E74292C746869732E666F6E745765696768743D6C7228412C24742C652E66';
wwv_flow_imp.g_varchar2_table(1001) := '6F6E74576569676874292C746869732E6C657474657253706163696E673D6C7228412C46742C652E6C657474657253706163696E67292C746869732E6C696E65427265616B3D6C7228412C68742C652E6C696E65427265616B292C746869732E6C696E65';
wwv_flow_imp.g_varchar2_table(1002) := '4865696768743D6C7228412C64742C652E6C696E65486569676874292C746869732E6C6973745374796C65496D6167653D6C7228412C66742C652E6C6973745374796C65496D616765292C746869732E6C6973745374796C65506F736974696F6E3D6C72';
wwv_flow_imp.g_varchar2_table(1003) := '28412C48742C652E6C6973745374796C65506F736974696F6E292C746869732E6C6973745374796C65547970653D6C7228412C70742C652E6C6973745374796C6554797065292C746869732E6D617267696E546F703D6C7228412C45742C652E6D617267';
wwv_flow_imp.g_varchar2_table(1004) := '696E546F70292C746869732E6D617267696E52696768743D6C7228412C49742C652E6D617267696E5269676874292C746869732E6D617267696E426F74746F6D3D6C7228412C79742C652E6D617267696E426F74746F6D292C746869732E6D617267696E';
wwv_flow_imp.g_varchar2_table(1005) := '4C6566743D6C7228412C4B742C652E6D617267696E4C656674292C746869732E6F7061636974793D6C7228412C5A742C652E6F706163697479293B76617220743D6C7228412C6D742C652E6F766572666C6F77293B746869732E6F766572666C6F77583D';
wwv_flow_imp.g_varchar2_table(1006) := '745B305D2C746869732E6F766572666C6F77593D745B313C742E6C656E6774683F313A305D2C746869732E6F766572666C6F77577261703D6C7228412C4C742C652E6F766572666C6F7757726170292C746869732E70616464696E67546F703D6C722841';
wwv_flow_imp.g_varchar2_table(1007) := '2C62742C652E70616464696E67546F70292C746869732E70616464696E6752696768743D6C7228412C44742C652E70616464696E675269676874292C746869732E70616464696E67426F74746F6D3D6C7228412C76742C652E70616464696E67426F7474';
wwv_flow_imp.g_varchar2_table(1008) := '6F6D292C746869732E70616464696E674C6566743D6C7228412C78742C652E70616464696E674C656674292C746869732E7061696E744F726465723D6C7228412C69722C652E7061696E744F72646572292C746869732E706F736974696F6E3D6C722841';
wwv_flow_imp.g_varchar2_table(1009) := '2C53742C652E706F736974696F6E292C746869732E74657874416C69676E3D6C7228412C4D742C652E74657874416C69676E292C746869732E746578744465636F726174696F6E436F6C6F723D6C7228412C5F742C6E756C6C213D3D28743D652E746578';
wwv_flow_imp.g_varchar2_table(1010) := '744465636F726174696F6E436F6C6F72292626766F69642030213D3D743F743A652E636F6C6F72292C746869732E746578744465636F726174696F6E4C696E653D6C7228412C71742C6E756C6C213D3D28743D652E746578744465636F726174696F6E4C';
wwv_flow_imp.g_varchar2_table(1011) := '696E65292626766F69642030213D3D743F743A652E746578744465636F726174696F6E292C746869732E74657874536861646F773D6C7228412C54742C652E74657874536861646F77292C746869732E746578745472616E73666F726D3D6C7228412C47';
wwv_flow_imp.g_varchar2_table(1012) := '742C652E746578745472616E73666F726D292C746869732E7472616E73666F726D3D6C7228412C4F742C652E7472616E73666F726D292C746869732E7472616E73666F726D4F726967696E3D6C7228412C52742C652E7472616E73666F726D4F72696769';
wwv_flow_imp.g_varchar2_table(1013) := '6E292C746869732E7669736962696C6974793D6C7228412C4E742C652E7669736962696C697479292C746869732E7765626B6974546578745374726F6B65436F6C6F723D6C7228412C51722C652E7765626B6974546578745374726F6B65436F6C6F7229';
wwv_flow_imp.g_varchar2_table(1014) := '2C746869732E7765626B6974546578745374726F6B6557696474683D6C7228412C63722C652E7765626B6974546578745374726F6B655769647468292C746869732E776F7264427265616B3D6C7228412C4A742C652E776F7264427265616B292C746869';
wwv_flow_imp.g_varchar2_table(1015) := '732E7A496E6465783D6C7228412C59742C652E7A496E646578297D666F72287661722077723D66756E6374696F6E28412C65297B746869732E636F6E74656E743D6C7228412C74722C652E636F6E74656E74292C746869732E71756F7465733D6C722841';
wwv_flow_imp.g_varchar2_table(1016) := '2C73722C652E71756F746573297D2C55723D66756E6374696F6E28412C65297B746869732E636F756E746572496E6372656D656E743D6C7228412C72722C652E636F756E746572496E6372656D656E74292C746869732E636F756E74657252657365743D';
wwv_flow_imp.g_varchar2_table(1017) := '6C7228412C42722C652E636F756E7465725265736574297D2C6C723D66756E6374696F6E28412C652C74297B76617220723D6E65772050412C743D6E756C6C213D743F742E746F537472696E6728293A652E696E697469616C56616C75653B722E777269';
wwv_flow_imp.g_varchar2_table(1018) := '74652874293B76617220423D6E6577204A4128722E726561642829293B73776974636828652E74797065297B6361736520323A766172206E3D422E7061727365436F6D706F6E656E7456616C756528293B72657475726E20652E706172736528412C5F41';
wwv_flow_imp.g_varchar2_table(1019) := '286E293F6E2E76616C75653A652E696E697469616C56616C7565293B6361736520303A72657475726E20652E706172736528412C422E7061727365436F6D706F6E656E7456616C75652829293B6361736520313A72657475726E20652E70617273652841';
wwv_flow_imp.g_varchar2_table(1020) := '2C422E7061727365436F6D706F6E656E7456616C7565732829293B6361736520343A72657475726E20422E7061727365436F6D706F6E656E7456616C756528293B6361736520333A73776974636828652E666F726D6174297B6361736522616E676C6522';
wwv_flow_imp.g_varchar2_table(1021) := '3A72657475726E206C6528412C422E7061727365436F6D706F6E656E7456616C75652829293B6361736522636F6C6F72223A72657475726E20756528412C422E7061727365436F6D706F6E656E7456616C75652829293B6361736522696D616765223A72';
wwv_flow_imp.g_varchar2_table(1022) := '657475726E204F6528412C422E7061727365436F6D706F6E656E7456616C75652829293B63617365226C656E677468223A76617220733D422E7061727365436F6D706F6E656E7456616C756528293B72657475726E2065652873293F733A61653B636173';
wwv_flow_imp.g_varchar2_table(1023) := '65226C656E6774682D70657263656E74616765223A733D422E7061727365436F6D706F6E656E7456616C756528293B72657475726E2074652873293F733A61653B636173652274696D65223A72657475726E20577428412C422E7061727365436F6D706F';
wwv_flow_imp.g_varchar2_table(1024) := '6E656E7456616C75652829297D7D7D2C43723D66756E6374696F6E28412C65297B413D66756E6374696F6E2841297B73776974636828412E6765744174747269627574652822646174612D68746D6C3263616E7661732D64656275672229297B63617365';
wwv_flow_imp.g_varchar2_table(1025) := '22616C6C223A72657475726E20313B6361736522636C6F6E65223A72657475726E20323B63617365227061727365223A72657475726E20333B636173652272656E646572223A72657475726E20343B64656661756C743A72657475726E20307D7D284129';
wwv_flow_imp.g_varchar2_table(1026) := '3B72657475726E20313D3D3D417C7C653D3D3D417D2C75723D66756E6374696F6E28412C65297B746869732E636F6E746578743D412C746869732E746578744E6F6465733D5B5D2C746869732E656C656D656E74733D5B5D2C746869732E666C6167733D';
wwv_flow_imp.g_varchar2_table(1027) := '302C437228652C33292C746869732E7374796C65733D6E657720617228412C77696E646F772E676574436F6D70757465645374796C6528652C6E756C6C29292C4A42286529262628746869732E7374796C65732E616E696D6174696F6E4475726174696F';
wwv_flow_imp.g_varchar2_table(1028) := '6E2E736F6D652866756E6374696F6E2841297B72657475726E20303C417D29262628652E7374796C652E616E696D6174696F6E4475726174696F6E3D22307322292C6E756C6C213D3D746869732E7374796C65732E7472616E73666F726D262628652E73';
wwv_flow_imp.g_varchar2_table(1029) := '74796C652E7472616E73666F726D3D226E6F6E652229292C746869732E626F756E64733D6628746869732E636F6E746578742C65292C437228652C3429262628746869732E666C6167737C3D3136297D2C46723D224142434445464748494A4B4C4D4E4F';
wwv_flow_imp.g_varchar2_table(1030) := '505152535455565758595A6162636465666768696A6B6C6D6E6F707172737475767778797A303132333435363738392B2F222C68723D22756E646566696E6564223D3D747970656F662055696E743841727261793F5B5D3A6E65772055696E7438417272';
wwv_flow_imp.g_varchar2_table(1031) := '617928323536292C64723D303B64723C46722E6C656E6774683B64722B2B2968725B46722E63686172436F64654174286472295D3D64723B66756E6374696F6E20667228412C652C74297B72657475726E20412E736C6963653F412E736C69636528652C';
wwv_flow_imp.g_varchar2_table(1032) := '74293A6E65772055696E74313641727261792841727261792E70726F746F747970652E736C6963652E63616C6C28412C652C7429297D7661722048723D2870722E70726F746F747970652E6765743D66756E6374696F6E2841297B76617220653B696628';
wwv_flow_imp.g_varchar2_table(1033) := '303C3D41297B696628413C35353239367C7C35363331393C412626413C3D36353533352972657475726E20653D746869732E696E6465785B413E3E355D2C746869732E646174615B653D28653C3C32292B2833312641295D3B696628413C3D3635353335';
wwv_flow_imp.g_varchar2_table(1034) := '2972657475726E20653D746869732E696E6465785B323034382B28412D35353239363E3E35295D2C746869732E646174615B653D28653C3C32292B2833312641295D3B696628413C746869732E6869676853746172742972657475726E20653D74686973';
wwv_flow_imp.g_varchar2_table(1035) := '2E696E6465785B653D323038302B28413E3E3131295D2C653D746869732E696E6465785B652B3D413E3E352636335D2C746869732E646174615B653D28653C3C32292B2833312641295D3B696628413C3D313131343131312972657475726E2074686973';
wwv_flow_imp.g_varchar2_table(1036) := '2E646174615B746869732E6869676856616C7565496E6465785D7D72657475726E20746869732E6572726F7256616C75657D2C7072293B66756E6374696F6E20707228412C652C742C722C422C6E297B746869732E696E697469616C56616C75653D412C';
wwv_flow_imp.g_varchar2_table(1037) := '746869732E6572726F7256616C75653D652C746869732E6869676853746172743D742C746869732E6869676856616C7565496E6465783D722C746869732E696E6465783D422C746869732E646174613D6E7D666F72287661722045723D22414243444546';
wwv_flow_imp.g_varchar2_table(1038) := '4748494A4B4C4D4E4F505152535455565758595A6162636465666768696A6B6C6D6E6F707172737475767778797A303132333435363738392B2F222C49723D22756E646566696E6564223D3D747970656F662055696E743841727261793F5B5D3A6E6577';
wwv_flow_imp.g_varchar2_table(1039) := '2055696E7438417272617928323536292C79723D303B79723C45722E6C656E6774683B79722B2B2949725B45722E63686172436F64654174287972295D3D79723B66756E6374696F6E204B722841297B72657475726E206B722E6765742841297D66756E';
wwv_flow_imp.g_varchar2_table(1040) := '6374696F6E206D722841297B76617220743D66756E6374696F6E2841297B666F722876617220653D5B5D2C743D302C723D412E6C656E6774683B743C723B297B76617220422C6E3D412E63686172436F6465417428742B2B293B35353239363C3D6E2626';
wwv_flow_imp.g_varchar2_table(1041) := '6E3C3D35363331392626743C723F35363332303D3D2836343531322628423D412E63686172436F6465417428742B2B2929293F652E7075736828282831303233266E293C3C3130292B28313032332642292B3635353336293A28652E70757368286E292C';
wwv_flow_imp.g_varchar2_table(1042) := '742D2D293A652E70757368286E297D72657475726E20657D2841292C723D742E6C656E6774682C423D302C6E3D302C733D742E6D6170284B72293B72657475726E7B6E6578743A66756E6374696F6E28297B696628723C3D422972657475726E7B646F6E';
wwv_flow_imp.g_varchar2_table(1043) := '653A21302C76616C75653A6E756C6C7D3B666F722876617220413D52723B423C72262628413D66756E6374696F6E28412C65297B76617220743D652D322C723D415B745D2C423D415B652D315D2C653D415B655D3B696628323D3D3D422626333D3D3D65';
wwv_flow_imp.g_varchar2_table(1044) := '2972657475726E2052723B696628323D3D3D427C7C333D3D3D427C7C343D3D3D422972657475726E22C3B7223B696628323D3D3D657C7C333D3D3D657C7C343D3D3D652972657475726E22C3B7223B696628423D3D3D547226262D31213D3D5B54722C47';
wwv_flow_imp.g_varchar2_table(1045) := '722C4F722C56725D2E696E6465784F662865292972657475726E2052723B696628212842213D3D4F72262642213D3D47727C7C65213D3D477226263130213D3D65292972657475726E2052723B69662828423D3D3D56727C7C31303D3D3D422926263130';
wwv_flow_imp.g_varchar2_table(1046) := '3D3D3D652972657475726E2052723B69662831333D3D3D657C7C353D3D3D652972657475726E2052723B696628373D3D3D652972657475726E2052723B696628313D3D3D422972657475726E2052723B69662831333D3D3D42262631343D3D3D65297B66';
wwv_flow_imp.g_varchar2_table(1047) := '6F72283B353D3D3D723B29723D415B2D2D745D3B69662831343D3D3D722972657475726E2052727D69662831353D3D3D42262631353D3D3D65297B666F7228766172206E3D303B31353D3D3D723B296E2B2B2C723D415B2D2D745D3B6966286E25323D3D';
wwv_flow_imp.g_varchar2_table(1048) := '302972657475726E2052727D72657475726E22C3B7227D28732C2B2B4229293D3D3D52723B293B696628413D3D3D5272262642213D3D722972657475726E7B646F6E653A21302C76616C75653A6E756C6C7D3B76617220653D66756E6374696F6E28297B';
wwv_flow_imp.g_varchar2_table(1049) := '666F722876617220413D5B5D2C653D303B653C617267756D656E74732E6C656E6774683B652B2B29415B655D3D617267756D656E74735B655D3B696628537472696E672E66726F6D436F6465506F696E742972657475726E20537472696E672E66726F6D';
wwv_flow_imp.g_varchar2_table(1050) := '436F6465506F696E742E6170706C7928537472696E672C41293B76617220743D412E6C656E6774683B69662821742972657475726E22223B666F722876617220723D5B5D2C423D2D312C6E3D22223B2B2B423C743B297B76617220733D415B425D3B733C';
wwv_flow_imp.g_varchar2_table(1051) := '3D36353533353F722E707573682873293A28732D3D36353533362C722E707573682835353239362B28733E3E3130292C7325313032342B353633323029292C28422B313D3D3D747C7C31363338343C722E6C656E677468292626286E2B3D537472696E67';
wwv_flow_imp.g_varchar2_table(1052) := '2E66726F6D43686172436F64652E6170706C7928537472696E672C72292C722E6C656E6774683D30297D72657475726E206E7D2E6170706C79286E756C6C2C742E736C696365286E2C4229293B72657475726E206E3D422C7B76616C75653A652C646F6E';
wwv_flow_imp.g_varchar2_table(1053) := '653A21317D7D7D7D66756E6374696F6E204C722841297B72657475726E20303D3D3D415B305D26263235353D3D3D415B315D2626303D3D3D415B325D26263235353D3D3D415B335D7D7661722062722C44722C76722C78722C4D722C53722C54723D382C';
wwv_flow_imp.g_varchar2_table(1054) := '47723D392C4F723D31312C56723D31322C6B723D2876723D66756E6374696F6E2841297B76617220652C742C722C422C6E3D2E37352A412E6C656E6774682C733D412E6C656E6774682C6F3D303B223D223D3D3D415B412E6C656E6774682D315D262628';
wwv_flow_imp.g_varchar2_table(1055) := '6E2D2D2C223D223D3D3D415B412E6C656E6774682D325D26266E2D2D293B666F7228766172206E3D6E65772822756E646566696E656422213D747970656F66204172726179427566666572262622756E646566696E656422213D747970656F662055696E';
wwv_flow_imp.g_varchar2_table(1056) := '743841727261792626766F69642030213D3D55696E743841727261792E70726F746F747970652E736C6963653F41727261794275666665723A417272617929286E292C693D41727261792E69734172726179286E293F6E3A6E65772055696E7438417272';
wwv_flow_imp.g_varchar2_table(1057) := '6179286E292C513D303B513C733B512B3D3429653D68725B412E63686172436F646541742851295D2C743D68725B412E63686172436F6465417428512B31295D2C723D68725B412E63686172436F6465417428512B32295D2C423D68725B412E63686172';
wwv_flow_imp.g_varchar2_table(1058) := '436F6465417428512B33295D2C695B6F2B2B5D3D653C3C327C743E3E342C695B6F2B2B5D3D2831352674293C3C347C723E3E322C695B6F2B2B5D3D28332672293C3C367C363326423B72657475726E206E7D2862723D2241414141414141414141414145';
wwv_flow_imp.g_varchar2_table(1059) := '41344147426B41414641614141414341414141414141494142414147414177414467414341415141416741454141494142414143414151414167414541414941424141434141514141674145414149414241415141424941455141544141494142414143';
wwv_flow_imp.g_varchar2_table(1060) := '414151414167414541414941424141564142634141674145414149414241414341415141474141614142774148674167414349414934416C674149414241416D77436A414B674173414332414C344176514446414D6F4130674250415659425767454941';
wwv_flow_imp.g_varchar2_table(1061) := '4167414341434D414E6F415967466B4157774264414638415830426851474E415A55426C67476541614D426C514757416173427377463841627342777746304163734259774854415167413277472F414F4D426441463841656B423851463041666B422B';
wwv_flow_imp.g_varchar2_table(1062) := '774869414851426641454941414D4335675149414173434567494941416741466749654167674149674970416767414D514935416B4143796745494141674153414A51416C674359414949414167414341414B42516F464367555442524D464751557242';
wwv_flow_imp.g_varchar2_table(1063) := '53734643414149414167414341414941416741434141494141674143414264414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1064) := '414149414167414341426F416D6743727747764151674162674A324167674148674549414167414341446E415873434341414941416741677749494141674143414149414167414341434B416767416B514B5A416767415041444A414167416F514B6B41';
wwv_flow_imp.g_varchar2_table(1065) := '71774373674B36417349434341444A41676741304149494141674143414149414E59433367494941416741434141494141674143414241414F59434341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1066) := '41416B41536F422B514945414167414341413841454D4343414243425167414341424A425641464341414941416741434141494141674143414149414167414341425442566F464341414941466F46434142664257554643414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1067) := '416741625155494141674143414149414167414341427A425873466651574642596F466967574B425A45466967574B42596F466D415766426159467267577842626B4643414149414167414341414941416741434141494141674143414149414D454643';
wwv_flow_imp.g_varchar2_table(1068) := '4141494141674143414149414167414341414941416741434141494141674143414149414D6746434144514251674143414149414167414341414941416741434141494141674143414149414F3443434141494141674169514149414167414341424141';
wwv_flow_imp.g_varchar2_table(1069) := '4167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414430416767414341443841676741434141494141674143414149414167414341414941416741434141494141674143414149414E594643';
wwv_flow_imp.g_varchar2_table(1070) := '41414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1071) := '41674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1072) := '41414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1073) := '41674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1074) := '41414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1075) := '41674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1076) := '41414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1077) := '41674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1078) := '41414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1079) := '41674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1080) := '41414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1081) := '41674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1082) := '41414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1083) := '41674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1084) := '41414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1085) := '41674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1086) := '41414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1087) := '41674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1088) := '41414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1089) := '41674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1090) := '41414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1091) := '41674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1092) := '41414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1093) := '41674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1094) := '4141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941414D4476774149414167414A4149494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1095) := '41674143774D544177674143414239424F734547774D6A417767414B774D794177734659674533412F4D4550774D494145554454514E524177674157514F73414745444341414941416741434141494141674143414270417A51464E515532425463464F';
wwv_flow_imp.g_varchar2_table(1096) := '41553542546F464E415531425459464E77553442546B464F675530425455464E675533425467464F515536425451464E515532425463464F41553542546F464E415531425459464E77553442546B464F675530425455464E675533425467464F51553642';
wwv_flow_imp.g_varchar2_table(1097) := '5451464E515532425463464F41553542546F464E415531425459464E77553442546B464F675530425455464E675533425467464F515536425451464E515532425463464F41553542546F464E415531425459464E77553442546B464F675530425455464E';
wwv_flow_imp.g_varchar2_table(1098) := '675533425467464F515536425451464E515532425463464F41553542546F464E415531425459464E77553442546B464F675530425455464E675533425467464F515536425451464E515532425463464F41553542546F464E415531425459464E77553442';
wwv_flow_imp.g_varchar2_table(1099) := '546B464F675530425455464E675533425467464F515536425451464E515532425463464F41553542546F464E415531425459464E77553442546B464F675530425455464E675533425467464F515536425451464E515532425463464F41553542546F464E';
wwv_flow_imp.g_varchar2_table(1100) := '415531425459464E77553442546B464F675530425455464E675533425467464F515536425451464E515532425463464F41553542546F464E415531425459464E77553442546B464F675530425455464E675533425467464F515536425451464E51553242';
wwv_flow_imp.g_varchar2_table(1101) := '5463464F41553542546F464E415531425459464E77553442546B464F675530425455464E675533425467464F515536425451464E515532425463464F41553542546F464E415531425459464E77553442546B464F675530425455464E675533425467464F';
wwv_flow_imp.g_varchar2_table(1102) := '515536425451464E515532425463464F41553542546F464E415531425459464E77553442546B464F675530425455464E675533425467464F515536425451464E515532425463464F41553542546F464E415531425459464E77553442546B464F67553042';
wwv_flow_imp.g_varchar2_table(1103) := '5455464E675533425467464F515536425451464E515532425463464F41553542546F464E415531425459464E77553442546B464F675530425455464E675533425467464F515536425451464E515532425463464F41553542546F464E415531425459464E';
wwv_flow_imp.g_varchar2_table(1104) := '77553442546B464F675530425455464E675533425467464F515536425451464E515532425463464F41553542546F464E415531425459464E77553442546B464F675530425455464E675533425467464F515536425451464E515532425463464F41553542';
wwv_flow_imp.g_varchar2_table(1105) := '546F464E415531425459464E77553442546B464951556F4253774643414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1106) := '41414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1107) := '41674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1108) := '41414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1109) := '41674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1110) := '41414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1111) := '41674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1112) := '41414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341427441776741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1113) := '41674143414149414167414341414941416741434141494141674143414149414167414341424D414577414341414941416741434141494142674143414149414167414341432F4141674143414179415167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1114) := '41414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414341414941417741416741434141494141674143414149414167414341414941414141';
wwv_flow_imp.g_varchar2_table(1115) := '52414249414167414341414941425141534141494141674149414277414541416A6743494142734171414332414C304169674451417477432B494A49517156415A554257517156415A55426C514756415A55426C514772433555426C514756415A55426C';
wwv_flow_imp.g_varchar2_table(1116) := '514756415A55426C5147564158734B6C5147564162414B367773724447554D70517A6C444A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C51475641';
wwv_flow_imp.g_varchar2_table(1117) := '5A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C';
wwv_flow_imp.g_varchar2_table(1118) := '514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C51475641';
wwv_flow_imp.g_varchar2_table(1119) := '5A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C';
wwv_flow_imp.g_varchar2_table(1120) := '514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C51475641';
wwv_flow_imp.g_varchar2_table(1121) := '5A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C';
wwv_flow_imp.g_varchar2_table(1122) := '514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C51475641';
wwv_flow_imp.g_varchar2_table(1123) := '5A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C';
wwv_flow_imp.g_varchar2_table(1124) := '514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C51475641';
wwv_flow_imp.g_varchar2_table(1125) := '5A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C';
wwv_flow_imp.g_varchar2_table(1126) := '514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C514756415A55426C5147564166414B4141755A413634417477434A414C6F43364144774141674175414367412F6F4570674F3641';
wwv_flow_imp.g_varchar2_table(1127) := '7173442B4141494141674173774D49414167414341414941496B4175775035416673427777504C4177674143414149414167414341445241396B4443414149414F454436514D4941416741434141494141674143414475412F5944434141494150344479';
wwv_flow_imp.g_varchar2_table(1128) := '5141494141674142675149414167415851414F4241674143414149414167414341414941424D4543414149414167414341414941416741434144384141514243414149414167414767516942436F45434145784241674145414549414167414341414941';
wwv_flow_imp.g_varchar2_table(1129) := '4167414341414941416741434141494141674143414134424167414341424142455945434141494141674154415159415167415641514941416741434141494141674143414149414167414341414941466F454341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1130) := '41414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414F51454941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1131) := '416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341422B4241634143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1132) := '41414941416741434141494141674143414149414167414341414941416741434141494141674143414149414541426867534D4241674143414149414167416C415149414167414341414941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1133) := '4167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141774145414151414241414441414D';
wwv_flow_imp.g_varchar2_table(1134) := '414177414441415141424141454141514142414145414151414248415441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D41417741';
wwv_flow_imp.g_varchar2_table(1135) := '4441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D4141774144414143';
wwv_flow_imp.g_varchar2_table(1136) := '41414941416741434141494141674143414149414167414341414941416741434141494141674164514D4941416741434141494141674143414149414D6B41434141494141674166514D4941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1137) := '416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341434641346B44434141494141674143414149414F6342434141494141674143';
wwv_flow_imp.g_varchar2_table(1138) := '41414941416741434141494141674143414149414167414341414941416741434141494149634443414149414167414341414941416741434141494141674143414149414A45444341414941416741434144464141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1139) := '4167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414267424167415A675149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1140) := '41414941416741434141494141674143414149414167414341414941416741434141494141674162415143425849454341414941486B45434141494141674143414149414167414341414941416741434141494141674143414149414167414341424141';
wwv_flow_imp.g_varchar2_table(1141) := '4A77455141436A424B6F457367514941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1142) := '414149414167414341414941416741434141494141674143414336424D4945434141494141674143414149414167414341426D42416741434141494141674143414149414167414341414941416741434141494141674178775149414167414341414941';
wwv_flow_imp.g_varchar2_table(1143) := '41674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494147594543';
wwv_flow_imp.g_varchar2_table(1144) := '414149414167417A6751494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1145) := '4167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414167416967574B42596F466967574B42596F466967574B4264304658775549414F49463667587842596F46336754354251414743';
wwv_flow_imp.g_varchar2_table(1146) := '41614B42596F466967574B42596F466967574B42596F466967574B42596F466967585742496F466967574B42596F466967574B42596F466967574B425973464541614B42596F466967574B42596F466967574B425251474341434B42596F466967574B42';
wwv_flow_imp.g_varchar2_table(1147) := '51674143414149414E4545434141494142674769675567426767414A675949414334474D77614B42596F4630775133426A34476967574B42596F466967574B42596F466967574B42596F466967574B42596F466967554941416741434141494141674143';
wwv_flow_imp.g_varchar2_table(1148) := '414149414167416967574B42596F466967574B42596F466967574B42596F466967574B42596F466967574B42596F466967574B42596F466967574B42596F466967574B42596F466967574B42596F466967574B42596F466967574C42662F2F2F2F2F2F2F';
wwv_flow_imp.g_varchar2_table(1149) := '77514142414145414151414241414541415141424141454141514141774145414151414167414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1150) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1151) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1152) := '41414141414141414141414141414141414141414141414141414141414141414141414141414142414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1153) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1154) := '41414141414141414141414141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414541415141424141454141514142414145414151414241414141';
wwv_flow_imp.g_varchar2_table(1155) := '414141414141414141414141414141414141414141414F4141414141414141414151414467414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(1156) := '51414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(1157) := '41554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1158) := '41414141415541425141464141554142514146414155414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1159) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141464141554142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(1160) := '51414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514141414155414141414641';
wwv_flow_imp.g_varchar2_table(1161) := '41554141414146414155414141414641414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1162) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414142414145414151414241414541415141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1163) := '41414141414141414155414251414641415541425141464141554142514146414155414251414141415141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1164) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(1165) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141425141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1166) := '41414141414141414141414141554142514146414155414251414641415541415141414141554142514146414155414251414641414141414141464141554141414146414155414251414641414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1167) := '41414141414141414141414141414141414141414141414141414141414141414145414141414641414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1168) := '41414141414141414141414141414141414141414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1169) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1170) := '41414141414141414141414141414141414146414155414251414641415541425141464141554142514146414155414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1171) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141464141554142514146414155414251414641415541425141414141414141';
wwv_flow_imp.g_varchar2_table(1172) := '41414141414141414141414141414141414146414141414141414641415541415141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(1173) := '41554142514146414155414277414641415541425141464141414142774148414163414141414841416341427741464141454141414141414141414141414141414141414141414141554141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1174) := '41414141414141414141414141414141414148414163414277414641415541425141464141634142774146414155414141414141414541414141414141414141414141414141414141414141414141414141414141414141414141414141414151414141';
wwv_flow_imp.g_varchar2_table(1175) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141484141414141514142414141414141414141414141414141464141554142514146414141414277414641414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1176) := '41414141414141414141414141414141414141414141414141414141414141425141484141634142774148414163414141414841416341414141414141554142514148414155414151414841414541427741464141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1177) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141425141464141554142514146414155414277414241415541425141464141554141';
wwv_flow_imp.g_varchar2_table(1178) := '41414141414141414141414141454141514142414145414151414241415541425141464141554142514146414155414251414641415541425141464141554142774146414155414141414141414141414141414141414142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(1179) := '41554141514146414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414155414251414641415141414141414141414141';
wwv_flow_imp.g_varchar2_table(1180) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414151414251414E41415141424141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1181) := '4151414241414541415141424141454141514141414141414141414141414141414141414141414141414141414141414141414141414F414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1182) := '41414141414141424141454141514142414145414151414241414541415141424141454141514141414141414141414141414141414141414141414141414141414141414141414141414141414141414141454141514142414145414151414241414541';
wwv_flow_imp.g_varchar2_table(1183) := '41514142414141414141414141414141414141414141414141414142514148414155414251414641414141414141414141634142514146414155414251414641415141424141454141514142414145414151414241414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(1184) := '51414641415541425141464141554142514146414155414251414641415541424141454141514142414145414151414241414541415141424141454141514142414145414151414241414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1185) := '41414141414141414141414141414141414141414141414141414141414141414155414251414641415541414141464141554142514146414155414141414641415541425141414141554142514146414155414251414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1186) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141464141554142514141414141414141414141415541425141464141634141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1187) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141425141484141554141414148414163414277414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(1188) := '51414641415541427741484141634142774146414163414277414141415541425141464141554142514146414155414141414141414141414141414141414141414141414141414141414641415541414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1189) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414155414277414841414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1190) := '41414141414141414141414141414141414141414141414141414141414141414141414141414142514141414155414277414841415541425141464141554141414141414163414277414141414141427741484141554141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1191) := '41414141414141414141414251414141414141414141414141414141414141414141414141414141415541425141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1192) := '41414141414141414141414141414142514141414141414251414641416341414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1193) := '41414141414146414141414277414841416341425141464141414141414141414141414251414641414141414141464141554142514141414141414141414641414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1194) := '41414141414141414141414141554142514141414141414141414641414141414141414141414141414141414141414141414141414141427741464141554142514146414155414141414641415541427741414141634142774146414141414141414141';
wwv_flow_imp.g_varchar2_table(1195) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141464141554141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1196) := '41414141414141414141464141554142514146414155414251414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1197) := '41554141414146414155414277414641415541425141464141414141414148414163414141414141416341427741464141414141414141414141414141414141414141425141464141554141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1198) := '41414641414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141464141634142774141414141414141414841';
wwv_flow_imp.g_varchar2_table(1199) := '41634142774141414163414277414841415541414141414141414141414141414141414141414141414141425141414141414141414141414141414141414141414141425141484141634142774146414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1200) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141415541427741484141634142774141414155414251414641414141425141464141554142514141414141414141414141';
wwv_flow_imp.g_varchar2_table(1201) := '41414141414141414155414251414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141425141414141634142';
wwv_flow_imp.g_varchar2_table(1202) := '51414841416341425141484141634141414146414163414277414141416341427741464141554141414141414141414141414141414141414141464141554141414141414141414141414141414141414141414141414142514146414163414277414141';
wwv_flow_imp.g_varchar2_table(1203) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414155414251414141415541427741414141414141';
wwv_flow_imp.g_varchar2_table(1204) := '41414141414141414141414141414141414141414155414141414141414141414141464141634142774146414155414251414141415541414141484141634142774148414163414277414841415541414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1205) := '41414141414141414141414141414141414141414141414141554141414148414155414251414641415541425141464141554141414141414141414141414141414141414141414141554142514146414155414251414641415541425141414141414141';
wwv_flow_imp.g_varchar2_table(1206) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414146414141414277414641415541425141464141554142514146414155414251414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1207) := '41414142514146414155414251414641415541414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141415541425141414141414141';
wwv_flow_imp.g_varchar2_table(1208) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141425141414141554141414146414141414141414141414141427741484141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1209) := '41414141414141414141414141414141414141414141414141414141414146414155414251414641415541425141464141554142514146414155414251414641415541427741464141554142514146414155414141414641415541414141414141414141';
wwv_flow_imp.g_varchar2_table(1210) := '41414141415541425141464141554142514146414155414251414641415541425141414141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(1211) := '41554142514146414155414251414641415541425141414141414141414141414141414141414141414141414141414141414141414141414141414141414141415541425141464141554142774146414155414251414641415541425141414141554142';
wwv_flow_imp.g_varchar2_table(1212) := '51414841416341425141464141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414841416341425141464141414141414141414141414251414641';
wwv_flow_imp.g_varchar2_table(1213) := '41554141414141414141414141414141414141414141414141414141414141414141414141414141414141414141464141554142514146414141414141414141414141414141414141414141414141414141414141414141414141425141414141634142';
wwv_flow_imp.g_varchar2_table(1214) := '51414641414141414141414141414141414141414155414141414141414141414141414141414141414141414141414141414141414141414141414141414142514141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1215) := '41414141414141414141414141414141414141425141464141554141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141415541425141484141554142';
wwv_flow_imp.g_varchar2_table(1216) := '51414641415541425141464141554142774148414163414277414841416341427741484141554142774148414155414251414641415541425141464141554142514146414155414251414141414141414141414141414141414141414141414141414641';
wwv_flow_imp.g_varchar2_table(1217) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414251414641415541427741484141634142774146414155414277414841416341414141414141414141';
wwv_flow_imp.g_varchar2_table(1218) := '41414841416341425141484141634142774148414163414277414641415541425141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414251414641';
wwv_flow_imp.g_varchar2_table(1219) := '41634142774146414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141416341425141484141554142514146414155414251414641415541414141464141414142';
wwv_flow_imp.g_varchar2_table(1220) := '51414141414141425141464141554142514146414155414251414641416341427741484141634142774148414155414251414641415541425141464141554142514146414155414141414141415541425141464141554142514148414141414141414141';
wwv_flow_imp.g_varchar2_table(1221) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141415541425141464141554142514146414155414277414641416341427741484141634142';
wwv_flow_imp.g_varchar2_table(1222) := '77414641416341427741414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414146414155414251414641';
wwv_flow_imp.g_varchar2_table(1223) := '41554142514146414155414251414141414141414141414141414141414141414141414141414141414141414141464141554142774141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1224) := '41414141414141414141414141414141414141414141414141414141414141414141484141554142514146414155414277414841415541425141484141554142514146414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1225) := '41414141414141414141414141414141414141414141464141634142514146414163414277414841415541427741464141554142514148414163414141414141414141414141414141414141414141414141414141414141414141427741484141634142';
wwv_flow_imp.g_varchar2_table(1226) := '77414841416341427741484141554142514146414155414251414641415541425141484141634142514146414141414141414141414141414141414141414141414141414141414141414141414141414141414141414142514146414155414141414641';
wwv_flow_imp.g_varchar2_table(1227) := '41554142514146414155414251414641415541425141464141554142514146414163414251414641415541425141464141554142514141414141414141414141415541414141414141414141414141414141414251414141414141427741464141554141';
wwv_flow_imp.g_varchar2_table(1228) := '41414141414141414141414141414142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141414142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(1229) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141415541425141464141414141414141414141414141414141414141414141414141414141414141414141414141414141414141425141464141554142';
wwv_flow_imp.g_varchar2_table(1230) := '5141464141554144674141414141414141414141414141414141414141414141414141414141414141414F414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1231) := '41414141414141414141414141414141415541425141414141414141414141414141414141414141414141414141414141414141414141414141414141414141415541425141464141554141414146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(1232) := '51414641414141414141414141414142514141414141414141414641414141414141414141414142514141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1233) := '41414142774148414155414251414841414141414141414141414142514141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414163414277414841416341425141464141414141';
wwv_flow_imp.g_varchar2_table(1234) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414146414155414251414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(1235) := '41554142514146414155414251414141414141414141414141414141414141414141414141414141414141414141414141554141414141414141414141414141414141425141464141554142514146414155414251414641414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1236) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414155414251414641415541425141464141554142514146414155414251414841416341414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1237) := '41414141414141414141414141414141414141414141414141414141414146414163414277414641415541425141464141634142774146414155414277414841414141414141414141414141414146414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1238) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141415541425141464141554142514146414163414277414641415541427741484141554142514141414141414141414141';
wwv_flow_imp.g_varchar2_table(1239) := '41414141414141414141414141414141414141414141464141414141414141414141414141414141414141414141464141634141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1240) := '41414141414141414141414141414141414141414141414141414141414141425141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141554141414146414155414251414141';
wwv_flow_imp.g_varchar2_table(1241) := '41414142514146414141414141414141414141414141464141554141414141414141414141414141414141414141414141414141414141414163414251414641416341427741414141414141414141414141414277414641414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1242) := '41414141414141414141414141414141414141414163414277414641416341427741464141634142774141414163414251414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1243) := '41414141414141414141414141414141414141414141414141414141414141414141414251414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1244) := '41414141414141414141414141414141414146414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141554142514146414155414251414141';
wwv_flow_imp.g_varchar2_table(1245) := '41414141414141414141414141414641415541425141414141554142514141414141414141414141414141425141464141554142514141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1246) := '41414141414141414141414141414141414146414155414251414141414141414141414141554141414141414141414141414141414141414141414141414141414141414155414251414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1247) := '41414141414141414141414141414141414141414141414141634142514148414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1248) := '41414141414141414141414141414141414146414155414251414641415541427741464141554142514146414155414251414641415541414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1249) := '41414141414141414141414141414641414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141427741484141634142514146414155414251414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(1250) := '77414141414141414141414141414141414141414141414141414141414141414141484141634142774146414155414251414841416341425141484141554142514141414141414141414141414141414141464141414142774148414163414251414641';
wwv_flow_imp.g_varchar2_table(1251) := '41554142514146414155414251414641414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141554142774148414163414277414141414141427741484141414141';
wwv_flow_imp.g_varchar2_table(1252) := '41414841416341427741414141414141414141414141414141414141414141414141464141414141414141414141414141414141414141414141414141414142774148414141414141414641415541425141464141554142514146414141414141414141';
wwv_flow_imp.g_varchar2_table(1253) := '41554142514146414155414251414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414148414163414277414641415541425141464141554142';
wwv_flow_imp.g_varchar2_table(1254) := '51414641415541427741484141554142514146414163414251414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414142514141414141414141414141';
wwv_flow_imp.g_varchar2_table(1255) := '41414141414141414141414141414141414141414141414141414141414141414141414251414841416341425141464141554142514146414155414277414641416341427741464141634142514146414163414251414641414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1256) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414251414841416341425141464141554142514141414141414277414841';
wwv_flow_imp.g_varchar2_table(1257) := '41634142774146414155414277414641415541414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141425141464141414141';
wwv_flow_imp.g_varchar2_table(1258) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414163414277414841415541425141464141554142514146414155414251414841416341425141484141554141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1259) := '41414141414141414141414141414141415541427741464141634142774146414155414251414641415541425141484141554141414141414141414141414141414141414141414141634142774146414155414251414641416341425141464141554142';
wwv_flow_imp.g_varchar2_table(1260) := '51414641414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141484141634142774146414155414251414641415541425141464141554142514148414155414251414141';
wwv_flow_imp.g_varchar2_table(1261) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141484141634142774146414155414251414641414141414141464141554142774148414163414277414641414141414141414141634141';
wwv_flow_imp.g_varchar2_table(1262) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414641415541425141464141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(1263) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141415541414141414141414141414141414141414141414141414141425141464141554142';
wwv_flow_imp.g_varchar2_table(1264) := '51414641415541427741484141554142514146414141414141414141414141414141414141414141414141414141414141414141414141414141414141634142514146414155414251414641415541425141414141554142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(1265) := '41634142514141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414146414155414251414641415541425141464141554142514146414155414251414641415541414141484141554142';
wwv_flow_imp.g_varchar2_table(1266) := '51414641415541425141464141554142774146414155414277414641415541414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141425141464141554142514146414155414141414141';
wwv_flow_imp.g_varchar2_table(1267) := '41414142514141414155414251414141415541414141414141414141414141414141414141414141414141414141484141634142774148414163414141414641415541414141484141634142514148414155414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1268) := '41414141414141414141414141414141414141414141414141414141414141414141464141554142774148414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414146414155414251414641';
wwv_flow_imp.g_varchar2_table(1269) := '41554141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414146414155414251414641415541425141464141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1270) := '41414141414141414141414141414142514141414163414277414841416341427741484141634142774148414163414277414841416341427741484141414141414141414141414141414141414141425141464141554142514141414141414141414141';
wwv_flow_imp.g_varchar2_table(1271) := '41414141414141414141414141414141414141414141414141554141414141414141414141414141414141414141414141414141414141414163414277414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1272) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414155414251414141415541425141464141414141414146414155414251414641415541425141464141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1273) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141425141464141554142514141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1274) := '41414141414141425141464141554141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414142514146414155414251414641';
wwv_flow_imp.g_varchar2_table(1275) := '41554142514146414155414251414641415541425141464141554142514146414155414251414641415541425141464141414141414141414141414251414641415541425141464141554142514146414155414251414641415541425141464141414141';
wwv_flow_imp.g_varchar2_table(1276) := '41414141414141414141414141414141414146414141414141414141414141414141414141414141414141414141414251414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1277) := '41414141414141414155414251414641415541425141414141554142514146414155414251414641415541425141464141554142514146414155414251414641414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1278) := '41414141414141425141464141554142514146414155414251414141415541425141464141554142514146414155414251414641415541425141464141554142514146414155414251414141414141425141464141554142514146414155414251414141';
wwv_flow_imp.g_varchar2_table(1279) := '41554142514141414155414251414641415541425141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414146414155414251414641414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1280) := '41414141414141414141414141414141414141414141414141414141414141425141464141554142514146414155414251414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1281) := '4141414141414F414134414467414F414134414467414F414134414467414F414134414467414F414134414467414F414134414467414F414134414467414F414134414467414F41413441446741464141554142514146414155414467414F4141344144';
wwv_flow_imp.g_varchar2_table(1282) := '67414F41413441447741504141384144774150414138414477415041413841447741504141384144774150414138414477415041413841447741504141384144774150414138414477415041414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1283) := '41414141414141414141414141414141414141414141414141634142774141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414277414841416341427741484141634142';
wwv_flow_imp.g_varchar2_table(1284) := '77414841416341427741484141634142774141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1285) := '41414142774148414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414142774148414163414277414841416341427741484141634142';
wwv_flow_imp.g_varchar2_table(1286) := '77414841416341427741484141634142774148414163414277414841416341427741484141634142774148414163414277414841416341427741484141674143414149414167414341414941416741434141494141674143414149414167414341414941';
wwv_flow_imp.g_varchar2_table(1287) := '4167414341414941416741434141494141674143414149414167414341414941416741434141494141674143414149414141414141414141416B414351414A41416B414351414A41416B414351414A41416B414351414A41416B414351414A41416B4143';
wwv_flow_imp.g_varchar2_table(1288) := '51414A41416B414351414A41416B414351414A41416B414351414A41416B414351414A41416B414351414B41416F414367414B41416F414367414B41416F414367414B41416F414367414B41416F414367414B41416F414367414B41416F414367414B41';
wwv_flow_imp.g_varchar2_table(1289) := '416F414367414D414177414441414D414141414141414141414141414141414141414141414141414141414141414141416B414351414A41416B414351414A41416B414351414A41416B414351414A41416B414351414A41416B414351414A41416B4141';
wwv_flow_imp.g_varchar2_table(1290) := '414141414141414141414B41416F414367414B41416F414367414B41416F414367414B41416F414367414B41416F414367414B41416F414367414B41416F414367414B41416F414367414B41416F414367414B41416F414367414B41416F414367414141';
wwv_flow_imp.g_varchar2_table(1291) := '41414141414141414173414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414377414D414177414441414D4141774144';
wwv_flow_imp.g_varchar2_table(1292) := '41414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D414177414441414D41417741444141414141414144674141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1293) := '41414141414141414141414141414141414141414141414141344141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414F414134414467414F4141344144';
wwv_flow_imp.g_varchar2_table(1294) := '674141414141414141414141414141414141414141414141414141414141414467414F4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1295) := '41414141414141414134414467414141414141414141414141414141414141414141414467414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1296) := '414141414141414467414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414467414F414134414467414F414134414467414F414134414467414F4141414141414141414141414467414F41';
wwv_flow_imp.g_varchar2_table(1297) := '413441414141414141414141414141414141414141414F4141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1298) := '414141414141414467414F414141414141414141414141414141414141414141414141414141414467414141414141414141414141414141414141414141414141414F414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1299) := '41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414467414F4141344144674141414134414467414F414134414467414F414141414467414F4141344144';
wwv_flow_imp.g_varchar2_table(1300) := '67414F414134414467414F414134414467414F414134414141414F414134414467414F414134414467414F414134414467414F414134414467414F414134414467414F414134414467414F414134414467414F414134414467414F414134414467414F41';
wwv_flow_imp.g_varchar2_table(1301) := '4134414467414F414134414467414F414141414141414141414141414141414141414141414141414141414467414F414134414467414F414134414467414F414134414467414F414134414467414F414134414467414F41413441414141414141344144';
wwv_flow_imp.g_varchar2_table(1302) := '67414F414134414467414F414134414467414F4141344144674141414134414141414F4141414141414141414141414141414141413441414141414141414141414141414141414467414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1303) := '41344144674141414141414141414141414141414141414141414141414141414141414467414141414141446741414141414141414141414134414141414F4141414141414141414141414467414F414134414141414F41414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1304) := '4141414141414141414141414141414141414F414134414467414F41413441414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414F41';
wwv_flow_imp.g_varchar2_table(1305) := '4134414467414141414141414141414141414141414141414141414141414F4141414141414141414141414141414141414141414141414141414141414141414141414141414F4141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1306) := '414141414141414141414F414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414F414134414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1307) := '4134414467414F414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414467414F41414141414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1308) := '41414141414141414141414141414144674141414141414141414141413441414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414F41';
wwv_flow_imp.g_varchar2_table(1309) := '414141446741414141414141414141414141414141414141414141414141414141414141414141414141414141414F4141344144674141414141414141414141414141414141414141414141414141414141414141414141414141414141414141344144';
wwv_flow_imp.g_varchar2_table(1310) := '67414F414134414467414F4141414141414141414141414141414141414141414141414141414141414141414134414467414141414141414141414141414141414141414141414141414141414141414141414141414144674141414141414467414F41';
wwv_flow_imp.g_varchar2_table(1311) := '4134414467414F414134414467414F41413441446741414141414141414141414141414141414141414141414141414141414141414141414141414467414F414134414467414F414134414467414F414134414467414F414134414467414F4141344144';
wwv_flow_imp.g_varchar2_table(1312) := '67414F4141344144674141414134414467414F414134414467414F414134414467414F414134414467414F414134414467414F41414141414141414141414141414141414141414141414141414141446741414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1313) := '41414141414141414141414141414141414141414141414141344141414141414134414467414F414134414467414F414134414467414F414141414467414F414134414467414141414141414141414141414141414141414141414141414F4141344144';
wwv_flow_imp.g_varchar2_table(1314) := '67414F414134414467414F414134414467414F414134414467414F414134414467414F414134414467414F414134414467414F41413441414141414141414141414141414141414467414F414134414467414F414134414467414F414134414467414F41';
wwv_flow_imp.g_varchar2_table(1315) := '4134414467414F414134414467414F414134414467414F414134414467414F414134414467414F41414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141344144';
wwv_flow_imp.g_varchar2_table(1316) := '67414F414134414467414F414134414467414F4141344144674141414141414141414141414141414141414141414141414141414141414141414F414134414467414F414141414141414141414141414141414141414141414141414141414141414141';
wwv_flow_imp.g_varchar2_table(1317) := '41414141414141414141414467414F414134414467414F414134414467414F414141414141414141414141414141414141414141414141414141414467414F414134414467414F4141344141414141414141414141414141414141414141414141344144';
wwv_flow_imp.g_varchar2_table(1318) := '67414F414134414467414F414134414467414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414F414134414467414F414134414467414F414134414467414F414134414467414F41';
wwv_flow_imp.g_varchar2_table(1319) := '4134414467414F414134414467414F414134414467414F414134414467414F414134414467414F414134414141414F414134414467414F4141344144674141414134414467414F414134414467414F414134414467414F414134414467414F4141344144';
wwv_flow_imp.g_varchar2_table(1320) := '67414F414134414467414F414134414467414F414134414467414F4141344141414141414141414141413D22292C78723D41727261792E69734172726179287672293F66756E6374696F6E2841297B666F722876617220653D412E6C656E6774682C743D';
wwv_flow_imp.g_varchar2_table(1321) := '5B5D2C723D303B723C653B722B3D3429742E7075736828415B722B335D3C3C32347C415B722B325D3C3C31367C415B722B315D3C3C387C415B725D293B72657475726E20747D287672293A6E65772055696E7433324172726179287672292C4D723D4172';
wwv_flow_imp.g_varchar2_table(1322) := '7261792E69734172726179287672293F66756E6374696F6E2841297B666F722876617220653D412E6C656E6774682C743D5B5D2C723D303B723C653B722B3D3229742E7075736828415B722B315D3C3C387C415B725D293B72657475726E20747D287672';
wwv_flow_imp.g_varchar2_table(1323) := '293A6E65772055696E7431364172726179287672292C62723D6672284D722C31322C78725B345D2F32292C44723D323D3D3D78725B355D3F6672284D722C2832342B78725B345D292F32293A2876723D78722C4D723D4D6174682E6365696C282832342B';
wwv_flow_imp.g_varchar2_table(1324) := '78725B345D292F34292C76722E736C6963653F76722E736C696365284D722C4472293A6E65772055696E74333241727261792841727261792E70726F746F747970652E736C6963652E63616C6C2876722C4D722C44722929292C6E65772048722878725B';
wwv_flow_imp.g_varchar2_table(1325) := '305D2C78725B315D2C78725B325D2C78725B335D2C62722C447229292C52723D22C397222C4E723D66756E6374696F6E28412C652C742C722C42297B766172206E3D22687474703A2F2F7777772E77332E6F72672F323030302F737667222C733D646F63';
wwv_flow_imp.g_varchar2_table(1326) := '756D656E742E637265617465456C656D656E744E53286E2C2273766722292C6E3D646F63756D656E742E637265617465456C656D656E744E53286E2C22666F726569676E4F626A65637422293B72657475726E20732E7365744174747269627574654E53';
wwv_flow_imp.g_varchar2_table(1327) := '286E756C6C2C227769647468222C412E746F537472696E672829292C732E7365744174747269627574654E53286E756C6C2C22686569676874222C652E746F537472696E672829292C6E2E7365744174747269627574654E53286E756C6C2C2277696474';
wwv_flow_imp.g_varchar2_table(1328) := '68222C223130302522292C6E2E7365744174747269627574654E53286E756C6C2C22686569676874222C223130302522292C6E2E7365744174747269627574654E53286E756C6C2C2278222C742E746F537472696E672829292C6E2E7365744174747269';
wwv_flow_imp.g_varchar2_table(1329) := '627574654E53286E756C6C2C2279222C722E746F537472696E672829292C6E2E7365744174747269627574654E53286E756C6C2C2265787465726E616C5265736F75726365735265717569726564222C227472756522292C732E617070656E644368696C';
wwv_flow_imp.g_varchar2_table(1330) := '64286E292C6E2E617070656E644368696C642842292C737D2C50723D66756E6374696F6E2872297B72657475726E206E65772050726F6D6973652866756E6374696F6E28412C65297B76617220743D6E657720496D6167653B742E6F6E6C6F61643D6675';
wwv_flow_imp.g_varchar2_table(1331) := '6E6374696F6E28297B72657475726E20412874297D2C742E6F6E6572726F723D652C742E7372633D22646174613A696D6167652F7376672B786D6C3B636861727365743D7574662D382C222B656E636F6465555249436F6D706F6E656E7428286E657720';
wwv_flow_imp.g_varchar2_table(1332) := '584D4C53657269616C697A6572292E73657269616C697A65546F537472696E67287229297D297D2C58723D7B67657420535550504F52545F52414E47455F424F554E445328297B76617220413D66756E6374696F6E2841297B696628412E637265617465';
wwv_flow_imp.g_varchar2_table(1333) := '52616E6765297B76617220653D412E63726561746552616E676528293B696628652E676574426F756E64696E67436C69656E7452656374297B76617220743D412E637265617465456C656D656E742822626F756E647465737422293B742E7374796C652E';
wwv_flow_imp.g_varchar2_table(1334) := '6865696768743D223132337078222C742E7374796C652E646973706C61793D22626C6F636B222C412E626F64792E617070656E644368696C642874292C652E73656C6563744E6F64652874293B653D652E676574426F756E64696E67436C69656E745265';
wwv_flow_imp.g_varchar2_table(1335) := '637428292C653D4D6174682E726F756E6428652E686569676874293B696628412E626F64792E72656D6F76654368696C642874292C3132333D3D3D652972657475726E21307D7D72657475726E21317D28646F63756D656E74293B72657475726E204F62';
wwv_flow_imp.g_varchar2_table(1336) := '6A6563742E646566696E6550726F70657274792858722C22535550504F52545F52414E47455F424F554E4453222C7B76616C75653A417D292C417D2C67657420535550504F52545F574F52445F425245414B494E4728297B76617220413D58722E535550';
wwv_flow_imp.g_varchar2_table(1337) := '504F52545F52414E47455F424F554E4453262666756E6374696F6E2841297B76617220653D412E637265617465456C656D656E742822626F756E647465737422293B652E7374796C652E77696474683D2235307078222C652E7374796C652E646973706C';
wwv_flow_imp.g_varchar2_table(1338) := '61793D22626C6F636B222C652E7374796C652E666F6E7453697A653D2231327078222C652E7374796C652E6C657474657253706163696E673D22307078222C652E7374796C652E776F726453706163696E673D22307078222C412E626F64792E61707065';
wwv_flow_imp.g_varchar2_table(1339) := '6E644368696C642865293B76617220723D412E63726561746552616E676528293B652E696E6E657248544D4C3D2266756E6374696F6E223D3D747970656F6622222E7265706561743F2226233132383130343B222E726570656174283130293A22223B76';
wwv_flow_imp.g_varchar2_table(1340) := '617220423D652E66697273744368696C642C743D5128422E64617461292E6D61702866756E6374696F6E2841297B72657475726E20672841297D292C6E3D302C733D7B7D2C743D742E65766572792866756E6374696F6E28412C65297B722E7365745374';
wwv_flow_imp.g_varchar2_table(1341) := '61727428422C6E292C722E736574456E6428422C6E2B412E6C656E677468293B76617220743D722E676574426F756E64696E67436C69656E745265637428293B6E2B3D412E6C656E6774683B413D742E783E732E787C7C742E793E732E793B7265747572';
wwv_flow_imp.g_varchar2_table(1342) := '6E20733D742C303D3D3D657C7C417D293B72657475726E20412E626F64792E72656D6F76654368696C642865292C747D28646F63756D656E74293B72657475726E204F626A6563742E646566696E6550726F70657274792858722C22535550504F52545F';
wwv_flow_imp.g_varchar2_table(1343) := '574F52445F425245414B494E47222C7B76616C75653A417D292C417D2C67657420535550504F52545F5356475F44524157494E4728297B76617220413D66756E6374696F6E2841297B76617220653D6E657720496D6167652C743D412E63726561746545';
wwv_flow_imp.g_varchar2_table(1344) := '6C656D656E74282263616E76617322292C413D742E676574436F6E746578742822326422293B69662821412972657475726E21313B652E7372633D22646174613A696D6167652F7376672B786D6C2C3C73766720786D6C6E733D27687474703A2F2F7777';
wwv_flow_imp.g_varchar2_table(1345) := '772E77332E6F72672F323030302F737667273E3C2F7376673E223B7472797B412E64726177496D61676528652C302C30292C742E746F4461746155524C28297D63617463682841297B72657475726E21317D72657475726E21307D28646F63756D656E74';
wwv_flow_imp.g_varchar2_table(1346) := '293B72657475726E204F626A6563742E646566696E6550726F70657274792858722C22535550504F52545F5356475F44524157494E47222C7B76616C75653A417D292C417D2C67657420535550504F52545F464F524549474E4F424A4543545F44524157';
wwv_flow_imp.g_varchar2_table(1347) := '494E4728297B76617220413D2266756E6374696F6E223D3D747970656F662041727261792E66726F6D26262266756E6374696F6E223D3D747970656F662077696E646F772E66657463683F66756E6374696F6E2874297B76617220413D742E6372656174';
wwv_flow_imp.g_varchar2_table(1348) := '65456C656D656E74282263616E76617322292C723D3130303B412E77696474683D722C412E6865696768743D723B76617220423D412E676574436F6E746578742822326422293B69662821422972657475726E2050726F6D6973652E72656A6563742821';
wwv_flow_imp.g_varchar2_table(1349) := '31293B422E66696C6C5374796C653D2272676228302C203235352C203029222C422E66696C6C5265637428302C302C722C72293B76617220653D6E657720496D6167652C6E3D412E746F4461746155524C28293B652E7372633D6E3B653D4E7228722C72';
wwv_flow_imp.g_varchar2_table(1350) := '2C302C302C65293B72657475726E20422E66696C6C5374796C653D22726564222C422E66696C6C5265637428302C302C722C72292C50722865292E7468656E2866756E6374696F6E2841297B422E64726177496D61676528412C302C30293B7661722065';
wwv_flow_imp.g_varchar2_table(1351) := '3D422E676574496D6167654461746128302C302C722C72292E646174613B422E66696C6C5374796C653D22726564222C422E66696C6C5265637428302C302C722C72293B413D742E637265617465456C656D656E74282264697622293B72657475726E20';
wwv_flow_imp.g_varchar2_table(1352) := '412E7374796C652E6261636B67726F756E64496D6167653D2275726C28222B6E2B2229222C412E7374796C652E6865696768743D223130307078222C4C722865293F5072284E7228722C722C302C302C4129293A50726F6D6973652E72656A6563742821';
wwv_flow_imp.g_varchar2_table(1353) := '31297D292E7468656E2866756E6374696F6E2841297B72657475726E20422E64726177496D61676528412C302C30292C4C7228422E676574496D6167654461746128302C302C722C72292E64617461297D292E63617463682866756E6374696F6E28297B';
wwv_flow_imp.g_varchar2_table(1354) := '72657475726E21317D297D28646F63756D656E74293A50726F6D6973652E7265736F6C7665282131293B72657475726E204F626A6563742E646566696E6550726F70657274792858722C22535550504F52545F464F524549474E4F424A4543545F445241';
wwv_flow_imp.g_varchar2_table(1355) := '57494E47222C7B76616C75653A417D292C417D2C67657420535550504F52545F434F52535F494D4147455328297B76617220413D766F69642030213D3D286E657720496D616765292E63726F73734F726967696E3B72657475726E204F626A6563742E64';
wwv_flow_imp.g_varchar2_table(1356) := '6566696E6550726F70657274792858722C22535550504F52545F434F52535F494D41474553222C7B76616C75653A417D292C417D2C67657420535550504F52545F524553504F4E53455F5459504528297B76617220413D22737472696E67223D3D747970';
wwv_flow_imp.g_varchar2_table(1357) := '656F66286E657720584D4C4874747052657175657374292E726573706F6E7365547970653B72657475726E204F626A6563742E646566696E6550726F70657274792858722C22535550504F52545F524553504F4E53455F54595045222C7B76616C75653A';
wwv_flow_imp.g_varchar2_table(1358) := '417D292C417D2C67657420535550504F52545F434F52535F58485228297B76617220413D227769746843726564656E7469616C7322696E206E657720584D4C48747470526571756573743B72657475726E204F626A6563742E646566696E6550726F7065';
wwv_flow_imp.g_varchar2_table(1359) := '7274792858722C22535550504F52545F434F52535F584852222C7B76616C75653A417D292C417D2C67657420535550504F52545F4E41544956455F544558545F5345474D454E544154494F4E28297B76617220413D212822756E646566696E6564223D3D';
wwv_flow_imp.g_varchar2_table(1360) := '747970656F6620496E746C7C7C21496E746C2E5365676D656E746572293B72657475726E204F626A6563742E646566696E6550726F70657274792858722C22535550504F52545F4E41544956455F544558545F5345474D454E544154494F4E222C7B7661';
wwv_flow_imp.g_varchar2_table(1361) := '6C75653A417D292C417D7D2C4A723D66756E6374696F6E28412C65297B746869732E746578743D412C746869732E626F756E64733D657D2C59723D66756E6374696F6E28412C65297B76617220743D652E6F776E6572446F63756D656E743B6966287429';
wwv_flow_imp.g_varchar2_table(1362) := '7B76617220723D742E637265617465456C656D656E74282268746D6C3263616E7661737772617070657222293B722E617070656E644368696C6428652E636C6F6E654E6F646528213029293B743D652E706172656E744E6F64653B69662874297B742E72';
wwv_flow_imp.g_varchar2_table(1363) := '65706C6163654368696C6428722C65293B413D6628412C72293B72657475726E20722E66697273744368696C642626742E7265706C6163654368696C6428722E66697273744368696C642C72292C417D7D72657475726E20642E454D5054597D2C57723D';
wwv_flow_imp.g_varchar2_table(1364) := '66756E6374696F6E28412C652C74297B76617220723D412E6F776E6572446F63756D656E743B6966282172297468726F77206E6577204572726F7228224E6F646520686173206E6F206F776E657220646F63756D656E7422293B723D722E637265617465';
wwv_flow_imp.g_varchar2_table(1365) := '52616E676528293B72657475726E20722E736574537461727428412C65292C722E736574456E6428412C652B74292C727D2C5A723D66756E6374696F6E2841297B69662858722E535550504F52545F4E41544956455F544558545F5345474D454E544154';
wwv_flow_imp.g_varchar2_table(1366) := '494F4E297B76617220653D6E657720496E746C2E5365676D656E74657228766F696420302C7B6772616E756C61726974793A226772617068656D65227D293B72657475726E2041727261792E66726F6D28652E7365676D656E74284129292E6D61702866';
wwv_flow_imp.g_varchar2_table(1367) := '756E6374696F6E2841297B72657475726E20412E7365676D656E747D297D72657475726E2066756E6374696F6E2841297B666F722876617220652C743D6D722841292C723D5B5D3B2128653D742E6E6578742829292E646F6E653B29652E76616C756526';
wwv_flow_imp.g_varchar2_table(1368) := '26722E7075736828652E76616C75652E736C6963652829293B72657475726E20727D2841297D2C5F723D66756E6374696F6E28412C65297B72657475726E2030213D3D652E6C657474657253706163696E673F5A722841293A66756E6374696F6E28412C';
wwv_flow_imp.g_varchar2_table(1369) := '65297B69662858722E535550504F52545F4E41544956455F544558545F5345474D454E544154494F4E297B76617220743D6E657720496E746C2E5365676D656E74657228766F696420302C7B6772616E756C61726974793A22776F7264227D293B726574';
wwv_flow_imp.g_varchar2_table(1370) := '75726E2041727261792E66726F6D28742E7365676D656E74284129292E6D61702866756E6374696F6E2841297B72657475726E20412E7365676D656E747D297D72657475726E206A7228412C65297D28412C65297D2C71723D5B33322C3136302C343936';
wwv_flow_imp.g_varchar2_table(1371) := '312C36353739322C36353739332C343135332C343234315D2C6A723D66756E6374696F6E28412C65297B666F722876617220742C723D774128412C7B6C696E65427265616B3A652E6C696E65427265616B2C776F7264427265616B3A22627265616B2D77';
wwv_flow_imp.g_varchar2_table(1372) := '6F7264223D3D3D652E6F766572666C6F77577261703F22627265616B2D776F7264223A652E776F7264427265616B7D292C423D5B5D3B2128743D722E6E6578742829292E646F6E653B292166756E6374696F6E28297B76617220412C653B742E76616C75';
wwv_flow_imp.g_varchar2_table(1373) := '65262628413D742E76616C75652E736C69636528292C413D512841292C653D22222C412E666F72456163682866756E6374696F6E2841297B2D313D3D3D71722E696E6465784F662841293F652B3D672841293A28652E6C656E6774682626422E70757368';
wwv_flow_imp.g_varchar2_table(1374) := '2865292C422E707573682867284129292C653D2222297D292C652E6C656E6774682626422E70757368286529297D28293B72657475726E20427D2C7A723D66756E6374696F6E28412C652C74297B76617220422C6E2C732C6F2C693B746869732E746578';
wwv_flow_imp.g_varchar2_table(1375) := '743D247228652E646174612C742E746578745472616E73666F726D292C746869732E74657874426F756E64733D28423D412C413D746869732E746578742C733D652C413D5F7228412C6E3D74292C6F3D5B5D2C693D302C412E666F72456163682866756E';
wwv_flow_imp.g_varchar2_table(1376) := '6374696F6E2841297B76617220652C742C723B6E2E746578744465636F726174696F6E4C696E652E6C656E6774687C7C303C412E7472696D28292E6C656E6774683F58722E535550504F52545F52414E47455F424F554E44533F313C28723D577228732C';
wwv_flow_imp.g_varchar2_table(1377) := '692C412E6C656E677468292E676574436C69656E7452656374732829292E6C656E6774683F28653D5A722841292C743D302C652E666F72456163682866756E6374696F6E2841297B6F2E70757368286E6577204A7228412C642E66726F6D444F4D526563';
wwv_flow_imp.g_varchar2_table(1378) := '744C69737428422C577228732C742B692C412E6C656E677468292E676574436C69656E74526563747328292929292C742B3D412E6C656E6774687D29293A6F2E70757368286E6577204A7228412C642E66726F6D444F4D526563744C69737428422C7229';
wwv_flow_imp.g_varchar2_table(1379) := '29293A28723D732E73706C69745465787428412E6C656E677468292C6F2E70757368286E6577204A7228412C597228422C732929292C733D72293A58722E535550504F52545F52414E47455F424F554E44537C7C28733D732E73706C6974546578742841';
wwv_flow_imp.g_varchar2_table(1380) := '2E6C656E67746829292C692B3D412E6C656E6774687D292C6F297D2C24723D66756E6374696F6E28412C65297B7377697463682865297B6361736520313A72657475726E20412E746F4C6F7765724361736528293B6361736520333A72657475726E2041';
wwv_flow_imp.g_varchar2_table(1381) := '2E7265706C6163652841422C6542293B6361736520323A72657475726E20412E746F55707065724361736528293B64656661756C743A72657475726E20417D7D2C41423D2F285E7C5C737C3A7C2D7C5C287C5C2929285B612D7A5D292F672C65423D6675';
wwv_flow_imp.g_varchar2_table(1382) := '6E6374696F6E28412C652C74297B72657475726E20303C412E6C656E6774683F652B742E746F55707065724361736528293A417D2C74423D28412872422C53723D7572292C7242293B66756E6374696F6E20724228412C65297B413D53722E63616C6C28';
wwv_flow_imp.g_varchar2_table(1383) := '746869732C412C65297C7C746869733B72657475726E20412E7372633D652E63757272656E745372637C7C652E7372632C412E696E7472696E73696357696474683D652E6E61747572616C57696474682C412E696E7472696E7369634865696768743D65';
wwv_flow_imp.g_varchar2_table(1384) := '2E6E61747572616C4865696768742C412E636F6E746578742E63616368652E616464496D61676528412E737263292C417D7661722042422C6E423D28412873422C42423D7572292C7342293B66756E6374696F6E20734228412C65297B413D42422E6361';
wwv_flow_imp.g_varchar2_table(1385) := '6C6C28746869732C412C65297C7C746869733B72657475726E20412E63616E7661733D652C412E696E7472696E73696357696474683D652E77696474682C412E696E7472696E7369634865696768743D652E6865696768742C417D766172206F422C6942';
wwv_flow_imp.g_varchar2_table(1386) := '3D28412851422C6F423D7572292C5142293B66756E6374696F6E20514228412C65297B76617220743D6F422E63616C6C28746869732C412C65297C7C746869732C723D6E657720584D4C53657269616C697A65722C413D6628412C65293B72657475726E';
wwv_flow_imp.g_varchar2_table(1387) := '20652E73657441747472696275746528227769647468222C412E77696474682B22707822292C652E7365744174747269627574652822686569676874222C412E6865696768742B22707822292C742E7376673D22646174613A696D6167652F7376672B78';
wwv_flow_imp.g_varchar2_table(1388) := '6D6C2C222B656E636F6465555249436F6D706F6E656E7428722E73657269616C697A65546F537472696E67286529292C742E696E7472696E73696357696474683D652E77696474682E6261736556616C2E76616C75652C742E696E7472696E7369634865';
wwv_flow_imp.g_varchar2_table(1389) := '696768743D652E6865696768742E6261736556616C2E76616C75652C742E636F6E746578742E63616368652E616464496D61676528742E737667292C747D7661722063422C61423D28412867422C63423D7572292C6742293B66756E6374696F6E206742';
wwv_flow_imp.g_varchar2_table(1390) := '28412C65297B413D63422E63616C6C28746869732C412C65297C7C746869733B72657475726E20412E76616C75653D652E76616C75652C417D7661722077422C55423D2841286C422C77423D7572292C6C42293B66756E6374696F6E206C4228412C6529';
wwv_flow_imp.g_varchar2_table(1391) := '7B413D77422E63616C6C28746869732C412C65297C7C746869733B72657475726E20412E73746172743D652E73746172742C412E72657665727365643D22626F6F6C65616E223D3D747970656F6620652E7265766572736564262621303D3D3D652E7265';
wwv_flow_imp.g_varchar2_table(1392) := '7665727365642C417D7661722043422C75423D5B7B747970653A31352C666C6167733A302C756E69743A227078222C6E756D6265723A337D5D2C46423D5B7B747970653A31362C666C6167733A302C6E756D6265723A35307D5D2C68423D22636865636B';
wwv_flow_imp.g_varchar2_table(1393) := '626F78222C64423D22726164696F222C66423D2270617373776F7264222C48423D3730373430363539312C70423D28412845422C43423D7572292C4542293B66756E6374696F6E20454228412C65297B76617220743D43422E63616C6C28746869732C41';
wwv_flow_imp.g_varchar2_table(1394) := '2C65297C7C746869733B73776974636828742E747970653D652E747970652E746F4C6F7765724361736528292C742E636865636B65643D652E636865636B65642C742E76616C75653D303D3D3D28653D28413D65292E747970653D3D3D66423F6E657720';
wwv_flow_imp.g_varchar2_table(1395) := '417272617928412E76616C75652E6C656E6774682B31292E6A6F696E2822E280A222293A412E76616C7565292E6C656E6774683F412E706C616365686F6C6465727C7C22223A652C742E74797065213D3D68422626742E74797065213D3D64427C7C2874';
wwv_flow_imp.g_varchar2_table(1396) := '2E7374796C65732E6261636B67726F756E64436F6C6F723D333733393134383033312C742E7374796C65732E626F72646572546F70436F6C6F723D742E7374796C65732E626F726465725269676874436F6C6F723D742E7374796C65732E626F72646572';
wwv_flow_imp.g_varchar2_table(1397) := '426F74746F6D436F6C6F723D742E7374796C65732E626F726465724C656674436F6C6F723D323737393039363537352C742E7374796C65732E626F72646572546F7057696474683D742E7374796C65732E626F72646572526967687457696474683D742E';
wwv_flow_imp.g_varchar2_table(1398) := '7374796C65732E626F72646572426F74746F6D57696474683D742E7374796C65732E626F726465724C65667457696474683D312C742E7374796C65732E626F72646572546F705374796C653D742E7374796C65732E626F7264657252696768745374796C';
wwv_flow_imp.g_varchar2_table(1399) := '653D742E7374796C65732E626F72646572426F74746F6D5374796C653D742E7374796C65732E626F726465724C6566745374796C653D312C742E7374796C65732E6261636B67726F756E64436C69703D5B305D2C742E7374796C65732E6261636B67726F';
wwv_flow_imp.g_varchar2_table(1400) := '756E644F726967696E3D5B305D2C742E626F756E64733D28653D742E626F756E6473292E77696474683E652E6865696768743F6E6577206428652E6C6566742B28652E77696474682D652E686569676874292F322C652E746F702C652E6865696768742C';
wwv_flow_imp.g_varchar2_table(1401) := '652E686569676874293A652E77696474683C652E6865696768743F6E6577206428652E6C6566742C652E746F702B28652E6865696768742D652E7769647468292F322C652E77696474682C652E7769647468293A65292C742E74797065297B6361736520';
wwv_flow_imp.g_varchar2_table(1402) := '68423A742E7374796C65732E626F72646572546F7052696768745261646975733D742E7374796C65732E626F72646572546F704C6566745261646975733D742E7374796C65732E626F72646572426F74746F6D52696768745261646975733D742E737479';
wwv_flow_imp.g_varchar2_table(1403) := '6C65732E626F72646572426F74746F6D4C6566745261646975733D75423B627265616B3B636173652064423A742E7374796C65732E626F72646572546F7052696768745261646975733D742E7374796C65732E626F72646572546F704C65667452616469';
wwv_flow_imp.g_varchar2_table(1404) := '75733D742E7374796C65732E626F72646572426F74746F6D52696768745261646975733D742E7374796C65732E626F72646572426F74746F6D4C6566745261646975733D46427D72657475726E20747D7661722049422C79423D2841284B422C49423D75';
wwv_flow_imp.g_varchar2_table(1405) := '72292C4B42293B66756E6374696F6E204B4228412C65297B413D49422E63616C6C28746869732C412C65297C7C746869732C653D652E6F7074696F6E735B652E73656C6563746564496E6465787C7C305D3B72657475726E20412E76616C75653D652626';
wwv_flow_imp.g_varchar2_table(1406) := '652E746578747C7C22222C417D766172206D422C4C423D28412862422C6D423D7572292C6242293B66756E6374696F6E20624228412C65297B413D6D422E63616C6C28746869732C412C65297C7C746869733B72657475726E20412E76616C75653D652E';
wwv_flow_imp.g_varchar2_table(1407) := '76616C75652C417D7661722044422C76423D28412878422C44423D7572292C7842293B66756E6374696F6E20784228412C65297B76617220742C722C423D44422E63616C6C28746869732C412C65297C7C746869733B422E7372633D652E7372632C422E';
wwv_flow_imp.g_varchar2_table(1408) := '77696474683D7061727365496E7428652E77696474682C3130297C7C302C422E6865696768743D7061727365496E7428652E6865696768742C3130297C7C302C422E6261636B67726F756E64436F6C6F723D422E7374796C65732E6261636B67726F756E';
wwv_flow_imp.g_varchar2_table(1409) := '64436F6C6F723B7472797B652E636F6E74656E7457696E646F772626652E636F6E74656E7457696E646F772E646F63756D656E742626652E636F6E74656E7457696E646F772E646F63756D656E742E646F63756D656E74456C656D656E74262628422E74';
wwv_flow_imp.g_varchar2_table(1410) := '7265653D6B4228412C652E636F6E74656E7457696E646F772E646F63756D656E742E646F63756D656E74456C656D656E74292C743D652E636F6E74656E7457696E646F772E646F63756D656E742E646F63756D656E74456C656D656E743F666528412C67';
wwv_flow_imp.g_varchar2_table(1411) := '6574436F6D70757465645374796C6528652E636F6E74656E7457696E646F772E646F63756D656E742E646F63756D656E74456C656D656E74292E6261636B67726F756E64436F6C6F72293A4C652E5452414E53504152454E542C723D652E636F6E74656E';
wwv_flow_imp.g_varchar2_table(1412) := '7457696E646F772E646F63756D656E742E626F64793F666528412C676574436F6D70757465645374796C6528652E636F6E74656E7457696E646F772E646F63756D656E742E626F6479292E6261636B67726F756E64436F6C6F72293A4C652E5452414E53';
wwv_flow_imp.g_varchar2_table(1413) := '504152454E542C422E6261636B67726F756E64436F6C6F723D6F652874293F6F652872293F422E7374796C65732E6261636B67726F756E64436F6C6F723A723A74297D63617463682841297B7D72657475726E20427D66756E6374696F6E204D42284129';
wwv_flow_imp.g_varchar2_table(1414) := '7B72657475726E22564944454F223D3D3D412E7461674E616D657D66756E6374696F6E2053422841297B72657475726E225354594C45223D3D3D412E7461674E616D657D66756E6374696F6E2054422841297B72657475726E20303C412E7461674E616D';
wwv_flow_imp.g_varchar2_table(1415) := '652E696E6465784F6628222D22297D7661722047423D5B224F4C222C22554C222C224D454E55225D2C4F423D66756E6374696F6E28652C412C742C72297B666F722876617220423D412E66697273744368696C643B423B423D73297B766172206E2C733D';
wwv_flow_imp.g_varchar2_table(1416) := '422E6E6578745369626C696E673B50422842292626303C422E646174612E7472696D28292E6C656E6774683F742E746578744E6F6465732E70757368286E6577207A7228652C422C742E7374796C657329293A5842284229262628726E2842292626422E';
wwv_flow_imp.g_varchar2_table(1417) := '61737369676E65644E6F6465733F422E61737369676E65644E6F64657328292E666F72456163682866756E6374696F6E2841297B72657475726E204F4228652C412C742C72297D293A286E3D564228652C4229292E7374796C65732E697356697369626C';
wwv_flow_imp.g_varchar2_table(1418) := '652829262628524228422C6E2C72293F6E2E666C6167737C3D343A4E42286E2E7374796C6573292626286E2E666C6167737C3D32292C2D31213D3D47422E696E6465784F6628422E7461674E616D65292626286E2E666C6167737C3D38292C742E656C65';
wwv_flow_imp.g_varchar2_table(1419) := '6D656E74732E70757368286E292C422E736C6F742C422E736861646F77526F6F743F4F4228652C422E736861646F77526F6F742C6E2C72293A656E2842297C7C71422842297C7C746E2842297C7C4F4228652C422C6E2C722929297D7D2C56423D66756E';
wwv_flow_imp.g_varchar2_table(1420) := '6374696F6E28412C65297B72657475726E206E65772824422865293F74423A7A422865293F6E423A71422865293F69423A57422865293F61423A5A422865293F55423A5F422865293F70423A746E2865293F79423A656E2865293F4C423A416E2865293F';
wwv_flow_imp.g_varchar2_table(1421) := '76423A75722928412C65297D2C6B423D66756E6374696F6E28412C65297B76617220743D564228412C65293B72657475726E20742E666C6167737C3D342C4F4228412C652C742C74292C747D2C52423D66756E6374696F6E28412C652C74297B72657475';
wwv_flow_imp.g_varchar2_table(1422) := '726E20652E7374796C65732E6973506F736974696F6E6564576974685A496E64657828297C7C652E7374796C65732E6F7061636974793C317C7C652E7374796C65732E69735472616E73666F726D656428297C7C6A422841292626742E7374796C65732E';
wwv_flow_imp.g_varchar2_table(1423) := '69735472616E73706172656E7428297D2C4E423D66756E6374696F6E2841297B72657475726E20412E6973506F736974696F6E656428297C7C412E6973466C6F6174696E6728297D2C50423D66756E6374696F6E2841297B72657475726E20412E6E6F64';
wwv_flow_imp.g_varchar2_table(1424) := '65547970653D3D3D4E6F64652E544558545F4E4F44457D2C58423D66756E6374696F6E2841297B72657475726E20412E6E6F6465547970653D3D3D4E6F64652E454C454D454E545F4E4F44457D2C4A423D66756E6374696F6E2841297B72657475726E20';
wwv_flow_imp.g_varchar2_table(1425) := '58422841292626766F69642030213D3D412E7374796C6526262159422841297D2C59423D66756E6374696F6E2841297B72657475726E226F626A656374223D3D747970656F6620412E636C6173734E616D657D2C57423D66756E6374696F6E2841297B72';
wwv_flow_imp.g_varchar2_table(1426) := '657475726E224C49223D3D3D412E7461674E616D657D2C5A423D66756E6374696F6E2841297B72657475726E224F4C223D3D3D412E7461674E616D657D2C5F423D66756E6374696F6E2841297B72657475726E22494E505554223D3D3D412E7461674E61';
wwv_flow_imp.g_varchar2_table(1427) := '6D657D2C71423D66756E6374696F6E2841297B72657475726E22737667223D3D3D412E7461674E616D657D2C6A423D66756E6374696F6E2841297B72657475726E22424F4459223D3D3D412E7461674E616D657D2C7A423D66756E6374696F6E2841297B';
wwv_flow_imp.g_varchar2_table(1428) := '72657475726E2243414E564153223D3D3D412E7461674E616D657D2C24423D66756E6374696F6E2841297B72657475726E22494D47223D3D3D412E7461674E616D657D2C416E3D66756E6374696F6E2841297B72657475726E22494652414D45223D3D3D';
wwv_flow_imp.g_varchar2_table(1429) := '412E7461674E616D657D2C656E3D66756E6374696F6E2841297B72657475726E225445585441524541223D3D3D412E7461674E616D657D2C746E3D66756E6374696F6E2841297B72657475726E2253454C454354223D3D3D412E7461674E616D657D2C72';
wwv_flow_imp.g_varchar2_table(1430) := '6E3D66756E6374696F6E2841297B72657475726E22534C4F54223D3D3D412E7461674E616D657D2C426E3D286E6E2E70726F746F747970652E676574436F756E74657256616C75653D66756E6374696F6E2841297B413D746869732E636F756E74657273';
wwv_flow_imp.g_varchar2_table(1431) := '5B415D3B72657475726E20412626412E6C656E6774683F415B412E6C656E6774682D315D3A317D2C6E6E2E70726F746F747970652E676574436F756E74657256616C7565733D66756E6374696F6E2841297B413D746869732E636F756E746572735B415D';
wwv_flow_imp.g_varchar2_table(1432) := '3B72657475726E20417C7C5B5D7D2C6E6E2E70726F746F747970652E706F703D66756E6374696F6E2841297B76617220653D746869733B412E666F72456163682866756E6374696F6E2841297B72657475726E20652E636F756E746572735B415D2E706F';
wwv_flow_imp.g_varchar2_table(1433) := '7028297D297D2C6E6E2E70726F746F747970652E70617273653D66756E6374696F6E2841297B76617220743D746869732C653D412E636F756E746572496E6372656D656E742C413D412E636F756E74657252657365742C723D21303B6E756C6C213D3D65';
wwv_flow_imp.g_varchar2_table(1434) := '2626652E666F72456163682866756E6374696F6E2841297B76617220653D742E636F756E746572735B412E636F756E7465725D3B65262630213D3D412E696E6372656D656E74262628723D21312C652E6C656E6774687C7C652E707573682831292C655B';
wwv_flow_imp.g_varchar2_table(1435) := '4D6174682E6D617828302C652E6C656E6774682D31295D2B3D412E696E6372656D656E74297D293B76617220423D5B5D3B72657475726E20722626412E666F72456163682866756E6374696F6E2841297B76617220653D742E636F756E746572735B412E';
wwv_flow_imp.g_varchar2_table(1436) := '636F756E7465725D3B422E7075736828412E636F756E746572292C28653D657C7C28742E636F756E746572735B412E636F756E7465725D3D5B5D29292E7075736828412E7265736574297D292C427D2C6E6E293B66756E6374696F6E206E6E28297B7468';
wwv_flow_imp.g_varchar2_table(1437) := '69732E636F756E746572733D7B7D7D66756E6374696F6E20736E28722C412C652C422C742C6E297B72657475726E20723C417C7C653C723F466E28722C742C303C6E2E6C656E677468293A422E696E7465676572732E7265647563652866756E6374696F';
wwv_flow_imp.g_varchar2_table(1438) := '6E28412C652C74297B666F72283B653C3D723B29722D3D652C412B3D422E76616C7565735B745D3B72657475726E20417D2C2222292B6E7D66756E6374696F6E206F6E28412C652C742C72297B666F722876617220423D22223B747C7C412D2D2C423D72';
wwv_flow_imp.g_varchar2_table(1439) := '2841292B422C653C3D28412F3D65292A653B293B72657475726E20427D66756E6374696F6E20516E28412C652C742C722C42297B766172206E3D742D652B313B72657475726E28413C303F222D223A2222292B286F6E284D6174682E6162732841292C6E';
wwv_flow_imp.g_varchar2_table(1440) := '2C722C66756E6374696F6E2841297B72657475726E2067284D6174682E666C6F6F722841256E292B65297D292B42297D66756E6374696F6E20636E28412C652C74297B766F696420303D3D3D74262628743D222E2022293B76617220723D652E6C656E67';
wwv_flow_imp.g_varchar2_table(1441) := '74683B72657475726E206F6E284D6174682E6162732841292C722C21312C66756E6374696F6E2841297B72657475726E20655B4D6174682E666C6F6F7228412572295D7D292B747D66756E6374696F6E20616E28412C652C742C722C422C6E297B696628';
wwv_flow_imp.g_varchar2_table(1442) := '413C2D393939397C7C393939393C412972657475726E20466E28412C342C303C422E6C656E677468293B76617220733D4D6174682E6162732841292C6F3D423B696628303D3D3D732972657475726E20655B305D2B6F3B666F722876617220693D303B30';
wwv_flow_imp.g_varchar2_table(1443) := '3C732626693C3D343B692B2B297B76617220513D732531303B303D3D5126265074286E2C312926262222213D3D6F3F6F3D655B515D2B6F3A313C517C7C313D3D512626303D3D3D697C7C313D3D512626313D3D3D6926265074286E2C32297C7C313D3D51';
wwv_flow_imp.g_varchar2_table(1444) := '2626313D3D3D6926265074286E2C342926263130303C417C7C313D3D512626313C6926265074286E2C38293F6F3D655B515D2B28303C693F745B692D315D3A2222292B6F3A313D3D512626303C692626286F3D745B692D315D2B6F292C733D4D6174682E';
wwv_flow_imp.g_varchar2_table(1445) := '666C6F6F7228732F3130297D72657475726E28413C303F723A2222292B6F7D76617220676E2C776E3D7B696E7465676572733A5B3165332C3930302C3530302C3430302C3130302C39302C35302C34302C31302C392C352C342C315D2C76616C7565733A';
wwv_flow_imp.g_varchar2_table(1446) := '5B224D222C22434D222C2244222C224344222C2243222C225843222C224C222C22584C222C2258222C224958222C2256222C224956222C2249225D7D2C556E3D7B696E7465676572733A5B3965332C3865332C3765332C3665332C3565332C3465332C33';
wwv_flow_imp.g_varchar2_table(1447) := '65332C3265332C3165332C3930302C3830302C3730302C3630302C3530302C3430302C3330302C3230302C3130302C39302C38302C37302C36302C35302C34302C33302C32302C31302C392C382C372C362C352C342C332C322C315D2C76616C7565733A';
wwv_flow_imp.g_varchar2_table(1448) := '5B22D594222C22D593222C22D592222C22D591222C22D590222C22D58F222C22D58E222C22D58D222C22D58C222C22D58B222C22D58A222C22D589222C22D588222C22D587222C22D586222C22D585222C22D584222C22D583222C22D582222C22D58122';
wwv_flow_imp.g_varchar2_table(1449) := '2C22D580222C22D4BF222C22D4BE222C22D4BD222C22D4BC222C22D4BB222C22D4BA222C22D4B9222C22D4B8222C22D4B7222C22D4B6222C22D4B5222C22D4B4222C22D4B3222C22D4B2222C22D4B1225D7D2C6C6E3D7B696E7465676572733A5B316534';
wwv_flow_imp.g_varchar2_table(1450) := '2C3965332C3865332C3765332C3665332C3565332C3465332C3365332C3265332C3165332C3430302C3330302C3230302C3130302C39302C38302C37302C36302C35302C34302C33302C32302C31392C31382C31372C31362C31352C31302C392C382C37';
wwv_flow_imp.g_varchar2_table(1451) := '2C362C352C342C332C322C315D2C76616C7565733A5B22D799D7B3222C22D798D7B3222C22D797D7B3222C22D796D7B3222C22D795D7B3222C22D794D7B3222C22D793D7B3222C22D792D7B3222C22D791D7B3222C22D790D7B3222C22D7AA222C22D7A9';
wwv_flow_imp.g_varchar2_table(1452) := '222C22D7A8222C22D7A7222C22D7A6222C22D7A4222C22D7A2222C22D7A1222C22D7A0222C22D79E222C22D79C222C22D79B222C22D799D798222C22D799D797222C22D799D796222C22D798D796222C22D798D795222C22D799222C22D798222C22D797';
wwv_flow_imp.g_varchar2_table(1453) := '222C22D796222C22D795222C22D794222C22D793222C22D792222C22D791222C22D790225D7D2C436E3D7B696E7465676572733A5B3165342C3965332C3865332C3765332C3665332C3565332C3465332C3365332C3265332C3165332C3930302C383030';
wwv_flow_imp.g_varchar2_table(1454) := '2C3730302C3630302C3530302C3430302C3330302C3230302C3130302C39302C38302C37302C36302C35302C34302C33302C32302C31302C392C382C372C362C352C342C332C322C315D2C76616C7565733A5B22E183B5222C22E183B0222C22E183AF22';
wwv_flow_imp.g_varchar2_table(1455) := '2C22E183B4222C22E183AE222C22E183AD222C22E183AC222C22E183AB222C22E183AA222C22E183A9222C22E183A8222C22E183A7222C22E183A6222C22E183A5222C22E183A4222C22E183B3222C22E183A2222C22E183A1222C22E183A0222C22E183';
wwv_flow_imp.g_varchar2_table(1456) := '9F222C22E1839E222C22E1839D222C22E183B2222C22E1839C222C22E1839B222C22E1839A222C22E18399222C22E18398222C22E18397222C22E183B1222C22E18396222C22E18395222C22E18394222C22E18393222C22E18392222C22E18391222C22';
wwv_flow_imp.g_varchar2_table(1457) := 'E18390225D7D2C756E3D22EBA788EC9DB4EB8488EC8AA4222C466E3D66756E6374696F6E28412C652C74297B76617220723D743F222E20223A22222C423D743F22E38081223A22222C6E3D743F222C20223A22222C733D743F2220223A22223B73776974';
wwv_flow_imp.g_varchar2_table(1458) := '63682865297B6361736520303A72657475726E22E280A2222B733B6361736520313A72657475726E22E297A6222B733B6361736520323A72657475726E22E297BE222B733B6361736520353A766172206F3D516E28412C34382C35372C21302C72293B72';
wwv_flow_imp.g_varchar2_table(1459) := '657475726E206F2E6C656E6774683C343F2230222B6F3A6F3B6361736520343A72657475726E20636E28412C22E38087E4B880E4BA8CE4B889E59B9BE4BA94E585ADE4B883E585ABE4B99D222C42293B6361736520363A72657475726E20736E28412C31';
wwv_flow_imp.g_varchar2_table(1460) := '2C333939392C776E2C332C72292E746F4C6F7765724361736528293B6361736520373A72657475726E20736E28412C312C333939392C776E2C332C72293B6361736520383A72657475726E20516E28412C3934352C3936392C21312C72293B6361736520';
wwv_flow_imp.g_varchar2_table(1461) := '393A72657475726E20516E28412C39372C3132322C21312C72293B636173652031303A72657475726E20516E28412C36352C39302C21312C72293B636173652031313A72657475726E20516E28412C313633322C313634312C21302C72293B6361736520';
wwv_flow_imp.g_varchar2_table(1462) := '31323A636173652034393A72657475726E20736E28412C312C393939392C556E2C332C72293B636173652033353A72657475726E20736E28412C312C393939392C556E2C332C72292E746F4C6F7765724361736528293B636173652031333A7265747572';
wwv_flow_imp.g_varchar2_table(1463) := '6E20516E28412C323533342C323534332C21302C72293B636173652031343A636173652033303A72657475726E20516E28412C363131322C363132312C21302C72293B636173652031353A72657475726E20636E28412C22E5AD90E4B891E5AF85E58DAF';
wwv_flow_imp.g_varchar2_table(1464) := 'E8BEB0E5B7B3E58D88E69CAAE794B3E98589E6888CE4BAA5222C42293B636173652031363A72657475726E20636E28412C22E794B2E4B999E4B899E4B881E6888AE5B7B1E5BA9AE8BE9BE5A3ACE799B8222C42293B636173652031373A63617365203438';
wwv_flow_imp.g_varchar2_table(1465) := '3A72657475726E20616E28412C22E99BB6E4B880E4BA8CE4B889E59B9BE4BA94E585ADE4B883E585ABE4B99D222C22E58D81E799BEE58D83E890AC222C22E8B2A0222C422C3134293B636173652034373A72657475726E20616E28412C22E99BB6E5A3B9';
wwv_flow_imp.g_varchar2_table(1466) := 'E8B2B3E58F83E88286E4BC8DE999B8E69F92E68D8CE78E96222C22E68BBEE4BDB0E4BB9FE890AC222C22E8B2A0222C422C3135293B636173652034323A72657475726E20616E28412C22E99BB6E4B880E4BA8CE4B889E59B9BE4BA94E585ADE4B883E585';
wwv_flow_imp.g_varchar2_table(1467) := 'ABE4B99D222C22E58D81E799BEE58D83E890AC222C22E8B49F222C422C3134293B636173652034313A72657475726E20616E28412C22E99BB6E5A3B9E8B4B0E58F81E88286E4BC8DE99986E69F92E68D8CE78E96222C22E68BBEE4BDB0E4BB9FE890AC22';
wwv_flow_imp.g_varchar2_table(1468) := '2C22E8B49F222C422C3135293B636173652032363A72657475726E20616E28412C22E38087E4B880E4BA8CE4B889E59B9BE4BA94E585ADE4B883E585ABE4B99D222C22E58D81E799BEE58D83E4B887222C22E3839EE382A4E3838AE382B9222C422C3029';
wwv_flow_imp.g_varchar2_table(1469) := '3B636173652032353A72657475726E20616E28412C22E99BB6E5A3B1E5BC90E58F82E59B9BE4BC8DE585ADE4B883E585ABE4B99D222C22E68BBEE799BEE58D83E4B887222C22E3839EE382A4E3838AE382B9222C422C37293B636173652033313A726574';
wwv_flow_imp.g_varchar2_table(1470) := '75726E20616E28412C22EC9881EC9DBCEC9DB4EC82BCEC82ACEC98A4EC9CA1ECB9A0ED8C94EAB5AC222C22EC8BADEBB0B1ECB29CEBA78C222C756E2C6E2C37293B636173652033333A72657475726E20616E28412C22E99BB6E4B880E4BA8CE4B889E59B';
wwv_flow_imp.g_varchar2_table(1471) := '9BE4BA94E585ADE4B883E585ABE4B99D222C22E58D81E799BEE58D83E890AC222C756E2C6E2C30293B636173652033323A72657475726E20616E28412C22E99BB6E5A3B9E8B2B3E58F83E59B9BE4BA94E585ADE4B883E585ABE4B99D222C22E68BBEE799';
wwv_flow_imp.g_varchar2_table(1472) := 'BEE58D83222C756E2C6E2C37293B636173652031383A72657475726E20516E28412C323430362C323431352C21302C72293B636173652032303A72657475726E20736E28412C312C31393939392C436E2C332C72293B636173652032313A72657475726E';
wwv_flow_imp.g_varchar2_table(1473) := '20516E28412C323739302C323739392C21302C72293B636173652032323A72657475726E20516E28412C323636322C323637312C21302C72293B636173652032323A72657475726E20736E28412C312C31303939392C6C6E2C332C72293B636173652032';
wwv_flow_imp.g_varchar2_table(1474) := '333A72657475726E20636E28412C22E38182E38184E38186E38188E3818AE3818BE3818DE3818FE38191E38193E38195E38197E38199E3819BE3819DE3819FE381A1E381A4E381A6E381A8E381AAE381ABE381ACE381ADE381AEE381AFE381B2E381B5E3';
wwv_flow_imp.g_varchar2_table(1475) := '81B8E381BBE381BEE381BFE38280E38281E38282E38284E38286E38288E38289E3828AE3828BE3828CE3828DE3828FE38290E38291E38292E3829322293B636173652032343A72657475726E20636E28412C22E38184E3828DE381AFE381ABE381BBE381';
wwv_flow_imp.g_varchar2_table(1476) := 'B8E381A8E381A1E3828AE381ACE3828BE38292E3828FE3818BE38288E3819FE3828CE3819DE381A4E381ADE381AAE38289E38280E38186E38290E381AEE3818AE3818FE38284E381BEE38191E381B5E38193E38188E381A6E38182E38195E3818DE38286';
wwv_flow_imp.g_varchar2_table(1477) := 'E38281E381BFE38197E38291E381B2E38282E3819BE3819922293B636173652032373A72657475726E20516E28412C333330322C333331312C21302C72293B636173652032383A72657475726E20636E28412C22E382A2E382A4E382A6E382A8E382AAE3';
wwv_flow_imp.g_varchar2_table(1478) := '82ABE382ADE382AFE382B1E382B3E382B5E382B7E382B9E382BBE382BDE382BFE38381E38384E38386E38388E3838AE3838BE3838CE3838DE3838EE3838FE38392E38395E38398E3839BE3839EE3839FE383A0E383A1E383A2E383A4E383A6E383A8E383';
wwv_flow_imp.g_varchar2_table(1479) := 'A9E383AAE383ABE383ACE383ADE383AFE383B0E383B1E383B2E383B3222C42293B636173652032393A72657475726E20636E28412C22E382A4E383ADE3838FE3838BE3839BE38398E38388E38381E383AAE3838CE383ABE383B2E383AFE382ABE383A8E3';
wwv_flow_imp.g_varchar2_table(1480) := '82BFE383ACE382BDE38384E3838DE3838AE383A9E383A0E382A6E383B0E3838EE382AAE382AFE383A4E3839EE382B1E38395E382B3E382A8E38386E382A2E382B5E382ADE383A6E383A1E3839FE382B7E383B1E38392E383A2E382BBE382B9222C42293B';
wwv_flow_imp.g_varchar2_table(1481) := '636173652033343A72657475726E20516E28412C333739322C333830312C21302C72293B636173652033373A72657475726E20516E28412C363136302C363136392C21302C72293B636173652033383A72657475726E20516E28412C343136302C343136';
wwv_flow_imp.g_varchar2_table(1482) := '392C21302C72293B636173652033393A72657475726E20516E28412C323931382C323932372C21302C72293B636173652034303A72657475726E20516E28412C313737362C313738352C21302C72293B636173652034333A72657475726E20516E28412C';
wwv_flow_imp.g_varchar2_table(1483) := '333034362C333035352C21302C72293B636173652034343A72657475726E20516E28412C333137342C333138332C21302C72293B636173652034353A72657475726E20516E28412C333636342C333637332C21302C72293B636173652034363A72657475';
wwv_flow_imp.g_varchar2_table(1484) := '726E20516E28412C333837322C333838312C21302C72293B64656661756C743A72657475726E20516E28412C34382C35372C21302C72297D7D2C686E3D22646174612D68746D6C3263616E7661732D69676E6F7265222C646E3D28666E2E70726F746F74';
wwv_flow_imp.g_varchar2_table(1485) := '7970652E746F494672616D653D66756E6374696F6E28412C72297B76617220653D746869732C423D706E28412C72293B69662821422E636F6E74656E7457696E646F772972657475726E2050726F6D6973652E72656A6563742822556E61626C6520746F';
wwv_flow_imp.g_varchar2_table(1486) := '2066696E6420696672616D652077696E646F7722293B76617220743D412E64656661756C74566965772E70616765584F66667365742C6E3D412E64656661756C74566965772E70616765594F66667365742C733D422E636F6E74656E7457696E646F772C';
wwv_flow_imp.g_varchar2_table(1487) := '6F3D732E646F63756D656E742C413D496E2842292E7468656E2866756E6374696F6E28297B72657475726E206128652C766F696420302C766F696420302C66756E6374696F6E28297B76617220652C743B72657475726E204828746869732C66756E6374';
wwv_flow_imp.g_varchar2_table(1488) := '696F6E2841297B73776974636828412E6C6162656C297B6361736520303A72657475726E20746869732E7363726F6C6C6564456C656D656E74732E666F724561636828626E292C73262628732E7363726F6C6C546F28722E6C6566742C722E746F70292C';
wwv_flow_imp.g_varchar2_table(1489) := '212F28695061647C6950686F6E657C69506F64292F672E74657374286E6176696761746F722E757365724167656E74297C7C732E7363726F6C6C593D3D3D722E746F702626732E7363726F6C6C583D3D3D722E6C6566747C7C28746869732E636F6E7465';
wwv_flow_imp.g_varchar2_table(1490) := '78742E6C6F676765722E7761726E2822556E61626C6520746F20726573746F7265207363726F6C6C20706F736974696F6E20666F7220636C6F6E656420646F63756D656E7422292C746869732E636F6E746578742E77696E646F77426F756E64733D7468';
wwv_flow_imp.g_varchar2_table(1491) := '69732E636F6E746578742E77696E646F77426F756E64732E61646428732E7363726F6C6C582D722E6C6566742C732E7363726F6C6C592D722E746F702C302C302929292C653D746869732E6F7074696F6E732E6F6E636C6F6E652C766F696420303D3D3D';
wwv_flow_imp.g_varchar2_table(1492) := '28743D746869732E636C6F6E65645265666572656E6365456C656D656E74293F5B322C50726F6D6973652E72656A65637428224572726F722066696E64696E672074686520222B746869732E7265666572656E6365456C656D656E742E6E6F64654E616D';
wwv_flow_imp.g_varchar2_table(1493) := '652B2220696E2074686520636C6F6E656420646F63756D656E7422295D3A6F2E666F6E747326266F2E666F6E74732E72656164793F5B342C6F2E666F6E74732E72656164795D3A5B332C325D3B6361736520313A412E73656E7428292C412E6C6162656C';
wwv_flow_imp.g_varchar2_table(1494) := '3D323B6361736520323A72657475726E2F284170706C655765624B6974292F672E74657374286E6176696761746F722E757365724167656E74293F5B342C456E286F295D3A5B332C345D3B6361736520333A412E73656E7428292C412E6C6162656C3D34';
wwv_flow_imp.g_varchar2_table(1495) := '3B6361736520343A72657475726E2266756E6374696F6E223D3D747970656F6620653F5B322C50726F6D6973652E7265736F6C766528292E7468656E2866756E6374696F6E28297B72657475726E2065286F2C74297D292E7468656E2866756E6374696F';
wwv_flow_imp.g_varchar2_table(1496) := '6E28297B72657475726E20427D295D3A5B322C425D7D7D297D297D293B72657475726E206F2E6F70656E28292C6F2E7772697465286D6E28646F63756D656E742E646F6374797065292B223C68746D6C3E3C2F68746D6C3E22292C4C6E28746869732E72';
wwv_flow_imp.g_varchar2_table(1497) := '65666572656E6365456C656D656E742E6F776E6572446F63756D656E742C742C6E292C6F2E7265706C6163654368696C64286F2E61646F70744E6F646528746869732E646F63756D656E74456C656D656E74292C6F2E646F63756D656E74456C656D656E';
wwv_flow_imp.g_varchar2_table(1498) := '74292C6F2E636C6F736528292C417D2C666E2E70726F746F747970652E637265617465456C656D656E74436C6F6E653D66756E6374696F6E2841297B696628437228412C32292C7A422841292972657475726E20746869732E63726561746543616E7661';
wwv_flow_imp.g_varchar2_table(1499) := '73436C6F6E652841293B6966284D422841292972657475726E20746869732E637265617465566964656F436C6F6E652841293B69662853422841292972657475726E20746869732E6372656174655374796C65436C6F6E652841293B76617220653D412E';
wwv_flow_imp.g_varchar2_table(1500) := '636C6F6E654E6F6465282131293B72657475726E20244228652926262824422841292626412E63757272656E745372632626412E63757272656E74537263213D3D412E737263262628652E7372633D412E63757272656E745372632C652E737263736574';
end;
/
begin
wwv_flow_imp.g_varchar2_table(1501) := '3D2222292C226C617A79223D3D3D652E6C6F6164696E67262628652E6C6F6164696E673D2265616765722229292C54422865293F746869732E637265617465437573746F6D456C656D656E74436C6F6E652865293A657D2C666E2E70726F746F74797065';
wwv_flow_imp.g_varchar2_table(1502) := '2E637265617465437573746F6D456C656D656E74436C6F6E653D66756E6374696F6E2841297B76617220653D646F63756D656E742E637265617465456C656D656E74282268746D6C3263616E766173637573746F6D656C656D656E7422293B7265747572';
wwv_flow_imp.g_varchar2_table(1503) := '6E204B6E28412E7374796C652C65292C657D2C666E2E70726F746F747970652E6372656174655374796C65436C6F6E653D66756E6374696F6E2841297B7472797B76617220653D412E73686565743B696628652626652E63737352756C6573297B766172';
wwv_flow_imp.g_varchar2_table(1504) := '20743D5B5D2E736C6963652E63616C6C28652E63737352756C65732C30292E7265647563652866756E6374696F6E28412C65297B72657475726E2065262622737472696E67223D3D747970656F6620652E637373546578743F412B652E63737354657874';
wwv_flow_imp.g_varchar2_table(1505) := '3A417D2C2222292C723D412E636C6F6E654E6F6465282131293B72657475726E20722E74657874436F6E74656E743D742C727D7D63617463682841297B696628746869732E636F6E746578742E6C6F676765722E6572726F722822556E61626C6520746F';
wwv_flow_imp.g_varchar2_table(1506) := '206163636573732063737352756C65732070726F7065727479222C41292C2253656375726974794572726F7222213D3D412E6E616D65297468726F7720417D72657475726E20412E636C6F6E654E6F6465282131297D2C666E2E70726F746F747970652E';
wwv_flow_imp.g_varchar2_table(1507) := '63726561746543616E766173436C6F6E653D66756E6374696F6E2865297B76617220413B696628746869732E6F7074696F6E732E696E6C696E65496D616765732626652E6F776E6572446F63756D656E74297B76617220743D652E6F776E6572446F6375';
wwv_flow_imp.g_varchar2_table(1508) := '6D656E742E637265617465456C656D656E742822696D6722293B7472797B72657475726E20742E7372633D652E746F4461746155524C28292C747D63617463682841297B746869732E636F6E746578742E6C6F676765722E696E666F2822556E61626C65';
wwv_flow_imp.g_varchar2_table(1509) := '20746F20696E6C696E652063616E76617320636F6E74656E74732C2063616E766173206973207461696E746564222C65297D7D743D652E636C6F6E654E6F6465282131293B7472797B742E77696474683D652E77696474682C742E6865696768743D652E';
wwv_flow_imp.g_varchar2_table(1510) := '6865696768743B76617220722C422C6E3D652E676574436F6E746578742822326422292C733D742E676574436F6E746578742822326422293B72657475726E207326262821746869732E6F7074696F6E732E616C6C6F775461696E7426266E3F732E7075';
wwv_flow_imp.g_varchar2_table(1511) := '74496D61676544617461286E2E676574496D6167654461746128302C302C652E77696474682C652E686569676874292C302C30293A282128723D6E756C6C213D3D28413D652E676574436F6E746578742822776562676C322229292626766F6964203021';
wwv_flow_imp.g_varchar2_table(1512) := '3D3D413F413A652E676574436F6E746578742822776562676C2229297C7C21313D3D3D286E756C6C3D3D28423D722E676574436F6E74657874417474726962757465732829293F766F696420303A422E707265736572766544726177696E674275666665';
wwv_flow_imp.g_varchar2_table(1513) := '72292626746869732E636F6E746578742E6C6F676765722E7761726E2822556E61626C6520746F20636C6F6E6520576562474C20636F6E746578742061732069742068617320707265736572766544726177696E674275666665723D66616C7365222C65';
wwv_flow_imp.g_varchar2_table(1514) := '292C732E64726177496D61676528652C302C302929292C747D63617463682841297B746869732E636F6E746578742E6C6F676765722E696E666F2822556E61626C6520746F20636C6F6E652063616E766173206173206974206973207461696E74656422';
wwv_flow_imp.g_varchar2_table(1515) := '2C65297D72657475726E20747D2C666E2E70726F746F747970652E637265617465566964656F436C6F6E653D66756E6374696F6E2865297B76617220413D652E6F776E6572446F63756D656E742E637265617465456C656D656E74282263616E76617322';
wwv_flow_imp.g_varchar2_table(1516) := '293B412E77696474683D652E6F666673657457696474682C412E6865696768743D652E6F66667365744865696768743B76617220743D412E676574436F6E746578742822326422293B7472797B72657475726E2074262628742E64726177496D61676528';
wwv_flow_imp.g_varchar2_table(1517) := '652C302C302C412E77696474682C412E686569676874292C746869732E6F7074696F6E732E616C6C6F775461696E747C7C742E676574496D6167654461746128302C302C412E77696474682C412E68656967687429292C417D63617463682841297B7468';
wwv_flow_imp.g_varchar2_table(1518) := '69732E636F6E746578742E6C6F676765722E696E666F2822556E61626C6520746F20636C6F6E6520766964656F206173206974206973207461696E746564222C65297D413D652E6F776E6572446F63756D656E742E637265617465456C656D656E742822';
wwv_flow_imp.g_varchar2_table(1519) := '63616E76617322293B72657475726E20412E77696474683D652E6F666673657457696474682C412E6865696768743D652E6F66667365744865696768742C417D2C666E2E70726F746F747970652E617070656E644368696C644E6F64653D66756E637469';
wwv_flow_imp.g_varchar2_table(1520) := '6F6E28412C652C74297B584228652926262822534352495054223D3D3D652E7461674E616D657C7C652E68617341747472696275746528686E297C7C2266756E6374696F6E223D3D747970656F6620746869732E6F7074696F6E732E69676E6F7265456C';
wwv_flow_imp.g_varchar2_table(1521) := '656D656E74732626746869732E6F7074696F6E732E69676E6F7265456C656D656E7473286529297C7C746869732E6F7074696F6E732E636F70795374796C657326265842286529262653422865297C7C412E617070656E644368696C6428746869732E63';
wwv_flow_imp.g_varchar2_table(1522) := '6C6F6E654E6F646528652C7429297D2C666E2E70726F746F747970652E636C6F6E654368696C644E6F6465733D66756E6374696F6E28412C652C74297B666F722876617220722C423D746869732C6E3D28412E736861646F77526F6F747C7C41292E6669';
wwv_flow_imp.g_varchar2_table(1523) := '7273744368696C643B6E3B6E3D6E2E6E6578745369626C696E67295842286E292626726E286E2926262266756E6374696F6E223D3D747970656F66206E2E61737369676E65644E6F6465733F28723D6E2E61737369676E65644E6F6465732829292E6C65';
wwv_flow_imp.g_varchar2_table(1524) := '6E6774682626722E666F72456163682866756E6374696F6E2841297B72657475726E20422E617070656E644368696C644E6F646528652C412C74297D293A746869732E617070656E644368696C644E6F646528652C6E2C74297D2C666E2E70726F746F74';
wwv_flow_imp.g_varchar2_table(1525) := '7970652E636C6F6E654E6F64653D66756E6374696F6E28412C65297B69662850422841292972657475726E20646F63756D656E742E637265617465546578744E6F646528412E64617461293B69662821412E6F776E6572446F63756D656E742972657475';
wwv_flow_imp.g_varchar2_table(1526) := '726E20412E636C6F6E654E6F6465282131293B76617220743D412E6F776E6572446F63756D656E742E64656661756C74566965773B69662874262658422841292626284A422841297C7C594228412929297B76617220723D746869732E63726561746545';
wwv_flow_imp.g_varchar2_table(1527) := '6C656D656E74436C6F6E652841293B722E7374796C652E7472616E736974696F6E50726F70657274793D226E6F6E65223B76617220423D742E676574436F6D70757465645374796C652841292C6E3D742E676574436F6D70757465645374796C6528412C';
wwv_flow_imp.g_varchar2_table(1528) := '223A6265666F726522292C733D742E676574436F6D70757465645374796C6528412C223A616674657222293B746869732E7265666572656E6365456C656D656E743D3D3D4126264A42287229262628746869732E636C6F6E65645265666572656E636545';
wwv_flow_imp.g_varchar2_table(1529) := '6C656D656E743D72292C6A4228722926264D6E2872293B743D746869732E636F756E746572732E7061727365286E657720557228746869732E636F6E746578742C4229292C6E3D746869732E7265736F6C766550736575646F436F6E74656E7428412C72';
wwv_flow_imp.g_varchar2_table(1530) := '2C6E2C676E2E4245464F5245293B5442284129262628653D2130292C4D422841297C7C746869732E636C6F6E654368696C644E6F64657328412C722C65292C6E2626722E696E736572744265666F7265286E2C722E66697273744368696C64293B733D74';
wwv_flow_imp.g_varchar2_table(1531) := '6869732E7265736F6C766550736575646F436F6E74656E7428412C722C732C676E2E4146544552293B72657475726E20732626722E617070656E644368696C642873292C746869732E636F756E746572732E706F702874292C2842262628746869732E6F';
wwv_flow_imp.g_varchar2_table(1532) := '7074696F6E732E636F70795374796C65737C7C594228412929262621416E2841297C7C652926264B6E28422C72292C303D3D3D412E7363726F6C6C546F702626303D3D3D412E7363726F6C6C4C6566747C7C746869732E7363726F6C6C6564456C656D65';
wwv_flow_imp.g_varchar2_table(1533) := '6E74732E70757368285B722C412E7363726F6C6C4C6566742C412E7363726F6C6C546F705D292C28656E2841297C7C746E28412929262628656E2872297C7C746E28722929262628722E76616C75653D412E76616C7565292C727D72657475726E20412E';
wwv_flow_imp.g_varchar2_table(1534) := '636C6F6E654E6F6465282131297D2C666E2E70726F746F747970652E7265736F6C766550736575646F436F6E74656E743D66756E6374696F6E286F2C412C652C74297B76617220693D746869733B69662865297B76617220723D652E636F6E74656E742C';
wwv_flow_imp.g_varchar2_table(1535) := '513D412E6F776E6572446F63756D656E743B696628512626722626226E6F6E6522213D3D722626222D6D6F7A2D616C742D636F6E74656E7422213D3D722626226E6F6E6522213D3D652E646973706C6179297B746869732E636F756E746572732E706172';
wwv_flow_imp.g_varchar2_table(1536) := '7365286E657720557228746869732E636F6E746578742C6529293B76617220633D6E657720777228746869732E636F6E746578742C65292C613D512E637265617465456C656D656E74282268746D6C3263616E76617370736575646F656C656D656E7422';
wwv_flow_imp.g_varchar2_table(1537) := '293B4B6E28652C61292C632E636F6E74656E742E666F72456163682866756E6374696F6E2841297B696628303D3D3D412E7479706529612E617070656E644368696C6428512E637265617465546578744E6F646528412E76616C756529293B656C736520';
wwv_flow_imp.g_varchar2_table(1538) := '69662832323D3D3D412E74797065297B76617220653D512E637265617465456C656D656E742822696D6722293B652E7372633D412E76616C75652C652E7374796C652E6F7061636974793D2231222C612E617070656E644368696C642865297D656C7365';
wwv_flow_imp.g_varchar2_table(1539) := '2069662831383D3D3D412E74797065297B76617220742C722C422C6E2C733B2261747472223D3D3D412E6E616D653F28653D412E76616C7565732E66696C746572285F4129292E6C656E6774682626612E617070656E644368696C6428512E6372656174';
wwv_flow_imp.g_varchar2_table(1540) := '65546578744E6F6465286F2E67657441747472696275746528655B305D2E76616C7565297C7C222229293A22636F756E746572223D3D3D412E6E616D653F28423D28723D412E76616C7565732E66696C74657228244129295B305D2C723D725B315D2C42';
wwv_flow_imp.g_varchar2_table(1541) := '26265F41284229262628743D692E636F756E746572732E676574436F756E74657256616C756528422E76616C7565292C733D7226265F412872293F70742E706172736528692E636F6E746578742C722E76616C7565293A332C612E617070656E64436869';
wwv_flow_imp.g_varchar2_table(1542) := '6C6428512E637265617465546578744E6F646528466E28742C732C213129292929293A22636F756E74657273223D3D3D412E6E616D65262628423D28743D412E76616C7565732E66696C74657228244129295B305D2C733D745B315D2C723D745B325D2C';
wwv_flow_imp.g_varchar2_table(1543) := '4226265F41284229262628423D692E636F756E746572732E676574436F756E74657256616C75657328422E76616C7565292C6E3D7226265F412872293F70742E706172736528692E636F6E746578742C722E76616C7565293A332C733D732626303D3D3D';
wwv_flow_imp.g_varchar2_table(1544) := '732E747970653F732E76616C75653A22222C733D422E6D61702866756E6374696F6E2841297B72657475726E20466E28412C6E2C2131297D292E6A6F696E2873292C612E617070656E644368696C6428512E637265617465546578744E6F646528732929';
wwv_flow_imp.g_varchar2_table(1545) := '29297D656C73652069662832303D3D3D412E747970652973776974636828412E76616C7565297B63617365226F70656E2D71756F7465223A612E617070656E644368696C6428512E637265617465546578744E6F646528587428632E71756F7465732C69';
wwv_flow_imp.g_varchar2_table(1546) := '2E71756F746544657074682B2B2C21302929293B627265616B3B6361736522636C6F73652D71756F7465223A612E617070656E644368696C6428512E637265617465546578744E6F646528587428632E71756F7465732C2D2D692E71756F746544657074';
wwv_flow_imp.g_varchar2_table(1547) := '682C21312929293B627265616B3B64656661756C743A612E617070656E644368696C6428512E637265617465546578744E6F646528412E76616C756529297D7D292C612E636C6173734E616D653D446E2B2220222B766E3B743D743D3D3D676E2E424546';
wwv_flow_imp.g_varchar2_table(1548) := '4F52453F2220222B446E3A2220222B766E3B72657475726E2059422841293F412E636C6173734E616D652E6261736556616C75652B3D743A412E636C6173734E616D652B3D742C617D7D7D2C666E2E64657374726F793D66756E6374696F6E2841297B72';
wwv_flow_imp.g_varchar2_table(1549) := '657475726E2121412E706172656E744E6F6465262628412E706172656E744E6F64652E72656D6F76654368696C642841292C2130297D2C666E293B66756E6374696F6E20666E28412C652C74297B696628746869732E636F6E746578743D412C74686973';
wwv_flow_imp.g_varchar2_table(1550) := '2E6F7074696F6E733D742C746869732E7363726F6C6C6564456C656D656E74733D5B5D2C746869732E7265666572656E6365456C656D656E743D652C746869732E636F756E746572733D6E657720426E2C746869732E71756F746544657074683D302C21';
wwv_flow_imp.g_varchar2_table(1551) := '652E6F776E6572446F63756D656E74297468726F77206E6577204572726F722822436C6F6E656420656C656D656E7420646F6573206E6F74206861766520616E206F776E657220646F63756D656E7422293B746869732E646F63756D656E74456C656D65';
wwv_flow_imp.g_varchar2_table(1552) := '6E743D746869732E636C6F6E654E6F646528652E6F776E6572446F63756D656E742E646F63756D656E74456C656D656E742C2131297D2868653D676E3D676E7C7C7B7D295B68652E4245464F52453D305D3D224245464F5245222C68655B68652E414654';
wwv_flow_imp.g_varchar2_table(1553) := '45523D315D3D224146544552223B66756E6374696F6E20486E2865297B72657475726E206E65772050726F6D6973652866756E6374696F6E2841297B21652E636F6D706C6574652626652E7372633F28652E6F6E6C6F61643D412C652E6F6E6572726F72';
wwv_flow_imp.g_varchar2_table(1554) := '3D41293A4128297D297D76617220706E3D66756E6374696F6E28412C65297B76617220743D412E637265617465456C656D656E742822696672616D6522293B72657475726E20742E636C6173734E616D653D2268746D6C3263616E7661732D636F6E7461';
wwv_flow_imp.g_varchar2_table(1555) := '696E6572222C742E7374796C652E7669736962696C6974793D2268696464656E222C742E7374796C652E706F736974696F6E3D226669786564222C742E7374796C652E6C6566743D222D31303030307078222C742E7374796C652E746F703D2230707822';
wwv_flow_imp.g_varchar2_table(1556) := '2C742E7374796C652E626F726465723D2230222C742E77696474683D652E77696474682E746F537472696E6728292C742E6865696768743D652E6865696768742E746F537472696E6728292C742E7363726F6C6C696E673D226E6F222C742E7365744174';
wwv_flow_imp.g_varchar2_table(1557) := '7472696275746528686E2C227472756522292C412E626F64792E617070656E644368696C642874292C747D2C456E3D66756E6374696F6E2841297B72657475726E2050726F6D6973652E616C6C285B5D2E736C6963652E63616C6C28412E696D61676573';
wwv_flow_imp.g_varchar2_table(1558) := '2C30292E6D617028486E29297D2C496E3D66756E6374696F6E2842297B72657475726E206E65772050726F6D6973652866756E6374696F6E28652C41297B76617220743D422E636F6E74656E7457696E646F773B69662821742972657475726E20412822';
wwv_flow_imp.g_varchar2_table(1559) := '4E6F2077696E646F772061737369676E656420666F7220696672616D6522293B76617220723D742E646F63756D656E743B742E6F6E6C6F61643D422E6F6E6C6F61643D66756E6374696F6E28297B742E6F6E6C6F61643D422E6F6E6C6F61643D6E756C6C';
wwv_flow_imp.g_varchar2_table(1560) := '3B76617220413D736574496E74657276616C2866756E6374696F6E28297B303C722E626F64792E6368696C644E6F6465732E6C656E677468262622636F6D706C657465223D3D3D722E72656164795374617465262628636C656172496E74657276616C28';
wwv_flow_imp.g_varchar2_table(1561) := '41292C65284229297D2C3530297D7D297D2C796E3D5B22616C6C222C2264222C22636F6E74656E74225D2C4B6E3D66756E6374696F6E28412C65297B666F722876617220743D412E6C656E6774682D313B303C3D743B742D2D297B76617220723D412E69';
wwv_flow_imp.g_varchar2_table(1562) := '74656D2874293B2D313D3D3D796E2E696E6465784F662872292626652E7374796C652E73657450726F706572747928722C412E67657450726F706572747956616C7565287229297D72657475726E20657D2C6D6E3D66756E6374696F6E2841297B766172';
wwv_flow_imp.g_varchar2_table(1563) := '20653D22223B72657475726E2041262628652B3D223C21444F435459504520222C412E6E616D65262628652B3D412E6E616D65292C412E696E7465726E616C537562736574262628652B3D412E696E7465726E616C537562736574292C412E7075626C69';
wwv_flow_imp.g_varchar2_table(1564) := '634964262628652B3D2722272B412E7075626C696349642B272227292C412E73797374656D4964262628652B3D2722272B412E73797374656D49642B272227292C652B3D223E22292C657D2C4C6E3D66756E6374696F6E28412C652C74297B412626412E';
wwv_flow_imp.g_varchar2_table(1565) := '64656661756C745669657726262865213D3D412E64656661756C74566965772E70616765584F66667365747C7C74213D3D412E64656661756C74566965772E70616765594F6666736574292626412E64656661756C74566965772E7363726F6C6C546F28';
wwv_flow_imp.g_varchar2_table(1566) := '652C74297D2C626E3D66756E6374696F6E2841297B76617220653D415B305D2C743D415B315D2C413D415B325D3B652E7363726F6C6C4C6566743D742C652E7363726F6C6C546F703D417D2C446E3D225F5F5F68746D6C3263616E7661735F5F5F707365';
wwv_flow_imp.g_varchar2_table(1567) := '75646F656C656D656E745F6265666F7265222C766E3D225F5F5F68746D6C3263616E7661735F5F5F70736575646F656C656D656E745F6166746572222C786E3D277B5C6E20202020636F6E74656E743A2022222021696D706F7274616E743B5C6E202020';
wwv_flow_imp.g_varchar2_table(1568) := '20646973706C61793A206E6F6E652021696D706F7274616E743B5C6E7D272C4D6E3D66756E6374696F6E2841297B536E28412C222E222B446E2B223A6265666F7265222B786E2B225C6E2020202020202020202E222B766E2B223A6166746572222B786E';
wwv_flow_imp.g_varchar2_table(1569) := '297D2C536E3D66756E6374696F6E28412C65297B76617220743D412E6F776E6572446F63756D656E743B7426262828743D742E637265617465456C656D656E7428227374796C652229292E74657874436F6E74656E743D652C412E617070656E64436869';
wwv_flow_imp.g_varchar2_table(1570) := '6C64287429297D2C546E3D28476E2E6765744F726967696E3D66756E6374696F6E2841297B76617220653D476E2E5F6C696E6B3B72657475726E20653F28652E687265663D412C652E687265663D652E687265662C652E70726F746F636F6C2B652E686F';
wwv_flow_imp.g_varchar2_table(1571) := '73746E616D652B652E706F7274293A2261626F75743A626C616E6B227D2C476E2E697353616D654F726967696E3D66756E6374696F6E2841297B72657475726E20476E2E6765744F726967696E2841293D3D3D476E2E5F6F726967696E7D2C476E2E7365';
wwv_flow_imp.g_varchar2_table(1572) := '74436F6E746578743D66756E6374696F6E2841297B476E2E5F6C696E6B3D412E646F63756D656E742E637265617465456C656D656E7428226122292C476E2E5F6F726967696E3D476E2E6765744F726967696E28412E6C6F636174696F6E2E6872656629';
wwv_flow_imp.g_varchar2_table(1573) := '7D2C476E2E5F6F726967696E3D2261626F75743A626C616E6B222C476E293B66756E6374696F6E20476E28297B7D766172204F6E3D28566E2E70726F746F747970652E616464496D6167653D66756E6374696F6E2841297B76617220653D50726F6D6973';
wwv_flow_imp.g_varchar2_table(1574) := '652E7265736F6C766528293B72657475726E20746869732E6861732841297C7C28596E2841297C7C506E28412929262628746869732E5F63616368655B415D3D746869732E6C6F6164496D616765284129292E63617463682866756E6374696F6E28297B';
wwv_flow_imp.g_varchar2_table(1575) := '7D292C657D2C566E2E70726F746F747970652E6D617463683D66756E6374696F6E2841297B72657475726E20746869732E5F63616368655B415D7D2C566E2E70726F746F747970652E6C6F6164496D6167653D66756E6374696F6E2873297B7265747572';
wwv_flow_imp.g_varchar2_table(1576) := '6E206128746869732C766F696420302C766F696420302C66756E6374696F6E28297B76617220652C722C742C422C6E3D746869733B72657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B6361736520';
wwv_flow_imp.g_varchar2_table(1577) := '303A72657475726E28653D546E2E697353616D654F726967696E2873292C723D21586E287329262621303D3D3D746869732E5F6F7074696F6E732E757365434F5253262658722E535550504F52545F434F52535F494D41474553262621652C743D21586E';
wwv_flow_imp.g_varchar2_table(1578) := '28732926262165262621596E287329262622737472696E67223D3D747970656F6620746869732E5F6F7074696F6E732E70726F7879262658722E535550504F52545F434F52535F584852262621722C657C7C2131213D3D746869732E5F6F7074696F6E73';
wwv_flow_imp.g_varchar2_table(1579) := '2E616C6C6F775461696E747C7C586E2873297C7C596E2873297C7C747C7C72293F28423D732C743F5B342C746869732E70726F78792842295D3A5B332C325D293A5B325D3B6361736520313A423D412E73656E7428292C412E6C6162656C3D323B636173';
wwv_flow_imp.g_varchar2_table(1580) := '6520323A72657475726E20746869732E636F6E746578742E6C6F676765722E64656275672822416464656420696D61676520222B732E737562737472696E6728302C32353629292C5B342C6E65772050726F6D6973652866756E6374696F6E28412C6529';
wwv_flow_imp.g_varchar2_table(1581) := '7B76617220743D6E657720496D6167653B742E6F6E6C6F61643D66756E6374696F6E28297B72657475726E20412874297D2C742E6F6E6572726F723D652C284A6E2842297C7C7229262628742E63726F73734F726967696E3D22616E6F6E796D6F757322';
wwv_flow_imp.g_varchar2_table(1582) := '292C742E7372633D422C21303D3D3D742E636F6D706C657465262673657454696D656F75742866756E6374696F6E28297B72657475726E20412874297D2C353030292C303C6E2E5F6F7074696F6E732E696D61676554696D656F7574262673657454696D';
wwv_flow_imp.g_varchar2_table(1583) := '656F75742866756E6374696F6E28297B72657475726E2065282254696D6564206F75742028222B6E2E5F6F7074696F6E732E696D61676554696D656F75742B226D7329206C6F6164696E6720696D61676522297D2C6E2E5F6F7074696F6E732E696D6167';
wwv_flow_imp.g_varchar2_table(1584) := '6554696D656F7574297D295D3B6361736520333A72657475726E5B322C412E73656E7428295D7D7D297D297D2C566E2E70726F746F747970652E6861733D66756E6374696F6E2841297B72657475726E20766F69642030213D3D746869732E5F63616368';
wwv_flow_imp.g_varchar2_table(1585) := '655B415D7D2C566E2E70726F746F747970652E6B6579733D66756E6374696F6E28297B72657475726E2050726F6D6973652E7265736F6C7665284F626A6563742E6B65797328746869732E5F636163686529297D2C566E2E70726F746F747970652E7072';
wwv_flow_imp.g_varchar2_table(1586) := '6F78793D66756E6374696F6E2873297B766172206F3D746869732C693D746869732E5F6F7074696F6E732E70726F78793B6966282169297468726F77206E6577204572726F7228224E6F2070726F787920646566696E656422293B76617220513D732E73';
wwv_flow_imp.g_varchar2_table(1587) := '7562737472696E6728302C323536293B72657475726E206E65772050726F6D6973652866756E6374696F6E28652C74297B76617220723D58722E535550504F52545F524553504F4E53455F545950453F22626C6F62223A2274657874222C423D6E657720';
wwv_flow_imp.g_varchar2_table(1588) := '584D4C48747470526571756573743B422E6F6E6C6F61643D66756E6374696F6E28297B76617220413B3230303D3D3D422E7374617475733F2274657874223D3D723F6528422E726573706F6E7365293A2828413D6E65772046696C65526561646572292E';
wwv_flow_imp.g_varchar2_table(1589) := '6164644576656E744C697374656E657228226C6F6164222C66756E6374696F6E28297B72657475726E206528412E726573756C74297D2C2131292C412E6164644576656E744C697374656E657228226572726F72222C66756E6374696F6E2841297B7265';
wwv_flow_imp.g_varchar2_table(1590) := '7475726E20742841297D2C2131292C412E7265616441734461746155524C28422E726573706F6E736529293A7428224661696C656420746F2070726F7879207265736F7572636520222B512B2220776974682073746174757320636F646520222B422E73';
wwv_flow_imp.g_varchar2_table(1591) := '7461747573297D2C422E6F6E6572726F723D743B76617220412C6E3D2D313C692E696E6465784F6628223F22293F2226223A223F223B422E6F70656E2822474554222C692B6E2B2275726C3D222B656E636F6465555249436F6D706F6E656E742873292B';
wwv_flow_imp.g_varchar2_table(1592) := '2226726573706F6E7365547970653D222B72292C227465787422213D7226264220696E7374616E63656F6620584D4C4874747052657175657374262628422E726573706F6E7365547970653D72292C6F2E5F6F7074696F6E732E696D61676554696D656F';
wwv_flow_imp.g_varchar2_table(1593) := '7574262628413D6F2E5F6F7074696F6E732E696D61676554696D656F75742C422E74696D656F75743D412C422E6F6E74696D656F75743D66756E6374696F6E28297B72657475726E2074282254696D6564206F75742028222B412B226D73292070726F78';
wwv_flow_imp.g_varchar2_table(1594) := '79696E6720222B51297D292C422E73656E6428297D297D2C566E293B66756E6374696F6E20566E28412C65297B746869732E636F6E746578743D412C746869732E5F6F7074696F6E733D652C746869732E5F63616368653D7B7D7D766172206B6E3D2F5E';
wwv_flow_imp.g_varchar2_table(1595) := '646174613A696D6167655C2F7376675C2B786D6C2F692C526E3D2F5E646174613A696D6167655C2F2E2A3B6261736536342C2F692C4E6E3D2F5E646174613A696D6167655C2F2E2A2F692C506E3D66756E6374696F6E2841297B72657475726E2058722E';
wwv_flow_imp.g_varchar2_table(1596) := '535550504F52545F5356475F44524157494E477C7C21576E2841297D2C586E3D66756E6374696F6E2841297B72657475726E204E6E2E746573742841297D2C4A6E3D66756E6374696F6E2841297B72657475726E20526E2E746573742841297D2C596E3D';
wwv_flow_imp.g_varchar2_table(1597) := '66756E6374696F6E2841297B72657475726E22626C6F62223D3D3D412E73756273747228302C34297D2C576E3D66756E6374696F6E2841297B72657475726E22737667223D3D3D412E737562737472282D33292E746F4C6F7765724361736528297C7C6B';
wwv_flow_imp.g_varchar2_table(1598) := '6E2E746573742841297D2C5A6E3D285F6E2E70726F746F747970652E6164643D66756E6374696F6E28412C65297B72657475726E206E6577205F6E28746869732E782B412C746869732E792B65297D2C5F6E293B66756E6374696F6E205F6E28412C6529';
wwv_flow_imp.g_varchar2_table(1599) := '7B746869732E747970653D302C746869732E783D412C746869732E793D657D66756E6374696F6E20716E28412C652C74297B72657475726E206E6577205A6E28412E782B28652E782D412E78292A742C412E792B28652E792D412E79292A74297D766172';
wwv_flow_imp.g_varchar2_table(1600) := '206A6E3D287A6E2E70726F746F747970652E7375626469766964653D66756E6374696F6E28412C65297B76617220743D716E28746869732E73746172742C746869732E7374617274436F6E74726F6C2C41292C723D716E28746869732E7374617274436F';
wwv_flow_imp.g_varchar2_table(1601) := '6E74726F6C2C746869732E656E64436F6E74726F6C2C41292C423D716E28746869732E656E64436F6E74726F6C2C746869732E656E642C41292C6E3D716E28742C722C41292C723D716E28722C422C41292C413D716E286E2C722C41293B72657475726E';
wwv_flow_imp.g_varchar2_table(1602) := '20653F6E6577207A6E28746869732E73746172742C742C6E2C41293A6E6577207A6E28412C722C422C746869732E656E64297D2C7A6E2E70726F746F747970652E6164643D66756E6374696F6E28412C65297B72657475726E206E6577207A6E28746869';
wwv_flow_imp.g_varchar2_table(1603) := '732E73746172742E61646428412C65292C746869732E7374617274436F6E74726F6C2E61646428412C65292C746869732E656E64436F6E74726F6C2E61646428412C65292C746869732E656E642E61646428412C6529297D2C7A6E2E70726F746F747970';
wwv_flow_imp.g_varchar2_table(1604) := '652E726576657273653D66756E6374696F6E28297B72657475726E206E6577207A6E28746869732E656E642C746869732E656E64436F6E74726F6C2C746869732E7374617274436F6E74726F6C2C746869732E7374617274297D2C7A6E293B66756E6374';
wwv_flow_imp.g_varchar2_table(1605) := '696F6E207A6E28412C652C742C72297B746869732E747970653D312C746869732E73746172743D412C746869732E7374617274436F6E74726F6C3D652C746869732E656E64436F6E74726F6C3D742C746869732E656E643D727D66756E6374696F6E2024';
wwv_flow_imp.g_varchar2_table(1606) := '6E2841297B72657475726E20313D3D3D412E747970657D7661722041732C65733D66756E6374696F6E2841297B76617220653D412E7374796C65732C743D412E626F756E64732C723D28433D426528652E626F72646572546F704C656674526164697573';
wwv_flow_imp.g_varchar2_table(1607) := '2C742E77696474682C742E68656967687429295B305D2C423D435B315D2C6E3D28753D426528652E626F72646572546F7052696768745261646975732C742E77696474682C742E68656967687429295B305D2C733D755B315D2C6F3D28463D426528652E';
wwv_flow_imp.g_varchar2_table(1608) := '626F72646572426F74746F6D52696768745261646975732C742E77696474682C742E68656967687429295B305D2C693D465B315D2C513D28683D426528652E626F72646572426F74746F6D4C6566745261646975732C742E77696474682C742E68656967';
wwv_flow_imp.g_varchar2_table(1609) := '687429295B305D2C633D685B315D3B28643D5B5D292E707573682828722B6E292F742E7769647468292C642E707573682828512B6F292F742E7769647468292C642E707573682828422B63292F742E686569676874292C642E707573682828732B69292F';
wwv_flow_imp.g_varchar2_table(1610) := '742E686569676874292C313C28663D4D6174682E6D61782E6170706C79284D6174682C642929262628722F3D662C422F3D662C6E2F3D662C732F3D662C6F2F3D662C692F3D662C512F3D662C632F3D66293B76617220613D742E77696474682D6E2C673D';
wwv_flow_imp.g_varchar2_table(1611) := '742E6865696768742D692C773D742E77696474682D6F2C553D742E6865696768742D632C6C3D652E626F72646572546F7057696474682C433D652E626F72646572526967687457696474682C753D652E626F72646572426F74746F6D57696474682C463D';
wwv_flow_imp.g_varchar2_table(1612) := '652E626F726465724C65667457696474682C683D556528652E70616464696E67546F702C412E626F756E64732E7769647468292C643D556528652E70616464696E6752696768742C412E626F756E64732E7769647468292C663D556528652E7061646469';
wwv_flow_imp.g_varchar2_table(1613) := '6E67426F74746F6D2C412E626F756E64732E7769647468292C413D556528652E70616464696E674C6566742C412E626F756E64732E7769647468293B746869732E746F704C656674426F72646572446F75626C654F75746572426F783D303C727C7C303C';
wwv_flow_imp.g_varchar2_table(1614) := '423F737328742E6C6566742B462F332C742E746F702B6C2F332C722D462F332C422D6C2F332C41732E544F505F4C454654293A6E6577205A6E28742E6C6566742B462F332C742E746F702B6C2F33292C746869732E746F705269676874426F7264657244';
wwv_flow_imp.g_varchar2_table(1615) := '6F75626C654F75746572426F783D303C727C7C303C423F737328742E6C6566742B612C742E746F702B6C2F332C6E2D432F332C732D6C2F332C41732E544F505F5249474854293A6E6577205A6E28742E6C6566742B742E77696474682D432F332C742E74';
wwv_flow_imp.g_varchar2_table(1616) := '6F702B6C2F33292C746869732E626F74746F6D5269676874426F72646572446F75626C654F75746572426F783D303C6F7C7C303C693F737328742E6C6566742B772C742E746F702B672C6F2D432F332C692D752F332C41732E424F54544F4D5F52494748';
wwv_flow_imp.g_varchar2_table(1617) := '54293A6E6577205A6E28742E6C6566742B742E77696474682D432F332C742E746F702B742E6865696768742D752F33292C746869732E626F74746F6D4C656674426F72646572446F75626C654F75746572426F783D303C517C7C303C633F737328742E6C';
wwv_flow_imp.g_varchar2_table(1618) := '6566742B462F332C742E746F702B552C512D462F332C632D752F332C41732E424F54544F4D5F4C454654293A6E6577205A6E28742E6C6566742B462F332C742E746F702B742E6865696768742D752F33292C746869732E746F704C656674426F72646572';
wwv_flow_imp.g_varchar2_table(1619) := '446F75626C65496E6E6572426F783D303C727C7C303C423F737328742E6C6566742B322A462F332C742E746F702B322A6C2F332C722D322A462F332C422D322A6C2F332C41732E544F505F4C454654293A6E6577205A6E28742E6C6566742B322A462F33';
wwv_flow_imp.g_varchar2_table(1620) := '2C742E746F702B322A6C2F33292C746869732E746F705269676874426F72646572446F75626C65496E6E6572426F783D303C727C7C303C423F737328742E6C6566742B612C742E746F702B322A6C2F332C6E2D322A432F332C732D322A6C2F332C41732E';
wwv_flow_imp.g_varchar2_table(1621) := '544F505F5249474854293A6E6577205A6E28742E6C6566742B742E77696474682D322A432F332C742E746F702B322A6C2F33292C746869732E626F74746F6D5269676874426F72646572446F75626C65496E6E6572426F783D303C6F7C7C303C693F7373';
wwv_flow_imp.g_varchar2_table(1622) := '28742E6C6566742B772C742E746F702B672C6F2D322A432F332C692D322A752F332C41732E424F54544F4D5F5249474854293A6E6577205A6E28742E6C6566742B742E77696474682D322A432F332C742E746F702B742E6865696768742D322A752F3329';
wwv_flow_imp.g_varchar2_table(1623) := '2C746869732E626F74746F6D4C656674426F72646572446F75626C65496E6E6572426F783D303C517C7C303C633F737328742E6C6566742B322A462F332C742E746F702B552C512D322A462F332C632D322A752F332C41732E424F54544F4D5F4C454654';
wwv_flow_imp.g_varchar2_table(1624) := '293A6E6577205A6E28742E6C6566742B322A462F332C742E746F702B742E6865696768742D322A752F33292C746869732E746F704C656674426F726465725374726F6B653D303C727C7C303C423F737328742E6C6566742B462F322C742E746F702B6C2F';
wwv_flow_imp.g_varchar2_table(1625) := '322C722D462F322C422D6C2F322C41732E544F505F4C454654293A6E6577205A6E28742E6C6566742B462F322C742E746F702B6C2F32292C746869732E746F705269676874426F726465725374726F6B653D303C727C7C303C423F737328742E6C656674';
wwv_flow_imp.g_varchar2_table(1626) := '2B612C742E746F702B6C2F322C6E2D432F322C732D6C2F322C41732E544F505F5249474854293A6E6577205A6E28742E6C6566742B742E77696474682D432F322C742E746F702B6C2F32292C746869732E626F74746F6D5269676874426F726465725374';
wwv_flow_imp.g_varchar2_table(1627) := '726F6B653D303C6F7C7C303C693F737328742E6C6566742B772C742E746F702B672C6F2D432F322C692D752F322C41732E424F54544F4D5F5249474854293A6E6577205A6E28742E6C6566742B742E77696474682D432F322C742E746F702B742E686569';
wwv_flow_imp.g_varchar2_table(1628) := '6768742D752F32292C746869732E626F74746F6D4C656674426F726465725374726F6B653D303C517C7C303C633F737328742E6C6566742B462F322C742E746F702B552C512D462F322C632D752F322C41732E424F54544F4D5F4C454654293A6E657720';
wwv_flow_imp.g_varchar2_table(1629) := '5A6E28742E6C6566742B462F322C742E746F702B742E6865696768742D752F32292C746869732E746F704C656674426F72646572426F783D303C727C7C303C423F737328742E6C6566742C742E746F702C722C422C41732E544F505F4C454654293A6E65';
wwv_flow_imp.g_varchar2_table(1630) := '77205A6E28742E6C6566742C742E746F70292C746869732E746F705269676874426F72646572426F783D303C6E7C7C303C733F737328742E6C6566742B612C742E746F702C6E2C732C41732E544F505F5249474854293A6E6577205A6E28742E6C656674';
wwv_flow_imp.g_varchar2_table(1631) := '2B742E77696474682C742E746F70292C746869732E626F74746F6D5269676874426F72646572426F783D303C6F7C7C303C693F737328742E6C6566742B772C742E746F702B672C6F2C692C41732E424F54544F4D5F5249474854293A6E6577205A6E2874';
wwv_flow_imp.g_varchar2_table(1632) := '2E6C6566742B742E77696474682C742E746F702B742E686569676874292C746869732E626F74746F6D4C656674426F72646572426F783D303C517C7C303C633F737328742E6C6566742C742E746F702B552C512C632C41732E424F54544F4D5F4C454654';
wwv_flow_imp.g_varchar2_table(1633) := '293A6E6577205A6E28742E6C6566742C742E746F702B742E686569676874292C746869732E746F704C65667450616464696E67426F783D303C727C7C303C423F737328742E6C6566742B462C742E746F702B6C2C4D6174682E6D617828302C722D46292C';
wwv_flow_imp.g_varchar2_table(1634) := '4D6174682E6D617828302C422D6C292C41732E544F505F4C454654293A6E6577205A6E28742E6C6566742B462C742E746F702B6C292C746869732E746F70526967687450616464696E67426F783D303C6E7C7C303C733F737328742E6C6566742B4D6174';
wwv_flow_imp.g_varchar2_table(1635) := '682E6D696E28612C742E77696474682D43292C742E746F702B6C2C613E742E77696474682B433F303A4D6174682E6D617828302C6E2D43292C4D6174682E6D617828302C732D6C292C41732E544F505F5249474854293A6E6577205A6E28742E6C656674';
wwv_flow_imp.g_varchar2_table(1636) := '2B742E77696474682D432C742E746F702B6C292C746869732E626F74746F6D526967687450616464696E67426F783D303C6F7C7C303C693F737328742E6C6566742B4D6174682E6D696E28772C742E77696474682D46292C742E746F702B4D6174682E6D';
wwv_flow_imp.g_varchar2_table(1637) := '696E28672C742E6865696768742D75292C4D6174682E6D617828302C6F2D43292C4D6174682E6D617828302C692D75292C41732E424F54544F4D5F5249474854293A6E6577205A6E28742E6C6566742B742E77696474682D432C742E746F702B742E6865';
wwv_flow_imp.g_varchar2_table(1638) := '696768742D75292C746869732E626F74746F6D4C65667450616464696E67426F783D303C517C7C303C633F737328742E6C6566742B462C742E746F702B4D6174682E6D696E28552C742E6865696768742D75292C4D6174682E6D617828302C512D46292C';
wwv_flow_imp.g_varchar2_table(1639) := '4D6174682E6D617828302C632D75292C41732E424F54544F4D5F4C454654293A6E6577205A6E28742E6C6566742B462C742E746F702B742E6865696768742D75292C746869732E746F704C656674436F6E74656E74426F783D303C727C7C303C423F7373';
wwv_flow_imp.g_varchar2_table(1640) := '28742E6C6566742B462B412C742E746F702B6C2B682C4D6174682E6D617828302C722D28462B4129292C4D6174682E6D617828302C422D286C2B6829292C41732E544F505F4C454654293A6E6577205A6E28742E6C6566742B462B412C742E746F702B6C';
wwv_flow_imp.g_varchar2_table(1641) := '2B68292C746869732E746F705269676874436F6E74656E74426F783D303C6E7C7C303C733F737328742E6C6566742B4D6174682E6D696E28612C742E77696474682B462B41292C742E746F702B6C2B682C613E742E77696474682B462B413F303A6E2D46';
wwv_flow_imp.g_varchar2_table(1642) := '2B412C732D286C2B68292C41732E544F505F5249474854293A6E6577205A6E28742E6C6566742B742E77696474682D28432B64292C742E746F702B6C2B68292C746869732E626F74746F6D5269676874436F6E74656E74426F783D303C6F7C7C303C693F';
wwv_flow_imp.g_varchar2_table(1643) := '737328742E6C6566742B4D6174682E6D696E28772C742E77696474682D28462B4129292C742E746F702B4D6174682E6D696E28672C742E6865696768742B6C2B68292C4D6174682E6D617828302C6F2D28432B6429292C692D28752B66292C41732E424F';
wwv_flow_imp.g_varchar2_table(1644) := '54544F4D5F5249474854293A6E6577205A6E28742E6C6566742B742E77696474682D28432B64292C742E746F702B742E6865696768742D28752B6629292C746869732E626F74746F6D4C656674436F6E74656E74426F783D303C517C7C303C633F737328';
wwv_flow_imp.g_varchar2_table(1645) := '742E6C6566742B462B412C742E746F702B552C4D6174682E6D617828302C512D28462B4129292C632D28752B66292C41732E424F54544F4D5F4C454654293A6E6577205A6E28742E6C6566742B462B412C742E746F702B742E6865696768742D28752B66';
wwv_flow_imp.g_varchar2_table(1646) := '29297D3B2868653D41733D41737C7C7B7D295B68652E544F505F4C4546543D305D3D22544F505F4C454654222C68655B68652E544F505F52494748543D315D3D22544F505F5249474854222C68655B68652E424F54544F4D5F52494748543D325D3D2242';
wwv_flow_imp.g_varchar2_table(1647) := '4F54544F4D5F5249474854222C68655B68652E424F54544F4D5F4C4546543D335D3D22424F54544F4D5F4C454654223B66756E6374696F6E2074732841297B72657475726E5B412E746F704C656674426F72646572426F782C412E746F70526967687442';
wwv_flow_imp.g_varchar2_table(1648) := '6F72646572426F782C412E626F74746F6D5269676874426F72646572426F782C412E626F74746F6D4C656674426F72646572426F785D7D66756E6374696F6E2072732841297B72657475726E5B412E746F704C65667450616464696E67426F782C412E74';
wwv_flow_imp.g_varchar2_table(1649) := '6F70526967687450616464696E67426F782C412E626F74746F6D526967687450616464696E67426F782C412E626F74746F6D4C65667450616464696E67426F785D7D66756E6374696F6E2042732841297B72657475726E20313D3D3D412E747970657D66';
wwv_flow_imp.g_varchar2_table(1650) := '756E6374696F6E206E7328412C74297B72657475726E20412E6C656E6774683D3D3D742E6C656E6774682626412E736F6D652866756E6374696F6E28412C65297B72657475726E20413D3D3D745B655D7D297D7661722073733D66756E6374696F6E2841';
wwv_flow_imp.g_varchar2_table(1651) := '2C652C742C722C42297B766172206E3D284D6174682E737172742832292D31292F332A342C733D742A6E2C6F3D722A6E2C693D412B742C513D652B723B7377697463682842297B636173652041732E544F505F4C4546543A72657475726E206E6577206A';
wwv_flow_imp.g_varchar2_table(1652) := '6E286E6577205A6E28412C51292C6E6577205A6E28412C512D6F292C6E6577205A6E28692D732C65292C6E6577205A6E28692C6529293B636173652041732E544F505F52494748543A72657475726E206E6577206A6E286E6577205A6E28412C65292C6E';
wwv_flow_imp.g_varchar2_table(1653) := '6577205A6E28412B732C65292C6E6577205A6E28692C512D6F292C6E6577205A6E28692C5129293B636173652041732E424F54544F4D5F52494748543A72657475726E206E6577206A6E286E6577205A6E28692C65292C6E6577205A6E28692C652B6F29';
wwv_flow_imp.g_varchar2_table(1654) := '2C6E6577205A6E28412B732C51292C6E6577205A6E28412C5129293B64656661756C743A41732E424F54544F4D5F4C4546543B72657475726E206E6577206A6E286E6577205A6E28692C51292C6E6577205A6E28692D732C51292C6E6577205A6E28412C';
wwv_flow_imp.g_varchar2_table(1655) := '652B6F292C6E6577205A6E28412C6529297D7D2C6F733D66756E6374696F6E28412C652C74297B746869732E6F6666736574583D412C746869732E6F6666736574593D652C746869732E6D61747269783D742C746869732E747970653D302C746869732E';
wwv_flow_imp.g_varchar2_table(1656) := '7461726765743D367D2C69733D66756E6374696F6E28412C65297B746869732E706174683D412C746869732E7461726765743D652C746869732E747970653D317D2C51733D66756E6374696F6E2841297B746869732E6F7061636974793D412C74686973';
wwv_flow_imp.g_varchar2_table(1657) := '2E747970653D322C746869732E7461726765743D367D2C63733D66756E6374696F6E2841297B746869732E656C656D656E743D412C746869732E696E6C696E654C6576656C3D5B5D2C746869732E6E6F6E496E6C696E654C6576656C3D5B5D2C74686973';
wwv_flow_imp.g_varchar2_table(1658) := '2E6E656761746976655A496E6465783D5B5D2C746869732E7A65726F4F724175746F5A496E6465784F725472616E73666F726D65644F724F7061636974793D5B5D2C746869732E706F7369746976655A496E6465783D5B5D2C746869732E6E6F6E506F73';
wwv_flow_imp.g_varchar2_table(1659) := '6974696F6E6564466C6F6174733D5B5D2C746869732E6E6F6E506F736974696F6E6564496E6C696E654C6576656C3D5B5D7D2C61733D2867732E70726F746F747970652E676574456666656374733D66756E6374696F6E2865297B666F72287661722041';
wwv_flow_imp.g_varchar2_table(1660) := '3D2D313D3D3D5B322C335D2E696E6465784F6628746869732E636F6E7461696E65722E7374796C65732E706F736974696F6E292C743D746869732E706172656E742C723D746869732E656666656374732E736C6963652830293B743B297B76617220422C';
wwv_flow_imp.g_varchar2_table(1661) := '6E2C733D742E656666656374732E66696C7465722866756E6374696F6E2841297B72657475726E2142732841297D293B417C7C30213D3D742E636F6E7461696E65722E7374796C65732E706F736974696F6E7C7C21742E706172656E743F28722E756E73';
wwv_flow_imp.g_varchar2_table(1662) := '686966742E6170706C7928722C73292C413D2D313D3D3D5B322C335D2E696E6465784F6628742E636F6E7461696E65722E7374796C65732E706F736974696F6E292C30213D3D742E636F6E7461696E65722E7374796C65732E6F766572666C6F77582626';
wwv_flow_imp.g_varchar2_table(1663) := '28423D747328742E637572766573292C6E3D727328742E637572766573292C6E7328422C6E297C7C722E756E7368696674286E6577206973286E2C36292929293A722E756E73686966742E6170706C7928722C73292C743D742E706172656E747D726574';
wwv_flow_imp.g_varchar2_table(1664) := '75726E20722E66696C7465722866756E6374696F6E2841297B72657475726E20507428412E7461726765742C65297D297D2C6773293B66756E6374696F6E20677328412C65297B76617220742C723B746869732E636F6E7461696E65723D412C74686973';
wwv_flow_imp.g_varchar2_table(1665) := '2E706172656E743D652C746869732E656666656374733D5B5D2C746869732E6375727665733D6E657720657328746869732E636F6E7461696E6572292C746869732E636F6E7461696E65722E7374796C65732E6F7061636974793C312626746869732E65';
wwv_flow_imp.g_varchar2_table(1666) := '6666656374732E70757368286E657720517328746869732E636F6E7461696E65722E7374796C65732E6F70616369747929292C6E756C6C213D3D746869732E636F6E7461696E65722E7374796C65732E7472616E73666F726D262628653D746869732E63';
wwv_flow_imp.g_varchar2_table(1667) := '6F6E7461696E65722E626F756E64732E6C6566742B746869732E636F6E7461696E65722E7374796C65732E7472616E73666F726D4F726967696E5B305D2E6E756D6265722C743D746869732E636F6E7461696E65722E626F756E64732E746F702B746869';
wwv_flow_imp.g_varchar2_table(1668) := '732E636F6E7461696E65722E7374796C65732E7472616E73666F726D4F726967696E5B315D2E6E756D6265722C723D746869732E636F6E7461696E65722E7374796C65732E7472616E73666F726D2C746869732E656666656374732E70757368286E6577';
wwv_flow_imp.g_varchar2_table(1669) := '206F7328652C742C722929292C30213D3D746869732E636F6E7461696E65722E7374796C65732E6F766572666C6F7758262628743D747328746869732E637572766573292C723D727328746869732E637572766573292C6E7328742C72293F746869732E';
wwv_flow_imp.g_varchar2_table(1670) := '656666656374732E70757368286E657720697328742C3629293A28746869732E656666656374732E70757368286E657720697328742C3229292C746869732E656666656374732E70757368286E657720697328722C34292929297D66756E6374696F6E20';
wwv_flow_imp.g_varchar2_table(1671) := '777328412C65297B7377697463682865297B6361736520303A72657475726E20487328412E746F704C656674426F72646572426F782C412E746F704C65667450616464696E67426F782C412E746F705269676874426F72646572426F782C412E746F7052';
wwv_flow_imp.g_varchar2_table(1672) := '6967687450616464696E67426F78293B6361736520313A72657475726E20487328412E746F705269676874426F72646572426F782C412E746F70526967687450616464696E67426F782C412E626F74746F6D5269676874426F72646572426F782C412E62';
wwv_flow_imp.g_varchar2_table(1673) := '6F74746F6D526967687450616464696E67426F78293B6361736520323A72657475726E20487328412E626F74746F6D5269676874426F72646572426F782C412E626F74746F6D526967687450616464696E67426F782C412E626F74746F6D4C656674426F';
wwv_flow_imp.g_varchar2_table(1674) := '72646572426F782C412E626F74746F6D4C65667450616464696E67426F78293B64656661756C743A72657475726E20487328412E626F74746F6D4C656674426F72646572426F782C412E626F74746F6D4C65667450616464696E67426F782C412E746F70';
wwv_flow_imp.g_varchar2_table(1675) := '4C656674426F72646572426F782C412E746F704C65667450616464696E67426F78297D7D66756E6374696F6E2055732841297B76617220653D412E626F756E64732C413D412E7374796C65733B72657475726E20652E61646428412E626F726465724C65';
wwv_flow_imp.g_varchar2_table(1676) := '667457696474682C412E626F72646572546F7057696474682C2D28412E626F72646572526967687457696474682B412E626F726465724C6566745769647468292C2D28412E626F72646572546F7057696474682B412E626F72646572426F74746F6D5769';
wwv_flow_imp.g_varchar2_table(1677) := '64746829297D66756E6374696F6E206C732841297B76617220653D412E7374796C65732C743D412E626F756E64732C723D556528652E70616464696E674C6566742C742E7769647468292C423D556528652E70616464696E6752696768742C742E776964';
wwv_flow_imp.g_varchar2_table(1678) := '7468292C6E3D556528652E70616464696E67546F702C742E7769647468292C413D556528652E70616464696E67426F74746F6D2C742E7769647468293B72657475726E20742E61646428722B652E626F726465724C65667457696474682C6E2B652E626F';
wwv_flow_imp.g_varchar2_table(1679) := '72646572546F7057696474682C2D28652E626F72646572526967687457696474682B652E626F726465724C65667457696474682B722B42292C2D28652E626F72646572546F7057696474682B652E626F72646572426F74746F6D57696474682B6E2B4129';
wwv_flow_imp.g_varchar2_table(1680) := '297D66756E6374696F6E20437328412C652C74297B76617220723D28423D457328412E7374796C65732E6261636B67726F756E644F726967696E2C65292C6E3D412C303D3D3D423F6E2E626F756E64733A28323D3D3D423F6C733A557329286E29292C42';
wwv_flow_imp.g_varchar2_table(1681) := '3D28733D457328412E7374796C65732E6261636B67726F756E64436C69702C65292C6F3D412C303D3D3D733F6F2E626F756E64733A28323D3D3D733F6C733A557329286F29292C6E3D707328457328412E7374796C65732E6261636B67726F756E645369';
wwv_flow_imp.g_varchar2_table(1682) := '7A652C65292C742C72292C733D6E5B305D2C6F3D6E5B315D2C743D426528457328412E7374796C65732E6261636B67726F756E64506F736974696F6E2C65292C722E77696474682D732C722E6865696768742D6F293B72657475726E5B49732845732841';
wwv_flow_imp.g_varchar2_table(1683) := '2E7374796C65732E6261636B67726F756E645265706561742C65292C742C6E2C722C42292C4D6174682E726F756E6428722E6C6566742B745B305D292C4D6174682E726F756E6428722E746F702B745B315D292C732C6F5D7D66756E6374696F6E207573';
wwv_flow_imp.g_varchar2_table(1684) := '2841297B72657475726E205F412841292626412E76616C75653D3D3D56652E4155544F7D66756E6374696F6E2046732841297B72657475726E226E756D626572223D3D747970656F6620417D7661722068733D66756E6374696F6E28512C632C612C6729';
wwv_flow_imp.g_varchar2_table(1685) := '7B512E636F6E7461696E65722E656C656D656E74732E666F72456163682866756E6374696F6E2841297B76617220653D507428412E666C6167732C34292C743D507428412E666C6167732C32292C723D6E657720617328412C51293B507428412E737479';
wwv_flow_imp.g_varchar2_table(1686) := '6C65732E646973706C61792C32303438292626672E707573682872293B76617220422C6E2C732C6F2C693D507428412E666C6167732C38293F5B5D3A673B657C7C743F28423D657C7C412E7374796C65732E6973506F736974696F6E656428293F613A63';
wwv_flow_imp.g_varchar2_table(1687) := '2C743D6E65772063732872292C412E7374796C65732E6973506F736974696F6E656428297C7C412E7374796C65732E6F7061636974793C317C7C412E7374796C65732E69735472616E73666F726D656428293F286E3D412E7374796C65732E7A496E6465';
wwv_flow_imp.g_varchar2_table(1688) := '782E6F72646572293C303F28733D302C422E6E656761746976655A496E6465782E736F6D652866756E6374696F6E28412C65297B72657475726E206E3E412E656C656D656E742E636F6E7461696E65722E7374796C65732E7A496E6465782E6F72646572';
wwv_flow_imp.g_varchar2_table(1689) := '3F28733D652C2131293A303C737D292C422E6E656761746976655A496E6465782E73706C69636528732C302C7429293A303C6E3F286F3D302C422E706F7369746976655A496E6465782E736F6D652866756E6374696F6E28412C65297B72657475726E20';
wwv_flow_imp.g_varchar2_table(1690) := '6E3E3D412E656C656D656E742E636F6E7461696E65722E7374796C65732E7A496E6465782E6F726465723F286F3D652B312C2131293A303C6F7D292C422E706F7369746976655A496E6465782E73706C696365286F2C302C7429293A422E7A65726F4F72';
wwv_flow_imp.g_varchar2_table(1691) := '4175746F5A496E6465784F725472616E73666F726D65644F724F7061636974792E707573682874293A28412E7374796C65732E6973466C6F6174696E6728293F422E6E6F6E506F736974696F6E6564466C6F6174733A422E6E6F6E506F736974696F6E65';
wwv_flow_imp.g_varchar2_table(1692) := '64496E6C696E654C6576656C292E707573682874292C687328722C742C653F743A612C6929293A2828412E7374796C65732E6973496E6C696E654C6576656C28293F632E696E6C696E654C6576656C3A632E6E6F6E496E6C696E654C6576656C292E7075';
wwv_flow_imp.g_varchar2_table(1693) := '73682872292C687328722C632C612C6929292C507428412E666C6167732C38292626647328412C69297D297D2C64733D66756E6374696F6E28412C65297B666F722876617220743D4120696E7374616E63656F662055423F412E73746172743A312C723D';
wwv_flow_imp.g_varchar2_table(1694) := '4120696E7374616E63656F662055422626412E72657665727365642C423D303B423C652E6C656E6774683B422B2B297B766172206E3D655B425D3B6E2E636F6E7461696E657220696E7374616E63656F662061422626226E756D626572223D3D74797065';
wwv_flow_imp.g_varchar2_table(1695) := '6F66206E2E636F6E7461696E65722E76616C7565262630213D3D6E2E636F6E7461696E65722E76616C7565262628743D6E2E636F6E7461696E65722E76616C7565292C6E2E6C69737456616C75653D466E28742C6E2E636F6E7461696E65722E7374796C';
wwv_flow_imp.g_varchar2_table(1696) := '65732E6C6973745374796C65547970652C2130292C742B3D723F2D313A317D7D2C66733D66756E6374696F6E28412C65297B76617220743D5B5D3B72657475726E20246E2841293F742E7075736828412E737562646976696465282E352C213129293A74';
wwv_flow_imp.g_varchar2_table(1697) := '2E707573682841292C246E2865293F742E7075736828652E737562646976696465282E352C213029293A742E707573682865292C747D2C48733D66756E6374696F6E28412C652C742C72297B76617220423D5B5D3B72657475726E20246E2841293F422E';
wwv_flow_imp.g_varchar2_table(1698) := '7075736828412E737562646976696465282E352C213129293A422E707573682841292C246E2874293F422E7075736828742E737562646976696465282E352C213029293A422E707573682874292C246E2872293F422E7075736828722E73756264697669';
wwv_flow_imp.g_varchar2_table(1699) := '6465282E352C2130292E726576657273652829293A422E707573682872292C246E2865293F422E7075736828652E737562646976696465282E352C2131292E726576657273652829293A422E707573682865292C427D2C70733D66756E6374696F6E2841';
wwv_flow_imp.g_varchar2_table(1700) := '2C652C74297B76617220723D655B305D2C423D655B315D2C6E3D655B325D2C733D415B305D2C6F3D415B315D3B69662821732972657475726E5B302C305D3B696628746528732926266F26267465286F292972657475726E5B556528732C742E77696474';
wwv_flow_imp.g_varchar2_table(1701) := '68292C5565286F2C742E686569676874295D3B76617220693D4673286E293B6966285F41287329262628732E76616C75653D3D3D56652E434F4E5441494E7C7C732E76616C75653D3D3D56652E434F564552292972657475726E204673286E293F742E77';
wwv_flow_imp.g_varchar2_table(1702) := '696474682F742E6865696768743C6E213D28732E76616C75653D3D3D56652E434F564552293F5B742E77696474682C742E77696474682F6E5D3A5B742E6865696768742A6E2C742E6865696768745D3A5B742E77696474682C742E6865696768745D3B76';
wwv_flow_imp.g_varchar2_table(1703) := '617220513D46732872292C653D46732842292C413D517C7C653B6966287573287329262628216F7C7C7573286F29292972657475726E20512626653F5B722C425D3A697C7C413F412626693F5B513F723A422A6E2C653F423A722F6E5D3A5B513F723A74';
wwv_flow_imp.g_varchar2_table(1704) := '2E77696474682C653F423A742E6865696768745D3A5B742E77696474682C742E6865696768745D3B69662869297B76617220633D302C613D303B72657475726E2074652873293F633D556528732C742E7769647468293A7465286F29262628613D556528';
wwv_flow_imp.g_varchar2_table(1705) := '6F2C742E68656967687429292C75732873293F633D612A6E3A6F2626217573286F297C7C28613D632F6E292C5B632C615D7D633D6E756C6C2C613D6E756C6C3B69662874652873293F633D556528732C742E7769647468293A6F26267465286F29262628';
wwv_flow_imp.g_varchar2_table(1706) := '613D5565286F2C742E68656967687429292C6E756C6C213D3D28633D6E756C6C213D3D28613D6E756C6C213D3D63262628216F7C7C7573286F29293F512626653F632F722A423A742E6865696768743A6129262675732873293F512626653F612F422A72';
wwv_flow_imp.g_varchar2_table(1707) := '3A742E77696474683A632926266E756C6C213D3D612972657475726E5B632C615D3B7468726F77206E6577204572726F722822556E61626C6520746F2063616C63756C617465206261636B67726F756E642D73697A6520666F7220656C656D656E742229';
wwv_flow_imp.g_varchar2_table(1708) := '7D2C45733D66756E6374696F6E28412C65297B653D415B655D3B72657475726E20766F696420303D3D3D653F415B305D3A657D2C49733D66756E6374696F6E28412C652C742C722C42297B766172206E3D655B305D2C733D655B315D2C6F3D745B305D2C';
wwv_flow_imp.g_varchar2_table(1709) := '693D745B315D3B7377697463682841297B6361736520323A72657475726E5B6E6577205A6E284D6174682E726F756E6428722E6C656674292C4D6174682E726F756E6428722E746F702B7329292C6E6577205A6E284D6174682E726F756E6428722E6C65';
wwv_flow_imp.g_varchar2_table(1710) := '66742B722E7769647468292C4D6174682E726F756E6428722E746F702B7329292C6E6577205A6E284D6174682E726F756E6428722E6C6566742B722E7769647468292C4D6174682E726F756E6428692B722E746F702B7329292C6E6577205A6E284D6174';
wwv_flow_imp.g_varchar2_table(1711) := '682E726F756E6428722E6C656674292C4D6174682E726F756E6428692B722E746F702B7329295D3B6361736520333A72657475726E5B6E6577205A6E284D6174682E726F756E6428722E6C6566742B6E292C4D6174682E726F756E6428722E746F702929';
wwv_flow_imp.g_varchar2_table(1712) := '2C6E6577205A6E284D6174682E726F756E6428722E6C6566742B6E2B6F292C4D6174682E726F756E6428722E746F7029292C6E6577205A6E284D6174682E726F756E6428722E6C6566742B6E2B6F292C4D6174682E726F756E6428722E6865696768742B';
wwv_flow_imp.g_varchar2_table(1713) := '722E746F7029292C6E6577205A6E284D6174682E726F756E6428722E6C6566742B6E292C4D6174682E726F756E6428722E6865696768742B722E746F7029295D3B6361736520313A72657475726E5B6E6577205A6E284D6174682E726F756E6428722E6C';
wwv_flow_imp.g_varchar2_table(1714) := '6566742B6E292C4D6174682E726F756E6428722E746F702B7329292C6E6577205A6E284D6174682E726F756E6428722E6C6566742B6E2B6F292C4D6174682E726F756E6428722E746F702B7329292C6E6577205A6E284D6174682E726F756E6428722E6C';
wwv_flow_imp.g_varchar2_table(1715) := '6566742B6E2B6F292C4D6174682E726F756E6428722E746F702B732B6929292C6E6577205A6E284D6174682E726F756E6428722E6C6566742B6E292C4D6174682E726F756E6428722E746F702B732B6929295D3B64656661756C743A72657475726E5B6E';
wwv_flow_imp.g_varchar2_table(1716) := '6577205A6E284D6174682E726F756E6428422E6C656674292C4D6174682E726F756E6428422E746F7029292C6E6577205A6E284D6174682E726F756E6428422E6C6566742B422E7769647468292C4D6174682E726F756E6428422E746F7029292C6E6577';
wwv_flow_imp.g_varchar2_table(1717) := '205A6E284D6174682E726F756E6428422E6C6566742B422E7769647468292C4D6174682E726F756E6428422E6865696768742B422E746F7029292C6E6577205A6E284D6174682E726F756E6428422E6C656674292C4D6174682E726F756E6428422E6865';
wwv_flow_imp.g_varchar2_table(1718) := '696768742B422E746F7029295D7D7D2C79733D2248696464656E2054657874222C4B733D286D732E70726F746F747970652E70617273654D6574726963733D66756E6374696F6E28412C65297B76617220743D746869732E5F646F63756D656E742E6372';
wwv_flow_imp.g_varchar2_table(1719) := '65617465456C656D656E74282264697622292C723D746869732E5F646F63756D656E742E637265617465456C656D656E742822696D6722292C423D746869732E5F646F63756D656E742E637265617465456C656D656E7428227370616E22292C6E3D7468';
wwv_flow_imp.g_varchar2_table(1720) := '69732E5F646F63756D656E742E626F64793B742E7374796C652E7669736962696C6974793D2268696464656E222C742E7374796C652E666F6E7446616D696C793D412C742E7374796C652E666F6E7453697A653D652C742E7374796C652E6D617267696E';
wwv_flow_imp.g_varchar2_table(1721) := '3D2230222C742E7374796C652E70616464696E673D2230222C742E7374796C652E776869746553706163653D226E6F77726170222C6E2E617070656E644368696C642874292C722E7372633D22646174613A696D6167652F6769663B6261736536342C52';
wwv_flow_imp.g_varchar2_table(1722) := '306C474F446C6841514142414941414141414141502F2F2F79483542414541414141414C41414141414142414145414141494252414137222C722E77696474683D312C722E6865696768743D312C722E7374796C652E6D617267696E3D2230222C722E73';
wwv_flow_imp.g_varchar2_table(1723) := '74796C652E70616464696E673D2230222C722E7374796C652E766572746963616C416C69676E3D22626173656C696E65222C422E7374796C652E666F6E7446616D696C793D412C422E7374796C652E666F6E7453697A653D652C422E7374796C652E6D61';
wwv_flow_imp.g_varchar2_table(1724) := '7267696E3D2230222C422E7374796C652E70616464696E673D2230222C422E617070656E644368696C6428746869732E5F646F63756D656E742E637265617465546578744E6F646528797329292C742E617070656E644368696C642842292C742E617070';
wwv_flow_imp.g_varchar2_table(1725) := '656E644368696C642872293B653D722E6F6666736574546F702D422E6F6666736574546F702B323B742E72656D6F76654368696C642842292C742E617070656E644368696C6428746869732E5F646F63756D656E742E637265617465546578744E6F6465';
wwv_flow_imp.g_varchar2_table(1726) := '28797329292C742E7374796C652E6C696E654865696768743D226E6F726D616C222C722E7374796C652E766572746963616C416C69676E3D227375706572223B723D722E6F6666736574546F702D742E6F6666736574546F702B323B72657475726E206E';
wwv_flow_imp.g_varchar2_table(1727) := '2E72656D6F76654368696C642874292C7B626173656C696E653A652C6D6964646C653A727D7D2C6D732E70726F746F747970652E6765744D6574726963733D66756E6374696F6E28412C65297B76617220743D412B2220222B653B72657475726E20766F';
wwv_flow_imp.g_varchar2_table(1728) := '696420303D3D3D746869732E5F646174615B745D262628746869732E5F646174615B745D3D746869732E70617273654D65747269637328412C6529292C746869732E5F646174615B745D7D2C6D73293B66756E6374696F6E206D732841297B746869732E';
wwv_flow_imp.g_varchar2_table(1729) := '5F646174613D7B7D2C746869732E5F646F63756D656E743D417D766172204C732C68653D66756E6374696F6E28412C65297B746869732E636F6E746578743D412C746869732E6F7074696F6E733D657D2C62733D28412844732C4C733D6865292C44732E';
wwv_flow_imp.g_varchar2_table(1730) := '70726F746F747970652E6170706C79456666656374733D66756E6374696F6E2841297B666F722876617220653D746869733B746869732E5F616374697665456666656374732E6C656E6774683B29746869732E706F7045666665637428293B412E666F72';
wwv_flow_imp.g_varchar2_table(1731) := '456163682866756E6374696F6E2841297B72657475726E20652E6170706C794566666563742841297D297D2C44732E70726F746F747970652E6170706C794566666563743D66756E6374696F6E2841297B746869732E6374782E7361766528292C323D3D';
wwv_flow_imp.g_varchar2_table(1732) := '3D412E74797065262628746869732E6374782E676C6F62616C416C7068613D412E6F706163697479292C303D3D3D412E74797065262628746869732E6374782E7472616E736C61746528412E6F6666736574582C412E6F666673657459292C746869732E';
wwv_flow_imp.g_varchar2_table(1733) := '6374782E7472616E73666F726D28412E6D61747269785B305D2C412E6D61747269785B315D2C412E6D61747269785B325D2C412E6D61747269785B335D2C412E6D61747269785B345D2C412E6D61747269785B355D292C746869732E6374782E7472616E';
wwv_flow_imp.g_varchar2_table(1734) := '736C617465282D412E6F6666736574582C2D412E6F66667365745929292C4273284129262628746869732E7061746828412E70617468292C746869732E6374782E636C69702829292C746869732E5F616374697665456666656374732E70757368284129';
wwv_flow_imp.g_varchar2_table(1735) := '7D2C44732E70726F746F747970652E706F704566666563743D66756E6374696F6E28297B746869732E5F616374697665456666656374732E706F7028292C746869732E6374782E726573746F726528297D2C44732E70726F746F747970652E72656E6465';
wwv_flow_imp.g_varchar2_table(1736) := '72537461636B3D66756E6374696F6E2865297B72657475726E206128746869732C766F696420302C766F696420302C66756E6374696F6E28297B72657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B';
wwv_flow_imp.g_varchar2_table(1737) := '6361736520303A72657475726E20652E656C656D656E742E636F6E7461696E65722E7374796C65732E697356697369626C6528293F5B342C746869732E72656E646572537461636B436F6E74656E742865295D3A5B332C325D3B6361736520313A412E73';
wwv_flow_imp.g_varchar2_table(1738) := '656E7428292C412E6C6162656C3D323B6361736520323A72657475726E5B325D7D7D297D297D2C44732E70726F746F747970652E72656E6465724E6F64653D66756E6374696F6E2865297B72657475726E206128746869732C766F696420302C766F6964';
wwv_flow_imp.g_varchar2_table(1739) := '20302C66756E6374696F6E28297B72657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B6361736520303A72657475726E20507428652E636F6E7461696E65722E666C6167732C3136292C652E636F6E';
wwv_flow_imp.g_varchar2_table(1740) := '7461696E65722E7374796C65732E697356697369626C6528293F5B342C746869732E72656E6465724E6F64654261636B67726F756E64416E64426F72646572732865295D3A5B332C335D3B6361736520313A72657475726E20412E73656E7428292C5B34';
wwv_flow_imp.g_varchar2_table(1741) := '2C746869732E72656E6465724E6F6465436F6E74656E742865295D3B6361736520323A412E73656E7428292C412E6C6162656C3D333B6361736520333A72657475726E5B325D7D7D297D297D2C44732E70726F746F747970652E72656E64657254657874';
wwv_flow_imp.g_varchar2_table(1742) := '576974684C657474657253706163696E673D66756E6374696F6E28742C412C72297B76617220423D746869733B303D3D3D413F746869732E6374782E66696C6C5465787428742E746578742C742E626F756E64732E6C6566742C742E626F756E64732E74';
wwv_flow_imp.g_varchar2_table(1743) := '6F702B72293A5A7228742E74657874292E7265647563652866756E6374696F6E28412C65297B72657475726E20422E6374782E66696C6C5465787428652C412C742E626F756E64732E746F702B72292C412B422E6374782E6D6561737572655465787428';
wwv_flow_imp.g_varchar2_table(1744) := '65292E77696474687D2C742E626F756E64732E6C656674297D2C44732E70726F746F747970652E637265617465466F6E745374796C653D66756E6374696F6E2841297B76617220653D412E666F6E7456617269616E742E66696C7465722866756E637469';
wwv_flow_imp.g_varchar2_table(1745) := '6F6E2841297B72657475726E226E6F726D616C223D3D3D417C7C22736D616C6C2D63617073223D3D3D417D292E6A6F696E282222292C743D477328412E666F6E7446616D696C79292E6A6F696E28222C2022292C723D574128412E666F6E7453697A6529';
wwv_flow_imp.g_varchar2_table(1746) := '3F22222B412E666F6E7453697A652E6E756D6265722B412E666F6E7453697A652E756E69743A412E666F6E7453697A652E6E756D6265722B227078223B72657475726E5B5B412E666F6E745374796C652C652C412E666F6E745765696768742C722C745D';
wwv_flow_imp.g_varchar2_table(1747) := '2E6A6F696E28222022292C742C725D7D2C44732E70726F746F747970652E72656E646572546578744E6F64653D66756E6374696F6E28692C51297B72657475726E206128746869732C766F696420302C766F696420302C66756E6374696F6E28297B7661';
wwv_flow_imp.g_varchar2_table(1748) := '7220652C742C722C422C6E2C732C6F3D746869733B72657475726E204828746869732C66756E6374696F6E2841297B72657475726E20723D746869732E637265617465466F6E745374796C652851292C653D725B305D2C743D725B315D2C723D725B325D';
wwv_flow_imp.g_varchar2_table(1749) := '2C746869732E6374782E666F6E743D652C746869732E6374782E646972656374696F6E3D313D3D3D512E646972656374696F6E3F2272746C223A226C7472222C746869732E6374782E74657874416C69676E3D226C656674222C746869732E6374782E74';
wwv_flow_imp.g_varchar2_table(1750) := '657874426173656C696E653D22616C7068616265746963222C723D746869732E666F6E744D6574726963732E6765744D65747269637328742C72292C423D722E626173656C696E652C6E3D722E6D6964646C652C733D512E7061696E744F726465722C69';
wwv_flow_imp.g_varchar2_table(1751) := '2E74657874426F756E64732E666F72456163682866756E6374696F6E2874297B732E666F72456163682866756E6374696F6E2841297B7377697463682841297B6361736520303A6F2E6374782E66696C6C5374796C653D696528512E636F6C6F72292C6F';
wwv_flow_imp.g_varchar2_table(1752) := '2E72656E64657254657874576974684C657474657253706163696E6728742C512E6C657474657253706163696E672C42293B76617220653D512E74657874536861646F773B652E6C656E6774682626742E746578742E7472696D28292E6C656E67746826';
wwv_flow_imp.g_varchar2_table(1753) := '2628652E736C6963652830292E7265766572736528292E666F72456163682866756E6374696F6E2841297B6F2E6374782E736861646F77436F6C6F723D696528412E636F6C6F72292C6F2E6374782E736861646F774F6666736574583D412E6F66667365';
wwv_flow_imp.g_varchar2_table(1754) := '74582E6E756D6265722A6F2E6F7074696F6E732E7363616C652C6F2E6374782E736861646F774F6666736574593D412E6F6666736574592E6E756D6265722A6F2E6F7074696F6E732E7363616C652C6F2E6374782E736861646F77426C75723D412E626C';
wwv_flow_imp.g_varchar2_table(1755) := '75722E6E756D6265722C6F2E72656E64657254657874576974684C657474657253706163696E6728742C512E6C657474657253706163696E672C42297D292C6F2E6374782E736861646F77436F6C6F723D22222C6F2E6374782E736861646F774F666673';
wwv_flow_imp.g_varchar2_table(1756) := '6574583D302C6F2E6374782E736861646F774F6666736574593D302C6F2E6374782E736861646F77426C75723D30292C512E746578744465636F726174696F6E4C696E652E6C656E6774682626286F2E6374782E66696C6C5374796C653D696528512E74';
wwv_flow_imp.g_varchar2_table(1757) := '6578744465636F726174696F6E436F6C6F727C7C512E636F6C6F72292C512E746578744465636F726174696F6E4C696E652E666F72456163682866756E6374696F6E2841297B7377697463682841297B6361736520313A6F2E6374782E66696C6C526563';
wwv_flow_imp.g_varchar2_table(1758) := '7428742E626F756E64732E6C6566742C4D6174682E726F756E6428742E626F756E64732E746F702B42292C742E626F756E64732E77696474682C31293B627265616B3B6361736520323A6F2E6374782E66696C6C5265637428742E626F756E64732E6C65';
wwv_flow_imp.g_varchar2_table(1759) := '66742C4D6174682E726F756E6428742E626F756E64732E746F70292C742E626F756E64732E77696474682C31293B627265616B3B6361736520333A6F2E6374782E66696C6C5265637428742E626F756E64732E6C6566742C4D6174682E6365696C28742E';
wwv_flow_imp.g_varchar2_table(1760) := '626F756E64732E746F702B6E292C742E626F756E64732E77696474682C31297D7D29293B627265616B3B6361736520313A512E7765626B6974546578745374726F6B6557696474682626742E746578742E7472696D28292E6C656E6774682626286F2E63';
wwv_flow_imp.g_varchar2_table(1761) := '74782E7374726F6B655374796C653D696528512E7765626B6974546578745374726F6B65436F6C6F72292C6F2E6374782E6C696E6557696474683D512E7765626B6974546578745374726F6B6557696474682C6F2E6374782E6C696E654A6F696E3D7769';
wwv_flow_imp.g_varchar2_table(1762) := '6E646F772E6368726F6D653F226D69746572223A22726F756E64222C6F2E6374782E7374726F6B655465787428742E746578742C742E626F756E64732E6C6566742C742E626F756E64732E746F702B4229292C6F2E6374782E7374726F6B655374796C65';
wwv_flow_imp.g_varchar2_table(1763) := '3D22222C6F2E6374782E6C696E6557696474683D302C6F2E6374782E6C696E654A6F696E3D226D69746572227D7D297D292C5B325D7D297D297D2C44732E70726F746F747970652E72656E6465725265706C61636564456C656D656E743D66756E637469';
wwv_flow_imp.g_varchar2_table(1764) := '6F6E28412C652C74297B76617220723B742626303C412E696E7472696E73696357696474682626303C412E696E7472696E736963486569676874262628723D6C732841292C653D72732865292C746869732E706174682865292C746869732E6374782E73';
wwv_flow_imp.g_varchar2_table(1765) := '61766528292C746869732E6374782E636C697028292C746869732E6374782E64726177496D61676528742C302C302C412E696E7472696E73696357696474682C412E696E7472696E7369634865696768742C722E6C6566742C722E746F702C722E776964';
wwv_flow_imp.g_varchar2_table(1766) := '74682C722E686569676874292C746869732E6374782E726573746F72652829297D2C44732E70726F746F747970652E72656E6465724E6F6465436F6E74656E743D66756E6374696F6E2877297B72657475726E206128746869732C766F696420302C766F';
wwv_flow_imp.g_varchar2_table(1767) := '696420302C66756E6374696F6E28297B76617220652C742C722C422C6E2C732C6F2C692C512C632C612C673B72657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B6361736520303A746869732E6170';
wwv_flow_imp.g_varchar2_table(1768) := '706C794566666563747328772E67657445666665637473283429292C653D772E636F6E7461696E65722C743D772E6375727665732C723D652E7374796C65732C423D302C6E3D652E746578744E6F6465732C412E6C6162656C3D313B6361736520313A72';
wwv_flow_imp.g_varchar2_table(1769) := '657475726E20423C6E2E6C656E6774683F28733D6E5B425D2C5B342C746869732E72656E646572546578744E6F646528732C72295D293A5B332C345D3B6361736520323A412E73656E7428292C412E6C6162656C3D333B6361736520333A72657475726E';
wwv_flow_imp.g_varchar2_table(1770) := '20422B2B2C5B332C315D3B6361736520343A69662821286520696E7374616E63656F66207442292972657475726E5B332C385D3B412E6C6162656C3D353B6361736520353A72657475726E20412E747279732E70757368285B352C372C2C385D292C5B34';
wwv_flow_imp.g_varchar2_table(1771) := '2C746869732E636F6E746578742E63616368652E6D6174636828652E737263295D3B6361736520363A72657475726E20513D412E73656E7428292C746869732E72656E6465725265706C61636564456C656D656E7428652C742C51292C5B332C385D3B63';
wwv_flow_imp.g_varchar2_table(1772) := '61736520373A72657475726E20412E73656E7428292C746869732E636F6E746578742E6C6F676765722E6572726F7228224572726F72206C6F6164696E6720696D61676520222B652E737263292C5B332C385D3B6361736520383A6966286520696E7374';
wwv_flow_imp.g_varchar2_table(1773) := '616E63656F66206E422626746869732E72656E6465725265706C61636564456C656D656E7428652C742C652E63616E766173292C21286520696E7374616E63656F66206942292972657475726E5B332C31325D3B412E6C6162656C3D393B636173652039';
wwv_flow_imp.g_varchar2_table(1774) := '3A72657475726E20412E747279732E70757368285B392C31312C2C31325D292C5B342C746869732E636F6E746578742E63616368652E6D6174636828652E737667295D3B636173652031303A72657475726E20513D412E73656E7428292C746869732E72';
wwv_flow_imp.g_varchar2_table(1775) := '656E6465725265706C61636564456C656D656E7428652C742C51292C5B332C31325D3B636173652031313A72657475726E20412E73656E7428292C746869732E636F6E746578742E6C6F676765722E6572726F7228224572726F72206C6F6164696E6720';
wwv_flow_imp.g_varchar2_table(1776) := '73766720222B652E7376672E737562737472696E6728302C32353529292C5B332C31325D3B636173652031323A72657475726E206520696E7374616E63656F662076422626652E747265653F5B342C6E657720447328746869732E636F6E746578742C7B';
wwv_flow_imp.g_varchar2_table(1777) := '7363616C653A746869732E6F7074696F6E732E7363616C652C6261636B67726F756E64436F6C6F723A652E6261636B67726F756E64436F6C6F722C783A302C793A302C77696474683A652E77696474682C6865696768743A652E6865696768747D292E72';
wwv_flow_imp.g_varchar2_table(1778) := '656E64657228652E74726565295D3A5B332C31345D3B636173652031333A733D412E73656E7428292C652E77696474682626652E6865696768742626746869732E6374782E64726177496D61676528732C302C302C652E77696474682C652E6865696768';
wwv_flow_imp.g_varchar2_table(1779) := '742C652E626F756E64732E6C6566742C652E626F756E64732E746F702C652E626F756E64732E77696474682C652E626F756E64732E686569676874292C412E6C6162656C3D31343B636173652031343A6966286520696E7374616E63656F662070422626';
wwv_flow_imp.g_varchar2_table(1780) := '28693D4D6174682E6D696E28652E626F756E64732E77696474682C652E626F756E64732E686569676874292C652E747970653D3D3D68423F652E636865636B6564262628746869732E6374782E7361766528292C746869732E70617468285B6E6577205A';
wwv_flow_imp.g_varchar2_table(1781) := '6E28652E626F756E64732E6C6566742B2E33393336332A692C652E626F756E64732E746F702B2E37392A69292C6E6577205A6E28652E626F756E64732E6C6566742B2E31362A692C652E626F756E64732E746F702B2E353534392A69292C6E6577205A6E';
wwv_flow_imp.g_varchar2_table(1782) := '28652E626F756E64732E6C6566742B2E32373334372A692C652E626F756E64732E746F702B2E34343037312A69292C6E6577205A6E28652E626F756E64732E6C6566742B2E33393639342A692C652E626F756E64732E746F702B2E353634392A69292C6E';
wwv_flow_imp.g_varchar2_table(1783) := '6577205A6E28652E626F756E64732E6C6566742B2E37323938332A692C652E626F756E64732E746F702B2E32332A69292C6E6577205A6E28652E626F756E64732E6C6566742B2E38342A692C652E626F756E64732E746F702B2E33343038352A69292C6E';
wwv_flow_imp.g_varchar2_table(1784) := '6577205A6E28652E626F756E64732E6C6566742B2E33393336332A692C652E626F756E64732E746F702B2E37392A69295D292C746869732E6374782E66696C6C5374796C653D6965284842292C746869732E6374782E66696C6C28292C746869732E6374';
wwv_flow_imp.g_varchar2_table(1785) := '782E726573746F72652829293A652E747970653D3D3D64422626652E636865636B6564262628746869732E6374782E7361766528292C746869732E6374782E626567696E5061746828292C746869732E6374782E61726328652E626F756E64732E6C6566';
wwv_flow_imp.g_varchar2_table(1786) := '742B692F322C652E626F756E64732E746F702B692F322C692F342C302C322A4D6174682E50492C2130292C746869732E6374782E66696C6C5374796C653D6965284842292C746869732E6374782E66696C6C28292C746869732E6374782E726573746F72';
wwv_flow_imp.g_varchar2_table(1787) := '65282929292C78732865292626652E76616C75652E6C656E677468297B73776974636828633D746869732E637265617465466F6E745374796C652872292C613D635B305D2C693D635B315D2C633D746869732E666F6E744D6574726963732E6765744D65';
wwv_flow_imp.g_varchar2_table(1788) := '747269637328612C69292E626173656C696E652C746869732E6374782E666F6E743D612C746869732E6374782E66696C6C5374796C653D696528722E636F6C6F72292C746869732E6374782E74657874426173656C696E653D22616C7068616265746963';
wwv_flow_imp.g_varchar2_table(1789) := '222C746869732E6374782E74657874416C69676E3D537328652E7374796C65732E74657874416C69676E292C673D6C732865292C6F3D302C652E7374796C65732E74657874416C69676E297B6361736520313A6F2B3D672E77696474682F323B62726561';
wwv_flow_imp.g_varchar2_table(1790) := '6B3B6361736520323A6F2B3D672E77696474687D693D672E616464286F2C302C302C2D672E6865696768742F322B31292C746869732E6374782E7361766528292C746869732E70617468285B6E6577205A6E28672E6C6566742C672E746F70292C6E6577';
wwv_flow_imp.g_varchar2_table(1791) := '205A6E28672E6C6566742B672E77696474682C672E746F70292C6E6577205A6E28672E6C6566742B672E77696474682C672E746F702B672E686569676874292C6E6577205A6E28672E6C6566742C672E746F702B672E686569676874295D292C74686973';
wwv_flow_imp.g_varchar2_table(1792) := '2E6374782E636C697028292C746869732E72656E64657254657874576974684C657474657253706163696E67286E6577204A7228652E76616C75652C69292C722E6C657474657253706163696E672C63292C746869732E6374782E726573746F72652829';
wwv_flow_imp.g_varchar2_table(1793) := '2C746869732E6374782E74657874426173656C696E653D22616C7068616265746963222C746869732E6374782E74657874416C69676E3D226C656674227D69662821507428652E7374796C65732E646973706C61792C32303438292972657475726E5B33';
wwv_flow_imp.g_varchar2_table(1794) := '2C32305D3B6966286E756C6C3D3D3D652E7374796C65732E6C6973745374796C65496D6167652972657475726E5B332C31395D3B69662830213D3D28633D652E7374796C65732E6C6973745374796C65496D616765292E747970652972657475726E5B33';
wwv_flow_imp.g_varchar2_table(1795) := '2C31385D3B513D766F696420302C633D632E75726C2C412E6C6162656C3D31353B636173652031353A72657475726E20412E747279732E70757368285B31352C31372C2C31385D292C5B342C746869732E636F6E746578742E63616368652E6D61746368';
wwv_flow_imp.g_varchar2_table(1796) := '2863295D3B636173652031363A72657475726E20513D412E73656E7428292C746869732E6374782E64726177496D61676528512C652E626F756E64732E6C6566742D28512E77696474682B3130292C652E626F756E64732E746F70292C5B332C31385D3B';
wwv_flow_imp.g_varchar2_table(1797) := '636173652031373A72657475726E20412E73656E7428292C746869732E636F6E746578742E6C6F676765722E6572726F7228224572726F72206C6F6164696E67206C6973742D7374796C652D696D61676520222B63292C5B332C31385D3B636173652031';
wwv_flow_imp.g_varchar2_table(1798) := '383A72657475726E5B332C32305D3B636173652031393A772E6C69737456616C756526262D31213D3D652E7374796C65732E6C6973745374796C6554797065262628613D746869732E637265617465466F6E745374796C652872295B305D2C746869732E';
wwv_flow_imp.g_varchar2_table(1799) := '6374782E666F6E743D612C746869732E6374782E66696C6C5374796C653D696528722E636F6C6F72292C746869732E6374782E74657874426173656C696E653D226D6964646C65222C746869732E6374782E74657874416C69676E3D227269676874222C';
wwv_flow_imp.g_varchar2_table(1800) := '673D6E6577206428652E626F756E64732E6C6566742C652E626F756E64732E746F702B556528652E7374796C65732E70616464696E67546F702C652E626F756E64732E7769647468292C652E626F756E64732E77696474682C596528722E6C696E654865';
wwv_flow_imp.g_varchar2_table(1801) := '696768742C722E666F6E7453697A652E6E756D626572292F322B31292C746869732E72656E64657254657874576974684C657474657253706163696E67286E6577204A7228772E6C69737456616C75652C67292C722E6C657474657253706163696E672C';
wwv_flow_imp.g_varchar2_table(1802) := '596528722E6C696E654865696768742C722E666F6E7453697A652E6E756D626572292F322B32292C746869732E6374782E74657874426173656C696E653D22626F74746F6D222C746869732E6374782E74657874416C69676E3D226C65667422292C412E';
wwv_flow_imp.g_varchar2_table(1803) := '6C6162656C3D32303B636173652032303A72657475726E5B325D7D7D297D297D2C44732E70726F746F747970652E72656E646572537461636B436F6E74656E743D66756E6374696F6E2843297B72657475726E206128746869732C766F696420302C766F';
wwv_flow_imp.g_varchar2_table(1804) := '696420302C66756E6374696F6E28297B76617220652C742C722C422C6E2C732C6F2C692C512C632C612C672C772C552C6C3B72657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B6361736520303A72';
wwv_flow_imp.g_varchar2_table(1805) := '657475726E20507428432E656C656D656E742E636F6E7461696E65722E666C6167732C3136292C5B342C746869732E72656E6465724E6F64654261636B67726F756E64416E64426F726465727328432E656C656D656E74295D3B6361736520313A412E73';
wwv_flow_imp.g_varchar2_table(1806) := '656E7428292C653D302C743D432E6E656761746976655A496E6465782C412E6C6162656C3D323B6361736520323A72657475726E20653C742E6C656E6774683F286C3D745B655D2C5B342C746869732E72656E646572537461636B286C295D293A5B332C';
wwv_flow_imp.g_varchar2_table(1807) := '355D3B6361736520333A412E73656E7428292C412E6C6162656C3D343B6361736520343A72657475726E20652B2B2C5B332C325D3B6361736520353A72657475726E5B342C746869732E72656E6465724E6F6465436F6E74656E7428432E656C656D656E';
wwv_flow_imp.g_varchar2_table(1808) := '74295D3B6361736520363A412E73656E7428292C723D302C423D432E6E6F6E496E6C696E654C6576656C2C412E6C6162656C3D373B6361736520373A72657475726E20723C422E6C656E6774683F286C3D425B725D2C5B342C746869732E72656E646572';
wwv_flow_imp.g_varchar2_table(1809) := '4E6F6465286C295D293A5B332C31305D3B6361736520383A412E73656E7428292C412E6C6162656C3D393B6361736520393A72657475726E20722B2B2C5B332C375D3B636173652031303A6E3D302C733D432E6E6F6E506F736974696F6E6564466C6F61';
wwv_flow_imp.g_varchar2_table(1810) := '74732C412E6C6162656C3D31313B636173652031313A72657475726E206E3C732E6C656E6774683F286C3D735B6E5D2C5B342C746869732E72656E646572537461636B286C295D293A5B332C31345D3B636173652031323A412E73656E7428292C412E6C';
wwv_flow_imp.g_varchar2_table(1811) := '6162656C3D31333B636173652031333A72657475726E206E2B2B2C5B332C31315D3B636173652031343A6F3D302C693D432E6E6F6E506F736974696F6E6564496E6C696E654C6576656C2C412E6C6162656C3D31353B636173652031353A72657475726E';
wwv_flow_imp.g_varchar2_table(1812) := '206F3C692E6C656E6774683F286C3D695B6F5D2C5B342C746869732E72656E646572537461636B286C295D293A5B332C31385D3B636173652031363A412E73656E7428292C412E6C6162656C3D31373B636173652031373A72657475726E206F2B2B2C5B';
wwv_flow_imp.g_varchar2_table(1813) := '332C31355D3B636173652031383A513D302C633D432E696E6C696E654C6576656C2C412E6C6162656C3D31393B636173652031393A72657475726E20513C632E6C656E6774683F286C3D635B515D2C5B342C746869732E72656E6465724E6F6465286C29';
wwv_flow_imp.g_varchar2_table(1814) := '5D293A5B332C32325D3B636173652032303A412E73656E7428292C412E6C6162656C3D32313B636173652032313A72657475726E20512B2B2C5B332C31395D3B636173652032323A613D302C673D432E7A65726F4F724175746F5A496E6465784F725472';
wwv_flow_imp.g_varchar2_table(1815) := '616E73666F726D65644F724F7061636974792C412E6C6162656C3D32333B636173652032333A72657475726E20613C672E6C656E6774683F286C3D675B615D2C5B342C746869732E72656E646572537461636B286C295D293A5B332C32365D3B63617365';
wwv_flow_imp.g_varchar2_table(1816) := '2032343A412E73656E7428292C412E6C6162656C3D32353B636173652032353A72657475726E20612B2B2C5B332C32335D3B636173652032363A773D302C553D432E706F7369746976655A496E6465782C412E6C6162656C3D32373B636173652032373A';
wwv_flow_imp.g_varchar2_table(1817) := '72657475726E20773C552E6C656E6774683F286C3D555B775D2C5B342C746869732E72656E646572537461636B286C295D293A5B332C33305D3B636173652032383A412E73656E7428292C412E6C6162656C3D32393B636173652032393A72657475726E';
wwv_flow_imp.g_varchar2_table(1818) := '20772B2B2C5B332C32375D3B636173652033303A72657475726E5B325D7D7D297D297D2C44732E70726F746F747970652E6D61736B3D66756E6374696F6E2841297B746869732E6374782E626567696E5061746828292C746869732E6374782E6D6F7665';
wwv_flow_imp.g_varchar2_table(1819) := '546F28302C30292C746869732E6374782E6C696E65546F28746869732E63616E7661732E77696474682C30292C746869732E6374782E6C696E65546F28746869732E63616E7661732E77696474682C746869732E63616E7661732E686569676874292C74';
wwv_flow_imp.g_varchar2_table(1820) := '6869732E6374782E6C696E65546F28302C746869732E63616E7661732E686569676874292C746869732E6374782E6C696E65546F28302C30292C746869732E666F726D61745061746828412E736C6963652830292E726576657273652829292C74686973';
wwv_flow_imp.g_varchar2_table(1821) := '2E6374782E636C6F73655061746828297D2C44732E70726F746F747970652E706174683D66756E6374696F6E2841297B746869732E6374782E626567696E5061746828292C746869732E666F726D6174506174682841292C746869732E6374782E636C6F';
wwv_flow_imp.g_varchar2_table(1822) := '73655061746828297D2C44732E70726F746F747970652E666F726D6174506174683D66756E6374696F6E2841297B76617220723D746869733B412E666F72456163682866756E6374696F6E28412C65297B76617220743D246E2841293F412E7374617274';
wwv_flow_imp.g_varchar2_table(1823) := '3A413B303D3D3D653F722E6374782E6D6F7665546F28742E782C742E79293A722E6374782E6C696E65546F28742E782C742E79292C246E2841292626722E6374782E62657A6965724375727665546F28412E7374617274436F6E74726F6C2E782C412E73';
wwv_flow_imp.g_varchar2_table(1824) := '74617274436F6E74726F6C2E792C412E656E64436F6E74726F6C2E782C412E656E64436F6E74726F6C2E792C412E656E642E782C412E656E642E79297D297D2C44732E70726F746F747970652E72656E6465725265706561743D66756E6374696F6E2841';
wwv_flow_imp.g_varchar2_table(1825) := '2C652C742C72297B746869732E706174682841292C746869732E6374782E66696C6C5374796C653D652C746869732E6374782E7472616E736C61746528742C72292C746869732E6374782E66696C6C28292C746869732E6374782E7472616E736C617465';
wwv_flow_imp.g_varchar2_table(1826) := '282D742C2D72297D2C44732E70726F746F747970652E726573697A65496D6167653D66756E6374696F6E28412C652C74297B696628412E77696474683D3D3D652626412E6865696768743D3D3D742972657475726E20413B76617220723D286E756C6C21';
wwv_flow_imp.g_varchar2_table(1827) := '3D3D28723D746869732E63616E7661732E6F776E6572446F63756D656E74292626766F69642030213D3D723F723A646F63756D656E74292E637265617465456C656D656E74282263616E76617322293B72657475726E20722E77696474683D4D6174682E';
wwv_flow_imp.g_varchar2_table(1828) := '6D617828312C65292C722E6865696768743D4D6174682E6D617828312C74292C722E676574436F6E746578742822326422292E64726177496D61676528412C302C302C412E77696474682C412E6865696768742C302C302C652C74292C727D2C44732E70';
wwv_flow_imp.g_varchar2_table(1829) := '726F746F747970652E72656E6465724261636B67726F756E64496D6167653D66756E6374696F6E2866297B72657475726E206128746869732C766F696420302C766F696420302C66756E6374696F6E28297B76617220682C652C642C742C722C423B7265';
wwv_flow_imp.g_varchar2_table(1830) := '7475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B6361736520303A683D662E7374796C65732E6261636B67726F756E64496D6167652E6C656E6774682D312C653D66756E6374696F6E2865297B766172';
wwv_flow_imp.g_varchar2_table(1831) := '20742C722C422C6E2C732C6F2C692C512C632C612C672C772C552C6C2C432C752C463B72657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B6361736520303A69662830213D3D652E74797065297265';
wwv_flow_imp.g_varchar2_table(1832) := '7475726E5B332C355D3B743D766F696420302C723D652E75726C2C412E6C6162656C3D313B6361736520313A72657475726E20412E747279732E70757368285B312C332C2C345D292C5B342C642E636F6E746578742E63616368652E6D61746368287229';
wwv_flow_imp.g_varchar2_table(1833) := '5D3B6361736520323A72657475726E20743D412E73656E7428292C5B332C345D3B6361736520333A72657475726E20412E73656E7428292C642E636F6E746578742E6C6F676765722E6572726F7228224572726F72206C6F6164696E67206261636B6772';
wwv_flow_imp.g_varchar2_table(1834) := '6F756E642D696D61676520222B72292C5B332C345D3B6361736520343A72657475726E2074262628423D437328662C682C5B742E77696474682C742E6865696768742C742E77696474682F742E6865696768745D292C6F3D425B305D2C673D425B315D2C';
wwv_flow_imp.g_varchar2_table(1835) := '773D425B325D2C633D425B335D2C613D425B345D2C733D642E6374782E6372656174655061747465726E28642E726573697A65496D61676528742C632C61292C2272657065617422292C642E72656E646572526570656174286F2C732C672C7729292C5B';
wwv_flow_imp.g_varchar2_table(1836) := '332C365D3B6361736520353A313D3D3D652E747970653F28463D437328662C682C5B6E756C6C2C6E756C6C2C6E756C6C5D292C6F3D465B305D2C673D465B315D2C773D465B325D2C633D465B335D2C613D465B345D2C433D456528652E616E676C652C63';
wwv_flow_imp.g_varchar2_table(1837) := '2C61292C6C3D435B305D2C423D435B315D2C693D435B325D2C753D435B335D2C513D435B345D2C28463D646F63756D656E742E637265617465456C656D656E74282263616E7661732229292E77696474683D632C462E6865696768743D612C433D462E67';
wwv_flow_imp.g_varchar2_table(1838) := '6574436F6E746578742822326422292C6E3D432E6372656174654C696E6561724772616469656E7428422C752C692C51292C706528652E73746F70732C6C292E666F72456163682866756E6374696F6E2841297B72657475726E206E2E616464436F6C6F';
wwv_flow_imp.g_varchar2_table(1839) := '7253746F7028412E73746F702C696528412E636F6C6F7229297D292C432E66696C6C5374796C653D6E2C432E66696C6C5265637428302C302C632C61292C303C632626303C61262628733D642E6374782E6372656174655061747465726E28462C227265';
wwv_flow_imp.g_varchar2_table(1840) := '7065617422292C642E72656E646572526570656174286F2C732C672C772929293A323D3D3D652E74797065262628753D437328662C682C5B6E756C6C2C6E756C6C2C6E756C6C5D292C6F3D755B305D2C693D755B315D2C513D755B325D2C633D755B335D';
wwv_flow_imp.g_varchar2_table(1841) := '2C613D755B345D2C6C3D303D3D3D652E706F736974696F6E2E6C656E6774683F5B67655D3A652E706F736974696F6E2C673D5565286C5B305D2C63292C773D5565286C5B6C2E6C656E6774682D315D2C61292C433D66756E6374696F6E28412C652C742C';
wwv_flow_imp.g_varchar2_table(1842) := '722C42297B766172206E2C732C6F2C692C513D302C633D303B73776974636828412E73697A65297B6361736520303A303D3D3D412E73686170653F513D633D4D6174682E6D696E284D6174682E6162732865292C4D6174682E61627328652D72292C4D61';
wwv_flow_imp.g_varchar2_table(1843) := '74682E6162732874292C4D6174682E61627328742D4229293A313D3D3D412E7368617065262628513D4D6174682E6D696E284D6174682E6162732865292C4D6174682E61627328652D7229292C633D4D6174682E6D696E284D6174682E6162732874292C';
wwv_flow_imp.g_varchar2_table(1844) := '4D6174682E61627328742D422929293B627265616B3B6361736520323A303D3D3D412E73686170653F513D633D4D6174682E6D696E28496528652C74292C496528652C742D42292C496528652D722C74292C496528652D722C742D4229293A313D3D3D41';
wwv_flow_imp.g_varchar2_table(1845) := '2E73686170652626286E3D4D6174682E6D696E284D6174682E6162732874292C4D6174682E61627328742D4229292F4D6174682E6D696E284D6174682E6162732865292C4D6174682E61627328652D7229292C6F3D28733D796528722C422C652C742C21';
wwv_flow_imp.g_varchar2_table(1846) := '3029295B305D2C693D735B315D2C633D6E2A28513D4965286F2D652C28692D74292F6E2929293B627265616B3B6361736520313A303D3D3D412E73686170653F513D633D4D6174682E6D6178284D6174682E6162732865292C4D6174682E61627328652D';
wwv_flow_imp.g_varchar2_table(1847) := '72292C4D6174682E6162732874292C4D6174682E61627328742D4229293A313D3D3D412E7368617065262628513D4D6174682E6D6178284D6174682E6162732865292C4D6174682E61627328652D7229292C633D4D6174682E6D6178284D6174682E6162';
wwv_flow_imp.g_varchar2_table(1848) := '732874292C4D6174682E61627328742D422929293B627265616B3B6361736520333A303D3D3D412E73686170653F513D633D4D6174682E6D617828496528652C74292C496528652C742D42292C496528652D722C74292C496528652D722C742D4229293A';
wwv_flow_imp.g_varchar2_table(1849) := '313D3D3D412E73686170652626286E3D4D6174682E6D6178284D6174682E6162732874292C4D6174682E61627328742D4229292F4D6174682E6D6178284D6174682E6162732865292C4D6174682E61627328652D7229292C6F3D28733D796528722C422C';
wwv_flow_imp.g_varchar2_table(1850) := '652C742C213129295B305D2C693D735B315D2C633D6E2A28513D4965286F2D652C28692D74292F6E2929297D72657475726E2041727261792E6973417272617928412E73697A6529262628513D556528412E73697A655B305D2C72292C633D323D3D3D41';
wwv_flow_imp.g_varchar2_table(1851) := '2E73697A652E6C656E6774683F556528412E73697A655B315D2C42293A51292C5B512C635D7D28652C672C772C632C61292C463D435B305D2C753D435B315D2C303C462626303C75262628553D642E6374782E63726561746552616469616C4772616469';
wwv_flow_imp.g_varchar2_table(1852) := '656E7428692B672C512B772C302C692B672C512B772C46292C706528652E73746F70732C322A46292E666F72456163682866756E6374696F6E2841297B72657475726E20552E616464436F6C6F7253746F7028412E73746F702C696528412E636F6C6F72';
wwv_flow_imp.g_varchar2_table(1853) := '29297D292C642E70617468286F292C642E6374782E66696C6C5374796C653D552C46213D3D753F286C3D662E626F756E64732E6C6566742B2E352A662E626F756E64732E77696474682C433D662E626F756E64732E746F702B2E352A662E626F756E6473';
wwv_flow_imp.g_varchar2_table(1854) := '2E6865696768742C463D312F28753D752F46292C642E6374782E7361766528292C642E6374782E7472616E736C617465286C2C43292C642E6374782E7472616E73666F726D28312C302C302C752C302C30292C642E6374782E7472616E736C617465282D';
wwv_flow_imp.g_varchar2_table(1855) := '6C2C2D43292C642E6374782E66696C6C5265637428692C462A28512D43292B432C632C612A46292C642E6374782E726573746F72652829293A642E6374782E66696C6C282929292C412E6C6162656C3D363B6361736520363A72657475726E20682D2D2C';
wwv_flow_imp.g_varchar2_table(1856) := '5B325D7D7D297D2C643D746869732C743D302C723D662E7374796C65732E6261636B67726F756E64496D6167652E736C6963652830292E7265766572736528292C412E6C6162656C3D313B6361736520313A72657475726E20743C722E6C656E6774683F';
wwv_flow_imp.g_varchar2_table(1857) := '28423D725B745D2C5B352C652842295D293A5B332C345D3B6361736520323A412E73656E7428292C412E6C6162656C3D333B6361736520333A72657475726E20742B2B2C5B332C315D3B6361736520343A72657475726E5B325D7D7D297D297D2C44732E';
wwv_flow_imp.g_varchar2_table(1858) := '70726F746F747970652E72656E646572536F6C6964426F726465723D66756E6374696F6E28652C742C72297B72657475726E206128746869732C766F696420302C766F696420302C66756E6374696F6E28297B72657475726E204828746869732C66756E';
wwv_flow_imp.g_varchar2_table(1859) := '6374696F6E2841297B72657475726E20746869732E7061746828777328722C7429292C746869732E6374782E66696C6C5374796C653D69652865292C746869732E6374782E66696C6C28292C5B325D7D297D297D2C44732E70726F746F747970652E7265';
wwv_flow_imp.g_varchar2_table(1860) := '6E646572446F75626C65426F726465723D66756E6374696F6E28742C722C422C6E297B72657475726E206128746869732C766F696420302C766F696420302C66756E6374696F6E28297B76617220653B72657475726E204828746869732C66756E637469';
wwv_flow_imp.g_varchar2_table(1861) := '6F6E2841297B73776974636828412E6C6162656C297B6361736520303A72657475726E20723C333F5B342C746869732E72656E646572536F6C6964426F7264657228742C422C6E295D3A5B332C325D3B6361736520313A72657475726E20412E73656E74';
wwv_flow_imp.g_varchar2_table(1862) := '28292C5B325D3B6361736520323A72657475726E20653D66756E6374696F6E28412C65297B7377697463682865297B6361736520303A72657475726E20487328412E746F704C656674426F72646572426F782C412E746F704C656674426F72646572446F';
wwv_flow_imp.g_varchar2_table(1863) := '75626C654F75746572426F782C412E746F705269676874426F72646572426F782C412E746F705269676874426F72646572446F75626C654F75746572426F78293B6361736520313A72657475726E20487328412E746F705269676874426F72646572426F';
wwv_flow_imp.g_varchar2_table(1864) := '782C412E746F705269676874426F72646572446F75626C654F75746572426F782C412E626F74746F6D5269676874426F72646572426F782C412E626F74746F6D5269676874426F72646572446F75626C654F75746572426F78293B6361736520323A7265';
wwv_flow_imp.g_varchar2_table(1865) := '7475726E20487328412E626F74746F6D5269676874426F72646572426F782C412E626F74746F6D5269676874426F72646572446F75626C654F75746572426F782C412E626F74746F6D4C656674426F72646572426F782C412E626F74746F6D4C65667442';
wwv_flow_imp.g_varchar2_table(1866) := '6F72646572446F75626C654F75746572426F78293B64656661756C743A72657475726E20487328412E626F74746F6D4C656674426F72646572426F782C412E626F74746F6D4C656674426F72646572446F75626C654F75746572426F782C412E746F704C';
wwv_flow_imp.g_varchar2_table(1867) := '656674426F72646572426F782C412E746F704C656674426F72646572446F75626C654F75746572426F78297D7D286E2C42292C746869732E706174682865292C746869732E6374782E66696C6C5374796C653D69652874292C746869732E6374782E6669';
wwv_flow_imp.g_varchar2_table(1868) := '6C6C28292C653D66756E6374696F6E28412C65297B7377697463682865297B6361736520303A72657475726E20487328412E746F704C656674426F72646572446F75626C65496E6E6572426F782C412E746F704C65667450616464696E67426F782C412E';
wwv_flow_imp.g_varchar2_table(1869) := '746F705269676874426F72646572446F75626C65496E6E6572426F782C412E746F70526967687450616464696E67426F78293B6361736520313A72657475726E20487328412E746F705269676874426F72646572446F75626C65496E6E6572426F782C41';
wwv_flow_imp.g_varchar2_table(1870) := '2E746F70526967687450616464696E67426F782C412E626F74746F6D5269676874426F72646572446F75626C65496E6E6572426F782C412E626F74746F6D526967687450616464696E67426F78293B6361736520323A72657475726E20487328412E626F';
wwv_flow_imp.g_varchar2_table(1871) := '74746F6D5269676874426F72646572446F75626C65496E6E6572426F782C412E626F74746F6D526967687450616464696E67426F782C412E626F74746F6D4C656674426F72646572446F75626C65496E6E6572426F782C412E626F74746F6D4C65667450';
wwv_flow_imp.g_varchar2_table(1872) := '616464696E67426F78293B64656661756C743A72657475726E20487328412E626F74746F6D4C656674426F72646572446F75626C65496E6E6572426F782C412E626F74746F6D4C65667450616464696E67426F782C412E746F704C656674426F72646572';
wwv_flow_imp.g_varchar2_table(1873) := '446F75626C65496E6E6572426F782C412E746F704C65667450616464696E67426F78297D7D286E2C42292C746869732E706174682865292C746869732E6374782E66696C6C28292C5B325D7D7D297D297D2C44732E70726F746F747970652E72656E6465';
wwv_flow_imp.g_varchar2_table(1874) := '724E6F64654261636B67726F756E64416E64426F72646572733D66756E6374696F6E2863297B72657475726E206128746869732C766F696420302C766F696420302C66756E6374696F6E28297B76617220652C742C722C422C6E2C732C6F2C692C513D74';
wwv_flow_imp.g_varchar2_table(1875) := '6869733B72657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B6361736520303A72657475726E28746869732E6170706C794566666563747328632E67657445666665637473283229292C653D632E63';
wwv_flow_imp.g_varchar2_table(1876) := '6F6E7461696E65722E7374796C65732C743D216F6528652E6261636B67726F756E64436F6C6F72297C7C652E6261636B67726F756E64496D6167652E6C656E6774682C723D5B7B7374796C653A652E626F72646572546F705374796C652C636F6C6F723A';
wwv_flow_imp.g_varchar2_table(1877) := '652E626F72646572546F70436F6C6F722C77696474683A652E626F72646572546F7057696474687D2C7B7374796C653A652E626F7264657252696768745374796C652C636F6C6F723A652E626F726465725269676874436F6C6F722C77696474683A652E';
wwv_flow_imp.g_varchar2_table(1878) := '626F72646572526967687457696474687D2C7B7374796C653A652E626F72646572426F74746F6D5374796C652C636F6C6F723A652E626F72646572426F74746F6D436F6C6F722C77696474683A652E626F72646572426F74746F6D57696474687D2C7B73';
wwv_flow_imp.g_varchar2_table(1879) := '74796C653A652E626F726465724C6566745374796C652C636F6C6F723A652E626F726465724C656674436F6C6F722C77696474683A652E626F726465724C65667457696474687D5D2C423D4D7328457328652E6261636B67726F756E64436C69702C3029';
wwv_flow_imp.g_varchar2_table(1880) := '2C632E637572766573292C747C7C652E626F78536861646F772E6C656E677468293F28746869732E6374782E7361766528292C746869732E706174682842292C746869732E6374782E636C697028292C6F6528652E6261636B67726F756E64436F6C6F72';
wwv_flow_imp.g_varchar2_table(1881) := '297C7C28746869732E6374782E66696C6C5374796C653D696528652E6261636B67726F756E64436F6C6F72292C746869732E6374782E66696C6C2829292C5B342C746869732E72656E6465724261636B67726F756E64496D61676528632E636F6E746169';
wwv_flow_imp.g_varchar2_table(1882) := '6E6572295D293A5B332C325D3B6361736520313A412E73656E7428292C746869732E6374782E726573746F726528292C652E626F78536861646F772E736C6963652830292E7265766572736528292E666F72456163682866756E6374696F6E2841297B51';
wwv_flow_imp.g_varchar2_table(1883) := '2E6374782E7361766528293B76617220742C722C422C6E2C653D747328632E637572766573292C733D412E696E7365743F303A3165342C6F3D28743D2D732B28412E696E7365743F313A2D31292A412E7370726561642E6E756D6265722C723D28412E69';
wwv_flow_imp.g_varchar2_table(1884) := '6E7365743F313A2D31292A412E7370726561642E6E756D6265722C423D412E7370726561642E6E756D6265722A28412E696E7365743F2D323A32292C6E3D412E7370726561642E6E756D6265722A28412E696E7365743F2D323A32292C652E6D61702866';
wwv_flow_imp.g_varchar2_table(1885) := '756E6374696F6E28412C65297B7377697463682865297B6361736520303A72657475726E20412E61646428742C72293B6361736520313A72657475726E20412E61646428742B422C72293B6361736520323A72657475726E20412E61646428742B422C72';
wwv_flow_imp.g_varchar2_table(1886) := '2B6E293B6361736520333A72657475726E20412E61646428742C722B6E297D72657475726E20417D29293B412E696E7365743F28512E706174682865292C512E6374782E636C697028292C512E6D61736B286F29293A28512E6D61736B2865292C512E63';
wwv_flow_imp.g_varchar2_table(1887) := '74782E636C697028292C512E70617468286F29292C512E6374782E736861646F774F6666736574583D412E6F6666736574582E6E756D6265722B732C512E6374782E736861646F774F6666736574593D412E6F6666736574592E6E756D6265722C512E63';
wwv_flow_imp.g_varchar2_table(1888) := '74782E736861646F77436F6C6F723D696528412E636F6C6F72292C512E6374782E736861646F77426C75723D412E626C75722E6E756D6265722C512E6374782E66696C6C5374796C653D412E696E7365743F696528412E636F6C6F72293A227267626128';
wwv_flow_imp.g_varchar2_table(1889) := '302C302C302C3129222C512E6374782E66696C6C28292C512E6374782E726573746F726528297D292C412E6C6162656C3D323B6361736520323A733D6E3D302C6F3D722C412E6C6162656C3D333B6361736520333A72657475726E20733C6F2E6C656E67';
wwv_flow_imp.g_varchar2_table(1890) := '74683F30213D3D28693D6F5B735D292E7374796C652626216F6528692E636F6C6F72292626303C692E77696474683F32213D3D692E7374796C653F5B332C355D3A5B342C746869732E72656E646572446173686564446F74746564426F7264657228692E';
wwv_flow_imp.g_varchar2_table(1891) := '636F6C6F722C692E77696474682C6E2C632E6375727665732C32295D3A5B332C31315D3A5B332C31335D3B6361736520343A72657475726E20412E73656E7428292C5B332C31315D3B6361736520353A72657475726E2033213D3D692E7374796C653F5B';
wwv_flow_imp.g_varchar2_table(1892) := '332C375D3A5B342C746869732E72656E646572446173686564446F74746564426F7264657228692E636F6C6F722C692E77696474682C6E2C632E6375727665732C33295D3B6361736520363A72657475726E20412E73656E7428292C5B332C31315D3B63';
wwv_flow_imp.g_varchar2_table(1893) := '61736520373A72657475726E2034213D3D692E7374796C653F5B332C395D3A5B342C746869732E72656E646572446F75626C65426F7264657228692E636F6C6F722C692E77696474682C6E2C632E637572766573295D3B6361736520383A72657475726E';
wwv_flow_imp.g_varchar2_table(1894) := '20412E73656E7428292C5B332C31315D3B6361736520393A72657475726E5B342C746869732E72656E646572536F6C6964426F7264657228692E636F6C6F722C6E2C632E637572766573295D3B636173652031303A412E73656E7428292C412E6C616265';
wwv_flow_imp.g_varchar2_table(1895) := '6C3D31313B636173652031313A6E2B2B2C412E6C6162656C3D31323B636173652031323A72657475726E20732B2B2C5B332C335D3B636173652031333A72657475726E5B325D7D7D297D297D2C44732E70726F746F747970652E72656E64657244617368';
wwv_flow_imp.g_varchar2_table(1896) := '6564446F74746564426F726465723D66756E6374696F6E28672C772C552C6C2C43297B72657475726E206128746869732C766F696420302C766F696420302C66756E6374696F6E28297B76617220652C742C722C422C6E2C732C6F2C692C512C632C613B';
wwv_flow_imp.g_varchar2_table(1897) := '72657475726E204828746869732C66756E6374696F6E2841297B72657475726E20746869732E6374782E7361766528292C513D66756E6374696F6E28412C65297B7377697463682865297B6361736520303A72657475726E20667328412E746F704C6566';
wwv_flow_imp.g_varchar2_table(1898) := '74426F726465725374726F6B652C412E746F705269676874426F726465725374726F6B65293B6361736520313A72657475726E20667328412E746F705269676874426F726465725374726F6B652C412E626F74746F6D5269676874426F72646572537472';
wwv_flow_imp.g_varchar2_table(1899) := '6F6B65293B6361736520323A72657475726E20667328412E626F74746F6D5269676874426F726465725374726F6B652C412E626F74746F6D4C656674426F726465725374726F6B65293B64656661756C743A72657475726E20667328412E626F74746F6D';
wwv_flow_imp.g_varchar2_table(1900) := '4C656674426F726465725374726F6B652C412E746F704C656674426F726465725374726F6B65297D7D286C2C55292C653D7773286C2C55292C323D3D3D43262628746869732E706174682865292C746869732E6374782E636C69702829292C733D246E28';
wwv_flow_imp.g_varchar2_table(1901) := '655B305D293F28743D655B305D2E73746172742E782C655B305D2E73746172742E79293A28743D655B305D2E782C655B305D2E79292C6F3D246E28655B315D293F28723D655B315D2E656E642E782C655B315D2E656E642E79293A28723D655B315D2E78';
wwv_flow_imp.g_varchar2_table(1902) := '2C655B315D2E79292C423D303D3D3D557C7C323D3D3D553F4D6174682E61627328742D72293A4D6174682E61627328732D6F292C746869732E6374782E626567696E5061746828292C333D3D3D433F746869732E666F726D6174506174682851293A7468';
wwv_flow_imp.g_varchar2_table(1903) := '69732E666F726D61745061746828652E736C69636528302C3229292C6E3D773C333F332A773A322A772C733D773C333F322A773A772C333D3D3D43262628733D6E3D77292C6F3D21302C423C3D322A6E3F6F3D21313A423C3D322A6E2B733F286E2A3D69';
wwv_flow_imp.g_varchar2_table(1904) := '3D422F28322A6E2B73292C732A3D69293A28513D4D6174682E666C6F6F722828422B73292F286E2B7329292C693D28422D512A6E292F28512D31292C733D28513D28422D28512B31292A6E292F51293C3D307C7C4D6174682E61627328732D69293C4D61';
wwv_flow_imp.g_varchar2_table(1905) := '74682E61627328732D51293F693A51292C6F262628333D3D3D433F746869732E6374782E7365744C696E6544617368285B302C6E2B735D293A746869732E6374782E7365744C696E6544617368285B6E2C735D29292C333D3D3D433F28746869732E6374';
wwv_flow_imp.g_varchar2_table(1906) := '782E6C696E654361703D22726F756E64222C746869732E6374782E6C696E6557696474683D77293A746869732E6374782E6C696E6557696474683D322A772B312E312C746869732E6374782E7374726F6B655374796C653D69652867292C746869732E63';
wwv_flow_imp.g_varchar2_table(1907) := '74782E7374726F6B6528292C746869732E6374782E7365744C696E6544617368285B5D292C323D3D3D43262628246E28655B305D29262628633D655B335D2C613D655B305D2C746869732E6374782E626567696E5061746828292C746869732E666F726D';
wwv_flow_imp.g_varchar2_table(1908) := '617450617468285B6E6577205A6E28632E656E642E782C632E656E642E79292C6E6577205A6E28612E73746172742E782C612E73746172742E79295D292C746869732E6374782E7374726F6B652829292C246E28655B315D29262628633D655B315D2C61';
wwv_flow_imp.g_varchar2_table(1909) := '3D655B325D2C746869732E6374782E626567696E5061746828292C746869732E666F726D617450617468285B6E6577205A6E28632E656E642E782C632E656E642E79292C6E6577205A6E28612E73746172742E782C612E73746172742E79295D292C7468';
wwv_flow_imp.g_varchar2_table(1910) := '69732E6374782E7374726F6B65282929292C746869732E6374782E726573746F726528292C5B325D7D297D297D2C44732E70726F746F747970652E72656E6465723D66756E6374696F6E2842297B72657475726E206128746869732C766F696420302C76';
wwv_flow_imp.g_varchar2_table(1911) := '6F696420302C66756E6374696F6E28297B72657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B6361736520303A72657475726E20746869732E6F7074696F6E732E6261636B67726F756E64436F6C6F';
wwv_flow_imp.g_varchar2_table(1912) := '72262628746869732E6374782E66696C6C5374796C653D696528746869732E6F7074696F6E732E6261636B67726F756E64436F6C6F72292C746869732E6374782E66696C6C5265637428746869732E6F7074696F6E732E782C746869732E6F7074696F6E';
wwv_flow_imp.g_varchar2_table(1913) := '732E792C746869732E6F7074696F6E732E77696474682C746869732E6F7074696F6E732E68656967687429292C743D6E657720617328653D422C6E756C6C292C723D6E65772063732874292C687328742C722C722C653D5B5D292C647328742E636F6E74';
wwv_flow_imp.g_varchar2_table(1914) := '61696E65722C65292C5B342C746869732E72656E646572537461636B2872295D3B6361736520313A72657475726E20412E73656E7428292C746869732E6170706C7945666665637473285B5D292C5B322C746869732E63616E7661735D7D76617220652C';
wwv_flow_imp.g_varchar2_table(1915) := '742C727D297D297D2C4473293B66756E6374696F6E20447328412C65297B413D4C732E63616C6C28746869732C412C65297C7C746869733B72657475726E20412E5F616374697665456666656374733D5B5D2C412E63616E7661733D652E63616E766173';
wwv_flow_imp.g_varchar2_table(1916) := '7C7C646F63756D656E742E637265617465456C656D656E74282263616E76617322292C412E6374783D412E63616E7661732E676574436F6E746578742822326422292C652E63616E7661737C7C28412E63616E7661732E77696474683D4D6174682E666C';
wwv_flow_imp.g_varchar2_table(1917) := '6F6F7228652E77696474682A652E7363616C65292C412E63616E7661732E6865696768743D4D6174682E666C6F6F7228652E6865696768742A652E7363616C65292C412E63616E7661732E7374796C652E77696474683D652E77696474682B227078222C';
wwv_flow_imp.g_varchar2_table(1918) := '412E63616E7661732E7374796C652E6865696768743D652E6865696768742B22707822292C412E666F6E744D6574726963733D6E6577204B7328646F63756D656E74292C412E6374782E7363616C6528412E6F7074696F6E732E7363616C652C412E6F70';
wwv_flow_imp.g_varchar2_table(1919) := '74696F6E732E7363616C65292C412E6374782E7472616E736C617465282D652E782C2D652E79292C412E6374782E74657874426173656C696E653D22626F74746F6D222C412E5F616374697665456666656374733D5B5D2C412E636F6E746578742E6C6F';
wwv_flow_imp.g_varchar2_table(1920) := '676765722E6465627567282243616E7661732072656E646572657220696E697469616C697A65642028222B652E77696474682B2278222B652E6865696768742B22292077697468207363616C6520222B652E7363616C65292C417D7661722076732C7873';
wwv_flow_imp.g_varchar2_table(1921) := '3D66756E6374696F6E2841297B72657475726E204120696E7374616E63656F66204C427C7C284120696E7374616E63656F662079427C7C4120696E7374616E63656F662070422626412E74797065213D3D64422626412E74797065213D3D6842297D2C4D';
wwv_flow_imp.g_varchar2_table(1922) := '733D66756E6374696F6E28412C65297B7377697463682841297B6361736520303A72657475726E2074732865293B6361736520323A72657475726E5B652E746F704C656674436F6E74656E74426F782C652E746F705269676874436F6E74656E74426F78';
wwv_flow_imp.g_varchar2_table(1923) := '2C652E626F74746F6D5269676874436F6E74656E74426F782C652E626F74746F6D4C656674436F6E74656E74426F785D3B64656661756C743A72657475726E2072732865297D7D2C53733D66756E6374696F6E2841297B7377697463682841297B636173';
wwv_flow_imp.g_varchar2_table(1924) := '6520313A72657475726E2263656E746572223B6361736520323A72657475726E227269676874223B64656661756C743A72657475726E226C656674227D7D2C54733D5B222D6170706C652D73797374656D222C2273797374656D2D7569225D2C47733D66';
wwv_flow_imp.g_varchar2_table(1925) := '756E6374696F6E2841297B72657475726E2F6950686F6E65204F532031355F28307C31292F2E746573742877696E646F772E6E6176696761746F722E757365724167656E74293F412E66696C7465722866756E6374696F6E2841297B72657475726E2D31';
wwv_flow_imp.g_varchar2_table(1926) := '3D3D3D54732E696E6465784F662841297D293A417D2C4F733D28412856732C76733D6865292C56732E70726F746F747970652E72656E6465723D66756E6374696F6E2874297B72657475726E206128746869732C766F696420302C766F696420302C6675';
wwv_flow_imp.g_varchar2_table(1927) := '6E6374696F6E28297B76617220653B72657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B6361736520303A72657475726E20653D4E7228746869732E6F7074696F6E732E77696474682A746869732E';
wwv_flow_imp.g_varchar2_table(1928) := '6F7074696F6E732E7363616C652C746869732E6F7074696F6E732E6865696768742A746869732E6F7074696F6E732E7363616C652C746869732E6F7074696F6E732E7363616C652C746869732E6F7074696F6E732E7363616C652C74292C5B342C6B7328';
wwv_flow_imp.g_varchar2_table(1929) := '65295D3B6361736520313A72657475726E20653D412E73656E7428292C746869732E6F7074696F6E732E6261636B67726F756E64436F6C6F72262628746869732E6374782E66696C6C5374796C653D696528746869732E6F7074696F6E732E6261636B67';
wwv_flow_imp.g_varchar2_table(1930) := '726F756E64436F6C6F72292C746869732E6374782E66696C6C5265637428302C302C746869732E6F7074696F6E732E77696474682A746869732E6F7074696F6E732E7363616C652C746869732E6F7074696F6E732E6865696768742A746869732E6F7074';
wwv_flow_imp.g_varchar2_table(1931) := '696F6E732E7363616C6529292C746869732E6374782E64726177496D61676528652C2D746869732E6F7074696F6E732E782A746869732E6F7074696F6E732E7363616C652C2D746869732E6F7074696F6E732E792A746869732E6F7074696F6E732E7363';
wwv_flow_imp.g_varchar2_table(1932) := '616C65292C5B322C746869732E63616E7661735D7D7D297D297D2C5673293B66756E6374696F6E20567328412C65297B413D76732E63616C6C28746869732C412C65297C7C746869733B72657475726E20412E63616E7661733D652E63616E7661737C7C';
wwv_flow_imp.g_varchar2_table(1933) := '646F63756D656E742E637265617465456C656D656E74282263616E76617322292C412E6374783D412E63616E7661732E676574436F6E746578742822326422292C412E6F7074696F6E733D652C412E63616E7661732E77696474683D4D6174682E666C6F';
wwv_flow_imp.g_varchar2_table(1934) := '6F7228652E77696474682A652E7363616C65292C412E63616E7661732E6865696768743D4D6174682E666C6F6F7228652E6865696768742A652E7363616C65292C412E63616E7661732E7374796C652E77696474683D652E77696474682B227078222C41';
wwv_flow_imp.g_varchar2_table(1935) := '2E63616E7661732E7374796C652E6865696768743D652E6865696768742B227078222C412E6374782E7363616C6528412E6F7074696F6E732E7363616C652C412E6F7074696F6E732E7363616C65292C412E6374782E7472616E736C617465282D652E78';
wwv_flow_imp.g_varchar2_table(1936) := '2C2D652E79292C412E636F6E746578742E6C6F676765722E646562756728224558504552494D454E54414C20466F726569676E4F626A6563742072656E646572657220696E697469616C697A65642028222B652E77696474682B2278222B652E68656967';
wwv_flow_imp.g_varchar2_table(1937) := '68742B2220617420222B652E782B222C222B652E792B22292077697468207363616C6520222B652E7363616C65292C417D766172206B733D66756E6374696F6E2872297B72657475726E206E65772050726F6D6973652866756E6374696F6E28412C6529';
wwv_flow_imp.g_varchar2_table(1938) := '7B76617220743D6E657720496D6167653B742E6F6E6C6F61643D66756E6374696F6E28297B412874297D2C742E6F6E6572726F723D652C742E7372633D22646174613A696D6167652F7376672B786D6C3B636861727365743D7574662D382C222B656E63';
wwv_flow_imp.g_varchar2_table(1939) := '6F6465555249436F6D706F6E656E7428286E657720584D4C53657269616C697A6572292E73657269616C697A65546F537472696E67287229297D297D2C52733D284E732E70726F746F747970652E64656275673D66756E6374696F6E28297B666F722876';
wwv_flow_imp.g_varchar2_table(1940) := '617220413D5B5D2C653D303B653C617267756D656E74732E6C656E6774683B652B2B29415B655D3D617267756D656E74735B655D3B746869732E656E61626C656426262822756E646566696E656422213D747970656F662077696E646F77262677696E64';
wwv_flow_imp.g_varchar2_table(1941) := '6F772E636F6E736F6C6526262266756E6374696F6E223D3D747970656F6620636F6E736F6C652E64656275673F636F6E736F6C652E64656275672E6170706C7928636F6E736F6C652C74285B746869732E69642C746869732E67657454696D6528292B22';
wwv_flow_imp.g_varchar2_table(1942) := '6D73225D2C4129293A746869732E696E666F2E6170706C7928746869732C4129297D2C4E732E70726F746F747970652E67657454696D653D66756E6374696F6E28297B72657475726E20446174652E6E6F7728292D746869732E73746172747D2C4E732E';
wwv_flow_imp.g_varchar2_table(1943) := '70726F746F747970652E696E666F3D66756E6374696F6E28297B666F722876617220413D5B5D2C653D303B653C617267756D656E74732E6C656E6774683B652B2B29415B655D3D617267756D656E74735B655D3B746869732E656E61626C656426262275';
wwv_flow_imp.g_varchar2_table(1944) := '6E646566696E656422213D747970656F662077696E646F77262677696E646F772E636F6E736F6C6526262266756E6374696F6E223D3D747970656F6620636F6E736F6C652E696E666F2626636F6E736F6C652E696E666F2E6170706C7928636F6E736F6C';
wwv_flow_imp.g_varchar2_table(1945) := '652C74285B746869732E69642C746869732E67657454696D6528292B226D73225D2C4129297D2C4E732E70726F746F747970652E7761726E3D66756E6374696F6E28297B666F722876617220413D5B5D2C653D303B653C617267756D656E74732E6C656E';
wwv_flow_imp.g_varchar2_table(1946) := '6774683B652B2B29415B655D3D617267756D656E74735B655D3B746869732E656E61626C656426262822756E646566696E656422213D747970656F662077696E646F77262677696E646F772E636F6E736F6C6526262266756E6374696F6E223D3D747970';
wwv_flow_imp.g_varchar2_table(1947) := '656F6620636F6E736F6C652E7761726E3F636F6E736F6C652E7761726E2E6170706C7928636F6E736F6C652C74285B746869732E69642C746869732E67657454696D6528292B226D73225D2C4129293A746869732E696E666F2E6170706C792874686973';
wwv_flow_imp.g_varchar2_table(1948) := '2C4129297D2C4E732E70726F746F747970652E6572726F723D66756E6374696F6E28297B666F722876617220413D5B5D2C653D303B653C617267756D656E74732E6C656E6774683B652B2B29415B655D3D617267756D656E74735B655D3B746869732E65';
wwv_flow_imp.g_varchar2_table(1949) := '6E61626C656426262822756E646566696E656422213D747970656F662077696E646F77262677696E646F772E636F6E736F6C6526262266756E6374696F6E223D3D747970656F6620636F6E736F6C652E6572726F723F636F6E736F6C652E6572726F722E';
wwv_flow_imp.g_varchar2_table(1950) := '6170706C7928636F6E736F6C652C74285B746869732E69642C746869732E67657454696D6528292B226D73225D2C4129293A746869732E696E666F2E6170706C7928746869732C4129297D2C4E732E696E7374616E6365733D7B7D2C4E73293B66756E63';
wwv_flow_imp.g_varchar2_table(1951) := '74696F6E204E732841297B76617220653D412E69642C413D412E656E61626C65643B746869732E69643D652C746869732E656E61626C65643D412C746869732E73746172743D446174652E6E6F7728297D7661722050733D2858732E696E7374616E6365';
wwv_flow_imp.g_varchar2_table(1952) := '436F756E743D312C5873293B66756E6374696F6E20587328412C65297B746869732E77696E646F77426F756E64733D652C746869732E696E7374616E63654E616D653D2223222B58732E696E7374616E6365436F756E742B2B2C746869732E6C6F676765';
wwv_flow_imp.g_varchar2_table(1953) := '723D6E6577205273287B69643A746869732E696E7374616E63654E616D652C656E61626C65643A412E6C6F6767696E677D292C746869732E63616368653D6E756C6C213D3D28653D412E6361636865292626766F69642030213D3D653F653A6E6577204F';
wwv_flow_imp.g_varchar2_table(1954) := '6E28746869732C41297D22756E646566696E656422213D747970656F662077696E646F772626546E2E736574436F6E746578742877696E646F77293B766172204A733D66756E6374696F6E28752C46297B72657475726E206128766F696420302C766F69';
wwv_flow_imp.g_varchar2_table(1955) := '6420302C766F696420302C66756E6374696F6E28297B76617220652C742C722C422C6E2C732C6F2C692C512C632C612C672C772C552C6C2C433B72657475726E204828746869732C66756E6374696F6E2841297B73776974636828412E6C6162656C297B';
wwv_flow_imp.g_varchar2_table(1956) := '6361736520303A69662821757C7C226F626A65637422213D747970656F6620752972657475726E5B322C50726F6D6973652E72656A6563742822496E76616C696420656C656D656E742070726F766964656420617320666972737420617267756D656E74';
wwv_flow_imp.g_varchar2_table(1957) := '22295D3B6966282128653D752E6F776E6572446F63756D656E7429297468726F77206E6577204572726F722822456C656D656E74206973206E6F7420617474616368656420746F206120446F63756D656E7422293B6966282128743D652E64656661756C';
wwv_flow_imp.g_varchar2_table(1958) := '745669657729297468726F77206E6577204572726F722822446F63756D656E74206973206E6F7420617474616368656420746F20612057696E646F7722293B72657475726E20773D7B616C6C6F775461696E743A6E756C6C213D3D28553D462E616C6C6F';
wwv_flow_imp.g_varchar2_table(1959) := '775461696E74292626766F69642030213D3D552626552C696D61676554696D656F75743A6E756C6C213D3D28633D462E696D61676554696D656F7574292626766F69642030213D3D633F633A313565332C70726F78793A462E70726F78792C757365434F';
wwv_flow_imp.g_varchar2_table(1960) := '52533A6E756C6C213D3D28613D462E757365434F5253292626766F69642030213D3D612626617D2C553D68287B6C6F6767696E673A6E756C6C3D3D3D28673D462E6C6F6767696E67297C7C766F696420303D3D3D677C7C672C63616368653A462E636163';
wwv_flow_imp.g_varchar2_table(1961) := '68657D2C77292C633D7B77696E646F7757696474683A6E756C6C213D3D28633D462E77696E646F775769647468292626766F69642030213D3D633F633A742E696E6E657257696474682C77696E646F774865696768743A6E756C6C213D3D28613D462E77';
wwv_flow_imp.g_varchar2_table(1962) := '696E646F77486569676874292626766F69642030213D3D613F613A742E696E6E65724865696768742C7363726F6C6C583A6E756C6C213D3D28673D462E7363726F6C6C58292626766F69642030213D3D673F673A742E70616765584F66667365742C7363';
wwv_flow_imp.g_varchar2_table(1963) := '726F6C6C593A6E756C6C213D3D28773D462E7363726F6C6C59292626766F69642030213D3D773F773A742E70616765594F66667365747D2C613D6E6577206428632E7363726F6C6C582C632E7363726F6C6C592C632E77696E646F7757696474682C632E';
wwv_flow_imp.g_varchar2_table(1964) := '77696E646F77486569676874292C673D6E657720507328552C61292C633D6E756C6C213D3D28773D462E666F726569676E4F626A65637452656E646572696E67292626766F69642030213D3D772626772C773D7B616C6C6F775461696E743A6E756C6C21';
wwv_flow_imp.g_varchar2_table(1965) := '3D3D28553D462E616C6C6F775461696E74292626766F69642030213D3D552626552C6F6E636C6F6E653A462E6F6E636C6F6E652C69676E6F7265456C656D656E74733A462E69676E6F7265456C656D656E74732C696E6C696E65496D616765733A632C63';
wwv_flow_imp.g_varchar2_table(1966) := '6F70795374796C65733A637D2C672E6C6F676765722E646562756728225374617274696E6720646F63756D656E7420636C6F6E6520776974682073697A6520222B612E77696474682B2278222B612E6865696768742B22207363726F6C6C656420746F20';
wwv_flow_imp.g_varchar2_table(1967) := '222B2D612E6C6566742B222C222B2D612E746F70292C553D6E657720646E28672C752C77292C28773D552E636C6F6E65645265666572656E6365456C656D656E74293F5B342C552E746F494672616D6528652C61295D3A5B322C50726F6D6973652E7265';
wwv_flow_imp.g_varchar2_table(1968) := '6A6563742822556E61626C6520746F2066696E6420656C656D656E7420696E20636C6F6E656420696672616D6522295D3B6361736520313A72657475726E28723D412E73656E7428292C6C3D6A422877297C7C2248544D4C223D3D3D772E7461674E616D';
wwv_flow_imp.g_varchar2_table(1969) := '653F66756E6374696F6E2841297B76617220653D412E626F64792C743D412E646F63756D656E74456C656D656E743B69662821657C7C2174297468726F77206E6577204572726F722822556E61626C6520746F2067657420646F63756D656E742073697A';
wwv_flow_imp.g_varchar2_table(1970) := '6522293B413D4D6174682E6D6178284D6174682E6D617828652E7363726F6C6C57696474682C742E7363726F6C6C5769647468292C4D6174682E6D617828652E6F666673657457696474682C742E6F66667365745769647468292C4D6174682E6D617828';
wwv_flow_imp.g_varchar2_table(1971) := '652E636C69656E7457696474682C742E636C69656E74576964746829292C743D4D6174682E6D6178284D6174682E6D617828652E7363726F6C6C4865696768742C742E7363726F6C6C486569676874292C4D6174682E6D617828652E6F66667365744865';
wwv_flow_imp.g_varchar2_table(1972) := '696768742C742E6F6666736574486569676874292C4D6174682E6D617828652E636C69656E744865696768742C742E636C69656E7448656967687429293B72657475726E206E6577206428302C302C412C74297D28772E6F776E6572446F63756D656E74';
wwv_flow_imp.g_varchar2_table(1973) := '293A6628672C77292C423D6C2E77696474682C6E3D6C2E6865696768742C733D6C2E6C6566742C6F3D6C2E746F702C693D597328672C772C462E6261636B67726F756E64436F6C6F72292C6C3D7B63616E7661733A462E63616E7661732C6261636B6772';
wwv_flow_imp.g_varchar2_table(1974) := '6F756E64436F6C6F723A692C7363616C653A6E756C6C213D3D286C3D6E756C6C213D3D286C3D462E7363616C65292626766F69642030213D3D6C3F6C3A742E646576696365506978656C526174696F292626766F69642030213D3D6C3F6C3A312C783A28';
wwv_flow_imp.g_varchar2_table(1975) := '6E756C6C213D3D286C3D462E78292626766F69642030213D3D6C3F6C3A30292B732C793A286E756C6C213D3D286C3D462E79292626766F69642030213D3D6C3F6C3A30292B6F2C77696474683A6E756C6C213D3D286C3D462E7769647468292626766F69';
wwv_flow_imp.g_varchar2_table(1976) := '642030213D3D6C3F6C3A4D6174682E6365696C2842292C6865696768743A6E756C6C213D3D286C3D462E686569676874292626766F69642030213D3D6C3F6C3A4D6174682E6365696C286E297D2C63293F28672E6C6F676765722E64656275672822446F';
wwv_flow_imp.g_varchar2_table(1977) := '63756D656E7420636C6F6E65642C207573696E6720666F726569676E206F626A6563742072656E646572696E6722292C5B342C6E6577204F7328672C6C292E72656E6465722877295D293A5B332C335D3B6361736520323A72657475726E20513D412E73';
wwv_flow_imp.g_varchar2_table(1978) := '656E7428292C5B332C355D3B6361736520333A72657475726E20672E6C6F676765722E64656275672822446F63756D656E7420636C6F6E65642C20656C656D656E74206C6F636174656420617420222B732B222C222B6F2B2220776974682073697A6520';
wwv_flow_imp.g_varchar2_table(1979) := '222B422B2278222B6E2B22207573696E6720636F6D70757465642072656E646572696E6722292C672E6C6F676765722E646562756728225374617274696E6720444F4D2070617273696E6722292C433D6B4228672C77292C693D3D3D432E7374796C6573';
wwv_flow_imp.g_varchar2_table(1980) := '2E6261636B67726F756E64436F6C6F72262628432E7374796C65732E6261636B67726F756E64436F6C6F723D4C652E5452414E53504152454E54292C672E6C6F676765722E646562756728225374617274696E672072656E646572657220666F7220656C';
wwv_flow_imp.g_varchar2_table(1981) := '656D656E7420617420222B6C2E782B222C222B6C2E792B2220776974682073697A6520222B6C2E77696474682B2278222B6C2E686569676874292C5B342C6E657720627328672C6C292E72656E6465722843295D3B6361736520343A513D412E73656E74';
wwv_flow_imp.g_varchar2_table(1982) := '28292C412E6C6162656C3D353B6361736520353A72657475726E206E756C6C213D3D28433D462E72656D6F7665436F6E7461696E6572292626766F69642030213D3D43262621437C7C646E2E64657374726F792872297C7C672E6C6F676765722E657272';
wwv_flow_imp.g_varchar2_table(1983) := '6F72282243616E6E6F742064657461636820636C6F6E656420696672616D65206173206974206973206E6F7420696E2074686520444F4D20616E796D6F726522292C672E6C6F676765722E6465627567282246696E69736865642072656E646572696E67';
wwv_flow_imp.g_varchar2_table(1984) := '22292C5B322C515D7D7D297D297D2C59733D66756E6374696F6E28412C652C74297B76617220723D652E6F776E6572446F63756D656E742C423D722E646F63756D656E74456C656D656E743F666528412C676574436F6D70757465645374796C6528722E';
wwv_flow_imp.g_varchar2_table(1985) := '646F63756D656E74456C656D656E74292E6261636B67726F756E64436F6C6F72293A4C652E5452414E53504152454E542C6E3D722E626F64793F666528412C676574436F6D70757465645374796C6528722E626F6479292E6261636B67726F756E64436F';
wwv_flow_imp.g_varchar2_table(1986) := '6C6F72293A4C652E5452414E53504152454E542C743D22737472696E67223D3D747970656F6620743F666528412C74293A6E756C6C3D3D3D743F4C652E5452414E53504152454E543A343239343936373239353B72657475726E20653D3D3D722E646F63';
wwv_flow_imp.g_varchar2_table(1987) := '756D656E74456C656D656E743F6F652842293F6F65286E293F743A6E3A423A747D3B72657475726E2066756E6374696F6E28412C65297B72657475726E204A7328412C653D766F696420303D3D3D653F7B7D3A65297D7D293B';
end;
/
begin
wwv_flow_imp_shared.create_plugin_file(
 p_id=>wwv_flow_imp.id(33947449460403006741)
,p_plugin_id=>wwv_flow_imp.id(34953412032582880042)
,p_file_name=>'js/html2canvas.min.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_imp.varchar2_to_blob(wwv_flow_imp.g_varchar2_table)
);
end;
/
begin
wwv_flow_imp.component_end;
end;
/
