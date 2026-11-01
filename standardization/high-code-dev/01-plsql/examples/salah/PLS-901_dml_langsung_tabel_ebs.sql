-- MELANGGAR: PLS-901 (DML langsung ke tabel standar EBS),
-- PLS-903 (konteks EBS di-hardcode), PLS-805 (password di kode).
begin
   fnd_global.apps_initialize(1318, 50554, 200);

   update ap_supplier_sites_all
      set inactive_date = sysdate
    where vendor_id = 12345;

   apx_prism_sftp_pkg.connect(p_user => 'mft_user', p_password => 'Rahasia#2026');
end;
/
