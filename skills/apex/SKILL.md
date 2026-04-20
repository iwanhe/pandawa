---
name: apex
description: Export/patch/import Oracle APEX components via SQLcl CLI (Bash). Covers pages, regions, items, buttons, processes, DAs, validations, LOVs, auth schemes, templates, IR, IG, charts, maps, cards, and all shared components.
argument-hint: "[conn|env] [app-id] [component] -- <change request>"
disable-model-invocation: false
---

# Oracle APEX Component Modifier (SQLcl CLI)

Export -> patch -> import APEX components via SQLcl CLI (Bash tool). Real side effects (DB + APEX).

## Settings

Env vars in `.claude/settings.json` (override in `.claude/settings.local.json`):
`SQLCL_CONNECTION`, `APEX_APP_ID`, `APEX_WORKSPACE` -- see CLAUDE.md.

## Inputs

- `$0`: connection alias (fallback: `$SQLCL_CONNECTION`)
- `$1`: app-id (fallback: `$APEX_APP_ID`)
- `$2`: component selector -- `PAGE:10`, `LOV:<id>`, `REGION:<id>`, or free-form
- Remaining args: change request

If inputs incomplete after defaults, resolve via `apex list` or APEX views.

## Preconditions

- `sql` CLI available on PATH (SQLcl 25.2.0+, Java 17+)
- Saved connection in `~/.dbtools` matching `$SQLCL_CONNECTION`
- `references/apex_imp/` docs present
- Filesystem write access

## SQLcl CLI Usage

All database and APEX operations use the `sql` CLI via the **Bash tool**. Do NOT use SQLcl MCP tools.

**Pattern — run SQL or SQLcl commands:**
```bash
sql -S -name $SQLCL_CONNECTION <<'EOF'
<commands here>
exit;
EOF
```

- `-S` = silent mode (suppresses banner)
- `-name` = required flag for saved connections (e.g. `-name ai`, `-name DEV`)
- Always end with `exit;` to ensure the process terminates
- Use heredoc (`<<'EOF'`) to pass multi-line commands
- For single commands: `sql -S -name $SQLCL_CONNECTION <<< "SELECT 1 FROM dual; exit;"`

---

## Change Tiers

Classify the request **before loading any references**. This determines which docs to read and how many workflow steps to execute.

| Tier | When | Examples | Docs to load |
|------|------|----------|--------------|
| **T1 — Modify** | Change parameter(s) on existing component(s) | Rename label, change item type, update SQL source, toggle condition | Export file only. `valid_values.md` only if setting an enumerated type value. |
| **T2 — Add/Remove** | Add or remove a component within an existing page or shared component file | Add item, add DA, add button, remove process, add region | `imp_page.md` or `imp_shared.md` (relevant section only) + matching `global-patterns/` file + `valid_values.md` |
| **T3 — Complex** | Multi-file changes, new shared components, cross-component wiring | Add IR with columns + saved report, add LOV + select list + DA, add form page | `references/apex_imp/README.md` for orientation, then specific files as needed per sub-task. Each sub-task follows T1 or T2 rules. |

When unsure, start at T1 — escalate only if the export file doesn't contain enough info.

---

## Workflow

### 1) Setup
Confirm `sql` CLI is available (`sql -V`). Create timestamped working folder. If git repo: branch + baseline commit.

### 2) Identify & Export
Normalize selector (e.g., "page 10" -> `PAGE:10`). For named shared components, use `apex list` to resolve IDs.
```bash
sql -S -name $SQLCL_CONNECTION <<'EOF'
apex export -applicationid <APP_ID> -split -dir <workdir> -expComponents "<...>"
exit;
EOF
```
**Note:** Export creates `<workdir>/f<APP_ID>/application/...` — the `f<APP_ID>` subdirectory is auto-created. So `-dir apex-export` produces `apex-export/f129/application/...`.

Confirm `install_component.sql` (partial) or `install.sql` (full) or `install_page.sql` (page export) exists.

### 3) Read export file, classify tier
Read the exported file(s). Classify the change per the tier table above. Then load only the docs that tier requires.

**Reference loading decision tree:**

```
Is this a parameter change on an existing component?
├─ YES (T1): Do you know the valid value?
│   ├─ YES: No docs needed — patch directly
│   └─ NO: Read `valid_values.md` for the relevant section only
└─ NO: Are you adding/removing a component?
    ├─ YES (T2): What component type?
    │   ├─ Page component → Read relevant section of `imp_page.md` + matching `global-patterns/` file
    │   └─ Shared component → Read relevant section of `imp_shared.md` + matching `global-patterns/` file
    └─ NO (T3): Multiple sub-tasks → Read `references/apex_imp/README.md`, then apply T1/T2 per sub-task
```

**Global pattern file lookup** (T2/T3 only — load the ONE file matching the component):

| Component type | Pattern file |
|---|---|
| Interactive Report | `interactive_report.md` |
| Interactive Grid | `interactive_grid.md` |
| Form region | `form_region.md` |
| Classic Report | `classic_report.md` |
| Cards region | `cards_region.md` (+ `card_component.md`, `card_media.md`, `card_actions.md`, `card_icons.md` as needed) |
| JET Chart | `jet_chart.md` |
| Map region | `map_region.md` |
| Dynamic Action | `dynamic_actions.md` |
| Faceted Search | `faceted_search.md` |
| Process | `page_process.md` |
| Validation | `page_validation.md` |
| Computation | `page_computation.md` |
| Branch | `page_branch.md` |
| Navigation | `navigation.md` |
| LOV | `lov.md` |
| Authorization | `authorization.md` |
| Web Source | `web_source.md` |
| Automation | `automation.md` |

Also check: `app-patterns/catalog.md` + `conventions.md` — if present, load to match app-specific template IDs, naming, and conventions.

### 4) Plan (T2/T3 only)
For T1, skip planning — go straight to patching. For T2/T3: split into DB changes (DDL/DML/PLSQL) and APEX patches. Order: DB first -> patch export -> import.

**Incremental import strategy (T2/T3 — REQUIRED):**

Because `set_environment.sql` uses `whenever sqlerror exit rollback`, **any single error rolls back the entire import**. Do NOT patch all components into one file and import once. Instead, add components one at a time:

1. Export page → add **one** component (e.g. a region) → import → verify it worked
2. Re-export page → add **next** component → import → verify
3. Repeat until all components are in place

This catches errors early — a bad parameter on one item won't destroy 20 previously-good regions. Each re-export captures APEX's canonical format for what you already imported, so you're always patching a known-good baseline.

**When to batch:** Simple, low-risk components of the same type (e.g. multiple IR columns, multiple DA actions on the same event) can be added together in one pass. But mix component types (regions + items + DAs) incrementally.

### 5) Apply DB changes (if any)
Generate idempotent scripts. Execute via `sql` CLI (Bash tool). Validate compilation.
```bash
sql -S -name $SQLCL_CONNECTION <<'EOF'
-- DDL/DML/PLSQL here
show errors;
exit;
EOF
```

### 6) Patch exported file(s)

#### Patching rules (follow these exactly)

**Structure:**
- Every procedure call wrapped in `begin...end;` terminated by `/` on its own line
- **CRITICAL — PL/SQL block boundaries:** Each `begin...end;/` is a separate SQL*Plus anonymous block. The `/` terminates the block and sends it for execution. **Never nest** `begin...end;/` inside another `begin...end;/` — the inner `/` will terminate the outer block and cause `ORA-06550`.
- **Page file block layout:**
  ```
  begin                           -- Block 1: component_begin + create_page
  wwv_flow_imp.component_begin(...);
  wwv_flow_imp_page.create_page(...);
  end;
  /
  begin                           -- Block 2..N: one per component
  wwv_flow_imp_page.create_page_plug(...);
  end;
  /
  begin                           -- Block N+1: component_end
  wwv_flow_imp.component_end;
  end;
  /
  ```
- Never modify `component_begin`/`component_end` blocks
- Comma-first style: `,p_name=>'...'`
- Multi-line strings: `wwv_flow_string.join(wwv_flow_t_varchar2('line1','line2'))`
- Single quotes doubled inside strings: `'it''s'`

**Hidden items set by JavaScript (DAs):**
- Hidden items set via `$s()` from a DA work fine with `p_protection_level=>'S'` and `value_protected=>'Y'` because `$s()` uses AJAX (not URL parameters), so session state protection checksums don't apply.
- **DO NOT** use `p_protection_level=>'N'` or `value_protected=>'N'` with `NATIVE_HIDDEN` — this violates the `WWV_VALID_FSITEM_IDT` check constraint and the import will fail with `ORA-02290`.
- Chart/region refresh via `p_ajax_items_to_submit` submits the item value via AJAX POST, which works correctly with the default protection settings.

**Item attributes format (APEX 24.2+):**
- Use `wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('key','value',...)).to_clob` — NOT bare `wwv_flow_t_varchar2(...)`.
- Example: `,p_attributes=>wwv_flow_t_plugin_attributes(wwv_flow_t_varchar2('value_protected', 'Y')).to_clob`
- When unsure of the format, export a reference page containing that item type from any app and copy the exact syntax.

**Item defaults:**
- Use `p_item_default=>'value'` only — do NOT include `p_item_default_type`. APEX exports omit it; including it (e.g. `'STATIC'`) causes `ORA-02290` constraint violations.

**IDs:**
- Scan all `wwv_flow_imp.id(...)` values in the file
- New ID = max existing + 1 (or +100 for spacing)
- Never use random IDs
- All cross-references must use matching raw IDs in `wwv_flow_imp.id(...)`
- Exception: `p_id` in `create_page` = raw page number (NOT wrapped)

**Sequences:**
- Use gaps of 10. Insert between 10 and 20 -> use 15.

**Ordering within page file:**
1. Manifest → `create_page` → regions → report/worksheet columns → buttons → branches → items → computations → validations → DA events + actions → processes

**File paths** (split export `<workdir>/f<APP_ID>/`):
- `PAGE:N` -> `application/pages/page_%05d.sql` (zero-padded)
- Shared components -> `application/shared_components/...` (use Glob if name unknown)
- New shared component files: add `@@` reference in `install_component.sql` before dependent pages

#### Post-patch validation
Run `bash tools/validate_export.sh <file>` to check begin/end balance, ID uniqueness, and syntax.

### 7) Import via SQLcl CLI
```bash
cd <workdir>/f<APP_ID>
sql -S -name $SQLCL_CONNECTION <<'EOF'
@install_component.sql
exit;
EOF
```
**Important:** `cd` into the export directory before running the install script — it uses relative `@@` paths to reference page/component files.
If different environment: prepend `apex_application_install` context block (read `app_install.md`).

### 8) Verify
Re-export + diff. Deliver: change summary, modified files, patch diff, import log.

---

## Error Recovery

**Before changes:** git baseline commit + export snapshot.

| Failure | Recovery |
|---------|----------|
| Export missing files | Verify `-dir`, permissions, APP_ID, connection (`sql -V` to confirm CLI works) |
| DB script fails | Fix + re-run; reverse with DROP/ALTER |
| Invalid patched file | `git checkout -- <file>`, re-patch |
| Import ORA-06550 (PLS-00103) | Nested `begin...end;/` blocks — fix block boundaries per structure rules above |
| Import ORA-02290 (`WWV_VALID_FSITEM_IDT`) | Invalid item parameter combination. Common causes: (1) `p_protection_level=>'N'` or `value_protected=>'N'` on `NATIVE_HIDDEN` — use `'S'`/`'Y'` instead; (2) `p_item_default_type` included — remove it, use only `p_item_default`; (3) wrong `p_attributes` format — must be `wwv_flow_t_plugin_attributes(...).to_clob`. Export a working item of the same type from any app as reference. |
| Import rolls back all changes | `set_environment.sql` contains `whenever sqlerror exit rollback`. **Any** error in the page file aborts the entire import and rolls back all components. Fix the failing call first, then reimport — partial imports are not possible. |
| Import ID collision | Revisit ID rules; regenerate |
| Import compilation error | `show errors`; fix DB objects; re-import |
| Component broken | Re-import baseline export |
| Unknown parameter format | Export a reference page from any app containing that component type (`apex export -applicationid <N> -split -dir /tmp/ref -expComponents "PAGE:<N>"`), then grep for the parameter to see the exact syntax APEX uses. |

Rollback: git -> `git checkout` + re-import. No git -> re-export from APEX.

---

## JavaScript API Quick Reference

Gunakan referensi ini saat wiring JS di Dynamic Action, inline page JS, atau AJAX callback.

### Item & Region Functions

| Fungsi | Kegunaan |
|---|---|
| `$v("P1_ITEM")` | Get nilai item (legacy) |
| `$s("P1_ITEM", "val")` | Set nilai item (legacy) |
| `$x("P1_ITEM")` | Get DOM element |
| `apex.item("P1_ITEM").getValue()` | Get nilai item (modern) |
| `apex.item("P1_ITEM").setValue("val")` | Set nilai item (modern) |
| `apex.item("P1_ITEM").show()` | Tampilkan item + label |
| `apex.item("P1_ITEM").hide()` | Sembunyikan item + label |
| `apex.item("P1_ITEM").enable()` | Aktifkan item |
| `apex.item("P1_ITEM").disable()` | Nonaktifkan item |
| `apex.item("P1_ITEM").refresh()` | Refresh LOV |
| `apex.item("P1_ITEM").isEmpty()` | Cek apakah kosong |
| `apex.region("static-id").refresh()` | Refresh region |
| `apex.region("static-id").widget()` | Akses widget jQuery region |

### Page & Navigation Functions

| Fungsi | Kegunaan |
|---|---|
| `apex.page.submit("REQUEST")` | Submit page dengan request value |
| `apex.page.validate()` | Validasi client-side |
| `apex.navigation.redirect("url")` | Redirect ke URL |
| `apex.navigation.dialog("url", opts)` | Buka modal dialog |
| `apex.navigation.dialog.close(false, {P1_X: "val"})` | Tutup dialog + pass values |

### Message Functions

| Fungsi | Kegunaan |
|---|---|
| `apex.message.showPageSuccess("msg")` | Tampilkan success message |
| `apex.message.showErrors([{type:"error", message:"msg", pageItem:"P1_X"}])` | Tampilkan error |
| `apex.message.confirm("msg", function(ok){ if(ok){...} })` | Dialog konfirmasi |
| `apex.message.clearErrors()` | Hapus semua error |

### URL Builder

```javascript
// Build URL ke page lain
var url = apex.util.makeApplicationUrl({
    appId:     $v("APP_ID"),
    pageId:    10,
    session:   $v("APP_SESSION"),
    itemNames: "P10_EMP_ID",
    itemValues: $v("P1_EMP_ID")
});
apex.navigation.redirect(url);
```

---

## AJAX Callback Pattern

Digunakan untuk server-side call dari JavaScript tanpa full page submit. Pattern ini melibatkan dua sisi: **PL/SQL process** di APEX dan **`apex.server.process()`** di JavaScript.

### Sisi APEX — Process `AJAX_CALLBACK`

Tambahkan process di halaman dengan `p_process_point => 'AJAX_CALLBACK'`:

```sql
begin
wwv_flow_imp_page.create_page_process(
 p_id                => wwv_flow_imp.id(10000000000000099)
,p_process_sequence  => 10
,p_process_point     => 'AJAX_CALLBACK'
,p_process_type      => 'NATIVE_PLSQL'
,p_process_name      => 'GET_DATA'
,p_process_sql_clob  => wwv_flow_string.join(wwv_flow_t_varchar2(
'DECLARE',
'    l_param1  VARCHAR2(4000) := apex_application.g_x01;',
'    l_param2  VARCHAR2(4000) := apex_application.g_x02;',
'BEGIN',
'    apex_json.open_object;',
'    apex_json.write(''status'', ''ok'');',
'    apex_json.write(''value'', l_param1 || '' - '' || l_param2);',
'    apex_json.close_object;',
'END;'))
);
end;
/
```

**Variabel input dari JS:** `apex_application.g_x01` s/d `g_x20` (string), `g_f01` (array).

### Sisi JavaScript — `apex.server.process()`

```javascript
apex.server.process("GET_DATA", {
    x01: $v("P10_EMP_ID"),       // → apex_application.g_x01
    x02: $v("P10_DEPT_ID")       // → apex_application.g_x02
}, {
    dataType: "json",
    loadingIndicator: "#myRegion",
    success: function(data) {
        if (data.status === "ok") {
            $s("P10_RESULT", data.value);
            apex.message.showPageSuccess("Data loaded.");
        }
    },
    error: function(jqXHR) {
        apex.message.showErrors([{
            type:    "error",
            message: "AJAX error: " + jqXHR.statusText
        }]);
    }
});
```

### Pattern di Export File (DA Action — Execute JavaScript)

Saat AJAX call dipicu dari Dynamic Action:

```sql
begin
wwv_flow_imp_page.create_page_da_action(
 p_id               => wwv_flow_imp.id(10000000000000088)
,p_event_id         => wwv_flow_imp.id(10000000000000087)
,p_event_result     => 'TRUE'
,p_action_sequence  => 10
,p_execute_on_page_init => 'N'
,p_action           => 'NATIVE_JAVASCRIPT_CODE'
,p_attribute_01     => wwv_flow_string.join(wwv_flow_t_varchar2(
'apex.server.process("GET_DATA", { x01: $v("P10_EMP_ID") }, {',
'    dataType: "json",',
'    success: function(data) {',
'        $s("P10_RESULT", data.value);',
'    }',
'});'))
);
end;
/
```

### Tips AJAX PANDAWA

- Nama process (`'GET_DATA'`) harus unik per halaman — gunakan format `VERB_NOUN` uppercase
- Selalu wrap response dengan `apex_json.open_object` / `apex_json.close_object`
- Gunakan `apex_application.g_x01`–`g_x20` untuk parameter string, `g_f01`–`g_f20` untuk array
- Tambahkan `p_ajax_items_to_submit` di region jika nilai item perlu ikut dikirim via region refresh

---

## Examples

- `/apex PAGE:10 -- Add item P10_STATUS (select list) based on LOV STATUS_LOV, create table APP_STATUS if missing.`
- `/apex DEV 113 PAGE:10 -- Add item P10_STATUS (select list) based on LOV STATUS_LOV.`
- `/apex STG 113 LOV:23618973754424510000 -- Rename LOV display column and update dependent items on Page 3.`
