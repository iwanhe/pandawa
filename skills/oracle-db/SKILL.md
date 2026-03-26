---
name: oracle-db
description: 129 practical Oracle Database and Oracle Container Registry reference guides covering SQL/PL/SQL development, performance tuning (AWR, ASH, explain plan, indexes, wait events, memory), security (TDE, VPD, auditing, network), administration (RMAN, Data Guard, undo/redo, users), monitoring, architecture (RAC, CDB/PDB, Exadata, In-Memory, OCI), DevOps (Liquibase, Flyway, utPLSQL, EBR), migrations from Postgres/MySQL/SQL Server/MongoDB/Snowflake/Redshift/DB2, PL/SQL development (packages, cursors, collections, unit testing, debugging), Oracle features (AQ, DBMS_SCHEDULER, materialized views, APEX), SQLcl (basics, scripting, Liquibase, MCP server, CI/CD), ORDS (architecture, authentication, AutoREST, REST API design, PL/SQL gateway), and Oracle Container Registry images. Use for any Oracle DB question, ORA- errors, DBMS_ packages, v$ views, Oracle tooling, ORDS REST APIs, SQLcl commands, or Oracle container images. Always consult this skill before answering Oracle-specific questions.
---

# Oracle DB Skills

A collection of 129 standalone reference guides for Oracle Database and Oracle Container Registry (OCR) database-category container images. Each file covers one topic with explanations, practical examples, best practices, and common mistakes.

## How to Use

1. **Find the right skill** using the category routing table below.
2. **Read only the file(s)** relevant to the task — do not load all files at once.
3. **Apply the guidance** to answer questions, generate code, or review existing work.

**Skill files are in:** `D:\0. KCSI\Github\pandawa\skills\oracle-db\skills\`

## Category Routing

| User asks about… | Read from |
|------------------|-----------|
| Backup, recovery, RMAN, redo/undo logs, users | `skills/admin/` |
| JDBC, Python, Node.js, .NET, Go drivers; pooling, JSON, XML, spatial, full-text, transactions, property graphs | `skills/appdev/` |
| RAC, CDB/PDB, Exadata, In-Memory, OCI, ATP/ADW, Data Guard | `skills/architecture/` |
| ERD, data modeling, partitioning, tablespaces | `skills/design/` |
| Liquibase, Flyway, online operations, EBR, utPLSQL, git for SQL | `skills/devops/` |
| Advanced Queuing, DBMS_SCHEDULER, materialized views, DBLinks, APEX | `skills/features/` |
| Migrating from PostgreSQL, MySQL, SQL Server, MongoDB, Snowflake, Redshift, etc. | `skills/migrations/` |
| Alert log, ADR, adrci, space, top SQL, health checks | `skills/monitoring/` |
| ORDS, REST APIs, OAuth2, AutoREST, PL/SQL gateway | `skills/ords/` |
| AWR, ASH, explain plan, indexes, optimizer stats, wait events, memory | `skills/performance/` |
| Packages, cursors, collections, error handling, unit testing, debugging | `skills/plsql/` |
| Privileges, VPD, TDE, encryption, auditing, network security | `skills/security/` |
| SQL patterns, window functions, CTEs, dynamic SQL, injection | `skills/sql-dev/` |
| SQLcl commands, scripting, Liquibase CLI, MCP server, CI/CD | `skills/sqlcl/` |
| Oracle Container Registry images, container pull commands, tags | `skills/containers/` |

## Skills Directory

```
skills/
├── admin/          (5)  backup-recovery, rman-basics, undo-management, redo-log-management, user-management
├── appdev/         (14) connection-pooling, json, xml, spatial, oracle-text, transactions, locking,
│                        sequences, sql-property-graph, python-oracledb, java-oracle-jdbc,
│                        nodejs-oracledb, dotnet-oracle, golang-oracle
├── architecture/   (6)  rac-concepts, multitenant, oracle-cloud-oci, exadata-features,
│                        inmemory-column-store, dataguard
├── containers/     (21) enterprise, free, adb-free, ords, rac, sqlcl, instantclient, private-ai,
│                        graph-quickstart, cman, gsm, operator, observability-exporter,
│                        microtx-ee-*, otmm, enterprise_ru, gsm_ru, rac_ru,
│                        container-selection-matrix, SKILLS.md
├── design/         (4)  erd-design, data-modeling, partitioning-strategy, tablespace-design
├── devops/         (5)  schema-migrations, online-operations, edition-based-redefinition,
│                        database-testing, version-control-sql
├── features/       (6)  advanced-queuing, dbms-scheduler, virtual-columns,
│                        materialized-views, database-links, oracle-apex
├── migrations/     (14) migrate-{postgres,mysql,sqlserver,db2,mongodb,snowflake,
│                        redshift,sqlite,teradata,sybase}-to-oracle,
│                        oracle-migration-tools, migration-assessment,
│                        migration-data-validation, migration-cutover-strategy
├── monitoring/     (5)  alert-log-analysis, adrci-usage, health-monitor,
│                        space-management, top-sql-queries
├── ords/           (10) ords-architecture, ords-installation, ords-auto-rest,
│                        ords-rest-api-design, ords-authentication, ords-pl-sql-gateway,
│                        ords-file-upload-download, ords-metadata-catalog,
│                        ords-security, ords-monitoring
├── performance/    (7)  awr-reports, ash-analysis, explain-plan, index-strategy,
│                        optimizer-stats, wait-events, memory-tuning
├── plsql/          (12) plsql-package-design, plsql-error-handling, plsql-performance,
│                        plsql-collections, plsql-cursors, plsql-dynamic-sql,
│                        plsql-security, plsql-debugging, plsql-unit-testing,
│                        plsql-patterns, plsql-compiler-options, plsql-code-quality
├── security/       (6)  privilege-management, row-level-security, data-masking,
│                        auditing, encryption, network-security
├── sql-dev/        (6)  sql-best-practices, sql-tuning, sql-injection-avoidance,
│                        pl-sql-best-practices, sql-patterns, dynamic-sql
└── sqlcl/          (8)  sqlcl-basics, sqlcl-scripting, sqlcl-liquibase, sqlcl-formatting,
                         sqlcl-ddl-generation, sqlcl-data-loading, sqlcl-cicd, sqlcl-mcp-server
```

## Key Starting Points

- **`skills/sqlcl/sqlcl-mcp-server.md`** — connecting Claude/AI assistants to Oracle via SQLcl MCP server
- **`skills/migrations/migration-assessment.md`** — start here for any migration project
- **`skills/performance/explain-plan.md`** — foundation for all SQL performance work
- **`skills/plsql/plsql-package-design.md`** — foundation for PL/SQL architecture
- **`skills/devops/schema-migrations.md`** — Liquibase/Flyway with Oracle in CI/CD
- **`skills/containers/container-selection-matrix.md`** — quick decision matrix for OCR images

## Oracle Version Notes

- All skills use **Oracle 19c** as the baseline unless stated otherwise.
- Features marked 21c, 23c, 23ai apply to **Oracle 26ai** — 19c-compatible alternatives are provided.
