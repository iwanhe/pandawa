prompt --application/shared_components/user_interface/template_options
begin
--   Manifest
--     THEME OPTIONS: 101
--   Manifest End
wwv_flow_imp.component_begin (
 p_version_yyyy_mm_dd=>'2024.11.30'
,p_release=>'24.2.11'
,p_default_workspace_id=>14430312641517637
,p_default_application_id=>101
,p_default_id_offset=>26419087940450297
,p_default_owner=>'WKSP_XTD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(46025411699050129)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_imp.id(1609153113324051937)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(46043468153050140)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_imp.id(1609165787138051967)
,p_css_classes=>'t-Dialog--noPadding'
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(46159988259050222)
,p_theme_id=>42
,p_name=>'COLLAPSED_DEFAULT'
,p_display_name=>'Collapsed by Default'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609201022152052058)
,p_css_classes=>'js-defaultCollapsed'
,p_template_types=>'LIST'
,p_help_text=>'This option will load the side navigation menu in a collapsed state by default.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(46209701076050256)
,p_theme_id=>42
,p_name=>'2_COLUMN_GRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(46209254364050255)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(46210096916050256)
,p_theme_id=>42
,p_name=>'3_COLUMN_GRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(46209254364050255)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(46210538830050257)
,p_theme_id=>42
,p_name=>'4_COLUMN_GRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(46209254364050255)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(46210931058050257)
,p_theme_id=>42
,p_name=>'5_COLUMN_GRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(46209254364050255)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(46211350720050258)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(46209254364050255)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(46211672138050258)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(46209254364050255)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(46212099799050258)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(46209254364050255)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(46212512891050259)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(46209254364050255)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(46212876765050259)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(46209254364050255)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(46213285165050260)
,p_theme_id=>42
,p_name=>'STACK'
,p_display_name=>'Stack'
,p_display_sequence=>5
,p_report_template_id=>wwv_flow_imp.id(46209254364050255)
,p_css_classes=>'t-MediaList--stack'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(151631497828360438)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(151630549551360437)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(151631971095360438)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(151630549551360437)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_imp.id(741161977464025898)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(151632335857360439)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(151630549551360437)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_imp.id(741161977464025898)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(151632735474360439)
,p_theme_id=>42
,p_name=>'NONE'
,p_display_name=>'None'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(151630549551360437)
,p_css_classes=>'js-dialog-nosize'
,p_group_id=>wwv_flow_imp.id(741161977464025898)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(151633088417360439)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(151630549551360437)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_imp.id(741161977464025898)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(188214071925446709)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(2118675665999159596)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Enables you to define a keyboard shortcut to activate the menu item.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(211651887977928098)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(201724407446589085)
,p_css_classes=>'t-Timeline--compact'
,p_group_id=>wwv_flow_imp.id(741178729300025906)
,p_template_types=>'REPORT'
,p_help_text=>'Displays a compact version of timeline with smaller text and fewer columns.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(248725821465532155)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(1069982239805186815)
,p_css_classes=>'t-ContentBlock--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(248734329458532161)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_imp.id(1609178879382051995)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(248739285176532166)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(151630549551360437)
,p_css_classes=>'t-DialogRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the region body.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(248807088208532214)
,p_theme_id=>42
,p_name=>'STYLE_B'
,p_display_name=>'Style B'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(1609201022152052058)
,p_css_classes=>'t-TreeNav--styleB'
,p_group_id=>wwv_flow_imp.id(741155132484025894)
,p_template_types=>'LIST'
,p_help_text=>'Style Variation B'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(248807841087532216)
,p_theme_id=>42
,p_name=>'STYLE_A'
,p_display_name=>'Style A'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1609201022152052058)
,p_css_classes=>'t-TreeNav--styleA'
,p_group_id=>wwv_flow_imp.id(741155132484025894)
,p_template_types=>'LIST'
,p_help_text=>'Style Variation A'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(248808583246532216)
,p_theme_id=>42
,p_name=>'STYLE_C'
,p_display_name=>'Classic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609201022152052058)
,p_css_classes=>'t-TreeNav--classic'
,p_group_id=>wwv_flow_imp.id(741155132484025894)
,p_template_types=>'LIST'
,p_help_text=>'Classic Style'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(248820533239532226)
,p_theme_id=>42
,p_name=>'WIZARD_PROGRESS_LINKS'
,p_display_name=>'Make Wizard Steps Clickable'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(1609201215784052059)
,p_css_classes=>'js-wizardProgressLinks'
,p_template_types=>'LIST'
,p_help_text=>'This option will make the wizard steps clickable links.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(248871215397532267)
,p_theme_id=>42
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_css_classes=>'t-Button--hoverIconPush'
,p_group_id=>wwv_flow_imp.id(741141910216025888)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will animate to the right or left on button hover or focus.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(248871975418532268)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_imp.id(1609202182404052066)
,p_css_classes=>'t-Button--hoverIconSpin'
,p_group_id=>wwv_flow_imp.id(741141910216025888)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will spin on button hover or focus.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(248874255194532270)
,p_theme_id=>42
,p_name=>'PUSH'
,p_display_name=>'Push'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_imp.id(1609202304669052069)
,p_css_classes=>'t-Button--hoverIconPush'
,p_group_id=>wwv_flow_imp.id(741141910216025888)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will animate to the right or left on button hover or focus.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(248874899753532271)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_imp.id(1609202304669052069)
,p_css_classes=>'t-Button--hoverIconSpin'
,p_group_id=>wwv_flow_imp.id(741141910216025888)
,p_template_types=>'BUTTON'
,p_help_text=>'The icon will spin on button hover or focus.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(248875306694532271)
,p_theme_id=>42
,p_name=>'HIDE_LABEL_ON_MOBILE'
,p_display_name=>'Hide Label on Mobile'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_imp.id(1609202304669052069)
,p_css_classes=>'t-Button--mobileHideLabel'
,p_template_types=>'BUTTON'
,p_help_text=>'This template options hides the button label on small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(287670950810292188)
,p_theme_id=>42
,p_name=>'ICONS_PLUS_OR_MINUS'
,p_display_name=>'Plus or Minus'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'t-Region--hideShowIconsMath'
,p_group_id=>wwv_flow_imp.id(741160756290025897)
,p_template_types=>'REGION'
,p_help_text=>'Use the plus and minus icons for the expand and collapse button.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(287671683512292188)
,p_theme_id=>42
,p_name=>'CONRTOLS_POSITION_END'
,p_display_name=>'End'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'t-Region--controlsPosEnd'
,p_group_id=>wwv_flow_imp.id(741161140753025897)
,p_template_types=>'REGION'
,p_help_text=>'Position the expand / collapse button to the end of the region header.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(287688801160292202)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609175202208051988)
,p_css_classes=>'t-HeroRegion--iconsSquare'
,p_group_id=>wwv_flow_imp.id(741163509326025899)
,p_template_types=>'REGION'
,p_help_text=>'The icons are displayed within a square.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(287689536057292203)
,p_theme_id=>42
,p_name=>'ICONS_CIRCULAR'
,p_display_name=>'Circle'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609175202208051988)
,p_css_classes=>'t-HeroRegion--iconsCircle'
,p_group_id=>wwv_flow_imp.id(741163509326025899)
,p_template_types=>'REGION'
,p_help_text=>'The icons are displayed within a circle.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(287698918398292210)
,p_theme_id=>42
,p_name=>'REMOVE_PAGE_OVERLAY'
,p_display_name=>'Remove Page Overlay'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(151630549551360437)
,p_css_classes=>'js-popup-noOverlay'
,p_template_types=>'REGION'
,p_help_text=>'This option will display the inline dialog without an overlay on the background.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(287744369126292246)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_imp.id(741152690928025893)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(287745056591292246)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_imp.id(741152690928025893)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(287762256096292259)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1609198279175052051)
,p_css_classes=>'t-MediaList--iconsSquare'
,p_group_id=>wwv_flow_imp.id(741152690928025893)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(287762934684292259)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609198279175052051)
,p_css_classes=>'t-MediaList--iconsRounded'
,p_group_id=>wwv_flow_imp.id(741152690928025893)
,p_template_types=>'LIST'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(287796592472292286)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--iconsSquare'
,p_group_id=>wwv_flow_imp.id(741175893608025905)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(287797320566292287)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--iconsRounded'
,p_group_id=>wwv_flow_imp.id(741175893608025905)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(287810931992292297)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609188817617052028)
,p_css_classes=>'t-Comments--iconsSquare'
,p_group_id=>wwv_flow_imp.id(741175893608025905)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(287811629675292297)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(1609188817617052028)
,p_css_classes=>'t-Comments--iconsRounded'
,p_group_id=>wwv_flow_imp.id(741175893608025905)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(287815079237292300)
,p_theme_id=>42
,p_name=>'ICONS_SQUARE'
,p_display_name=>'Square'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(46209254364050255)
,p_css_classes=>'t-MediaList--iconsSquare'
,p_group_id=>wwv_flow_imp.id(741175893608025905)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square shape.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(287815785712292300)
,p_theme_id=>42
,p_name=>'ICONS_ROUNDED'
,p_display_name=>'Rounded Corners'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(46209254364050255)
,p_css_classes=>'t-MediaList--iconsRounded'
,p_group_id=>wwv_flow_imp.id(741175893608025905)
,p_template_types=>'REPORT'
,p_help_text=>'The icons are displayed within a square with rounded corners.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(399031975416893323)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(399074102089893353)
,p_theme_id=>42
,p_name=>'SHOW_REGION_ICON'
,p_display_name=>'Show Region Icon'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--showIcon'
,p_template_types=>'REGION'
,p_help_text=>'Displays the region icon in the region header beside the region title'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(399110235912893381)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(399110886582893382)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_imp.id(741155132484025894)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(399144047330893410)
,p_theme_id=>42
,p_name=>'NO_LABEL_LG'
,p_display_name=>'Do not display labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(46169027504050228)
,p_css_classes=>'t-NavTabs--hiddenLabels-lg'
,p_group_id=>wwv_flow_imp.id(741151573346025893)
,p_template_types=>'LIST'
,p_help_text=>'Hides the label for the list item'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(399144747940893410)
,p_theme_id=>42
,p_name=>'LABEL_INLINE_LG'
,p_display_name=>'Display labels inline'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(46169027504050228)
,p_css_classes=>'t-NavTabs--inlineLabels-lg'
,p_group_id=>wwv_flow_imp.id(741151573346025893)
,p_template_types=>'LIST'
,p_help_text=>'Display the label inline with the icon and badge'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(399145428880893411)
,p_theme_id=>42
,p_name=>'LABEL_ABOVE_LG'
,p_display_name=>'Display labels above'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(46169027504050228)
,p_css_classes=>'t-NavTabs--stacked'
,p_group_id=>wwv_flow_imp.id(741151573346025893)
,p_template_types=>'LIST'
,p_help_text=>'Display the label stacked above the icon and badge'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(399146108650893411)
,p_theme_id=>42
,p_name=>'DISPLAY_LABELS_SM'
,p_display_name=>'Display labels'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(46169027504050228)
,p_css_classes=>'t-NavTabs--displayLabels-sm'
,p_group_id=>wwv_flow_imp.id(741154337488025894)
,p_template_types=>'LIST'
,p_help_text=>'Displays the label for the list items below the icon'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(399146758977893411)
,p_theme_id=>42
,p_name=>'HIDE_LABELS_SM'
,p_display_name=>'Do not display labels'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(46169027504050228)
,p_css_classes=>'t-NavTabs--hiddenLabels-sm'
,p_group_id=>wwv_flow_imp.id(741154337488025894)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(399161943944893422)
,p_theme_id=>42
,p_name=>'BLOCK'
,p_display_name=>'Block'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--featured t-Cards--block force-fa-lg'
,p_group_id=>wwv_flow_imp.id(741178729300025906)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(399162270666893424)
,p_theme_id=>42
,p_name=>'DISPLAY_SUBTITLE'
,p_display_name=>'Display Subtitle'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--displaySubtitle'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(444000230855741063)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609192737556052039)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(444000908606741064)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1609192737556052039)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_imp.id(741155132484025894)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(444001629276741064)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(1609192737556052039)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_imp.id(741155132484025894)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(444046989270741109)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(1609184244586052016)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(444047696097741109)
,p_theme_id=>42
,p_name=>'CIRCULAR'
,p_display_name=>'Circular'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609184244586052016)
,p_css_classes=>'t-BadgeList--circular'
,p_group_id=>wwv_flow_imp.id(741178729300025906)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(444048387027741109)
,p_theme_id=>42
,p_name=>'GRID'
,p_display_name=>'Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(1609184244586052016)
,p_css_classes=>'t-BadgeList--dash'
,p_group_id=>wwv_flow_imp.id(741178729300025906)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(492848745015419820)
,p_theme_id=>42
,p_name=>'USE_COMPACT_STYLE'
,p_display_name=>'Use Compact Style'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609182514379052001)
,p_css_classes=>'t-BreadcrumbRegion--compactTitle'
,p_template_types=>'REGION'
,p_help_text=>'Uses a compact style for the breadcrumbs.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(492921745041419881)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(46209254364050255)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_imp.id(741178335899025906)
,p_template_types=>'REPORT'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(570476764308077098)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_imp.id(1609153113324051937)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(570494557914077114)
,p_theme_id=>42
,p_name=>'STRETCH_TO_FIT_WINDOW'
,p_display_name=>'Stretch to Fit Window'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_imp.id(1609165787138051967)
,p_css_classes=>'ui-dialog--stretch'
,p_template_types=>'PAGE'
,p_help_text=>'Stretch the dialog to fit the browser window.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(570544531985077178)
,p_theme_id=>42
,p_name=>'TEXT_CONTENT'
,p_display_name=>'Text Content'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--textContent'
,p_group_id=>wwv_flow_imp.id(741168694796025901)
,p_template_types=>'REGION'
,p_help_text=>'Useful for displaying primarily text-based content, such as FAQs and more.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(577045702705081982)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(577045230067081981)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Displays a callout arrow that points to where the menu was activated from.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(577046109263081982)
,p_theme_id=>42
,p_name=>'FULL_WIDTH'
,p_display_name=>'Full Width'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(577045230067081981)
,p_css_classes=>'t-MegaMenu--fullWidth'
,p_template_types=>'LIST'
,p_help_text=>'Stretches the menu to fill the width of the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(577046568593081982)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(577045230067081981)
,p_css_classes=>'t-MegaMenu--layout2Cols'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(577046970537081982)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(577045230067081981)
,p_css_classes=>'t-MegaMenu--layout3Cols'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(577047363535081983)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(577045230067081981)
,p_css_classes=>'t-MegaMenu--layout4Cols'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(577047739863081983)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(577045230067081981)
,p_css_classes=>'t-MegaMenu--layout5Cols'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(577048113922081983)
,p_theme_id=>42
,p_name=>'CUSTOM'
,p_display_name=>'Custom'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_imp.id(577045230067081981)
,p_css_classes=>'t-MegaMenu--layoutCustom'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(577048573200081983)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_imp.id(577045230067081981)
,p_css_classes=>'t-MegaMenu--layoutStacked'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(597393614068618758)
,p_theme_id=>42
,p_name=>'AUTO_HEIGHT_INLINE_DIALOG'
,p_display_name=>'Auto Height'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1609178879382051995)
,p_css_classes=>'js-dialog-autoheight'
,p_template_types=>'REGION'
,p_help_text=>'This option will set the height of the dialog to fit its contents.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634399498116930946)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND_3'
,p_display_name=>'Background 3'
,p_display_sequence=>30
,p_page_template_id=>wwv_flow_imp.id(1609142962133051925)
,p_css_classes=>'t-LoginPage--bg3'
,p_group_id=>wwv_flow_imp.id(741155567204025895)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634400201540930947)
,p_theme_id=>42
,p_name=>'PAGE_LAYOUT_SPLIT'
,p_display_name=>'Split'
,p_display_sequence=>1
,p_page_template_id=>wwv_flow_imp.id(1609142962133051925)
,p_css_classes=>'t-LoginPage--split'
,p_group_id=>wwv_flow_imp.id(741155904549025895)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634400949627930947)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND_1'
,p_display_name=>'Background 1'
,p_display_sequence=>10
,p_page_template_id=>wwv_flow_imp.id(1609142962133051925)
,p_css_classes=>'t-LoginPage--bg1'
,p_group_id=>wwv_flow_imp.id(741155567204025895)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634401642163930948)
,p_theme_id=>42
,p_name=>'PAGE_BACKGROUND_2'
,p_display_name=>'Background 2'
,p_display_sequence=>20
,p_page_template_id=>wwv_flow_imp.id(1609142962133051925)
,p_css_classes=>'t-LoginPage--bg2'
,p_group_id=>wwv_flow_imp.id(741155567204025895)
,p_template_types=>'PAGE'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634500924886931028)
,p_theme_id=>42
,p_name=>'DISPLAY_POPUP_CALLOUT'
,p_display_name=>'Display Popup Callout'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(151630549551360437)
,p_css_classes=>'js-popup-callout'
,p_template_types=>'REGION'
,p_help_text=>'Use this option to add display a callout for the popup. Note that callout will only be displayed if the data-parent-element custom attribute is defined.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634501619599931028)
,p_theme_id=>42
,p_name=>'BEFORE'
,p_display_name=>'Before'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(151630549551360437)
,p_css_classes=>'js-popup-pos-before'
,p_group_id=>wwv_flow_imp.id(741160380424025897)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout before or typically to the left of the parent.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634502341414931029)
,p_theme_id=>42
,p_name=>'AFTER'
,p_display_name=>'After'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(151630549551360437)
,p_css_classes=>'js-popup-pos-after'
,p_group_id=>wwv_flow_imp.id(741160380424025897)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout after or typically to the right of the parent.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634503019317931029)
,p_theme_id=>42
,p_name=>'ABOVE'
,p_display_name=>'Above'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(151630549551360437)
,p_css_classes=>'js-popup-pos-above'
,p_group_id=>wwv_flow_imp.id(741160380424025897)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout above or typically on top of the parent.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634503749024931030)
,p_theme_id=>42
,p_name=>'BELOW'
,p_display_name=>'Below'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(151630549551360437)
,p_css_classes=>'js-popup-pos-below'
,p_group_id=>wwv_flow_imp.id(741160380424025897)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout below or typically to the bottom of the parent.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634504458284931030)
,p_theme_id=>42
,p_name=>'INSIDE'
,p_display_name=>'Inside'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_imp.id(151630549551360437)
,p_css_classes=>'js-popup-pos-inside'
,p_group_id=>wwv_flow_imp.id(741160380424025897)
,p_template_types=>'REGION'
,p_help_text=>'Positions the callout inside of the parent. This is useful when the parent is sufficiently large, such as a report or large region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634513831598931039)
,p_theme_id=>42
,p_name=>'LOGIN_HEADER_ICON'
,p_display_name=>'Icon'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609178666138051994)
,p_css_classes=>'t-Login-region--headerIcon'
,p_group_id=>wwv_flow_imp.id(741166305974025900)
,p_template_types=>'REGION'
,p_help_text=>'Displays only the Region Icon in the Login region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634514517833931039)
,p_theme_id=>42
,p_name=>'LOGIN_HEADER_TITLE'
,p_display_name=>'Title'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609178666138051994)
,p_css_classes=>'t-Login-region--headerTitle'
,p_group_id=>wwv_flow_imp.id(741166305974025900)
,p_template_types=>'REGION'
,p_help_text=>'Displays only the Region Title in the Login region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634515224058931040)
,p_theme_id=>42
,p_name=>'LOGO_HEADER_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(1609178666138051994)
,p_css_classes=>'t-Login-region--headerHidden'
,p_group_id=>wwv_flow_imp.id(741166305974025900)
,p_template_types=>'REGION'
,p_help_text=>'Hides both the Region Icon and Title from the Login region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634579401819931097)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(1609199991451052052)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634581663918931100)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(2118675665999159596)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu. Note that callout will only be displayed if the data-parent-element custom attribute is defined.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634582918270931102)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609200763212052056)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634584264850931103)
,p_theme_id=>42
,p_name=>'ICON_DEFAULT'
,p_display_name=>'Icon (Default)'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609201022152052058)
,p_css_classes=>'js-navCollapsed--default'
,p_group_id=>wwv_flow_imp.id(741150721273025892)
,p_template_types=>'LIST'
,p_help_text=>'Display icons when the navigation menu is collapsed for large screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634584890282931104)
,p_theme_id=>42
,p_name=>'COLLAPSE_STYLE_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1609201022152052058)
,p_css_classes=>'js-navCollapsed--hidden'
,p_group_id=>wwv_flow_imp.id(741150721273025892)
,p_template_types=>'LIST'
,p_help_text=>'Completely hide the navigation menu when it is collapsed.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634593410236931113)
,p_theme_id=>42
,p_name=>'DISPLAY_MENU_CALLOUT'
,p_display_name=>'Display Menu Callout'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(1609200189648052055)
,p_css_classes=>'js-menu-callout'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add display a callout for the menu.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634650940817931162)
,p_theme_id=>42
,p_name=>'ACTIONS_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_imp.id(634650409263931161)
,p_css_classes=>'t-ContentRow--hideActions'
,p_group_id=>wwv_flow_imp.id(741172330282025903)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Actions column from being rendered on the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634651366130931162)
,p_theme_id=>42
,p_name=>'ALIGNMENT_TOP'
,p_display_name=>'Top'
,p_display_sequence=>100
,p_report_template_id=>wwv_flow_imp.id(634650409263931161)
,p_css_classes=>'t-ContentRow--alignTop'
,p_group_id=>wwv_flow_imp.id(741175145326025904)
,p_template_types=>'REPORT'
,p_help_text=>'Aligns the content to the top of the row. This is useful when you expect that yours rows will vary in height (e.g. some rows will have longer descriptions than others).'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634651774627931162)
,p_theme_id=>42
,p_name=>'DESCRIPTION_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(634650409263931161)
,p_css_classes=>'t-ContentRow--hideDescription'
,p_group_id=>wwv_flow_imp.id(741172787470025903)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Description from being rendered on the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634652102161931162)
,p_theme_id=>42
,p_name=>'ICON_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(634650409263931161)
,p_css_classes=>'t-ContentRow--hideIcon'
,p_group_id=>wwv_flow_imp.id(741173562013025903)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Icon from being rendered on the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634652523333931163)
,p_theme_id=>42
,p_name=>'MISC_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(634650409263931161)
,p_css_classes=>'t-ContentRow--hideMisc'
,p_group_id=>wwv_flow_imp.id(741173977171025904)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Misc column from being rendered on the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634652964823931163)
,p_theme_id=>42
,p_name=>'SELECTION_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(634650409263931161)
,p_css_classes=>'t-ContentRow--hideSelection'
,p_group_id=>wwv_flow_imp.id(741174325023025904)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Selection column from being rendered on the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634653301210931163)
,p_theme_id=>42
,p_name=>'STYLE_COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>1
,p_report_template_id=>wwv_flow_imp.id(634650409263931161)
,p_css_classes=>'t-ContentRow--styleCompact'
,p_group_id=>wwv_flow_imp.id(741178729300025906)
,p_template_types=>'REPORT'
,p_help_text=>'This option reduces the padding and font sizes to present a compact display of the same information.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(634653698265931163)
,p_theme_id=>42
,p_name=>'TITLE_HIDDEN'
,p_display_name=>'Hidden'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(634650409263931161)
,p_css_classes=>'t-ContentRow--hideTitle'
,p_group_id=>wwv_flow_imp.id(741173182924025903)
,p_template_types=>'REPORT'
,p_help_text=>'Hides the Title from being rendered on the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719977902286957792)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(719977422660957792)
,p_css_classes=>'u-colors'
,p_template_types=>'REGION'
,p_help_text=>'Applies the colors from the theme''s color palette to the icons or initials within cards.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719978326337957792)
,p_theme_id=>42
,p_name=>'STYLE_A'
,p_display_name=>'Style A'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(719977422660957792)
,p_css_classes=>'t-CardsRegion--styleA'
,p_group_id=>wwv_flow_imp.id(741168694796025901)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719978728720957792)
,p_theme_id=>42
,p_name=>'STYLE_B'
,p_display_name=>'Style B'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(719977422660957792)
,p_css_classes=>'t-CardsRegion--styleB'
,p_group_id=>wwv_flow_imp.id(741168694796025901)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(719979093185957793)
,p_theme_id=>42
,p_name=>'STYLE_C'
,p_display_name=>'Style C'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(719977422660957792)
,p_css_classes=>'t-CardsRegion--styleC'
,p_group_id=>wwv_flow_imp.id(741168694796025901)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(720015263855957820)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(1609201022152052058)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(720024026173957829)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(577045230067081981)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741199874609025919)
,p_theme_id=>42
,p_name=>'FBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_imp.id(741145970987025890)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large bottom margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741200536094025919)
,p_theme_id=>42
,p_name=>'RBM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-bottom-lg'
,p_group_id=>wwv_flow_imp.id(741166778923025900)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large bottom margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741201219373025920)
,p_theme_id=>42
,p_name=>'FBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_imp.id(741145970987025890)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium bottom margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741201918167025920)
,p_theme_id=>42
,p_name=>'RBM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-bottom-md'
,p_group_id=>wwv_flow_imp.id(741166778923025900)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium bottom margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741202616080025921)
,p_theme_id=>42
,p_name=>'FBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_imp.id(741145970987025890)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the bottom margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741203292190025921)
,p_theme_id=>42
,p_name=>'RBM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-bottom-none'
,p_group_id=>wwv_flow_imp.id(741166778923025900)
,p_template_types=>'REGION'
,p_help_text=>'Removes the bottom margin for this region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741204050946025921)
,p_theme_id=>42
,p_name=>'FBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_imp.id(741145970987025890)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small bottom margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741204751549025922)
,p_theme_id=>42
,p_name=>'RBM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-bottom-sm'
,p_group_id=>wwv_flow_imp.id(741166778923025900)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small bottom margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741205388617025922)
,p_theme_id=>42
,p_name=>'FLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_imp.id(741147135713025891)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large left margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741206115169025923)
,p_theme_id=>42
,p_name=>'RLM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-left-lg'
,p_group_id=>wwv_flow_imp.id(741167176997025900)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741206843166025923)
,p_theme_id=>42
,p_name=>'FLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_imp.id(741147135713025891)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium left margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741207514472025923)
,p_theme_id=>42
,p_name=>'RLM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-left-md'
,p_group_id=>wwv_flow_imp.id(741167176997025900)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741208259761025924)
,p_theme_id=>42
,p_name=>'FLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_imp.id(741147135713025891)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the left margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741208890437025924)
,p_theme_id=>42
,p_name=>'RLM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-left-none'
,p_group_id=>wwv_flow_imp.id(741167176997025900)
,p_template_types=>'REGION'
,p_help_text=>'Removes the left margin from the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741209666674025925)
,p_theme_id=>42
,p_name=>'FLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_imp.id(741147135713025891)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small left margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741210309672025925)
,p_theme_id=>42
,p_name=>'RLM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-left-sm'
,p_group_id=>wwv_flow_imp.id(741167176997025900)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small left margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741211070544025926)
,p_theme_id=>42
,p_name=>'FRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_imp.id(741148308864025891)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large right margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741211749347025926)
,p_theme_id=>42
,p_name=>'RRM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-right-lg'
,p_group_id=>wwv_flow_imp.id(741167543636025901)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large right margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741212393294025926)
,p_theme_id=>42
,p_name=>'FRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_imp.id(741148308864025891)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium right margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741213088074025927)
,p_theme_id=>42
,p_name=>'RRM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-right-md'
,p_group_id=>wwv_flow_imp.id(741167543636025901)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium right margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741213867187025927)
,p_theme_id=>42
,p_name=>'FRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_imp.id(741148308864025891)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the right margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741214504477025928)
,p_theme_id=>42
,p_name=>'RRM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-right-none'
,p_group_id=>wwv_flow_imp.id(741167543636025901)
,p_template_types=>'REGION'
,p_help_text=>'Removes the right margin from the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741215287168025928)
,p_theme_id=>42
,p_name=>'FRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_imp.id(741148308864025891)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small right margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741215972707025929)
,p_theme_id=>42
,p_name=>'RRM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-right-sm'
,p_group_id=>wwv_flow_imp.id(741167543636025901)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small right margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741216590610025929)
,p_theme_id=>42
,p_name=>'FTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_imp.id(741149142868025891)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a large top margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741217306411025929)
,p_theme_id=>42
,p_name=>'RTM_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>40
,p_css_classes=>'margin-top-lg'
,p_group_id=>wwv_flow_imp.id(741168387264025901)
,p_template_types=>'REGION'
,p_help_text=>'Adds a large top margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741218036110025930)
,p_theme_id=>42
,p_name=>'FTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_imp.id(741149142868025891)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a medium top margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741218758042025930)
,p_theme_id=>42
,p_name=>'RTM_MEDIUM'
,p_display_name=>'Medium'
,p_display_sequence=>30
,p_css_classes=>'margin-top-md'
,p_group_id=>wwv_flow_imp.id(741168387264025901)
,p_template_types=>'REGION'
,p_help_text=>'Adds a medium top margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741219482025025931)
,p_theme_id=>42
,p_name=>'FTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_imp.id(741149142868025891)
,p_template_types=>'FIELD'
,p_help_text=>'Removes the top margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741220111231025931)
,p_theme_id=>42
,p_name=>'RTM_NONE'
,p_display_name=>'None'
,p_display_sequence=>10
,p_css_classes=>'margin-top-none'
,p_group_id=>wwv_flow_imp.id(741168387264025901)
,p_template_types=>'REGION'
,p_help_text=>'Removes the top margin for this region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741220864649025932)
,p_theme_id=>42
,p_name=>'FTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_imp.id(741149142868025891)
,p_template_types=>'FIELD'
,p_help_text=>'Adds a small top margin for this field.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741221513345025932)
,p_theme_id=>42
,p_name=>'RTM_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'margin-top-sm'
,p_group_id=>wwv_flow_imp.id(741168387264025901)
,p_template_types=>'REGION'
,p_help_text=>'Adds a small top margin to the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741222200650025932)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>30
,p_css_classes=>'t-Button--danger'
,p_group_id=>wwv_flow_imp.id(741145167830025889)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741222906712025933)
,p_theme_id=>42
,p_name=>'LARGEBOTTOMMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapBottom'
,p_group_id=>wwv_flow_imp.id(741143108662025888)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741223619322025933)
,p_theme_id=>42
,p_name=>'LARGELEFTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapLeft'
,p_group_id=>wwv_flow_imp.id(741143518973025889)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741224352924025934)
,p_theme_id=>42
,p_name=>'LARGERIGHTMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapRight'
,p_group_id=>wwv_flow_imp.id(741143964898025889)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741225006117025934)
,p_theme_id=>42
,p_name=>'LARGETOPMARGIN'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_css_classes=>'t-Button--gapTop'
,p_group_id=>wwv_flow_imp.id(741144380383025889)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741225773956025934)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>30
,p_css_classes=>'t-Button--large'
,p_group_id=>wwv_flow_imp.id(741142766256025888)
,p_template_types=>'BUTTON'
,p_help_text=>'A large button.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741226441750025935)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_LINK'
,p_display_name=>'Display as Link'
,p_display_sequence=>30
,p_css_classes=>'t-Button--link'
,p_group_id=>wwv_flow_imp.id(741144715805025889)
,p_template_types=>'BUTTON'
,p_help_text=>'This option makes the button appear as a text link.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741227109028025935)
,p_theme_id=>42
,p_name=>'NOUI'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>20
,p_css_classes=>'t-Button--noUI'
,p_group_id=>wwv_flow_imp.id(741144715805025889)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741227880450025936)
,p_theme_id=>42
,p_name=>'SMALLBOTTOMMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padBottom'
,p_group_id=>wwv_flow_imp.id(741143108662025888)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741228531597025936)
,p_theme_id=>42
,p_name=>'SMALLLEFTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padLeft'
,p_group_id=>wwv_flow_imp.id(741143518973025889)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741229265342025937)
,p_theme_id=>42
,p_name=>'SMALLRIGHTMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padRight'
,p_group_id=>wwv_flow_imp.id(741143964898025889)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741229987081025937)
,p_theme_id=>42
,p_name=>'SMALLTOPMARGIN'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_css_classes=>'t-Button--padTop'
,p_group_id=>wwv_flow_imp.id(741144380383025889)
,p_template_types=>'BUTTON'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741230594154025937)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Inner Button'
,p_display_sequence=>20
,p_css_classes=>'t-Button--pill'
,p_group_id=>wwv_flow_imp.id(741141580960025888)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741231329369025938)
,p_theme_id=>42
,p_name=>'PILLEND'
,p_display_name=>'Last Button'
,p_display_sequence=>30
,p_css_classes=>'t-Button--pillEnd'
,p_group_id=>wwv_flow_imp.id(741141580960025888)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741232000782025938)
,p_theme_id=>42
,p_name=>'PILLSTART'
,p_display_name=>'First Button'
,p_display_sequence=>10
,p_css_classes=>'t-Button--pillStart'
,p_group_id=>wwv_flow_imp.id(741141580960025888)
,p_template_types=>'BUTTON'
,p_help_text=>'Use this for the start of a pill button.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741232736972025939)
,p_theme_id=>42
,p_name=>'PRIMARY'
,p_display_name=>'Primary'
,p_display_sequence=>10
,p_css_classes=>'t-Button--primary'
,p_group_id=>wwv_flow_imp.id(741145167830025889)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741233424995025939)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_css_classes=>'t-Button--simple'
,p_group_id=>wwv_flow_imp.id(741144715805025889)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741234128810025939)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>20
,p_css_classes=>'t-Button--small'
,p_group_id=>wwv_flow_imp.id(741142766256025888)
,p_template_types=>'BUTTON'
,p_help_text=>'A small button.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741234822503025940)
,p_theme_id=>42
,p_name=>'STRETCH'
,p_display_name=>'Stretch'
,p_display_sequence=>10
,p_css_classes=>'t-Button--stretch'
,p_group_id=>wwv_flow_imp.id(741145572417025890)
,p_template_types=>'BUTTON'
,p_help_text=>'Stretches button to fill container'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741235542569025940)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_css_classes=>'t-Button--success'
,p_group_id=>wwv_flow_imp.id(741145167830025889)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741236211587025941)
,p_theme_id=>42
,p_name=>'TINY'
,p_display_name=>'Tiny'
,p_display_sequence=>10
,p_css_classes=>'t-Button--tiny'
,p_group_id=>wwv_flow_imp.id(741142766256025888)
,p_template_types=>'BUTTON'
,p_help_text=>'A very small button.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741236972497025941)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>20
,p_css_classes=>'t-Button--warning'
,p_group_id=>wwv_flow_imp.id(741145167830025889)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741237666477025941)
,p_theme_id=>42
,p_name=>'SHOWFORMLABELSABOVE'
,p_display_name=>'Show Form Labels Above'
,p_display_sequence=>10
,p_css_classes=>'t-Form--labelsAbove'
,p_group_id=>wwv_flow_imp.id(741165574205025900)
,p_template_types=>'REGION'
,p_help_text=>'Show form labels above input fields.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741238342856025942)
,p_theme_id=>42
,p_name=>'FORMSIZELARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form--large'
,p_group_id=>wwv_flow_imp.id(741164366021025899)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741239073301025942)
,p_theme_id=>42
,p_name=>'FORMLEFTLABELS'
,p_display_name=>'Left'
,p_display_sequence=>20
,p_css_classes=>'t-Form--leftLabels'
,p_group_id=>wwv_flow_imp.id(741165094878025899)
,p_template_types=>'REGION'
,p_help_text=>'Align form labels to left.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741239706668025943)
,p_theme_id=>42
,p_name=>'FORMREMOVEPADDING'
,p_display_name=>'Remove Padding'
,p_display_sequence=>20
,p_css_classes=>'t-Form--noPadding'
,p_group_id=>wwv_flow_imp.id(741163898196025899)
,p_template_types=>'REGION'
,p_help_text=>'Removes padding between items.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741240450594025943)
,p_theme_id=>42
,p_name=>'FORMSLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>10
,p_css_classes=>'t-Form--slimPadding'
,p_group_id=>wwv_flow_imp.id(741163898196025899)
,p_template_types=>'REGION'
,p_help_text=>'Reduces form item padding to 4px.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741241135151025944)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_FIELDS'
,p_display_name=>'Stretch Form Fields'
,p_display_sequence=>10
,p_css_classes=>'t-Form--stretchInputs'
,p_group_id=>wwv_flow_imp.id(741164757049025899)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741241863041025944)
,p_theme_id=>42
,p_name=>'FORMSIZEXLARGE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form--xlarge'
,p_group_id=>wwv_flow_imp.id(741164366021025899)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741242529755025944)
,p_theme_id=>42
,p_name=>'LARGE_FIELD'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--large'
,p_group_id=>wwv_flow_imp.id(741148714201025891)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741243244848025945)
,p_theme_id=>42
,p_name=>'POST_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--postTextBlock'
,p_group_id=>wwv_flow_imp.id(741146331757025890)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Post Text in a block style immediately after the item.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741243896413025945)
,p_theme_id=>42
,p_name=>'PRE_TEXT_BLOCK'
,p_display_name=>'Display as Block'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--preTextBlock'
,p_group_id=>wwv_flow_imp.id(741146744211025890)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the Item Pre Text in a block style immediately before the item.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741244686701025946)
,p_theme_id=>42
,p_name=>'DISPLAY_AS_PILL_BUTTON'
,p_display_name=>'Display as Pill Button'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--radioButtonGroup'
,p_group_id=>wwv_flow_imp.id(741147942396025891)
,p_template_types=>'FIELD'
,p_help_text=>'Displays the radio buttons to look like a button set / pill button.  Note that the the radio buttons must all be in the same row for this option to work.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741245080775025946)
,p_theme_id=>42
,p_name=>'STRETCH_FORM_ITEM'
,p_display_name=>'Stretch Form Item'
,p_display_sequence=>10
,p_css_classes=>'t-Form-fieldContainer--stretchInputs'
,p_template_types=>'FIELD'
,p_help_text=>'Stretches the form item to fill its container.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741245756032025946)
,p_theme_id=>42
,p_name=>'X_LARGE_SIZE'
,p_display_name=>'X Large'
,p_display_sequence=>20
,p_css_classes=>'t-Form-fieldContainer--xlarge'
,p_group_id=>wwv_flow_imp.id(741148714201025891)
,p_template_types=>'FIELD'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(741246401997025947)
,p_theme_id=>42
,p_name=>'HIDE_WHEN_ALL_ROWS_DISPLAYED'
,p_display_name=>'Hide when all rows displayed'
,p_display_sequence=>10
,p_css_classes=>'t-Report--hideNoPagination'
,p_group_id=>wwv_flow_imp.id(741177101329025905)
,p_template_types=>'REPORT'
,p_help_text=>'This option will hide the pagination when all rows are displayed.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(766778372477482644)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609175202208051988)
,p_css_classes=>'t-HeroRegion--featured'
,p_group_id=>wwv_flow_imp.id(741168694796025901)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(766779146138482644)
,p_theme_id=>42
,p_name=>'DISPLAY_ICON_NO'
,p_display_name=>'No'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609175202208051988)
,p_css_classes=>'t-HeroRegion--hideIcon'
,p_group_id=>wwv_flow_imp.id(741162310235025898)
,p_template_types=>'REGION'
,p_help_text=>'Hide the Hero Region icon.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(766779817573482645)
,p_theme_id=>42
,p_name=>'STACKED_FEATURED'
,p_display_name=>'Stacked Featured'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609175202208051988)
,p_css_classes=>'t-HeroRegion--featured t-HeroRegion--centered'
,p_group_id=>wwv_flow_imp.id(741168694796025901)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(801636188886073795)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_imp.id(1609136515118051906)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(801645352340073808)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_imp.id(1609139477660051920)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(801656504525073816)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_imp.id(1609146493940051929)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(801663784929073820)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_imp.id(1609150431590051933)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(801675531158073827)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_imp.id(1609159988920051956)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(801682796811073832)
,p_theme_id=>42
,p_name=>'STICKY_HEADER_ON_MOBILE'
,p_display_name=>'Sticky Header on Mobile'
,p_display_sequence=>100
,p_page_template_id=>wwv_flow_imp.id(1609163135326051960)
,p_css_classes=>'js-pageStickyMobileHeader'
,p_template_types=>'PAGE'
,p_help_text=>'This will position the contents of the Breadcrumb Bar region position so it sticks to the top of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(801699753731073846)
,p_theme_id=>42
,p_name=>'STICK_TO_BOTTOM'
,p_display_name=>'Stick to Bottom for Mobile'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609169348961051977)
,p_css_classes=>'t-ButtonRegion--stickToBottom'
,p_template_types=>'REGION'
,p_help_text=>'This will position the button container region to the bottom of the screen for small screens.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1069908957132186700)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609167356359051970)
,p_css_classes=>'t-Alert--removeHeading'
,p_group_id=>wwv_flow_imp.id(741157524865025896)
,p_template_types=>'REGION'
,p_help_text=>'Hides the Alert Title from being displayed.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1069909580522186700)
,p_theme_id=>42
,p_name=>'HIDDENHEADER'
,p_display_name=>'Hidden but Accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609167356359051970)
,p_css_classes=>'t-Alert--accessibleHeading'
,p_group_id=>wwv_flow_imp.id(741157524865025896)
,p_template_types=>'REGION'
,p_help_text=>'Visually hides the alert title, but assistive technologies can still read it.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1069950751018186759)
,p_theme_id=>42
,p_name=>'REMOVE_BODY_PADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609175202208051988)
,p_css_classes=>'t-HeroRegion--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes the padding around the hero region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1069982701406186816)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H1'
,p_display_name=>'Heading Level 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1069982239805186815)
,p_css_classes=>'t-ContentBlock--h1'
,p_group_id=>wwv_flow_imp.id(741167916053025901)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1069983132243186816)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H2'
,p_display_name=>'Heading Level 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1069982239805186815)
,p_css_classes=>'t-ContentBlock--h2'
,p_group_id=>wwv_flow_imp.id(741167916053025901)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1069983515714186816)
,p_theme_id=>42
,p_name=>'CONTENT_TITLE_H3'
,p_display_name=>'Heading Level 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(1069982239805186815)
,p_css_classes=>'t-ContentBlock--h3'
,p_group_id=>wwv_flow_imp.id(741167916053025901)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1069992814824186833)
,p_theme_id=>42
,p_name=>'CARDS_STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--stacked'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
,p_help_text=>'Stacks the cards on top of each other.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1069993501525186834)
,p_theme_id=>42
,p_name=>'RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_imp.id(741149580518025892)
,p_template_types=>'LIST'
,p_help_text=>'Raises the card so it pops up.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1069994231176186835)
,p_theme_id=>42
,p_name=>'COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_imp.id(741149580518025892)
,p_template_types=>'LIST'
,p_help_text=>'Fills the card background with the color of the icon or default link style.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1070033333764186901)
,p_theme_id=>42
,p_name=>'CARD_RAISE_CARD'
,p_display_name=>'Raise Card'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--animRaiseCard'
,p_group_id=>wwv_flow_imp.id(741170768708025902)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1070033994302186903)
,p_theme_id=>42
,p_name=>'CARDS_COLOR_FILL'
,p_display_name=>'Color Fill'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--animColorFill'
,p_group_id=>wwv_flow_imp.id(741170768708025902)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1368986698250827371)
,p_theme_id=>42
,p_name=>'REMEMBER_COLLAPSIBLE_STATE'
,p_display_name=>'Remember Collapsible State'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
,p_help_text=>'This option saves the current state of the collapsible region for the duration of the session.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1504772661673681877)
,p_theme_id=>42
,p_name=>'APPLY_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(1609198279175052051)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies colors from the Theme''s color palette to icons in the list.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1509943190942071592)
,p_theme_id=>42
,p_name=>'LIST_SIZE_LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609198279175052051)
,p_css_classes=>'t-MediaList--large force-fa-lg'
,p_group_id=>wwv_flow_imp.id(741154781648025894)
,p_template_types=>'LIST'
,p_help_text=>'Increases the size of the text and icons in the list.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1514178591441449334)
,p_theme_id=>42
,p_name=>'ACCENT_10'
,p_display_name=>'Accent 10'
,p_display_sequence=>100
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--accent10'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1514179305335449335)
,p_theme_id=>42
,p_name=>'ACCENT_11'
,p_display_name=>'Accent 11'
,p_display_sequence=>110
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--accent11'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1514180025849449335)
,p_theme_id=>42
,p_name=>'ACCENT_15'
,p_display_name=>'Accent 15'
,p_display_sequence=>150
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--accent15'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1514180694131449336)
,p_theme_id=>42
,p_name=>'ACCENT_7'
,p_display_name=>'Accent 7'
,p_display_sequence=>70
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--accent7'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1514181381716449336)
,p_theme_id=>42
,p_name=>'ACCENT_6'
,p_display_name=>'Accent 6'
,p_display_sequence=>60
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--accent6'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1514182099718449337)
,p_theme_id=>42
,p_name=>'ACCENT_13'
,p_display_name=>'Accent 13'
,p_display_sequence=>130
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--accent13'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1514182831488449337)
,p_theme_id=>42
,p_name=>'ACCENT_8'
,p_display_name=>'Accent 8'
,p_display_sequence=>80
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--accent8'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1514183540218449338)
,p_theme_id=>42
,p_name=>'ACCENT_9'
,p_display_name=>'Accent 9'
,p_display_sequence=>90
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--accent9'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1514184234124449338)
,p_theme_id=>42
,p_name=>'ACCENT_14'
,p_display_name=>'Accent 14'
,p_display_sequence=>140
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--accent14'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1514184921522449340)
,p_theme_id=>42
,p_name=>'ACCENT_12'
,p_display_name=>'Accent 12'
,p_display_sequence=>120
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--accent12'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624496330743440004)
,p_theme_id=>42
,p_name=>'WIZARD'
,p_display_name=>'Wizard'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609167356359051970)
,p_css_classes=>'t-Alert--wizard'
,p_group_id=>wwv_flow_imp.id(741156726395025895)
,p_template_types=>'REGION'
,p_help_text=>'Show the alert in a wizard style region.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624496520623440005)
,p_theme_id=>42
,p_name=>'HORIZONTAL'
,p_display_name=>'Horizontal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609167356359051970)
,p_css_classes=>'t-Alert--horizontal'
,p_group_id=>wwv_flow_imp.id(741156726395025895)
,p_template_types=>'REGION'
,p_help_text=>'Show horizontal alert with buttons to the right.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624496756119440005)
,p_theme_id=>42
,p_name=>'WARNING'
,p_display_name=>'Warning'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609167356359051970)
,p_css_classes=>'t-Alert--warning'
,p_group_id=>wwv_flow_imp.id(741157976788025896)
,p_template_types=>'REGION'
,p_help_text=>'Show a warning alert.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624496912981440005)
,p_theme_id=>42
,p_name=>'SUCCESS'
,p_display_name=>'Success'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(1609167356359051970)
,p_css_classes=>'t-Alert--success'
,p_group_id=>wwv_flow_imp.id(741157976788025896)
,p_template_types=>'REGION'
,p_help_text=>'Show success alert.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624497110472440005)
,p_theme_id=>42
,p_name=>'DANGER'
,p_display_name=>'Danger'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609167356359051970)
,p_css_classes=>'t-Alert--danger'
,p_group_id=>wwv_flow_imp.id(741157976788025896)
,p_template_types=>'REGION'
,p_help_text=>'Show an error or danger alert.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624497308402440005)
,p_theme_id=>42
,p_name=>'COLOREDBACKGROUND'
,p_display_name=>'Highlight Background'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1609167356359051970)
,p_css_classes=>'t-Alert--colorBG'
,p_template_types=>'REGION'
,p_help_text=>'Set alert background color to that of the alert type (warning, success, etc.)'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624497547305440005)
,p_theme_id=>42
,p_name=>'INFORMATION'
,p_display_name=>'Information'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(1609167356359051970)
,p_css_classes=>'t-Alert--info'
,p_group_id=>wwv_flow_imp.id(741157976788025896)
,p_template_types=>'REGION'
,p_help_text=>'Show informational alert.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624497593910440005)
,p_theme_id=>42
,p_name=>'USEDEFAULTICONS'
,p_display_name=>'Show Default Icons'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609167356359051970)
,p_css_classes=>'t-Alert--defaultIcons'
,p_group_id=>wwv_flow_imp.id(741157100701025895)
,p_template_types=>'REGION'
,p_help_text=>'Uses default icons for alert types.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624511975974440035)
,p_theme_id=>42
,p_name=>'REMOVEBORDERS'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609178411209051992)
,p_css_classes=>'t-IRR-region--noBorders'
,p_template_types=>'REGION'
,p_help_text=>'Removes borders around the Interactive Report'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624518922670440056)
,p_theme_id=>42
,p_name=>'HIDE_BREADCRUMB'
,p_display_name=>'Show Breadcrumbs'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1609182514379052001)
,p_css_classes=>'t-BreadcrumbRegion--showBreadcrumb'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624519136951440056)
,p_theme_id=>42
,p_name=>'GET_TITLE_FROM_BREADCRUMB'
,p_display_name=>'Use Current Breadcrumb Entry'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1609182514379052001)
,p_css_classes=>'t-BreadcrumbRegion--useBreadcrumbTitle'
,p_group_id=>wwv_flow_imp.id(741167916053025901)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624519266997440056)
,p_theme_id=>42
,p_name=>'REGION_HEADER_VISIBLE'
,p_display_name=>'Use Region Title'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1609182514379052001)
,p_css_classes=>'t-BreadcrumbRegion--useRegionTitle'
,p_group_id=>wwv_flow_imp.id(741167916053025901)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624519996198440059)
,p_theme_id=>42
,p_name=>'HIDESMALLSCREENS'
,p_display_name=>'Small Screens (Tablet)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609183249067052003)
,p_css_classes=>'t-Wizard--hideStepsSmall'
,p_group_id=>wwv_flow_imp.id(741163179306025898)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624520249871440059)
,p_theme_id=>42
,p_name=>'HIDEXSMALLSCREENS'
,p_display_name=>'X Small Screens (Mobile)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609183249067052003)
,p_css_classes=>'t-Wizard--hideStepsXSmall'
,p_group_id=>wwv_flow_imp.id(741163179306025898)
,p_template_types=>'REGION'
,p_help_text=>'Hides the wizard progress steps for screens that are smaller than 768px wide.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624520798403440062)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_imp.id(1609192737556052039)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
,p_help_text=>'Float badges to left'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624521054654440062)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_list_template_id=>wwv_flow_imp.id(1609192737556052039)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
,p_help_text=>'Use flexbox to arrange items'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624521171035440062)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_imp.id(1609192737556052039)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
,p_help_text=>'Span badges horizontally'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624521361608440062)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609192737556052039)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
,p_help_text=>'Stack badges on top of each other'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624521580873440063)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1609192737556052039)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624521770866440063)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(1609192737556052039)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624522010283440063)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(1609192737556052039)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in 4 column grid'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624522217535440063)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(1609192737556052039)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
,p_help_text=>'Arrange badges in a 5 column grid'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624522439120440063)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609192737556052039)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(741149891824025892)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624522581239440063)
,p_theme_id=>42
,p_name=>'MEDIUM'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1609192737556052039)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(741149891824025892)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624522774698440063)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(1609192737556052039)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(741149891824025892)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624523012326440063)
,p_theme_id=>42
,p_name=>'XXLARGE'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(1609192737556052039)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(741149891824025892)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624523217200440063)
,p_theme_id=>42
,p_name=>'XLARGE'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(1609192737556052039)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(741149891824025892)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624526675695440073)
,p_theme_id=>42
,p_name=>'SHOWGOTOARROW'
,p_display_name=>'Show Right Arrow'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1609197146392052049)
,p_css_classes=>'t-LinksList--showArrow'
,p_template_types=>'LIST'
,p_help_text=>'Show arrow to the right of link'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624526763061440073)
,p_theme_id=>42
,p_name=>'DISABLETEXTWRAPPING'
,p_display_name=>'Disable Text Wrapping'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(1609197146392052049)
,p_css_classes=>'t-LinksList--nowrap'
,p_template_types=>'LIST'
,p_help_text=>'Do not allow link text to wrap to new lines. Truncate with ellipsis.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624526948984440073)
,p_theme_id=>42
,p_name=>'SHOWBADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609197146392052049)
,p_css_classes=>'t-LinksList--showBadge'
,p_template_types=>'LIST'
,p_help_text=>'Show badge to right of link (requires Attribute 1 to be populated)'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624527426721440073)
,p_theme_id=>42
,p_name=>'SHOWTOPICONS'
,p_display_name=>'For Top Level Items Only'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609197146392052049)
,p_css_classes=>'t-LinksList--showTopIcons'
,p_group_id=>wwv_flow_imp.id(741151930192025893)
,p_template_types=>'LIST'
,p_help_text=>'This will show icons for top level items of the list only. It will not show icons for sub lists.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624527588605440073)
,p_theme_id=>42
,p_name=>'ACTIONS'
,p_display_name=>'Actions'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609197146392052049)
,p_css_classes=>'t-LinksList--actions'
,p_group_id=>wwv_flow_imp.id(741155132484025894)
,p_template_types=>'LIST'
,p_help_text=>'Render as actions to be placed on the right side column.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624527759045440074)
,p_theme_id=>42
,p_name=>'SHOWICONS'
,p_display_name=>'For All Items'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1609197146392052049)
,p_css_classes=>'t-LinksList--showIcons'
,p_group_id=>wwv_flow_imp.id(741151930192025893)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624529081702440078)
,p_theme_id=>42
,p_name=>'SPANHORIZONTAL'
,p_display_name=>'Span Horizontal'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(1609198279175052051)
,p_css_classes=>'t-MediaList--horizontal'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
,p_help_text=>'Show all list items in one horizontal row.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624529282980440078)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609198279175052051)
,p_css_classes=>'t-MediaList--cols t-MediaList--2cols'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624529492303440078)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1609198279175052051)
,p_css_classes=>'t-MediaList--cols t-MediaList--3cols'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624529735673440078)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(1609198279175052051)
,p_css_classes=>'t-MediaList--cols t-MediaList--4cols'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624529889852440078)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(1609198279175052051)
,p_css_classes=>'t-MediaList--cols t-MediaList--5cols'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624532219022440094)
,p_theme_id=>42
,p_name=>'ALLSTEPS'
,p_display_name=>'All Steps'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609201215784052059)
,p_css_classes=>'t-WizardSteps--displayLabels'
,p_group_id=>wwv_flow_imp.id(741153540220025894)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624532414666440094)
,p_theme_id=>42
,p_name=>'CURRENTSTEPONLY'
,p_display_name=>'Current Step Only'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1609201215784052059)
,p_css_classes=>'t-WizardSteps--displayCurrentLabelOnly'
,p_group_id=>wwv_flow_imp.id(741153540220025894)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624532622375440094)
,p_theme_id=>42
,p_name=>'HIDELABELS'
,p_display_name=>'Hide Labels'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(1609201215784052059)
,p_css_classes=>'t-WizardSteps--hideLabels'
,p_group_id=>wwv_flow_imp.id(741153540220025894)
,p_template_types=>'LIST'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624533509562440100)
,p_theme_id=>42
,p_name=>'128PX'
,p_display_name=>'128px'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(1609184244586052016)
,p_css_classes=>'t-BadgeList--xxlarge'
,p_group_id=>wwv_flow_imp.id(741171141879025902)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624533671290440101)
,p_theme_id=>42
,p_name=>'32PX'
,p_display_name=>'32px'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(1609184244586052016)
,p_css_classes=>'t-BadgeList--small'
,p_group_id=>wwv_flow_imp.id(741171141879025902)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624533909412440101)
,p_theme_id=>42
,p_name=>'48PX'
,p_display_name=>'48px'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609184244586052016)
,p_css_classes=>'t-BadgeList--medium'
,p_group_id=>wwv_flow_imp.id(741171141879025902)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624534058630440101)
,p_theme_id=>42
,p_name=>'64PX'
,p_display_name=>'64px'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(1609184244586052016)
,p_css_classes=>'t-BadgeList--large'
,p_group_id=>wwv_flow_imp.id(741171141879025902)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624534291401440103)
,p_theme_id=>42
,p_name=>'96PX'
,p_display_name=>'96px'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(1609184244586052016)
,p_css_classes=>'t-BadgeList--xlarge'
,p_group_id=>wwv_flow_imp.id(741171141879025902)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624534494118440103)
,p_theme_id=>42
,p_name=>'2COLUMNGRID'
,p_display_name=>'2 Column Grid'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609184244586052016)
,p_css_classes=>'t-BadgeList--cols'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a two column grid'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624534709499440103)
,p_theme_id=>42
,p_name=>'3COLUMNGRID'
,p_display_name=>'3 Column Grid'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(1609184244586052016)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--3cols'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
,p_help_text=>'Arrange badges in a 3 column grid'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624534934597440104)
,p_theme_id=>42
,p_name=>'4COLUMNGRID'
,p_display_name=>'4 Column Grid'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(1609184244586052016)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--4cols'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624535155114440104)
,p_theme_id=>42
,p_name=>'5COLUMNGRID'
,p_display_name=>'5 Column Grid'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(1609184244586052016)
,p_css_classes=>'t-BadgeList--cols t-BadgeList--5cols'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624535320443440104)
,p_theme_id=>42
,p_name=>'FLEXIBLEBOX'
,p_display_name=>'Flexible Box'
,p_display_sequence=>80
,p_report_template_id=>wwv_flow_imp.id(1609184244586052016)
,p_css_classes=>'t-BadgeList--flex'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624535509332440104)
,p_theme_id=>42
,p_name=>'FLOATITEMS'
,p_display_name=>'Float Items'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_imp.id(1609184244586052016)
,p_css_classes=>'t-BadgeList--float'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624535672707440104)
,p_theme_id=>42
,p_name=>'FIXED'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_imp.id(1609184244586052016)
,p_css_classes=>'t-BadgeList--fixed'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624535888743440104)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stacked'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(1609184244586052016)
,p_css_classes=>'t-BadgeList--stacked'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624536677292440111)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624536890951440111)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624537080834440111)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624537285423440111)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>15
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624537458342440112)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624537732237440112)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624537934184440112)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_imp.id(741171577849025902)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624538063876440112)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_imp.id(741171577849025902)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624538308782440112)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_imp.id(741171577849025902)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624538474819440112)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'u-colors'
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624538750336440112)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_imp.id(741175532008025904)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624538929940440112)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_imp.id(741175532008025904)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624539082124440113)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_imp.id(741178729300025906)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624539286643440113)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_imp.id(741178729300025906)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624539815020440116)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(1609188817617052028)
,p_css_classes=>'t-Comments--basic'
,p_group_id=>wwv_flow_imp.id(741174782244025904)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624540028559440117)
,p_theme_id=>42
,p_name=>'SPEECH_BUBBLES'
,p_display_name=>'Speech Bubbles'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609188817617052028)
,p_css_classes=>'t-Comments--chat'
,p_group_id=>wwv_flow_imp.id(741174782244025904)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624540799800440124)
,p_theme_id=>42
,p_name=>'VERTICALBORDERS'
,p_display_name=>'Vertical Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609189559365052032)
,p_css_classes=>'t-Report--verticalBorders'
,p_group_id=>wwv_flow_imp.id(741177585469025905)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624541044313440126)
,p_theme_id=>42
,p_name=>'ENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(1609189559365052032)
,p_css_classes=>'t-Report--rowHighlight'
,p_group_id=>wwv_flow_imp.id(741177962330025906)
,p_template_types=>'REPORT'
,p_help_text=>'Enable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624541216610440126)
,p_theme_id=>42
,p_name=>'ROWHIGHLIGHTDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609189559365052032)
,p_css_classes=>'t-Report--rowHighlightOff'
,p_group_id=>wwv_flow_imp.id(741177962330025906)
,p_template_types=>'REPORT'
,p_help_text=>'Disable row highlighting on mouse over'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624541402223440126)
,p_theme_id=>42
,p_name=>'REMOVEALLBORDERS'
,p_display_name=>'No Borders'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(1609189559365052032)
,p_css_classes=>'t-Report--noBorders'
,p_group_id=>wwv_flow_imp.id(741177585469025905)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624541466826440126)
,p_theme_id=>42
,p_name=>'STRETCHREPORT'
,p_display_name=>'Stretch Report'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(1609189559365052032)
,p_css_classes=>'t-Report--stretch'
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624541660470440126)
,p_theme_id=>42
,p_name=>'REMOVEOUTERBORDERS'
,p_display_name=>'No Outer Borders'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(1609189559365052032)
,p_css_classes=>'t-Report--inline'
,p_group_id=>wwv_flow_imp.id(741177585469025905)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624541891055440126)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSDISABLE'
,p_display_name=>'Disable'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609189559365052032)
,p_css_classes=>'t-Report--staticRowColors'
,p_group_id=>wwv_flow_imp.id(741170309676025902)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624542102749440126)
,p_theme_id=>42
,p_name=>'ALTROWCOLORSENABLE'
,p_display_name=>'Enable'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(1609189559365052032)
,p_css_classes=>'t-Report--altRowsDefault'
,p_group_id=>wwv_flow_imp.id(741170309676025902)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624542289038440126)
,p_theme_id=>42
,p_name=>'HORIZONTALBORDERS'
,p_display_name=>'Horizontal Only'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609189559365052032)
,p_css_classes=>'t-Report--horizontalBorders'
,p_group_id=>wwv_flow_imp.id(741177585469025905)
,p_template_types=>'REPORT'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624545272042440160)
,p_theme_id=>42
,p_name=>'LEFTICON'
,p_display_name=>'Left'
,p_display_sequence=>10
,p_button_template_id=>wwv_flow_imp.id(1609202304669052069)
,p_css_classes=>'t-Button--iconLeft'
,p_group_id=>wwv_flow_imp.id(741142328774025888)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1624545537139440160)
,p_theme_id=>42
,p_name=>'RIGHTICON'
,p_display_name=>'Right'
,p_display_sequence=>20
,p_button_template_id=>wwv_flow_imp.id(1609202304669052069)
,p_css_classes=>'t-Button--iconRight'
,p_group_id=>wwv_flow_imp.id(741142328774025888)
,p_template_types=>'BUTTON'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1716579764791878043)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_imp.id(741158770775025896)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1716580402445878044)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_imp.id(741158770775025896)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1716580966494878045)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1716581606031878047)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1716582243019878047)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1716582794021878048)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1716583411506878048)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1716583992574878049)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_imp.id(741159087984025896)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1716584328678878049)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1716584901794878049)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(741168694796025901)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1716585481041878049)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_imp.id(741159087984025896)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1716586713077878050)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_imp.id(741168694796025901)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1716587336136878051)
,p_theme_id=>42
,p_name=>'EXPANDED'
,p_display_name=>'Expanded'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'is-expanded'
,p_group_id=>wwv_flow_imp.id(741161560989025898)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1716587933461878051)
,p_theme_id=>42
,p_name=>'COLLAPSED'
,p_display_name=>'Collapsed'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'is-collapsed'
,p_group_id=>wwv_flow_imp.id(741161560989025898)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1723681006508555231)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(1609200189648052055)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1723681344442555232)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(1609200189648052055)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1723681889646555232)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(1609200189648052055)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1739122644266513828)
,p_theme_id=>42
,p_name=>'DRAGGABLE'
,p_display_name=>'Draggable'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609178879382051995)
,p_css_classes=>'js-draggable'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1739122906313513829)
,p_theme_id=>42
,p_name=>'MODAL'
,p_display_name=>'Modal'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609178879382051995)
,p_css_classes=>'js-modal'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1739123224680513829)
,p_theme_id=>42
,p_name=>'RESIZABLE'
,p_display_name=>'Resizable'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(1609178879382051995)
,p_css_classes=>'js-resizable'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1739123761042513830)
,p_theme_id=>42
,p_name=>'SMALL_480X320'
,p_display_name=>'Small (480x320)'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609178879382051995)
,p_css_classes=>'js-dialog-size480x320'
,p_group_id=>wwv_flow_imp.id(741161977464025898)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1739124357360513832)
,p_theme_id=>42
,p_name=>'LARGE_720X480'
,p_display_name=>'Large (720x480)'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(1609178879382051995)
,p_css_classes=>'js-dialog-size720x480'
,p_group_id=>wwv_flow_imp.id(741161977464025898)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1739125052147513833)
,p_theme_id=>42
,p_name=>'MEDIUM_600X400'
,p_display_name=>'Medium (600x400)'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609178879382051995)
,p_css_classes=>'js-dialog-size600x400'
,p_group_id=>wwv_flow_imp.id(741161977464025898)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1744577553796030158)
,p_theme_id=>42
,p_name=>'REMOVEUIDECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>4
,p_region_template_id=>wwv_flow_imp.id(1609169348961051977)
,p_css_classes=>'t-ButtonRegion--noUI'
,p_group_id=>wwv_flow_imp.id(741168694796025901)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1744578087457030158)
,p_theme_id=>42
,p_name=>'BORDERLESS'
,p_display_name=>'Borderless'
,p_display_sequence=>1
,p_region_template_id=>wwv_flow_imp.id(1609169348961051977)
,p_css_classes=>'t-ButtonRegion--noBorder'
,p_group_id=>wwv_flow_imp.id(741168694796025901)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1744578999941030159)
,p_theme_id=>42
,p_name=>'SLIMPADDING'
,p_display_name=>'Slim Padding'
,p_display_sequence=>5
,p_region_template_id=>wwv_flow_imp.id(1609169348961051977)
,p_css_classes=>'t-ButtonRegion--slimPadding'
,p_group_id=>wwv_flow_imp.id(741159517358025897)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1744579626061030159)
,p_theme_id=>42
,p_name=>'NOPADDING'
,p_display_name=>'No Padding'
,p_display_sequence=>3
,p_region_template_id=>wwv_flow_imp.id(1609169348961051977)
,p_css_classes=>'t-ButtonRegion--noPadding'
,p_group_id=>wwv_flow_imp.id(741159517358025897)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1748923506645016384)
,p_theme_id=>42
,p_name=>'FLOAT'
,p_display_name=>'Float'
,p_display_sequence=>60
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--float'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1748924145636016384)
,p_theme_id=>42
,p_name=>'2_COLUMNS'
,p_display_name=>'2 Columns'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--cols'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1748924703079016384)
,p_theme_id=>42
,p_name=>'SPAN_HORIZONTALLY'
,p_display_name=>'Span Horizontally'
,p_display_sequence=>70
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--spanHorizontally'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1748925260130016385)
,p_theme_id=>42
,p_name=>'5_COLUMNS'
,p_display_name=>'5 Columns'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--5cols'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1748925920395016385)
,p_theme_id=>42
,p_name=>'FEATURED'
,p_display_name=>'Featured'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--featured force-fa-lg'
,p_group_id=>wwv_flow_imp.id(741155132484025894)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1748926517713016386)
,p_theme_id=>42
,p_name=>'BASIC'
,p_display_name=>'Basic'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--basic'
,p_group_id=>wwv_flow_imp.id(741155132484025894)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1748927138525016386)
,p_theme_id=>42
,p_name=>'USE_THEME_COLORS'
,p_display_name=>'Apply Theme Colors'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'u-colors'
,p_template_types=>'LIST'
,p_help_text=>'Applies the colors from the theme''s color palette to the icons or initials within cards.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1748927742977016386)
,p_theme_id=>42
,p_name=>'4_LINES'
,p_display_name=>'4 Lines'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--desc-4ln'
,p_group_id=>wwv_flow_imp.id(741150375692025892)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1748928301312016386)
,p_theme_id=>42
,p_name=>'DISPLAY_ICONS'
,p_display_name=>'Display Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--displayIcons'
,p_group_id=>wwv_flow_imp.id(741152350824025893)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1748928890109016387)
,p_theme_id=>42
,p_name=>'DISPLAY_INITIALS'
,p_display_name=>'Display Initials'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--displayInitials'
,p_group_id=>wwv_flow_imp.id(741152350824025893)
,p_template_types=>'LIST'
,p_help_text=>'Initials come from List Attribute 3'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1748929461745016387)
,p_theme_id=>42
,p_name=>'2_LINES'
,p_display_name=>'2 Lines'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--desc-2ln'
,p_group_id=>wwv_flow_imp.id(741150375692025892)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1748930107481016388)
,p_theme_id=>42
,p_name=>'3_LINES'
,p_display_name=>'3 Lines'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--desc-3ln'
,p_group_id=>wwv_flow_imp.id(741150375692025892)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1748930749497016388)
,p_theme_id=>42
,p_name=>'3_COLUMNS'
,p_display_name=>'3 Columns'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--3cols'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1748931305519016388)
,p_theme_id=>42
,p_name=>'4_COLUMNS'
,p_display_name=>'4 Columns'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--4cols'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749231991969037287)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_imp.id(741158770775025896)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749232638345037288)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_imp.id(741158770775025896)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749233241109037288)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_imp.id(741158770775025896)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749233800804037288)
,p_theme_id=>42
,p_name=>'5_SECONDS'
,p_display_name=>'5 Seconds'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'js-cycle5s'
,p_group_id=>wwv_flow_imp.id(741169958982025902)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749234357505037289)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_imp.id(741158770775025896)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749235039528037289)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749235576293037290)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749236214677037291)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749236758150037291)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749237393798037292)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749237985301037292)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_imp.id(741162694032025898)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749238576601037292)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_imp.id(741159087984025896)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749239224888037293)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(741162694032025898)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749239512186037293)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749240091116037293)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(741168694796025901)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749240441088037294)
,p_theme_id=>42
,p_name=>'REMEMBER_CAROUSEL_SLIDE'
,p_display_name=>'Remember Carousel Slide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749241018532037294)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_imp.id(741159087984025896)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749242234803037295)
,p_theme_id=>42
,p_name=>'SLIDE'
,p_display_name=>'Slide'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'t-Region--carouselSlide'
,p_group_id=>wwv_flow_imp.id(741158299182025896)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749242826096037295)
,p_theme_id=>42
,p_name=>'SPIN'
,p_display_name=>'Spin'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'t-Region--carouselSpin'
,p_group_id=>wwv_flow_imp.id(741158299182025896)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1749243389724037295)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_imp.id(741168694796025901)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1752333732419227841)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(1609191499082052037)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1752334301730227842)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609191499082052037)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1752334945774227842)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(1609191499082052037)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_imp.id(741176300622025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1752335549039227843)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609191499082052037)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_imp.id(741176300622025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1752336110057227844)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(1609191499082052037)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_imp.id(741176300622025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1752336743253227844)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(1609191499082052037)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_imp.id(741176300622025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1752337258209227844)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(1609191499082052037)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_imp.id(741176300622025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1752337857758227844)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_imp.id(1609191499082052037)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_imp.id(741176300622025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1756650074151581262)
,p_theme_id=>42
,p_name=>'HIDEOVERFLOW'
,p_display_name=>'Hide'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--hiddenOverflow'
,p_group_id=>wwv_flow_imp.id(741159087984025896)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1756650736074581263)
,p_theme_id=>42
,p_name=>'HIDDENHEADERNOAT'
,p_display_name=>'Hidden'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--removeHeader'
,p_group_id=>wwv_flow_imp.id(741162694032025898)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1756651930501581265)
,p_theme_id=>42
,p_name=>'ACCENT_1'
,p_display_name=>'Accent 1'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--accent1'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1756652507229581267)
,p_theme_id=>42
,p_name=>'ACCENT_2'
,p_display_name=>'Accent 2'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--accent2'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1756653069815581267)
,p_theme_id=>42
,p_name=>'ACCENT_3'
,p_display_name=>'Accent 3'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--accent3'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1756653694741581268)
,p_theme_id=>42
,p_name=>'ACCENT_4'
,p_display_name=>'Accent 4'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--accent4'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1756654308149581268)
,p_theme_id=>42
,p_name=>'ACCENT_5'
,p_display_name=>'Accent 5'
,p_display_sequence=>50
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--accent5'
,p_group_id=>wwv_flow_imp.id(741156293169025895)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1756654867953581268)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_imp.id(741158770775025896)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1756655545288581268)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_imp.id(741158770775025896)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1756656114516581269)
,p_theme_id=>42
,p_name=>'NOBORDER'
,p_display_name=>'Remove Borders'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--noBorder'
,p_group_id=>wwv_flow_imp.id(741168694796025901)
,p_template_types=>'REGION'
,p_help_text=>'Removes borders from the region.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1756656456708581269)
,p_theme_id=>42
,p_name=>'NOBODYPADDING'
,p_display_name=>'Remove Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--noPadding'
,p_template_types=>'REGION'
,p_help_text=>'Removes padding from region body.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1756656982690581270)
,p_theme_id=>42
,p_name=>'STACKED'
,p_display_name=>'Stack Region'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--stacked'
,p_group_id=>wwv_flow_imp.id(741168694796025901)
,p_template_types=>'REGION'
,p_help_text=>'Removes side borders and shadows, and can be useful for accordions and regions that need to be grouped together vertically.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1756658202901581270)
,p_theme_id=>42
,p_name=>'240PX'
,p_display_name=>'240px'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'i-h240'
,p_group_id=>wwv_flow_imp.id(741158770775025896)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 240px.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1756658817320581272)
,p_theme_id=>42
,p_name=>'320PX'
,p_display_name=>'320px'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'i-h320'
,p_group_id=>wwv_flow_imp.id(741158770775025896)
,p_template_types=>'REGION'
,p_help_text=>'Sets region body height to 320px.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1756659358825581273)
,p_theme_id=>42
,p_name=>'SCROLLBODY'
,p_display_name=>'Scroll - Default'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--scrollBody'
,p_group_id=>wwv_flow_imp.id(741159087984025896)
,p_template_types=>'REGION'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1756659991304581273)
,p_theme_id=>42
,p_name=>'HIDEREGIONHEADER'
,p_display_name=>'Hidden but accessible'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--hideHeader'
,p_group_id=>wwv_flow_imp.id(741162694032025898)
,p_template_types=>'REGION'
,p_help_text=>'This option will hide the region header.  Note that the region title will still be audible for Screen Readers. Buttons placed in the region header will be hidden and inaccessible.'
,p_is_advanced=>'N'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1841145084354531748)
,p_theme_id=>42
,p_name=>'SHOW_NEXT_AND_PREVIOUS_BUTTONS'
,p_display_name=>'Show Next and Previous Buttons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'t-Region--showCarouselControls'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1841184497574531849)
,p_theme_id=>42
,p_name=>'REMEMBER_ACTIVE_TAB'
,p_display_name=>'Remember Active Tab'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1841183145772531847)
,p_css_classes=>'js-useLocalStorage'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1841208033223531906)
,p_theme_id=>42
,p_name=>'BEHAVE_LIKE_TABS'
,p_display_name=>'Behave Like Tabs'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609199991451052052)
,p_css_classes=>'js-tabLike'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1841208332928531906)
,p_theme_id=>42
,p_name=>'ADD_ACTIONS'
,p_display_name=>'Add Actions'
,p_display_sequence=>40
,p_list_template_id=>wwv_flow_imp.id(1609199991451052052)
,p_css_classes=>'js-addActions'
,p_template_types=>'LIST'
,p_help_text=>'Use this option to add shortcuts for menu items. Note that actions.js must be included on your page to support this functionality.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1841208595439531906)
,p_theme_id=>42
,p_name=>'SHOW_SUB_MENU_ICONS'
,p_display_name=>'Show Sub Menu Icons'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(1609199991451052052)
,p_css_classes=>'js-showSubMenuIcons'
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1841234708904532037)
,p_theme_id=>42
,p_name=>'RIGHT_ALIGNED_DETAILS'
,p_display_name=>'Right Aligned Details'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609191321083052036)
,p_css_classes=>'t-AVPList--rightAligned'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1841235293708532038)
,p_theme_id=>42
,p_name=>'VARIABLE_SMALL'
,p_display_name=>'Variable - Small'
,p_display_sequence=>40
,p_report_template_id=>wwv_flow_imp.id(1609191321083052036)
,p_css_classes=>'t-AVPList--variableLabelSmall'
,p_group_id=>wwv_flow_imp.id(741176300622025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1841235895416532038)
,p_theme_id=>42
,p_name=>'FIXED_MEDIUM'
,p_display_name=>'Fixed - Medium'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609191321083052036)
,p_css_classes=>'t-AVPList--fixedLabelMedium'
,p_group_id=>wwv_flow_imp.id(741176300622025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1841236494594532038)
,p_theme_id=>42
,p_name=>'LEFT_ALIGNED_DETAILS'
,p_display_name=>'Left Aligned Details'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(1609191321083052036)
,p_css_classes=>'t-AVPList--leftAligned'
,p_group_id=>wwv_flow_imp.id(741176761134025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1841237089641532038)
,p_theme_id=>42
,p_name=>'VARIABLE_LARGE'
,p_display_name=>'Variable - Large'
,p_display_sequence=>60
,p_report_template_id=>wwv_flow_imp.id(1609191321083052036)
,p_css_classes=>'t-AVPList--variableLabelLarge'
,p_group_id=>wwv_flow_imp.id(741176300622025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1841237673091532039)
,p_theme_id=>42
,p_name=>'FIXED_SMALL'
,p_display_name=>'Fixed - Small'
,p_display_sequence=>10
,p_report_template_id=>wwv_flow_imp.id(1609191321083052036)
,p_css_classes=>'t-AVPList--fixedLabelSmall'
,p_group_id=>wwv_flow_imp.id(741176300622025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1841238341187532039)
,p_theme_id=>42
,p_name=>'FIXED_LARGE'
,p_display_name=>'Fixed - Large'
,p_display_sequence=>30
,p_report_template_id=>wwv_flow_imp.id(1609191321083052036)
,p_css_classes=>'t-AVPList--fixedLabelLarge'
,p_group_id=>wwv_flow_imp.id(741176300622025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1841238875089532040)
,p_theme_id=>42
,p_name=>'VARIABLE_MEDIUM'
,p_display_name=>'Variable - Medium'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(1609191321083052036)
,p_css_classes=>'t-AVPList--variableLabelMedium'
,p_group_id=>wwv_flow_imp.id(741176300622025905)
,p_template_types=>'REPORT'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1852320430071387422)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_imp.id(741155132484025894)
,p_template_types=>'LIST'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1852321108156387425)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_list_template_id=>wwv_flow_imp.id(1609194685364052043)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_imp.id(741150375692025892)
,p_template_types=>'LIST'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1852633192582389695)
,p_theme_id=>42
,p_name=>'COMPACT'
,p_display_name=>'Compact'
,p_display_sequence=>20
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--compact'
,p_group_id=>wwv_flow_imp.id(741178729300025906)
,p_template_types=>'REPORT'
,p_help_text=>'Use this option when you want to show smaller cards.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1852633876062389696)
,p_theme_id=>42
,p_name=>'HIDDEN_BODY_TEXT'
,p_display_name=>'Hidden'
,p_display_sequence=>50
,p_report_template_id=>wwv_flow_imp.id(1609186449852052021)
,p_css_classes=>'t-Cards--hideBody'
,p_group_id=>wwv_flow_imp.id(741171577849025902)
,p_template_types=>'REPORT'
,p_help_text=>'This option hides the card body which contains description and subtext.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1879020617870493928)
,p_theme_id=>42
,p_name=>'HIDE_ICONS'
,p_display_name=>'Hide Icons'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609167356359051970)
,p_css_classes=>'t-Alert--noIcon'
,p_group_id=>wwv_flow_imp.id(741157100701025895)
,p_template_types=>'REGION'
,p_help_text=>'Hides alert icons'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1879021217850493928)
,p_theme_id=>42
,p_name=>'SHOW_CUSTOM_ICONS'
,p_display_name=>'Show Custom Icons'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(1609167356359051970)
,p_css_classes=>'t-Alert--customIcons'
,p_group_id=>wwv_flow_imp.id(741157100701025895)
,p_template_types=>'REGION'
,p_help_text=>'Set custom icons by modifying the Alert Region''s Icon CSS Classes property.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1879101450366494197)
,p_theme_id=>42
,p_name=>'ABOVE_LABEL'
,p_display_name=>'Above Label'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1879100963965494195)
,p_css_classes=>'t-Tabs--iconsAbove'
,p_group_id=>wwv_flow_imp.id(741152350824025893)
,p_template_types=>'LIST'
,p_help_text=>'Places icons above tab label.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1879101669713494197)
,p_theme_id=>42
,p_name=>'FILL_LABELS'
,p_display_name=>'Fill Labels'
,p_display_sequence=>1
,p_list_template_id=>wwv_flow_imp.id(1879100963965494195)
,p_css_classes=>'t-Tabs--fillLabels'
,p_group_id=>wwv_flow_imp.id(741153921439025894)
,p_template_types=>'LIST'
,p_help_text=>'Stretch tabs to fill to the width of the tabs container.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1879102014539494197)
,p_theme_id=>42
,p_name=>'INLINE_WITH_LABEL'
,p_display_name=>'Inline with Label'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1879100963965494195)
,p_css_classes=>'t-Tabs--inlineIcons'
,p_group_id=>wwv_flow_imp.id(741152350824025893)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1879102353301494197)
,p_theme_id=>42
,p_name=>'LARGE'
,p_display_name=>'Large'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1879100963965494195)
,p_css_classes=>'t-Tabs--large'
,p_group_id=>wwv_flow_imp.id(741154781648025894)
,p_template_types=>'LIST'
,p_help_text=>'Increases font size and white space around tab items.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1879102582785494197)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1879100963965494195)
,p_css_classes=>'t-Tabs--pill'
,p_group_id=>wwv_flow_imp.id(741155132484025894)
,p_template_types=>'LIST'
,p_help_text=>'Displays tabs in a pill container.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1879102871116494197)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1879100963965494195)
,p_css_classes=>'t-Tabs--simple'
,p_group_id=>wwv_flow_imp.id(741155132484025894)
,p_template_types=>'LIST'
,p_help_text=>'A very simplistic tab UI.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1879103157807494197)
,p_theme_id=>42
,p_name=>'SMALL'
,p_display_name=>'Small'
,p_display_sequence=>5
,p_list_template_id=>wwv_flow_imp.id(1879100963965494195)
,p_css_classes=>'t-Tabs--small'
,p_group_id=>wwv_flow_imp.id(741154781648025894)
,p_template_types=>'LIST'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1959460321624061316)
,p_theme_id=>42
,p_name=>'TABSLARGE'
,p_display_name=>'Large'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1841183145772531847)
,p_css_classes=>'t-TabsRegion-mod--large'
,p_group_id=>wwv_flow_imp.id(741169131546025901)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1959460861742061316)
,p_theme_id=>42
,p_name=>'TABS_SMALL'
,p_display_name=>'Small'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1841183145772531847)
,p_css_classes=>'t-TabsRegion-mod--small'
,p_group_id=>wwv_flow_imp.id(741169131546025901)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1959461548909061316)
,p_theme_id=>42
,p_name=>'FILL_TAB_LABELS'
,p_display_name=>'Fill Tab Labels'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1841183145772531847)
,p_css_classes=>'t-TabsRegion-mod--fillLabels'
,p_group_id=>wwv_flow_imp.id(741165911863025900)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1959462066911061317)
,p_theme_id=>42
,p_name=>'PILL'
,p_display_name=>'Pill'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1841183145772531847)
,p_css_classes=>'t-TabsRegion-mod--pill'
,p_group_id=>wwv_flow_imp.id(741169539674025901)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1959462697841061317)
,p_theme_id=>42
,p_name=>'SIMPLE'
,p_display_name=>'Simple'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1841183145772531847)
,p_css_classes=>'t-TabsRegion-mod--simple'
,p_group_id=>wwv_flow_imp.id(741169539674025901)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1975197379996535602)
,p_theme_id=>42
,p_name=>'SHOW_ICONS'
,p_display_name=>'Show Icons'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609198279175052051)
,p_css_classes=>'t-MediaList--showIcons'
,p_template_types=>'LIST'
,p_help_text=>'Display an icon next to the list item.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1975197730249535602)
,p_theme_id=>42
,p_name=>'SHOW_DESCRIPTION'
,p_display_name=>'Show Description'
,p_display_sequence=>20
,p_list_template_id=>wwv_flow_imp.id(1609198279175052051)
,p_css_classes=>'t-MediaList--showDesc'
,p_template_types=>'LIST'
,p_help_text=>'Shows the description (Attribute 1) for each list item.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(1975197957871535602)
,p_theme_id=>42
,p_name=>'SHOW_BADGES'
,p_display_name=>'Show Badges'
,p_display_sequence=>30
,p_list_template_id=>wwv_flow_imp.id(1609198279175052051)
,p_css_classes=>'t-MediaList--showBadges'
,p_template_types=>'LIST'
,p_help_text=>'Show a badge (Attribute 2) to the right of the list item.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2214804092492475820)
,p_theme_id=>42
,p_name=>'LIGHT_BACKGROUND'
,p_display_name=>'Light Background'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1069982239805186815)
,p_css_classes=>'t-ContentBlock--lightBG'
,p_group_id=>wwv_flow_imp.id(741159941942025897)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly lighter background.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2214804468356475820)
,p_theme_id=>42
,p_name=>'ADD_BODY_PADDING'
,p_display_name=>'Add Body Padding'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1069982239805186815)
,p_css_classes=>'t-ContentBlock--padded'
,p_template_types=>'REGION'
,p_help_text=>'Adds padding to the region''s body container.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2214805193088475821)
,p_theme_id=>42
,p_name=>'SHADOW_BACKGROUND'
,p_display_name=>'Shadow Background'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1069982239805186815)
,p_css_classes=>'t-ContentBlock--shadowBG'
,p_group_id=>wwv_flow_imp.id(741159941942025897)
,p_template_types=>'REGION'
,p_help_text=>'Gives the region body a slightly darker background.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2304999961186123315)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2305024115764123410)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609178411209051992)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Interactive Reports toolbar to maximize the report. Clicking this button will toggle the maximize state and stretch the report to fill the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2305028204082123494)
,p_theme_id=>42
,p_name=>'SHOW_MAXIMIZE_BUTTON'
,p_display_name=>'Show Maximize Button'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'js-showMaximizeButton'
,p_template_types=>'REGION'
,p_help_text=>'Displays a button in the Region Header to maximize the region. Clicking this button will toggle the maximize state and stretch the region to fill the screen.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2317827636802722353)
,p_theme_id=>42
,p_name=>'VERTICAL_LIST'
,p_display_name=>'Vertical Orientation'
,p_display_sequence=>10
,p_list_template_id=>wwv_flow_imp.id(1609201215784052059)
,p_css_classes=>'t-WizardSteps--vertical'
,p_template_types=>'LIST'
,p_help_text=>'Displays the wizard progress list in a vertical orientation and is suitable for displaying within a side column of a page.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2409774502478627721)
,p_theme_id=>42
,p_name=>'SHOW_TITLE'
,p_display_name=>'Show Title'
,p_display_sequence=>10
,p_region_template_id=>wwv_flow_imp.id(1609183249067052003)
,p_css_classes=>'t-Wizard--showTitle'
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2430230522909764896)
,p_theme_id=>42
,p_name=>'10_SECONDS'
,p_display_name=>'10 Seconds'
,p_display_sequence=>20
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'js-cycle10s'
,p_group_id=>wwv_flow_imp.id(741169958982025902)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2430231150386764898)
,p_theme_id=>42
,p_name=>'15_SECONDS'
,p_display_name=>'15 Seconds'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'js-cycle15s'
,p_group_id=>wwv_flow_imp.id(741169958982025902)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2430231687619764898)
,p_theme_id=>42
,p_name=>'20_SECONDS'
,p_display_name=>'20 Seconds'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(1609171134656051979)
,p_css_classes=>'js-cycle20s'
,p_group_id=>wwv_flow_imp.id(741169958982025902)
,p_template_types=>'REGION'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2430245860909764923)
,p_theme_id=>42
,p_name=>'480PX'
,p_display_name=>'480px'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'i-h480'
,p_group_id=>wwv_flow_imp.id(741158770775025896)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 480px.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2430246534955764924)
,p_theme_id=>42
,p_name=>'640PX'
,p_display_name=>'640px'
,p_display_sequence=>40
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'i-h640'
,p_group_id=>wwv_flow_imp.id(741158770775025896)
,p_template_types=>'REGION'
,p_help_text=>'Sets body height to 640px.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2499734174351686612)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(1609175722365051990)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_imp.id(741168694796025901)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_imp_shared.create_template_option(
 p_id=>wwv_flow_imp.id(2500217984773777948)
,p_theme_id=>42
,p_name=>'REMOVE_UI_DECORATION'
,p_display_name=>'Remove UI Decoration'
,p_display_sequence=>30
,p_region_template_id=>wwv_flow_imp.id(1609179910711051998)
,p_css_classes=>'t-Region--noUI'
,p_group_id=>wwv_flow_imp.id(741168694796025901)
,p_template_types=>'REGION'
,p_help_text=>'Removes UI decoration (borders, backgrounds, shadows, etc) from the region.'
);
wwv_flow_imp.component_end;
end;
/
