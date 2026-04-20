# APEX Component Quick Reference — Cheat Sheet

Referensi cepat nilai-nilai valid untuk parameter umum di `wwv_flow_imp_page.*`.
Gunakan sebagai pelengkap `valid_values.md` saat patching export file.

---

## Item Types (`p_display_as`)

| Nama Komponen | `p_display_as` | Keterangan |
|---|---|---|
| Hidden | `NATIVE_HIDDEN` | Primary key, ID tersembunyi |
| Text Field | `NATIVE_TEXT_FIELD` | Input teks pendek |
| Number Field | `NATIVE_NUMBER_FIELD` | Input angka |
| Textarea | `NATIVE_TEXTAREA` | Input teks panjang |
| Select List | `NATIVE_SELECT_LIST` | Dropdown dengan LOV |
| Popup LOV | `NATIVE_POPUP_LOV` | Dropdown searchable |
| Date Picker | `NATIVE_DATE_PICKER_APEX` | Pilihan tanggal |
| Checkbox | `NATIVE_SINGLE_CHECKBOX` | Toggle boolean |
| Radio Group | `NATIVE_RADIOGROUP` | Pilihan tunggal |
| Display Only | `NATIVE_DISPLAY_ONLY` | Read-only display |
| Combobox | `NATIVE_COMBOBOX` | Multi-value combo |
| Color Picker | `NATIVE_COLOR_PICKER` | Pilihan warna |
| Rich Text Editor | `NATIVE_RICH_TEXT_EDITOR` | Editor HTML |
| File Browse | `NATIVE_FILE` | Upload file |
| Star Rating | `NATIVE_STAR_RATING` | Rating bintang |
| Slider | `NATIVE_RANGE` | Slider angka |
| Switch | `NATIVE_YES_NO` | Toggle Yes/No |

---

## Region Types (`p_plug_source_type`)

| Nama Komponen | `p_plug_source_type` | Keterangan |
|---|---|---|
| Form | `NATIVE_FORM` | Form input editable |
| Interactive Report | `NATIVE_IR` | Report dengan filter/sort |
| Interactive Grid | `NATIVE_IG` | Grid editable |
| Classic Report | `NATIVE_SQL_REPORT` | Report sederhana |
| Cards | `NATIVE_CARDS` | Layout kartu |
| List | `NATIVE_LIST` | Navigation list |
| Map | `NATIVE_MAP_REGION` | Map geografis |
| Static Content | *(default/kosong)* | HTML statis |
| Breadcrumb | `NATIVE_BREADCRUMB` | Breadcrumb trail |
| Chart | `NATIVE_JET_CHART` | Oracle JET Chart |
| Faceted Search | `NATIVE_FACETED_SEARCH` | Filter faceted |
| Tree | `NATIVE_TREE` | Hierarki tree |
| Calendar | `NATIVE_DISPLAY_SELECTOR` | Kalender |
| Help Text | `NATIVE_HELP_TEXT` | Teks bantuan inline |
| Tabs Container | `NATIVE_TAB_FORM` | Container tab |

---

## Button Actions (`p_button_action`)

| Nama Aksi | `p_button_action` | Keterangan |
|---|---|---|
| Submit Page | `SUBMIT` | Submit form |
| Redirect to Page | `REDIRECT_PAGE` | Navigate ke page APEX |
| Redirect to URL | `REDIRECT_URL` | Navigate ke URL external |
| Defined by DA | `DEFINED_BY_DA` | Dihandle Dynamic Action |
| Reset Page | `RESET` | Reset semua item ke default |

---

## Dynamic Action Types (`p_action`)

| Nama Aksi | `p_action` | Keterangan |
|---|---|---|
| Show | `NATIVE_SHOW` | Tampilkan element |
| Hide | `NATIVE_HIDE` | Sembunyikan element |
| Enable | `NATIVE_ENABLE` | Aktifkan field |
| Disable | `NATIVE_DISABLE` | Nonaktifkan field |
| Set Value | `NATIVE_SET_VALUE` | Set nilai item |
| Refresh | `NATIVE_REFRESH` | Refresh region/LOV |
| Execute PL/SQL | `NATIVE_EXECUTE_PLSQL_CODE` | Jalankan PL/SQL server-side |
| Execute JavaScript | `NATIVE_JAVASCRIPT_CODE` | Jalankan JavaScript client-side |
| Submit Page | `NATIVE_SUBMIT_PAGE` | Submit form |
| Cancel Dialog | `NATIVE_DIALOG_CANCEL` | Tutup modal tanpa aksi |
| Close Dialog | `NATIVE_CLOSE_WINDOW` | Tutup dialog + pass values |
| Alert | `NATIVE_ALERT` | Tampilkan pesan alert |
| Confirm | `NATIVE_CONFIRM` | Dialog konfirmasi |
| Add CSS Class | `NATIVE_ADD_CLASS` | Tambah CSS class |
| Remove CSS Class | `NATIVE_REMOVE_CLASS` | Hapus CSS class |
| Toggle CSS Class | `NATIVE_TOGGLE_CLASS` | Toggle CSS class |
| Set Focus | `NATIVE_SET_FOCUS` | Set fokus ke item |
| Clear Value | `NATIVE_CLEAR` | Kosongkan nilai item |

---

## DA Event Types (`p_event`)

| Event | `p_event` | Keterangan |
|---|---|---|
| Click | `NATIVE_CLICK` | Klik element |
| Change | `NATIVE_CHANGE` | Nilai berubah |
| Page Load | `NATIVE_WHEN_PAGE_LOADS` | Saat halaman load |
| Before Page Submit | `NATIVE_WHEN_BUTTON_PRESSED` | Sebelum submit |
| Custom Event | `NATIVE_CUSTOM_EVENT` | Event custom JS |
| Dialog Closed | `NATIVE_DIALOG_CLOSED` | Dialog ditutup |
| Region Refresh | `native_on_region_loaded` | Setelah region refresh |

---

## Process Types (`p_process_type`)

| Nama Proses | `p_process_type` | Keterangan |
|---|---|---|
| Form Init | `NATIVE_FORM_INIT` | Load data form (AFTER_HEADER) |
| Form DML | `NATIVE_FORM_DML` | Insert/Update/Delete (AFTER_SUBMIT) |
| PL/SQL | `NATIVE_PLSQL` | Custom PL/SQL |
| Close Window | `NATIVE_CLOSE_WINDOW` | Tutup dialog (AFTER_SUBMIT) |
| Clear State | `NATIVE_SESSION_STATE` | Clear cache item (AFTER_SUBMIT) |
| AJAX Callback | `NATIVE_PLSQL` + point `AJAX_CALLBACK` | Server-side untuk JS call |
| Send Email | `NATIVE_SEND_EMAIL` | Kirim email via APEX |
| Web Service | `NATIVE_WEB_SERVICE` | Panggil REST web service |

---

## Process Points (`p_process_point`)

| Point | `p_process_point` | Keterangan |
|---|---|---|
| Before Header | `BEFORE_HEADER` | Sebelum render halaman |
| After Header | `AFTER_HEADER` | Setelah header, sebelum body |
| Before Regions | `BEFORE_BOX_BODY` | Sebelum regions dirender |
| After Footer | `AFTER_FOOTER` | Setelah seluruh halaman render |
| After Submit | `AFTER_SUBMIT` | Setelah form disubmit |
| AJAX Callback | `AJAX_CALLBACK` | Dipanggil via apex.server.process() |
| On Submit Before Validation | `ON_SUBMIT_BEFORE_COMPUTATION` | Sebelum validasi saat submit |

---

## Authorization Scheme Actions (`p_required_role`)

| Nilai | Keterangan |
|---|---|
| *(kosong)* | Tidak ada authorization |
| `MUST_NOT_BE_PUBLIC_USER` | Harus login |
| ID dari auth scheme | Gunakan `wwv_flow_imp.id(...)` |

---

## Condition Types (`p_condition_type`)

| Tipe Kondisi | `p_condition_type` | Keterangan |
|---|---|---|
| *(kosong)* | Selalu tampil/jalan | No condition |
| Exists | `EXISTS` | SQL EXISTS subquery |
| Not Exists | `NOT_EXISTS` | SQL NOT EXISTS |
| Item = Value | `VAL_OF_ITEM_IN_COND_EQ_COND2` | Item equals value |
| Item != Value | `VAL_OF_ITEM_IN_COND_NOT_EQ_COND2` | Item not equals value |
| Item is NULL | `ITEM_IS_NULL` | Item kosong |
| Item is NOT NULL | `ITEM_IS_NOT_NULL` | Item terisi |
| PL/SQL Expression | `PLSQL_EXPRESSION` | Ekspresi PL/SQL return boolean |
| PL/SQL Function Body | `FUNCTION_BODY` | Function return boolean |
| Request = Value | `REQUEST_EQUALS_CONDITION` | Request (submit button) matches |
| Current Page in List | `CURRENT_PAGE_IN_EXPRESSION1` | Page saat ini di list |

---

## Catatan Penggunaan

- Untuk **item type** yang tidak ada di list, export halaman yang sudah ada berisi komponen tersebut sebagai referensi: `apex export -applicationid <N> -split -dir /tmp/ref -expComponents "PAGE:<N>"`
- **Kondisi** yang sering dipakai di PANDAWA: `ITEM_IS_NOT_NULL` untuk show/hide berdasarkan nilai, `EXISTS` untuk cek akses data
- **Process point** `AJAX_CALLBACK` selalu dipakai berpasangan dengan `apex.server.process()` di JavaScript — lihat section AJAX di `SKILL.md`
