-- MELANGGAR: APX-301 (substitution string &ITEM. di SQL region -> SQL injection),
-- APX-303 (HTML dibangun di SQL), APX-306 (URL f?p= dirakit manual).
select ven.vendor_name
      ,'<span class="badge">' || ven.status || '</span>' as status_html
      ,'f?p=&APP_ID.:210:&SESSION.::NO::P210_VENDOR_ID:' || ven.vendor_id as edit_link
  from apx_prism_vendor ven
 where ven.company_code = '&P100_COMPANY.'
