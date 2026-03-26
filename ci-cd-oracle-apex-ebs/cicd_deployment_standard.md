# CI/CD Deployment Standard — Oracle APEX & Oracle EBS

**Versi Dokumen:** 1.0  
**Tanggal:** 25 Maret 2026  
**Berlaku untuk:** Oracle APEX 24.x, Oracle EBS R12.2  

---

## Daftar Isi

1. [Tujuan & Ruang Lingkup](#1-tujuan--ruang-lingkup)
2. [Arsitektur Lingkungan](#2-arsitektur-lingkungan)
3. [Branching Strategy](#3-branching-strategy)
4. [CI/CD Pipeline — Oracle APEX](#4-cicd-pipeline--oracle-apex)
5. [CI/CD Pipeline — Oracle EBS (FNDLOAD)](#5-cicd-pipeline--oracle-ebs-fndload)
6. [Standar Penamaan File Artefak](#6-standar-penamaan-file-artefak)
7. [Testing Standard](#7-testing-standard)
8. [Deployment Checklist](#8-deployment-checklist)
9. [Rollback Procedure](#9-rollback-procedure)
10. [Tools & Referensi](#10-tools--referensi)

---

## 1. Tujuan & Ruang Lingkup

Dokumen ini menetapkan standar proses CI/CD (Continuous Integration / Continuous Delivery) untuk dua platform Oracle:

- **Oracle APEX** — platform low-code berbasis browser untuk aplikasi web enterprise
- **Oracle EBS R12.2** — enterprise resource planning dengan manajemen konfigurasi via FNDLOAD/WFLOAD

Tujuan standar ini:
- Memastikan konsistensi deployment di semua environment (DEV → TEST → PROD)
- Mengurangi risiko human error pada proses release
- Mempercepat siklus delivery dengan pipeline otomatis
- Menyediakan audit trail lengkap setiap perubahan

---

## 2. Arsitektur Lingkungan

### 2.1 Tiga-Tier Environment (Wajib)

```
┌──────────────┐    pipeline    ┌──────────────┐    pipeline    ┌──────────────┐
│     DEV      │  ──────────►  │     TEST     │  ──────────►  │     PROD     │
│  (develop)   │               │  (validate)  │               │   (release)  │
└──────────────┘               └──────────────┘               └──────────────┘
  Green Banner                   Blue Banner                    Red Banner
```

| Environment | Tujuan | Akses | Banner Warna |
|---|---|---|---|
| DEV | Development aktif | Developer only | Hijau |
| TEST / UAT | QA & user testing | Developer + QA + UAT team | Biru |
| PROD | Production end-user | Release manager only | Merah |

### 2.2 Environment untuk Oracle APEX

Setiap environment APEX memiliki:
- Workspace tersendiri (atau APEX instance tersendiri untuk isolasi penuh)
- Schema database tersendiri
- Application ID dan alias unik (jika dalam satu APEX instance)
- Environment banner yang dikonfigurasi di: **Administration → Manage Service → Define Environment Banner**

### 2.3 Environment untuk Oracle EBS

| Environment | DB Instance | Keterangan |
|---|---|---|
| DEV | `EBSDEV` | Development & customization |
| TEST | `EBSTEST` | SIT / UAT |
| PROD | `EBSPROD` | Production live |

---

## 3. Branching Strategy

### 3.1 Struktur Branch Git

```
main (protected)
 ├── develop
 │    ├── feature/APP-1234-nama-fitur
 │    ├── feature/APP-1235-nama-fitur
 │    └── fix/BUG-567-nama-bug
 └── release/v1.0.3
      └── hotfix/HOT-001
```

### 3.2 Aturan Branch

| Branch | Proteksi | Merge Rule | Trigger Pipeline |
|---|---|---|---|
| `main` | Protected | Pull/Merge Request + min. 1 reviewer | Deploy ke PROD |
| `develop` | Protected | Pull/Merge Request | Deploy ke TEST |
| `feature/*` | Tidak | Developer bebas commit | Build + Unit Test |
| `release/*` | Protected | Release manager | Deploy ke TEST → PROD |
| `hotfix/*` | Tidak | Merge ke main + develop | Build + Deploy darurat |

### 3.3 Konvensi Penamaan Branch

```
feature/<TICKET-ID>-<deskripsi-singkat>
fix/<TICKET-ID>-<deskripsi-singkat>
release/<versi>
hotfix/<TICKET-ID>-<deskripsi-singkat>

Contoh:
  feature/APP-1234-add-payment-report
  fix/BUG-567-fix-null-pointer-in-ar
  release/v2.1.0
  hotfix/HOT-001-critical-payroll-fix
```

---

## 4. CI/CD Pipeline — Oracle APEX

### 4.1 Tools yang Dibutuhkan

| Tool | Versi | Fungsi |
|---|---|---|
| SQLcl | 25.1.1+ | Export, stage, deploy artefak APEX |
| Git | 2.x+ | Source control |
| utPLSQL | 3.x+ | Unit testing PL/SQL |
| Cypress | 13.x+ | UI end-to-end testing |
| Jenkins / GitLab CI | Latest | Pipeline automation |
| Java | 11, 17, atau 21 | Dependency SQLcl |

### 4.2 Inisialisasi Project SQLcl

```bash
# 1. Clone repo dan masuk ke direktori
git clone https://your-git-server/yourproject.git
cd yourproject

# 2. Koneksi ke database DEV
sql username/password@host:port/service

# 3. Simpan named connection
SQL> connect -save dev -savepwd
SQL> connect -save test -savepwd
SQL> connect -save prod -savepwd

# 4. Inisialisasi project
SQL> project init -name yourproject -schemas yourschema
```

### 4.3 Konfigurasi Filter Project

Edit file `.dbtools/filters/project.filters`:

```sql
-- Export hanya application ID tertentu
application_id in (146, 147),

-- Export hanya objek dengan prefix tertentu
object_name like 'APP\_%' escape '\',

-- Nonaktifkan ekspor ORDS jika tidak diperlukan
export_type not in ('ORDS_SCHEMA')
```

Edit file `.dbtools/project.config.json`:

```json
{
  "setTransform": {
    "emitSchema": false
  },
  "apex": {
    "expSupportingObjects": "Y",
    "exptype": ["READABLE_YAML", "APPLICATION_SOURCE", "EMBEDDED_CODE"]
  }
}
```

### 4.4 Alur Pipeline APEX — Feature-Centric

```
┌─────────────┐
│ 1. Buat     │  git checkout -b feature/APP-1234
│    Branch   │
└──────┬──────┘
       │
┌──────▼──────┐
│ 2. Develop  │  Kerjakan di Branch Instance APEX
│    di APEX  │  (PDB clone dari DEV)
└──────┬──────┘
       │
┌──────▼──────┐
│ 3. Export   │  sql -name dev
│    Artefak  │  SQL> project export
└──────┬──────┘
       │
┌──────▼──────┐
│ 4. Stage &  │  SQL> project stage
│    Commit   │  git add --all && git commit -m "APP-1234: ..."
└──────┬──────┘
       │
┌──────▼──────┐
│ 5. Merge    │  git merge main (resolve konflik)
│    & Review │  Buat Merge/Pull Request
└──────┬──────┘
       │
┌──────▼──────┐
│ 6. CI Build │  Pipeline otomatis: build + unit test
│    & Test   │  (dipicu oleh merge ke develop)
└──────┬──────┘
       │
┌──────▼──────┐
│ 7. Deploy   │  project release -version x.y.z-BUILD
│    ke TEST  │  project gen-artifact
│             │  project deploy ke TEST
└──────┬──────┘
       │
┌──────▼──────┐
│ 8. UAT &    │  QA team melakukan testing
│    Approval │  di lingkungan TEST
└──────┬──────┘
       │
┌──────▼──────┐
│ 9. Deploy   │  project deploy ke PROD
│    ke PROD  │  (setelah approval)
└─────────────┘
```

### 4.5 Perintah SQLcl Pipeline Lengkap

```bash
# ── EXPORT dari DEV ke Git ──────────────────────────────────
cd yourproject
git checkout -b milestone-1
sql -name dev
SQL> project export
git add --all
git commit -m "milestone-1: export team progress"

# ── STAGING distribusi scripts ──────────────────────────────
SQL> project stage
git add --all
git commit -m "milestone-1: add distribution scripts"

# ── MERGE ke main dan buat RELEASE ──────────────────────────
git checkout main
git merge milestone-1
sql -name dev
SQL> project release -version 1.0.3-15
git add --all
git commit -m "release 1.0.3 build-15"
git tag release-1.0.3-15

# ── GENERATE ARTIFACT ───────────────────────────────────────
SQL> project gen-artifact -version 1.0.3-15

# ── DEPLOY ke TEST ──────────────────────────────────────────
sql -name test
SQL> DEFINE DEFAULTS_FILE=utils/properties/test.properties
SQL> project deploy -file yourproject-1.0.3-15.zip

# ── DEPLOY ke PROD ──────────────────────────────────────────
sql -name prod
SQL> DEFINE DEFAULTS_FILE=utils/properties/prod.properties
SQL> project deploy -file yourproject-1.0.3-15.zip
```

### 4.6 Konfigurasi Multi-Workspace (Single APEX Instance)

File `dist/utils/properties/test.properties`:

```properties
apex.500.workspace=APEX_TEST
apex.500.appid=1500
apex.500.schema=APEX_TEST
apex.500.alias=greatapptest
```

File `dist/utils/properties/prod.properties`:

```properties
apex.500.workspace=APEX_PROD
apex.500.appid=2500
apex.500.schema=APEX_PROD
apex.500.alias=greatappprod
```

### 4.7 Jenkinsfile — Pipeline Export & Release (APEX)

```groovy
pipeline {
  agent any
  options {
    checkoutToSubdirectory('greatapp')
  }
  tools { jdk 'JDK17' }
  environment {
    GIT_WORKAREA = "$WORKSPACE/greatapp"
    UTILS        = "$GIT_WORKAREA/utils"
    SQLCL        = "$WORKSPACE/sqlcl/bin/sql"
    DB           = 'localhost:1521/freepdb1'
  }
  stages {
    stage('Setup') {
      steps {
        sh '$UTILS/setupLatestSQLcl'
      }
    }
    stage('Export, Stage & Create Release Artifact') {
      environment {
        DEVDB_AUTH = credentials('apex-dev-credential')
      }
      steps {
        sh '$UTILS/exportStageMergeReleaseArtifact $GIT_WORKAREA $DEVDB_AUTH_USR/$DEVDB_AUTH_PSW@$DB'
      }
    }
  }
}
```

### 4.8 Jenkinsfile — Pipeline Build, Test & Deploy (APEX)

```groovy
pipeline {
  agent any
  options { checkoutToSubdirectory('greatapp') }
  tools { jdk 'JDK17' }
  environment {
    GIT_WORKAREA = "$WORKSPACE/greatapp"
    UTILS        = "$GIT_WORKAREA/utils"
    SQLCL        = "$WORKSPACE/sqlcl/bin/sql"
    UTPLSQL      = "$WORKSPACE/utPLSQL-cli/bin/utplsql"
    TESTS_XML    = "$WORKSPACE/tests/results.xml"
    DB           = 'localhost:1521/apexdb'
  }
  stages {
    stage('Setup') {
      steps {
        sh '$UTILS/setupLatestSQLcl'
        sh '$UTILS/setupLatestTestRunner'
      }
    }
    stage('Create Build') {
      steps {
        sh '$UTILS/genProjectArtifact $GIT_WORKAREA $BUILD_NUMBER'
      }
    }
    stage('Run Unit Tests') {
      environment { UNITDB = credentials('apex-unittest-credential') }
      steps {
        sh '$UTILS/deployProjectArtifactToUnitTest $UNITDB_USR/$UNITDB_PSW@$DB'
        sh '$UTPLSQL run -f=ut_junit_reporter -o $TESTS_XML $UNITDB_USR/$UNITDB_PSW@$DB'
      }
    }
    stage('Deploy to TEST') {
      environment { TESTDB = credentials('apex-test-credential') }
      steps {
        sh '$UTILS/deployProjectArtifactToTest $TESTDB_USR/$TESTDB_PSW@$DB'
      }
    }
  }
  post {
    always {
      archiveArtifacts 'artifact/build-**/*.zip'
      junit 'tests/**/*.xml'
      cleanWs()
    }
  }
}
```

---

## 5. CI/CD Pipeline — Oracle EBS (FNDLOAD)

### 5.1 Format Umum FNDLOAD

```bash
FNDLOAD apps/<password>@<db> 0 Y DOWNLOAD|UPLOAD \
  <lct_file> <ldt_file> [entity] [parameter=value]
```

### 5.2 Alur Pipeline EBS

```
┌──────────────┐
│ 1. Download  │  FNDLOAD dari DEV → file .ldt di Git
│    dari DEV  │
└──────┬───────┘
       │
┌──────▼───────┐
│ 2. Commit    │  git add && git commit
│    ke Git    │
└──────┬───────┘
       │
┌──────▼───────┐
│ 3. Review    │  Merge/Pull Request + review
│    & Approve │
└──────┬───────┘
       │
┌──────▼───────┐
│ 4. Upload ke │  FNDLOAD ke TEST (pipeline otomatis)
│    TEST      │
└──────┬───────┘
       │
┌──────▼───────┐
│ 5. Validasi  │  QA validasi di TEST
│    QA        │
└──────┬───────┘
       │
┌──────▼───────┐
│ 6. Upload ke │  FNDLOAD ke PROD (setelah approval)
│    PROD      │
└──────────────┘
```

### 5.3 Syntax Lengkap FNDLOAD — Download & Upload

#### Concurrent Program

```bash
# Download
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/afcpprog.lct \
  CP_<program_short_name>.ldt \
  PROGRAM APPLICATION_SHORT_NAME="<app>" \
  CONCURRENT_PROGRAM_NAME="<prog_name>"

# Upload
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/afcpprog.lct \
  CP_<program_short_name>.ldt
```

#### Request Group

```bash
# Download
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/afcpreqg.lct \
  RG_<group_name>.ldt \
  REQUEST_GROUP REQUEST_GROUP_NAME="<group_name>" \
  APPLICATION_SHORT_NAME="<app>"

# Upload
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/afcpreqg.lct \
  RG_<group_name>.ldt
```

#### Value Set

```bash
# Download
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/afffload.lct \
  VS_<valueset_name>.ldt \
  VALUE_SET FLEX_VALUE_SET_NAME="<valueset_name>"

# Upload
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/afffload.lct \
  VS_<valueset_name>.ldt
```

#### Lookup Type & Values

```bash
# Download
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/aflvmlu.lct \
  LKP_<lookup_type>.ldt \
  FND_LOOKUP_TYPE APPLICATION_SHORT_NAME="<app>" \
  LOOKUP_TYPE="<LOOKUP_TYPE>"

# Upload
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/aflvmlu.lct \
  LKP_<lookup_type>.ldt
```

#### Profile Option

```bash
# Download
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/afscprof.lct \
  PROF_<profile_name>.ldt \
  PROFILE PROFILE_NAME="<PROFILE_NAME>" \
  APPLICATION_SHORT_NAME="<app>"

# Upload
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/afscprof.lct \
  PROF_<profile_name>.ldt
```

#### Menu

```bash
# Download
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/afsload.lct \
  MENU_<menu_name>.ldt \
  MENU MENU_NAME="<menu_name>"

# Upload
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/afsload.lct \
  MENU_<menu_name>.ldt
```

#### Responsibility

```bash
# Download
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/afscursp.lct \
  RESP_<resp_key>.ldt \
  FND_RESPONSIBILITY RESP_KEY="<RESP_KEY>" \
  APPLICATION_SHORT_NAME="<app>"

# Upload
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/afscursp.lct \
  RESP_<resp_key>.ldt
```

#### Form Function

```bash
# Download
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/afsload.lct \
  FUNC_<function_name>.ldt \
  FUNCTION FUNCTION_NAME="<FUNCTION_NAME>"

# Upload
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/afsload.lct \
  FUNC_<function_name>.ldt
```

#### FND Message

```bash
# Download
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/afmdmsg.lct \
  MSG_<message_name>.ldt \
  FND_NEW_MESSAGES APPLICATION_SHORT_NAME="<app>" \
  MESSAGE_NAME="<MESSAGE_NAME>"

# Upload
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/afmdmsg.lct \
  MSG_<message_name>.ldt
```

#### Printer Style

```bash
# Download
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/afcpprnt.lct \
  PRNTSTYLE_<style>.ldt \
  STYLE PRINTER_STYLE_NAME="<style_name>"

# Upload
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/afcpprnt.lct \
  PRNTSTYLE_<style>.ldt
```

#### Oracle Alert

```bash
# Download (gunakan $ALR_TOP)
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $ALR_TOP/patch/115/import/alr.lct \
  ALERT_<alert_name>.ldt \
  ALR_ALERTS APPLICATION_SHORT_NAME="<app>" \
  ALERT_NAME="<ALERT_NAME>"

# Upload
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $ALR_TOP/patch/115/import/alr.lct \
  ALERT_<alert_name>.ldt
```

#### BI Publisher — Data Definition

```bash
# Download (gunakan $XDO_TOP)
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $XDO_TOP/patch/115/import/xdotmpl.lct \
  DD_<code>.ldt \
  XDO_DS_DEFINITIONS APPLICATION_SHORT_NAME="<app>" \
  DATA_SOURCE_CODE="<CODE>"

# Upload
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $XDO_TOP/patch/115/import/xdotmpl.lct \
  DD_<code>.ldt
```

#### BI Publisher — Template Definition

```bash
# Download
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $XDO_TOP/patch/115/import/xdotmpl.lct \
  TMPL_<code>.ldt \
  XDO_TEMPLATES APPLICATION_SHORT_NAME="<app>" \
  TEMPLATE_CODE="<CODE>"

# Upload
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $XDO_TOP/patch/115/import/xdotmpl.lct \
  TMPL_<code>.ldt
```

#### Workflow (WFLOAD)

```bash
# Download
WFLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  WF_<item_type>.wft <ITEM_TYPE>

# Upload
WFLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  WF_<item_type>.wft
```

### 5.4 Struktur Direktori Git untuk EBS

```
ebs-customization/
├── concurrent_programs/
│   ├── CP_XXAR_AGING_REPORT.ldt
│   └── CP_XXGL_JOURNAL_IMPORT.ldt
├── request_groups/
│   └── RG_XXAR_STANDARD.ldt
├── value_sets/
│   └── VS_XXAR_CUSTOMER_TYPE.ldt
├── lookups/
│   └── LKP_XXAR_PAYMENT_TERMS.ldt
├── profiles/
│   └── PROF_XX_DEFAULT_ORG.ldt
├── menus/
│   └── MENU_XXAR_MAIN.ldt
├── responsibilities/
│   └── RESP_XXAR_SUPERVISOR.ldt
├── messages/
│   └── MSG_XXAR_VALIDATION.ldt
├── alerts/
│   └── ALERT_XXAR_OVERDUE.ldt
├── bi_publisher/
│   ├── DD_XXAR_AGING.ldt
│   └── TMPL_XXAR_AGING.ldt
├── workflows/
│   └── WF_XXAPPROVAL.wft
├── scripts/
│   ├── deploy_to_test.sh
│   └── deploy_to_prod.sh
└── README.md
```

### 5.5 Script Deployment EBS — deploy_to_test.sh

```bash
#!/bin/bash
# deploy_to_test.sh — Deploy semua konfigurasi EBS ke lingkungan TEST
set -e

TARGET_DB=$TEST_TWO_TASK
APPS_PWD=$TEST_APPS_PWD
FND_TOP=/u01/oracle/TEST/apps/fnd/12.0.0

echo "===== DEPLOYMENT EBS ke TEST: $(date) ====="

# Concurrent Programs
for f in concurrent_programs/*.ldt; do
  echo "Uploading: $f"
  FNDLOAD apps/$APPS_PWD@$TARGET_DB 0 Y UPLOAD \
    $FND_TOP/patch/115/import/afcpprog.lct "$f"
done

# Request Groups
for f in request_groups/*.ldt; do
  echo "Uploading: $f"
  FNDLOAD apps/$APPS_PWD@$TARGET_DB 0 Y UPLOAD \
    $FND_TOP/patch/115/import/afcpreqg.lct "$f"
done

# Value Sets
for f in value_sets/*.ldt; do
  echo "Uploading: $f"
  FNDLOAD apps/$APPS_PWD@$TARGET_DB 0 Y UPLOAD \
    $FND_TOP/patch/115/import/afffload.lct "$f"
done

# Lookups
for f in lookups/*.ldt; do
  echo "Uploading: $f"
  FNDLOAD apps/$APPS_PWD@$TARGET_DB 0 Y UPLOAD \
    $FND_TOP/patch/115/import/aflvmlu.lct "$f"
done

echo "===== DEPLOYMENT SELESAI: $(date) ====="
```

### 5.6 Referensi Variabel EBS

| Variabel | Keterangan |
|---|---|
| `$APPS_PWD` | Password user APPS |
| `$TWO_TASK` | Alias database (TNS name) |
| `$FND_TOP` | Top directory FND module |
| `$ALR_TOP` | Top directory Alert module |
| `$XDO_TOP` | Top directory BI Publisher module |
| `<app>` | Application short name (XXCUST, AR, GL, dll.) |
| `0 Y` | Log level 0, force upload Y |

---

## 6. Standar Penamaan File Artefak

### 6.1 Oracle APEX

| Tipe Artefak | Format Nama | Contoh |
|---|---|---|
| Release artifact | `<project>-<version>-<build>.zip` | `hrapp-2.1.0-42.zip` |
| Git tag | `release-<version>-<build>` | `release-2.1.0-42` |
| Branch feature | `feature/<TICKET>-<desc>` | `feature/APP-1234-payroll-report` |

### 6.2 Oracle EBS — File .ldt

| Tipe Komponen | Prefix | Contoh |
|---|---|---|
| Concurrent Program | `CP_` | `CP_XXAR_AGING_REPORT.ldt` |
| Request Group | `RG_` | `RG_XXAR_STANDARD.ldt` |
| Value Set | `VS_` | `VS_XXAR_CUSTOMER_TYPE.ldt` |
| Lookup | `LKP_` | `LKP_XXAR_PAYMENT_TERMS.ldt` |
| Profile Option | `PROF_` | `PROF_XX_DEFAULT_ORG.ldt` |
| Menu | `MENU_` | `MENU_XXAR_MAIN.ldt` |
| Responsibility | `RESP_` | `RESP_XXAR_SUPERVISOR.ldt` |
| Form Function | `FUNC_` | `FUNC_XXAR_MAIN.ldt` |
| Message | `MSG_` | `MSG_XXAR_VALIDATION.ldt` |
| Printer Style | `PRNTSTYLE_` | `PRNTSTYLE_LANDSCAPE.ldt` |
| Alert | `ALERT_` | `ALERT_XXAR_OVERDUE.ldt` |
| BI Publisher Data Def | `DD_` | `DD_XXAR_AGING.ldt` |
| BI Publisher Template | `TMPL_` | `TMPL_XXAR_AGING.ldt` |
| Workflow | `WF_` | `WF_XXAPPROVAL.wft` |

---

## 7. Testing Standard

### 7.1 Unit Test PL/SQL — utPLSQL (APEX & EBS)

```sql
-- Definisi test suite
CREATE OR REPLACE PACKAGE ut_payment_pkg IS
  --%suite(Payment Module Tests)
  --%test
  PROCEDURE test_validate_amount;
  --%test
  PROCEDURE test_validate_due_date;
END;
/

-- Implementasi
CREATE OR REPLACE PACKAGE BODY ut_payment_pkg IS
  PROCEDURE test_validate_amount IS
  BEGIN
    ut.expect(payment_pkg.validate_amount(100)).to_be_true();
    ut.expect(payment_pkg.validate_amount(-1)).to_be_false();
  END;

  PROCEDURE test_validate_due_date IS
    l_past DATE := SYSDATE - 1;
  BEGIN
    ut.expect(payment_pkg.validate_due_date(l_past)).to_be_false();
  END;
END;
/

-- Jalankan semua test
BEGIN ut.run(); END;

-- Output dengan format JUnit XML (untuk Jenkins)
EXEC ut.run(ut_junit_reporter())

-- Code coverage HTML
EXEC ut.run(ut_coverage_html_reporter())
```

### 7.2 UI Test — Cypress (APEX)

```javascript
// cypress/e2e/payment_report.cy.js
describe('Payment Report Feature', () => {
  beforeEach(() => {
    cy.visit(Cypress.env('apex_url'))
    cy.get('#P9999_USERNAME').type(Cypress.env('username'))
    cy.get('#P9999_PASSWORD').type(Cypress.env('password'), { log: false })
    cy.get('[data-cy="login_button"]').click()
    cy.url().should('include', '/home')
  })

  it('should display payment report with correct filters', () => {
    cy.get('[data-cy="payment-report-menu"]').click()
    cy.get('#P1_DATE_FROM').type('01-JAN-2026')
    cy.get('#P1_DATE_TO').type('31-MAR-2026')
    cy.get('[data-cy="run-report"]').click()
    cy.get('#report-region').should('contain', 'Total')
    cy.get('#report-region').should('not.contain', 'No data found')
  })
})
```

### 7.3 Gate Kualitas Pipeline

| Gate | Tool | Threshold | Blocking? |
|---|---|---|---|
| Unit Test Pass Rate | utPLSQL | 100% | Ya |
| Code Coverage | utPLSQL | ≥ 80% | Ya |
| UI Test Pass Rate | Cypress | 100% | Ya |
| SQL Security Scan | SQLcl CODESCAN | 0 critical | Ya |
| APEX Advisor | APEX Built-in | 0 critical | Ya |

---

## 8. Deployment Checklist

### 8.1 Pre-Deployment (Wajib)

```
[ ] Semua unit test lulus di CI pipeline
[ ] Code review disetujui oleh minimal 1 reviewer
[ ] Artefak deployment tersimpan di artifact repository
[ ] Change request (CR) dibuat dan disetujui (untuk PROD)
[ ] Backup database target sudah dilakukan
[ ] Maintenance window dikonfirmasi (untuk PROD)
[ ] Rollback plan disiapkan
```

### 8.2 APEX — Deployment Steps

```
[ ] Verifikasi versi APEX di target environment
[ ] Backup workspace dan application saat ini
[ ] Deploy artefak dengan project deploy
[ ] Verifikasi application berjalan normal
[ ] Cek environment banner sesuai (DEV/TEST/PROD)
[ ] Jalankan smoke test basic
[ ] Update CHANGELOG.md
```

### 8.3 EBS — Deployment Steps

```
[ ] Source environment variable: . /u01/oracle/PROD/EBSapps.env run
[ ] Verifikasi konektivitas database target
[ ] Upload semua file .ldt sesuai urutan dependensi:
    1. Value Sets
    2. Lookups
    3. Messages
    4. Profile Options
    5. Form Functions
    6. Menus
    7. Responsibilities
    8. Request Groups
    9. Concurrent Programs
    10. Alerts
    11. BI Publisher Data Definitions
    12. BI Publisher Templates
    13. Workflows (dengan WFLOAD)
[ ] Validasi setiap komponen di EBS Builder
[ ] Jalankan Concurrent Request test
[ ] Update change log di Git
```

---

## 9. Rollback Procedure

### 9.1 APEX Rollback

```bash
# Identifikasi versi sebelumnya di Git
git log --oneline --tags

# Deploy versi sebelumnya
sql -name prod
SQL> DEFINE DEFAULTS_FILE=utils/properties/prod.properties
SQL> project deploy -file yourproject-1.0.2-14.zip

# Verifikasi setelah rollback
# Cek application berjalan dengan versi lama
```

### 9.2 EBS Rollback

```bash
# Download konfigurasi dari versi sebelumnya (ambil dari Git tag)
git checkout tags/release-v1.0.2 -- concurrent_programs/

# Upload ulang konfigurasi versi lama
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/afcpprog.lct \
  concurrent_programs/CP_XXAR_AGING_REPORT.ldt

# Kembalikan ke branch HEAD setelah rollback
git checkout main
```

---

## 10. Tools & Referensi

### 10.1 Referensi Tools

| Tool | URL / Lokasi | Keterangan |
|---|---|---|
| SQLcl | https://www.oracle.com/database/sqldeveloper/technologies/sqlcl/ | Oracle SQL Command Line |
| utPLSQL | https://utplsql.org | PL/SQL Unit Testing Framework |
| Cypress | https://www.cypress.io | UI End-to-End Testing |
| Jenkins | https://www.jenkins.io | CI/CD Automation Server |
| GitLab CI | https://docs.gitlab.com/ee/ci/ | Integrated CI/CD |
| GitHub Actions | https://docs.github.com/en/actions | CI/CD di GitHub |
| Oracle VB Studio | https://www.oracle.com/application-development/visual-builder/ | Oracle-native DevOps platform |

### 10.2 Referensi Dokumentasi Oracle

| Dokumen | URL |
|---|---|
| APEX Lifecycle Management v3.2 | https://www.oracle.com/a/tech/docs/apex-lifecycle-management-v3.pdf |
| SQLcl User Guide | https://docs.oracle.com/en/database/oracle/sql-developer-command-line/ |
| Oracle EBS Developer Guide | https://docs.oracle.com/cd/E26401_01/doc.122/e20371/toc.htm |
| utPLSQL Documentation | https://utplsql.org/utPLSQL/latest/ |

### 10.3 Referensi Control Files FNDLOAD

| Komponen | Control File (.lct) | Top Directory |
|---|---|---|
| Concurrent Program | `afcpprog.lct` | `$FND_TOP` |
| Request Group | `afcpreqg.lct` | `$FND_TOP` |
| Value Set | `afffload.lct` | `$FND_TOP` |
| Lookup | `aflvmlu.lct` | `$FND_TOP` |
| Profile Option | `afscprof.lct` | `$FND_TOP` |
| Menu / Form Function | `afsload.lct` | `$FND_TOP` |
| Responsibility | `afscursp.lct` | `$FND_TOP` |
| FND Message | `afmdmsg.lct` | `$FND_TOP` |
| Printer Style | `afcpprnt.lct` | `$FND_TOP` |
| Oracle Alert | `alr.lct` | `$ALR_TOP` |
| BI Publisher | `xdotmpl.lct` | `$XDO_TOP` |
| Workflow | *(WFLOAD, bukan FNDLOAD)* | — |

---

*Dokumen ini disiapkan berdasarkan Oracle APEX Application Development Lifecycle Technical Paper (Version 3.2, Juni 2025) dan praktik terbaik Oracle EBS R12.2 FNDLOAD.*
