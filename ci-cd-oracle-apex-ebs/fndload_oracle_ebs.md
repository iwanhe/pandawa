# FNDLOAD Oracle EBS R12.2 — Syntax Download & Upload

> **Format Umum:**
> ```
> FNDLOAD apps/<password>@<db> 0 Y DOWNLOAD|UPLOAD <lct_file> <ldt_file> [entity] [parameter=value]
> ```
> - `0 Y` → argument standar (log level & force)
> - File `.lct` → control/template file (tidak berubah)
> - File `.ldt` → data file hasil download

---

## 1. Concurrent Program

### Download
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/afcpprog.lct \
  CP_<program_short_name>.ldt \
  PROGRAM APPLICATION_SHORT_NAME="<app>" \
  CONCURRENT_PROGRAM_NAME="<prog_name>"
```

### Upload
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/afcpprog.lct \
  CP_<program_short_name>.ldt
```

---

## 2. Request Group

### Download
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/afcpreqg.lct \
  RG_<group_name>.ldt \
  REQUEST_GROUP REQUEST_GROUP_NAME="<group_name>" \
  APPLICATION_SHORT_NAME="<app>"
```

### Upload
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/afcpreqg.lct \
  RG_<group_name>.ldt
```

---

## 3. Value Set

### Download
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/afffload.lct \
  VS_<valueset_name>.ldt \
  VALUE_SET FLEX_VALUE_SET_NAME="<valueset_name>"
```

### Upload
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/afffload.lct \
  VS_<valueset_name>.ldt
```

---

## 4. Lookup Type & Values

### Download
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/aflvmlu.lct \
  LKP_<lookup_type>.ldt \
  FND_LOOKUP_TYPE APPLICATION_SHORT_NAME="<app>" \
  LOOKUP_TYPE="<LOOKUP_TYPE>"
```

### Upload
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/aflvmlu.lct \
  LKP_<lookup_type>.ldt
```

---

## 5. Profile Option

### Download
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/afscprof.lct \
  PROF_<profile_name>.ldt \
  PROFILE PROFILE_NAME="<PROFILE_NAME>" \
  APPLICATION_SHORT_NAME="<app>"
```

### Upload
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/afscprof.lct \
  PROF_<profile_name>.ldt
```

---

## 6. Menu

### Download
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/afsload.lct \
  MENU_<menu_name>.ldt \
  MENU MENU_NAME="<menu_name>"
```

### Upload
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/afsload.lct \
  MENU_<menu_name>.ldt
```

---

## 7. Responsibility

### Download
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/afscursp.lct \
  RESP_<resp_key>.ldt \
  FND_RESPONSIBILITY RESP_KEY="<RESP_KEY>" \
  APPLICATION_SHORT_NAME="<app>"
```

### Upload
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/afscursp.lct \
  RESP_<resp_key>.ldt
```

---

## 8. Form Function

### Download
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/afsload.lct \
  FUNC_<function_name>.ldt \
  FUNCTION FUNCTION_NAME="<FUNCTION_NAME>"
```

### Upload
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/afsload.lct \
  FUNC_<function_name>.ldt
```

---

## 9. FND Message

### Download
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/afmdmsg.lct \
  MSG_<message_name>.ldt \
  FND_NEW_MESSAGES APPLICATION_SHORT_NAME="<app>" \
  MESSAGE_NAME="<MESSAGE_NAME>"
```

### Upload
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/afmdmsg.lct \
  MSG_<message_name>.ldt
```

---

## 10. Printer Style

### Download
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $FND_TOP/patch/115/import/afcpprnt.lct \
  PRNTSTYLE_<style>.ldt \
  STYLE PRINTER_STYLE_NAME="<style_name>"
```

### Upload
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $FND_TOP/patch/115/import/afcpprnt.lct \
  PRNTSTYLE_<style>.ldt
```

---

## 11. Oracle Alert

### Download
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $ALR_TOP/patch/115/import/alr.lct \
  ALERT_<alert_name>.ldt \
  ALR_ALERTS APPLICATION_SHORT_NAME="<app>" \
  ALERT_NAME="<ALERT_NAME>"
```

### Upload
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $ALR_TOP/patch/115/import/alr.lct \
  ALERT_<alert_name>.ldt
```

> **Catatan:** Gunakan `$ALR_TOP` bukan `$FND_TOP` untuk Oracle Alert.

---

## 12. XML Publisher / BI Publisher — Data Definition

### Download
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $XDO_TOP/patch/115/import/xdotmpl.lct \
  DD_<code>.ldt \
  XDO_DS_DEFINITIONS APPLICATION_SHORT_NAME="<app>" \
  DATA_SOURCE_CODE="<CODE>"
```

### Upload
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $XDO_TOP/patch/115/import/xdotmpl.lct \
  DD_<code>.ldt
```

---

## 13. XML Publisher / BI Publisher — Template Definition

### Download
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  $XDO_TOP/patch/115/import/xdotmpl.lct \
  TMPL_<code>.ldt \
  XDO_TEMPLATES APPLICATION_SHORT_NAME="<app>" \
  TEMPLATE_CODE="<CODE>"
```

### Upload
```bash
FNDLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  $XDO_TOP/patch/115/import/xdotmpl.lct \
  TMPL_<code>.ldt
```

> **Catatan:** Gunakan `$XDO_TOP` untuk semua komponen BI Publisher.

---

## 14. Workflow (WFLOAD)

### Download
```bash
WFLOAD apps/$APPS_PWD@$TWO_TASK 0 Y DOWNLOAD \
  WF_<item_type>.wft <ITEM_TYPE>
```

### Upload
```bash
WFLOAD apps/$APPS_PWD@$TWO_TASK 0 Y UPLOAD \
  WF_<item_type>.wft
```

> **Catatan:** Workflow menggunakan `WFLOAD`, bukan `FNDLOAD`. File output berekstensi `.wft`.

---

## Referensi Variabel

| Variabel | Keterangan |
|---|---|
| `$APPS_PWD` | Password user APPS |
| `$TWO_TASK` | Alias database (TNS name) |
| `$FND_TOP` | Top directory FND module |
| `$ALR_TOP` | Top directory Alert module |
| `$XDO_TOP` | Top directory BI Publisher module |
| `<app>` | Application short name (contoh: `XXCUST`, `AR`, `GL`) |
| `0 Y` | Log level 0, force upload Y |

## Tips Penting

- Selalu gunakan `UPLOAD_MODE=REPLACE` jika ingin menimpa data yang sudah ada
- File `.lct` adalah control/template file — tidak perlu dimodifikasi
- File `.ldt` adalah data file hasil download yang akan di-upload ke environment lain
- Untuk environment Rapid Clone (R12.2), pastikan environment variable sudah di-source sebelum menjalankan FNDLOAD
- Gunakan `-- CUSTOM_MODE=FORCE` jika upload ditolak karena konflik versi
