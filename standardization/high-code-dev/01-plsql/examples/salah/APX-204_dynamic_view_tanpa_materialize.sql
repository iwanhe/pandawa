-- MELANGGAR: APX-204 (tanpa WITH ... MATERIALIZE: v() dipanggil untuk setiap baris),
-- APX-105 (nama view tidak mengikuti pola APX_<APP>_P<hal>_<DESK>_V).
create or replace force view vendor_page_view
as
select ven.vendor_id
      ,ven.vendor_name
  from apx_prism_vendor ven
 where ven.company_code = v('P100_COMPANY');
