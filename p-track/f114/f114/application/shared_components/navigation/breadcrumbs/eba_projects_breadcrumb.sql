prompt --application/shared_components/navigation/breadcrumbs/eba_projects_breadcrumb
begin
--   Manifest
--     MENU: EBA_PROJECTS Breadcrumb
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>114
,p_default_id_offset=>25570339520000058
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_menu(
 p_id=>wwv_flow_imp.id(8863635143327529617)
,p_name=>'EBA_PROJECTS Breadcrumb'
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(119926535919846242)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Issue Levels'
,p_link=>'f?p=&APP_ID.:220:&SESSION.'
,p_page_id=>220
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(628374005668098994)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Additional Required Items'
,p_link=>'f?p=&APP_ID.:119:&SESSION.'
,p_page_id=>119
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(628375240514098999)
,p_parent_id=>wwv_flow_imp.id(628374005668098994)
,p_short_name=>'Additional Required Item'
,p_link=>'f?p=&APP_ID.:124:&SESSION.'
,p_page_id=>124
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(737574849856176100)
,p_parent_id=>wwv_flow_imp.id(8921689127102874171)
,p_short_name=>'&P219_TAG_DISPLAY.'
,p_link=>'f?p=&APP_ID.:219:&SESSION.::&DEBUG.:::'
,p_page_id=>219
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(2713395464766666235)
,p_parent_id=>wwv_flow_imp.id(7773308695650601309)
,p_short_name=>'Mass Update Users'
,p_link=>'f?p=&APP_ID.:11:&SESSION.'
,p_page_id=>11
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(2716507549098562086)
,p_parent_id=>wwv_flow_imp.id(2713395464766666235)
,p_short_name=>'Preview Updated Users'
,p_link=>'f?p=&APP_ID.:16:&SESSION.'
,p_page_id=>16
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(2727520134129636961)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Headlines Report'
,p_link=>'f?p=&APP_ID.:19:&SESSION.'
,p_page_id=>19
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(2727853400155258657)
,p_parent_id=>wwv_flow_imp.id(2727520134129636961)
,p_short_name=>'Headline History'
,p_link=>'f?p=&APP_ID.:58:&SESSION.'
,p_page_id=>58
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(2743855641435019537)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Project Activity Heat Map'
,p_link=>'f?p=&APP_ID.:84:&SESSION.::&DEBUG.:::'
,p_page_id=>84
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(3370096853072126888)
,p_parent_id=>wwv_flow_imp.id(5253655685787685193)
,p_short_name=>'Quarters'
,p_link=>'f?p=&APP_ID.:112:&SESSION.::&DEBUG.:::'
,p_page_id=>112
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(3927724730448530403)
,p_parent_id=>wwv_flow_imp.id(5253655685787685193)
,p_short_name=>'Issue Categories'
,p_link=>'f?p=&APP_ID.:153:&SESSION.::&DEBUG.:::'
,p_page_id=>153
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5253643110551288074)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Administrative Configuration'
,p_link=>'f?p=&APP_ID.:152:&SESSION.::&DEBUG.:::'
,p_page_id=>152
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5253655685787685193)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Code Table Administration'
,p_link=>'f?p=&APP_ID.:154:&SESSION.'
,p_page_id=>154
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5292926229272498767)
,p_parent_id=>wwv_flow_imp.id(6697896170794708506)
,p_short_name=>'Projects to view in navigator'
,p_link=>'f?p=&APP_ID.:33:&SESSION.::&DEBUG.:::'
,p_page_id=>33
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5354065063369971695)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Milestones By Owner Timeline'
,p_link=>'f?p=&APP_ID.:17:&SESSION.::&DEBUG.:::'
,p_page_id=>17
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5847485314659068347)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Page Privileges'
,p_link=>'f?p=&APP_ID.:96:&SESSION.::&DEBUG.:::'
,p_page_id=>96
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5847579099649382932)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Projects Tree View'
,p_link=>'f?p=&APP_ID.:72:&SESSION.::&DEBUG.:::'
,p_page_id=>72
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5847595306362579455)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Project Creation Date Calendar'
,p_link=>'f?p=&APP_ID.:98:&SESSION.::&DEBUG.:::'
,p_page_id=>98
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5871348899529927464)
,p_parent_id=>wwv_flow_imp.id(5253643110551288074)
,p_short_name=>'Application Settings'
,p_link=>'f?p=&APP_ID.:42:&SESSION.::&DEBUG.:::'
,p_page_id=>42
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5909245194351626039)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Username Format'
,p_link=>'f?p=&APP_ID.:71:&SESSION.'
,p_page_id=>71
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5909253113370696057)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Add Multiple Users'
,p_link=>'f?p=&APP_ID.:103:&SESSION.::&DEBUG.:::'
,p_page_id=>103
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5909261283004703594)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Add Multiple Users'
,p_link=>'f?p=&APP_ID.:104:&SESSION.::&DEBUG.:::'
,p_page_id=>104
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5963197200030343323)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Change my password'
,p_link=>'f?p=&APP_ID.:97:&SESSION.'
,p_page_id=>97
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5963210200728534163)
,p_parent_id=>wwv_flow_imp.id(6697896170794708506)
,p_short_name=>'Set Time Zone'
,p_link=>'f?p=&APP_ID.:99:&SESSION.::&DEBUG.:::'
,p_page_id=>99
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5969670009369502627)
,p_parent_id=>wwv_flow_imp.id(5253643110551288074)
,p_short_name=>'Build Options'
,p_link=>'f?p=&APP_ID.:105:&SESSION.::&DEBUG.:::'
,p_page_id=>105
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5970602789072067461)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Milestone'
,p_link=>'f?p=&APP_ID.:107:&SESSION.'
,p_page_id=>107
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5975717394690109319)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Reassign Action Items'
,p_link=>'f?p=&APP_ID.:108:&SESSION.::&DEBUG.:::'
,p_page_id=>108
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5975768784862495314)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Email Preferences'
,p_link=>'f?p=&APP_ID.:110:&SESSION.::&DEBUG.:::'
,p_page_id=>110
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5978040110903914002)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Attachment'
,p_link=>'f?p=&FLOW_ID.:106:&SESSION.'
,p_page_id=>106
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5979195003569463792)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Action Items By Owner Timeline'
,p_link=>'f?p=&APP_ID.:111:&SESSION.::&DEBUG.:::'
,p_page_id=>111
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(5981495802213282188)
,p_parent_id=>wwv_flow_imp.id(7034701594847083944)
,p_short_name=>'Merge &CAT_TITLE_PL.'
,p_link=>'f?p=&APP_ID.:109:&SESSION.::&DEBUG.:::'
,p_page_id=>109
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6061418593067428387)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Edit Status Report'
,p_link=>'f?p=&APP_ID.:115:&SESSION.::&DEBUG.:::'
,p_page_id=>115
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6061438507310610174)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Add Status Report'
,p_link=>'f?p=&APP_ID.:116:&SESSION.::&DEBUG.:::'
,p_page_id=>116
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6061450596225883202)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Project Status Reports Timeline'
,p_link=>'f?p=&APP_ID.:117:&SESSION.::&DEBUG.:::'
,p_page_id=>117
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6061680897522316510)
,p_parent_id=>wwv_flow_imp.id(6061450596225883202)
,p_short_name=>'Status Report'
,p_link=>'f?p=&APP_ID.:120:&SESSION.'
,p_page_id=>120
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6063984802843292755)
,p_parent_id=>wwv_flow_imp.id(6061680897522316510)
,p_short_name=>'Email Status Report'
,p_link=>'f?p=&APP_ID.:121:&SESSION.'
,p_page_id=>121
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6064081709758587873)
,p_short_name=>'Verify Project'
,p_link=>'f?p=&APP_ID.:122:&SESSION.::&DEBUG.:::'
,p_page_id=>122
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6064318006442560386)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Project Validations Report'
,p_link=>'f?p=&APP_ID.:114:&SESSION.::&DEBUG.:::'
,p_page_id=>114
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6064318686025560391)
,p_parent_id=>wwv_flow_imp.id(6064318006442560386)
,p_short_name=>'Validation'
,p_link=>'f?p=&APP_ID.:123:&SESSION.'
,p_page_id=>123
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6067386304147140911)
,p_short_name=>'Action Items'
,p_link=>'f?p=&APP_ID.:125:&SESSION.::&DEBUG.:::'
,p_page_id=>125
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6067468911226729752)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Project Usage Metrics'
,p_link=>'f?p=&APP_ID.:127:&SESSION.'
,p_page_id=>127
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6068276588774381481)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Update'
,p_link=>'f?p=&APP_ID.:129:&SESSION.::&DEBUG.:::'
,p_page_id=>129
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6072790612231508320)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Milestone Summary by Project'
,p_link=>'f?p=&APP_ID.:26:&SESSION.::&DEBUG.:::'
,p_page_id=>26
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6072837106501131353)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Action Item Summary by Project'
,p_link=>'f?p=&APP_ID.:30:&SESSION.::&DEBUG.:::'
,p_page_id=>30
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6075240009069693407)
,p_parent_id=>wwv_flow_imp.id(8919247329784031386)
,p_short_name=>'Application Activity by Page'
,p_link=>'f?p=&APP_ID.:86:&SESSION.::&DEBUG.:::'
,p_page_id=>86
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6086621689543846023)
,p_parent_id=>wwv_flow_imp.id(8957353333397635812)
,p_short_name=>'Updates Dashboard'
,p_link=>'f?p=&APP_ID.:88:&SESSION.::&DEBUG.:::'
,p_page_id=>88
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6096969999192608642)
,p_parent_id=>wwv_flow_imp.id(8919247329784031386)
,p_short_name=>'Page Views by Day'
,p_link=>'f?p=&APP_ID.:18:&SESSION.::&DEBUG.:::'
,p_page_id=>18
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6143584294556034486)
,p_parent_id=>wwv_flow_imp.id(5253643110551288074)
,p_short_name=>'Flex Columns'
,p_link=>'f?p=&APP_ID.:140:&SESSION.::&DEBUG.:::'
,p_page_id=>140
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6143592613071041788)
,p_parent_id=>wwv_flow_imp.id(6143584294556034486)
,p_short_name=>'Flex Column'
,p_link=>'f?p=&APP_ID.:141:&SESSION.'
,p_page_id=>141
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6143611804623059756)
,p_parent_id=>wwv_flow_imp.id(6143584294556034486)
,p_short_name=>'Flex Column'
,p_link=>'f?p=&APP_ID.:142:&SESSION.'
,p_page_id=>142
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6143633486910069462)
,p_parent_id=>wwv_flow_imp.id(6143584294556034486)
,p_short_name=>'Assign Flexible Column - Data Source'
,p_link=>'f?p=&APP_ID.:143:&SESSION.'
,p_page_id=>143
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6143645404317080876)
,p_parent_id=>wwv_flow_imp.id(6143584294556034486)
,p_short_name=>'Assign Flexible Column - Flex Column'
,p_link=>'f?p=&APP_ID.:144:&SESSION.'
,p_page_id=>144
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6143658304832091895)
,p_parent_id=>wwv_flow_imp.id(6143584294556034486)
,p_short_name=>'Assign Flexible Column - Form Element'
,p_link=>'f?p=&APP_ID.:145:&SESSION.'
,p_page_id=>145
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6143671292769098886)
,p_parent_id=>wwv_flow_imp.id(6143584294556034486)
,p_short_name=>'Assign Flexible Column - Select List Options'
,p_link=>'f?p=&APP_ID.:146:&SESSION.'
,p_page_id=>146
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6143683500177106693)
,p_parent_id=>wwv_flow_imp.id(6143584294556034486)
,p_short_name=>'Assign Flexible Column - Confirmation'
,p_link=>'f?p=&APP_ID.:147:&SESSION.'
,p_page_id=>147
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6229429211358489396)
,p_parent_id=>wwv_flow_imp.id(6799550249788247478)
,p_short_name=>'Remove Attachments'
,p_link=>'f?p=&APP_ID.:23:&SESSION.::&DEBUG.:::'
,p_page_id=>23
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6669511603232080385)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Milestones Gantt Chart'
,p_link=>'f?p=&APP_ID.:68:&SESSION.::&DEBUG.:::'
,p_page_id=>68
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6669669088469182736)
,p_parent_id=>wwv_flow_imp.id(8957353333397635812)
,p_short_name=>'Edit Project Update'
,p_link=>'f?p=&APP_ID.:76:&SESSION.::&DEBUG.:::'
,p_page_id=>76
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6669838893395209499)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Manage Project Updates'
,p_link=>'f?p=&APP_ID.:75:&SESSION.::&DEBUG.:::'
,p_page_id=>75
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6674558097821936026)
,p_parent_id=>wwv_flow_imp.id(5253655685787685193)
,p_short_name=>'Status Update Types'
,p_link=>'f?p=&APP_ID.:81:&SESSION.::&DEBUG.:::'
,p_page_id=>81
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6674558382881936027)
,p_parent_id=>wwv_flow_imp.id(6674558097821936026)
,p_short_name=>'Status Update Type'
,p_link=>'f?p=&APP_ID.:82:&SESSION.::&DEBUG.:::'
,p_page_id=>82
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6697896170794708506)
,p_short_name=>'Preferences'
,p_link=>'f?p=&APP_ID.:130:&SESSION.'
,p_page_id=>130
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Reports'
,p_link=>'f?p=&APP_ID.:136:&SESSION.::&DEBUG.:::'
,p_page_id=>136
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6715026078707727186)
,p_short_name=>'Action Items by &CAT_TITLE.'
,p_link=>'f?p=&APP_ID.:6:&SESSION.::&DEBUG.:::'
,p_page_id=>6
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6715499768170898539)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Milestones &CAT_TITLE. Bar Chart'
,p_link=>'f?p=&APP_ID.:9:&SESSION.::&DEBUG.:::'
,p_page_id=>9
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6726332587710634367)
,p_short_name=>'Attachments'
,p_link=>'f?p=&FLOW_ID.:28:&SESSION.'
,p_page_id=>28
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6726968873914653858)
,p_short_name=>'Attachments by Project &CAT_TITLE. and Status'
,p_link=>'f?p=&APP_ID.:62:&SESSION.::&DEBUG.:RP::'
,p_page_id=>62
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6726975779082798051)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Project Attachments Report'
,p_link=>'f?p=&APP_ID.:132:&SESSION.::&DEBUG.:::'
,p_page_id=>132
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6729524147532595534)
,p_short_name=>'People'
,p_link=>'f?p=&APP_ID.:133:&SESSION.::&DEBUG.:::'
,p_page_id=>133
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6729525973267635733)
,p_parent_id=>wwv_flow_imp.id(6729524147532595534)
,p_short_name=>'&P137_DISPLAY_NAME.'
,p_link=>'f?p=&APP_ID.:137:&SESSION.::&DEBUG.:::'
,p_page_id=>137
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6799550249788247478)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Attachments Dashboard'
,p_link=>'f?p=&APP_ID.:79:&SESSION.::&DEBUG.:::'
,p_page_id=>79
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6799592522803756813)
,p_short_name=>'Dashboard'
,p_link=>'f?p=&APP_ID.:113:&SESSION.::&DEBUG.:::'
,p_page_id=>113
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6814583101655040163)
,p_short_name=>'&CAT_TITLE_PL.'
,p_link=>'f?p=&APP_ID.:139:&SESSION.::&DEBUG.:::'
,p_page_id=>139
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6823224887384582874)
,p_parent_id=>wwv_flow_imp.id(6823569184083636017)
,p_short_name=>'Email Action Item'
,p_link=>'f?p=&APP_ID.:37:&SESSION.::&DEBUG.:::'
,p_page_id=>37
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6823569184083636017)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Action Item'
,p_link=>'f?p=&APP_ID.:78:&SESSION.::&DEBUG.:::'
,p_page_id=>78
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(6987988156527964407)
,p_parent_id=>wwv_flow_imp.id(5253643110551288074)
,p_short_name=>'Application Appearance'
,p_link=>'f?p=&APP_ID.:148:&SESSION.::&DEBUG.:::'
,p_page_id=>148
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(7034701594847083944)
,p_parent_id=>wwv_flow_imp.id(5253655685787685193)
,p_short_name=>'&CAT_TITLE_PL.'
,p_link=>'f?p=&APP_ID.:15:&SESSION.::&DEBUG.:::'
,p_page_id=>15
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(7156347076073130362)
,p_parent_id=>wwv_flow_imp.id(5253643110551288074)
,p_short_name=>'Manage Sample Data'
,p_link=>'f?p=&APP_ID.:149:&SESSION.::&DEBUG.:::'
,p_page_id=>149
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(7417469713764828390)
,p_parent_id=>wwv_flow_imp.id(5253643110551288074)
,p_short_name=>'Notifications'
,p_link=>'f?p=&APP_ID.:53:&SESSION.::&DEBUG.:::'
,p_page_id=>53
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(7417470013740828392)
,p_parent_id=>wwv_flow_imp.id(7417469713764828390)
,p_short_name=>'Notification'
,p_link=>'f?p=&FLOW_ID.:80:&SESSION.'
,p_page_id=>80
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(7613001024385152852)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Manage Project Issues'
,p_link=>'f?p=&APP_ID.:92:&SESSION.::&DEBUG.:::'
,p_page_id=>92
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(7658149221907306972)
,p_short_name=>'Feedback'
,p_link=>'f?p=&FLOW_ID.:102:&SESSION.'
,p_page_id=>102
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(7693421894708492092)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Project Followers Report'
,p_link=>'f?p=&APP_ID.:14:&SESSION.::&DEBUG.:::'
,p_page_id=>14
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(7759577082960679361)
,p_parent_id=>wwv_flow_imp.id(7773308695650601309)
,p_short_name=>'User Details'
,p_link=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.:RP::'
,p_page_id=>90
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(7773284413233269328)
,p_short_name=>'Help'
,p_link=>'f?p=&APP_ID.:52:&SESSION.::&DEBUG.:::'
,p_page_id=>52
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(7773308695650601309)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Access Control List'
,p_link=>'f?p=&APP_ID.:89:&SESSION.::&DEBUG.:RP::'
,p_page_id=>89
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(7773309893754627801)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Access Control Configuration'
,p_link=>'f?p=&FLOW_ID.:91:&SESSION.'
,p_page_id=>91
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(7773323506730108050)
,p_parent_id=>wwv_flow_imp.id(8959288229844496708)
,p_short_name=>'Project Details'
,p_link=>'f?p=&APP_ID.:200:&SESSION.::&DEBUG.:::'
,p_page_id=>200
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(7840730589137515353)
,p_parent_id=>wwv_flow_imp.id(8919247329784031386)
,p_short_name=>'Application Error Log'
,p_link=>'f?p=&APP_ID.:175:&SESSION.::&DEBUG.:::'
,p_page_id=>175
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(7864198105823664006)
,p_parent_id=>wwv_flow_imp.id(8957353333397635812)
,p_short_name=>'Add Project Update'
,p_link=>'f?p=&APP_ID.:93:&SESSION.::&DEBUG.:::'
,p_page_id=>93
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(7868311207060285345)
,p_parent_id=>wwv_flow_imp.id(8919247329784031386)
,p_short_name=>'Activity Calendar'
,p_link=>'f?p=&FLOW_ID.:94:&SESSION.'
,p_page_id=>94
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8030303240595439334)
,p_parent_id=>wwv_flow_imp.id(5253655685787685193)
,p_short_name=>'Action Item Types'
,p_link=>'f?p=&APP_ID.:69:&SESSION.::&DEBUG.:::'
,p_page_id=>69
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8030303529636439336)
,p_parent_id=>wwv_flow_imp.id(8030303240595439334)
,p_short_name=>'Details'
,p_link=>'f?p=&APP_ID.:70:&SESSION.::&DEBUG.:::'
,p_page_id=>70
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8039718416822994351)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Action Item'
,p_link=>'f?p=&APP_ID.:73:&SESSION.::&DEBUG.:::'
,p_page_id=>73
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8039722321194236161)
,p_parent_id=>wwv_flow_imp.id(8926847825615785878)
,p_short_name=>'Merge Projects'
,p_link=>'f?p=&FLOW_ID.:74:&SESSION.'
,p_page_id=>74
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8863649724468529901)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Projects Interactive Report'
,p_link=>'f?p=&APP_ID.:1:&SESSION.::&DEBUG.:::'
,p_page_id=>1
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8903296523826537319)
,p_short_name=>'Project'
,p_link=>'f?p=&APP_ID.:2:&SESSION.::&DEBUG.:::'
,p_page_id=>2
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8903316033633288572)
,p_short_name=>'Application Timeline'
,p_link=>'f?p=&APP_ID.:10:&SESSION.::&DEBUG.:::'
,p_page_id=>10
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8903335225773420389)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Projects Status Bar Chart'
,p_link=>'f?p=&APP_ID.:4:&SESSION.::&DEBUG.:::'
,p_page_id=>4
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8903355446258463104)
,p_parent_id=>wwv_flow_imp.id(7034701594847083944)
,p_short_name=>'&CAT_TITLE.'
,p_link=>'f?p=&APP_ID.:7:&SESSION.::&DEBUG.:::'
,p_page_id=>7
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8904194340825916403)
,p_short_name=>'Search Results'
,p_link=>'f?p=&APP_ID.:8:&SESSION.::&DEBUG.:::'
,p_page_id=>8
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8904203121157052977)
,p_parent_id=>wwv_flow_imp.id(6669838893395209499)
,p_short_name=>'Edit Project Update'
,p_link=>'f?p=&APP_ID.:12:&SESSION.::&DEBUG.:::'
,p_page_id=>12
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8904227225179534673)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Email Project'
,p_link=>'f?p=&APP_ID.:20:&SESSION.::&DEBUG.:::'
,p_page_id=>20
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8907724035695156681)
,p_parent_id=>wwv_flow_imp.id(8912518748117385403)
,p_short_name=>'Link'
,p_link=>'f?p=&APP_ID.:3:&SESSION.::&DEBUG.:::'
,p_page_id=>3
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8907737319059612055)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Search Requests Report'
,p_link=>'f?p=&APP_ID.:13:&SESSION.::&DEBUG.:::'
,p_page_id=>13
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8912518748117385403)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Project Links Report'
,p_link=>'f?p=&APP_ID.:21:&SESSION.::&DEBUG.:::'
,p_page_id=>21
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8913234828590533569)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Milestones Monthly Calendar'
,p_link=>'f?p=&APP_ID.:5:&SESSION.::&DEBUG.:::'
,p_page_id=>5
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Administration'
,p_link=>'f?p=&APP_ID.:27:&SESSION.::&DEBUG.:::'
,p_page_id=>27
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8913524646899935161)
,p_parent_id=>wwv_flow_imp.id(5253655685787685193)
,p_short_name=>'Status Codes'
,p_link=>'f?p=&APP_ID.:31:&SESSION.::&DEBUG.:::'
,p_page_id=>31
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8913524836836935161)
,p_parent_id=>wwv_flow_imp.id(8913524646899935161)
,p_short_name=>'Status Code Details'
,p_link=>'f?p=&APP_ID.:32:&SESSION.::&DEBUG.:::'
,p_page_id=>32
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8917947941985424765)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Manage Project Milestones'
,p_link=>'f?p=&APP_ID.:34:&SESSION.::&DEBUG.:::'
,p_page_id=>34
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8919247329784031386)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Activity Reports'
,p_link=>'f?p=&APP_ID.:36:&SESSION.::&DEBUG.:::'
,p_page_id=>36
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8919255243116105740)
,p_parent_id=>wwv_flow_imp.id(8919247329784031386)
,p_short_name=>'Page Views'
,p_link=>'f?p=&APP_ID.:38:&SESSION.::&DEBUG.:::'
,p_page_id=>38
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8919261441648188224)
,p_parent_id=>wwv_flow_imp.id(8919247329784031386)
,p_short_name=>'Top Users'
,p_link=>'f?p=&APP_ID.:40:&SESSION.::&DEBUG.:::'
,p_page_id=>40
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8920767527469816872)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Ingest Log'
,p_link=>'f?p=&APP_ID.:39:&SESSION.::&DEBUG.:::'
,p_page_id=>39
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8921492341170455324)
,p_parent_id=>wwv_flow_imp.id(8920767527469816872)
,p_short_name=>'Resubmit'
,p_link=>'f?p=&FLOW_ID.:41:&SESSION.'
,p_page_id=>41
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8921520422210391146)
,p_parent_id=>wwv_flow_imp.id(8959429332914047963)
,p_short_name=>'Attachment'
,p_link=>'f?p=&APP_ID.:43:&SESSION.::&DEBUG.:::'
,p_page_id=>43
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8921685839149806502)
,p_parent_id=>wwv_flow_imp.id(6799550249788247478)
,p_short_name=>'Interactive Report'
,p_link=>'f?p=&APP_ID.:44:&SESSION.::&DEBUG.:::'
,p_page_id=>44
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8921689127102874171)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Tags'
,p_link=>'f?p=&APP_ID.:45:&SESSION.::&DEBUG.:::'
,p_page_id=>45
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8922513036206319185)
,p_parent_id=>wwv_flow_imp.id(8925930642778305531)
,p_short_name=>'All Action Items'
,p_link=>'f?p=&APP_ID.:46:&SESSION.::&DEBUG.:::'
,p_page_id=>46
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8925930642778305531)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Action Items Dashboard'
,p_link=>'f?p=&APP_ID.:50:&SESSION.::&DEBUG.:::'
,p_page_id=>50
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8926847825615785878)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Projects Dashboard'
,p_link=>'f?p=&APP_ID.:51:&SESSION.::&DEBUG.:::'
,p_page_id=>51
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8927057629671588030)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Merge Projects'
,p_link=>'f?p=&APP_ID.:54:&SESSION.::&DEBUG.:::'
,p_page_id=>54
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8927133526892292359)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Project Email Log'
,p_link=>'f?p=&APP_ID.:56:&SESSION.::&DEBUG.:::'
,p_page_id=>56
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8956883547985672533)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Milestone'
,p_link=>'f?p=&APP_ID.:48:&SESSION.::&DEBUG.:::'
,p_page_id=>48
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8957337618237223682)
,p_short_name=>'Milestones'
,p_link=>'f?p=&APP_ID.:35:&SESSION.::&DEBUG.:::'
,p_page_id=>35
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8957353333397635812)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Project Updates Timeline'
,p_link=>'f?p=&APP_ID.:59:&SESSION.::&DEBUG.:::'
,p_page_id=>59
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8958187228168733276)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Action Items Interactive Report'
,p_link=>'f?p=&APP_ID.:49:&SESSION.::&DEBUG.:::'
,p_page_id=>49
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8958190924047777344)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Milestones Interactive Report'
,p_link=>'f?p=&APP_ID.:63:&SESSION.::&DEBUG.:::'
,p_page_id=>63
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8959288229844496708)
,p_short_name=>'Projects'
,p_long_name=>'&APPLICATION_TITLE.: Project Tracking'
,p_link=>'f?p=&APP_ID.:64:&SESSION.::&DEBUG.:::'
,p_page_id=>64
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8959397822007555304)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Projects &CAT_TITLE. Bar Chart'
,p_link=>'f?p=&APP_ID.:61:&SESSION.::&DEBUG.:::'
,p_page_id=>61
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8959406916795900956)
,p_short_name=>'Projects by Owner'
,p_link=>'f?p=&APP_ID.:65:&SESSION.::&DEBUG.:::'
,p_page_id=>65
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8959429332914047963)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Manage Project Attachments'
,p_link=>'f?p=&APP_ID.:66:&SESSION.::&DEBUG.:::'
,p_page_id=>66
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8959454725709187663)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Manage Project Links'
,p_link=>'f?p=&APP_ID.:67:&SESSION.::&DEBUG.:::'
,p_page_id=>67
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(8959639033452764725)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Manage Project Action Items'
,p_link=>'f?p=&APP_ID.:55:&SESSION.::&DEBUG.:::'
,p_page_id=>55
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(11568252983001183598)
,p_parent_id=>wwv_flow_imp.id(8903316033633288572)
,p_short_name=>'Create a Project'
,p_link=>'f?p=&APP_ID.:300:&SESSION.::&DEBUG.:::'
,p_page_id=>300
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(11569958114439596610)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Manage Project People'
,p_link=>'f?p=&APP_ID.:159:&SESSION.::&DEBUG.:::'
,p_page_id=>159
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(11618115244545589706)
,p_parent_id=>wwv_flow_imp.id(5253655685787685193)
,p_short_name=>'Project Roles'
,p_link=>'f?p=&APP_ID.:160:&SESSION.::&DEBUG.:::'
,p_page_id=>160
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(11618501368382609127)
,p_parent_id=>wwv_flow_imp.id(11618115244545589706)
,p_short_name=>'Project Role'
,p_link=>'f?p=&APP_ID.:161:&SESSION.'
,p_page_id=>161
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(11753015263347997812)
,p_parent_id=>wwv_flow_imp.id(5253655685787685193)
,p_short_name=>'Involvement Levels'
,p_link=>'f?p=&APP_ID.:165:&SESSION.::&DEBUG.:::'
,p_page_id=>165
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(11753016475908997823)
,p_parent_id=>wwv_flow_imp.id(11753015263347997812)
,p_short_name=>'Involvement Level'
,p_link=>'f?p=&APP_ID.:166:&SESSION.'
,p_page_id=>166
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(11809651031843709629)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Project Status'
,p_link=>'f?p=&APP_ID.:155:&SESSION.::&DEBUG.:::'
,p_page_id=>155
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(11876615808060357030)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Email Past Due'
,p_link=>'f?p=&APP_ID.:100:&SESSION.'
,p_page_id=>100
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(11888550029244578689)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Email Upcoming'
,p_link=>'f?p=&APP_ID.:180:&SESSION.'
,p_page_id=>180
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(11984304889859815684)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Email Past Due Deliverables Send Job'
,p_link=>'f?p=&APP_ID.:163:&SESSION.::&DEBUG.:::'
,p_page_id=>163
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(11984458486393853176)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Email Upcoming Deliverables Send Job'
,p_link=>'f?p=&APP_ID.:167:&SESSION.'
,p_page_id=>167
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(12021488846061269824)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Manage Project Resources'
,p_link=>'f?p=&APP_ID.:169:&SESSION.::&DEBUG.:::'
,p_page_id=>169
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(12021490023326269831)
,p_parent_id=>wwv_flow_imp.id(12021488846061269824)
,p_short_name=>'Project Resource'
,p_link=>'f?p=&APP_ID.:170:&SESSION.'
,p_page_id=>170
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(12030664321085021263)
,p_parent_id=>wwv_flow_imp.id(12030683699163030123)
,p_short_name=>'Resource Type'
,p_link=>'f?p=&APP_ID.:171:&SESSION.::&DEBUG.:::'
,p_page_id=>171
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(12030683699163030123)
,p_parent_id=>wwv_flow_imp.id(5253655685787685193)
,p_short_name=>'Resource Types'
,p_link=>'f?p=&APP_ID.:172:&SESSION.::&DEBUG.:::'
,p_page_id=>172
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(12101482749274225107)
,p_parent_id=>wwv_flow_imp.id(5253655685787685193)
,p_short_name=>'Project Sizes'
,p_link=>'f?p=&APP_ID.:156:&SESSION.::&DEBUG.:::'
,p_page_id=>156
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(12101483945504225114)
,p_parent_id=>wwv_flow_imp.id(12101482749274225107)
,p_short_name=>'Project Size'
,p_link=>'f?p=&APP_ID.:176:&SESSION.'
,p_page_id=>176
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(12128503934482303465)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'&APPLICATION_TITLE.: Projects by Resource'
,p_link=>'f?p=&APP_ID.:177:&SESSION.'
,p_page_id=>177
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(12130687486447002614)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Project Resources Report'
,p_link=>'f?p=&APP_ID.:158:&SESSION.::&DEBUG.:::'
,p_page_id=>158
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(12397043505729811734)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Manage Project Status Reports'
,p_link=>'f?p=&APP_ID.:162:&SESSION.::&DEBUG.:::'
,p_page_id=>162
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(12540083670833641741)
,p_parent_id=>wwv_flow_imp.id(6067468911226729752)
,p_short_name=>'Project Viewers'
,p_link=>'f?p=&APP_ID.:164:&SESSION.'
,p_page_id=>164
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(12587732187542473335)
,p_parent_id=>wwv_flow_imp.id(7773284413233269328)
,p_short_name=>'Managing Projects'
,p_link=>'f?p=&APP_ID.:173:&SESSION.::&DEBUG.:::'
,p_page_id=>173
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(12588764369879597965)
,p_parent_id=>wwv_flow_imp.id(7773284413233269328)
,p_short_name=>'Emails'
,p_link=>'f?p=&APP_ID.:174:&SESSION.'
,p_page_id=>174
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(12589327262289641088)
,p_parent_id=>wwv_flow_imp.id(7773284413233269328)
,p_short_name=>'Reporting'
,p_link=>'f?p=&APP_ID.:178:&SESSION.'
,p_page_id=>178
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(12589475014214687409)
,p_parent_id=>wwv_flow_imp.id(7773284413233269328)
,p_short_name=>'Application Administration'
,p_link=>'f?p=&APP_ID.:179:&SESSION.'
,p_page_id=>179
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(13450671330714917877)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Work Days'
,p_link=>'f?p=&APP_ID.:57:&SESSION.'
,p_page_id=>57
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(13516461884258495543)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Project Templates'
,p_link=>'f?p=&APP_ID.:60:&SESSION.'
,p_page_id=>60
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(13516463055082495548)
,p_parent_id=>wwv_flow_imp.id(13516461884258495543)
,p_short_name=>'Project Template'
,p_link=>'f?p=&APP_ID.:77:&SESSION.'
,p_page_id=>77
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(13521548482518308500)
,p_parent_id=>wwv_flow_imp.id(13617633135253924317)
,p_short_name=>'Template Milestones'
,p_link=>'f?p=&APP_ID.:47:&SESSION.::&DEBUG.:::'
,p_page_id=>47
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(13521549561628308509)
,p_parent_id=>wwv_flow_imp.id(13521548482518308500)
,p_short_name=>'Template Milestone'
,p_link=>'f?p=&APP_ID.:181:&SESSION.'
,p_page_id=>181
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(13522196759705551246)
,p_parent_id=>wwv_flow_imp.id(13617633135253924317)
,p_short_name=>'Template Action Items'
,p_link=>'f?p=&APP_ID.:182:&SESSION.::&DEBUG.:::'
,p_page_id=>182
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(13522197928039551250)
,p_parent_id=>wwv_flow_imp.id(13522196759705551246)
,p_short_name=>'Template Action Item'
,p_link=>'f?p=&APP_ID.:183:&SESSION.'
,p_page_id=>183
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(13617633135253924317)
,p_parent_id=>wwv_flow_imp.id(13516461884258495543)
,p_short_name=>'&P184_PROJECT_NAME.'
,p_link=>'f?p=&APP_ID.:184:&SESSION.::&DEBUG.:::'
,p_page_id=>184
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(14017362864003322722)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Past Due Milestones'
,p_link=>'f?p=&APP_ID.:29:&SESSION.'
,p_page_id=>29
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(14138412213895992903)
,p_short_name=>'&P194_DISPLAY_USERNAME.''s Dashboard'
,p_link=>'f?p=&APP_ID.:194:&SESSION.::&DEBUG.:::'
,p_page_id=>194
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(16027662943792690737)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Email Project Details'
,p_link=>'f?p=&APP_ID.:196:&SESSION.::&DEBUG.:::'
,p_page_id=>196
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(16027965238516753263)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Email Project Details Send Job'
,p_link=>'f?p=&APP_ID.:197:&SESSION.::&DEBUG.:::'
,p_page_id=>197
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(16842274610630943638)
,p_parent_id=>wwv_flow_imp.id(7773284413233269328)
,p_short_name=>'Access Control'
,p_link=>'f?p=&APP_ID.:198:&SESSION.'
,p_page_id=>198
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(16934824871426167325)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Feedback'
,p_link=>'f?p=&APP_ID.:203:&SESSION.'
,p_page_id=>203
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(18074437791398368002)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Projects History Report'
,p_link=>'f?p=&APP_ID.:126:&SESSION.::&DEBUG.:::'
,p_page_id=>126
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(18523143612128815605)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Email Project Statuses'
,p_link=>'f?p=&APP_ID.:131:&SESSION.'
,p_page_id=>131
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(18523284199871872422)
,p_parent_id=>wwv_flow_imp.id(8913377925264013267)
,p_short_name=>'Email Project Statuses Send Job'
,p_link=>'f?p=&APP_ID.:134:&SESSION.'
,p_page_id=>134
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(18874234050124601278)
,p_parent_id=>wwv_flow_imp.id(5253655685787685193)
,p_short_name=>'Regions'
,p_link=>'f?p=&APP_ID.:135:&SESSION.::&DEBUG.:::'
,p_page_id=>135
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(18874397416652640313)
,p_parent_id=>wwv_flow_imp.id(18874234050124601278)
,p_short_name=>'Countries'
,p_link=>'f?p=&APP_ID.:205:&SESSION.'
,p_page_id=>205
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(18879816171044688361)
,p_parent_id=>wwv_flow_imp.id(7773323506730108050)
,p_short_name=>'Project Countries'
,p_link=>'f?p=&APP_ID.:209:&SESSION.'
,p_page_id=>209
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(19157340986677522004)
,p_parent_id=>wwv_flow_imp.id(5253655685787685193)
,p_short_name=>'Deal Types'
,p_link=>'f?p=&APP_ID.:206:&SESSION.::&DEBUG.:::'
,p_page_id=>206
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(19272913449809975535)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Milestones Analysis Report'
,p_link=>'f?p=&APP_ID.:214:&SESSION.::&DEBUG.:::'
,p_page_id=>214
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(19288862548406153090)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Action Items Analysis Report'
,p_link=>'f?p=&APP_ID.:216:&SESSION.::&DEBUG.:::'
,p_page_id=>216
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(19992917073729618908)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'Project Issues Report'
,p_link=>'f?p=&APP_ID.:22:&SESSION.'
,p_page_id=>22
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(20027707890840144227)
,p_parent_id=>wwv_flow_imp.id(6697908733459863195)
,p_short_name=>'User Involvement Report'
,p_link=>'f?p=&APP_ID.:95:&SESSION.'
,p_page_id=>95
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(20417056725561437134)
,p_parent_id=>wwv_flow_imp.id(14138412213895992903)
,p_short_name=>'Mass Update My Open Action Items'
,p_link=>'f?p=&APP_ID.:212:&SESSION.::&DEBUG.:::'
,p_page_id=>212
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(20542130401246719350)
,p_parent_id=>wwv_flow_imp.id(20417056725561437134)
,p_short_name=>'Preview My Action Item Changes'
,p_link=>'f?p=&APP_ID.:213:&SESSION.::&DEBUG.:::'
,p_page_id=>213
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(20645297381432070554)
,p_parent_id=>wwv_flow_imp.id(14138412213895992903)
,p_short_name=>'Mass Update My Open Milestones'
,p_link=>'f?p=&APP_ID.:215:&SESSION.::&DEBUG.:215::'
,p_page_id=>215
);
wwv_flow_imp_shared.create_menu_option(
 p_id=>wwv_flow_imp.id(20646617421855232073)
,p_parent_id=>wwv_flow_imp.id(20645297381432070554)
,p_short_name=>'Preview My Milestone Changes'
,p_link=>'f?p=&APP_ID.:217:&SESSION.::&DEBUG.:::'
,p_page_id=>217
);
wwv_flow_imp.component_end;
end;
/
