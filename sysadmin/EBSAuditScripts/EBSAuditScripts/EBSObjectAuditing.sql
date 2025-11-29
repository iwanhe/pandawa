REM ----------------------------------------------------------------------------
REM Copyright (c) 2015 Oracle Corporation  - Redwood Shores
REM All rights reserved.
REM run as SYS
REM
REM This script will configure Object level auditing
REM per E-Business Suite guidance.
REM See the Auditing section of the E-Business Suite Security Admin Guide for more information
REM
REM ----------------------------------------------------------------------------

REM ----------------------------------------------------------------------------
REM Security Tables and Security Configuration
REM ----------------------------------------------------------------------------

REM Users

audit insert, update, delete on APPLSYS.FND_USER by access;
audit insert, update, delete on APPS.WF_USERS by access;

REM Responsibilities, Roles and Privs

audit insert, update, delete on APPS.WF_USER_ROLES by access;
audit insert, update, delete on APPLSYS.WF_LOCAL_USER_ROLES by access;
audit insert, update, delete on APPLSYS.WF_USER_ROLE_ASSIGNMENTS by access;
audit insert, update, delete on APPLSYS.FND_MENUS by access;
audit insert, update, delete on APPLSYS.FND_MENU_ENTRIES by access;
audit insert, update, delete on APPLSYS.FND_RESP_FUNCTIONS by access;
audit insert, update, delete on APPLSYS.FND_GRANTS by access;
audit insert, update, delete on APPLSYS.FND_DATA_GROUPS by access;
audit insert, update, delete on APPLSYS.FND_DATA_GROUP_UNITS by access;
audit insert, update, delete on APPLSYS.FND_COMPILED_MENU_FUNCTIONS by access;
audit insert, update, delete on APPLSYS.FND_FORM by access;
audit insert, update, delete on APPLSYS.FND_FORM_FUNCTIONS by access;
audit insert, update, delete on APPLSYS.FND_FORM_FUNCTIONS by access;
audit insert, update, delete on APPLSYS.FND_RESPONSIBILITY by access;
audit insert, update, delete on APPLSYS.FND_OBJECT_INSTANCE_SETS by access;

REM JTF Responsibilities, Roles and Privs

audit insert, update, delete on JTF.JTF_AUTH_PRINCIPALS_B by access;
audit insert, update, delete on JTF.JTF_AUTH_PRINCIPAL_MAPS by access;
audit insert, update, delete on JTF.JTF_AUTH_ROLE_PERMS by access;
audit insert, update, delete on JTF.JTF_AUTH_PERMISSIONS_B by access;

REM Security Configuration

audit insert, update, delete on HR.PER_SECURITY_PROFILES by access;
audit insert, update, delete on APPLSYS.FND_PROFILE_OPTION_VALUES by access;
audit insert, update, delete on APPLSYS.FND_ORACLE_USERID by access;
audit insert, update, delete on APPLSYS.FND_NODES by access;
audit insert, update, delete on APPLSYS.FND_EXECUTABLES by access;
audit insert, update, delete on APPLSYS.FND_APPLICATION by access;
audit insert, update, delete on APPLSYS.FND_DOCUMENT_ENTITIES by access;
audit insert, update, delete on APPLSYS.FND_PRINTER_DRIVERS by access;

REM Flexfield Configuration

audit insert, update, delete on APPLSYS.FND_ID_FLEX_SEGMENTS by access;
audit insert, update, delete on APPLSYS.FND_ID_FLEXS by access;
audit insert, update, delete on APPLSYS.FND_ID_FLEX_SEGMENTS by access;
audit insert, update, delete on APPLSYS.FND_FLEX_VALIDATION_EVENTS by access;
audit insert, update, delete on APPLSYS.FND_FLEX_VALIDATION_QUALIFIERS by access;
audit insert, update, delete on APPLSYS.FND_FLEX_VALIDATION_RULES by access;
audit insert, update, delete on APPLSYS.FND_FLEX_VALIDATION_RULE_LINES by access;
audit insert, update, delete on APPLSYS.FND_FLEX_VALIDATION_RULE_STATS by access;
audit insert, update, delete on APPLSYS.FND_FLEX_VALIDATION_TABLES by access;
audit insert, update, delete on APPLSYS.FND_FLEX_VALUE_RULES by access;
audit insert, update, delete on APPLSYS.FND_FLEX_VALUE_RULE_LINES by access;
audit insert, update, delete on APPLSYS.FND_FLEX_VALUE_RULE_USAGES by access;
audit insert, update, delete on APPLSYS.FND_FLEX_VALUE_SETS by access;

REM Concurrent Request Configuration

audit insert, update, delete on APPLSYS.FND_DESCRIPTIVE_FLEXS by access;
audit insert, update, delete on APPLSYS.FND_DESCR_FLEX_CONTEXTS by access;
audit insert, update, delete on APPLSYS.FND_DESCR_FLEX_COLUMN_USAGES by access;
audit insert, update, delete on APPLSYS.FND_REQUEST_GROUPS by access;
audit insert, update, delete on APPLSYS.FND_REQUEST_GROUP_UNITS by access;
audit insert, update, delete on APPLSYS.FND_CONCURRENT_PROGRAMS by access;
