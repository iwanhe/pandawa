-- PLS-903: konteks EBS diambil dari tabel konfigurasi, bukan angka hardcode.
-- Tabel xtd_fnd_api_context adalah contoh; sesuaikan dengan tabel konfigurasi aplikasi.
create or replace procedure xtd_ap_init_context_prc (
   p_source_system in varchar2
  ,p_org_id        in number
)
authid definer
is
   r_ctx xtd_fnd_api_context%rowtype;
begin
   select ctx.*
     into r_ctx
     from xtd_fnd_api_context ctx
    where ctx.source_system = p_source_system
      and ctx.org_id        = p_org_id;

   fnd_global.apps_initialize(
      user_id      => r_ctx.user_id
     ,resp_id      => r_ctx.resp_id
     ,resp_appl_id => r_ctx.resp_appl_id
   );
   mo_global.init('SQLAP');
   mo_global.set_policy_context('S', r_ctx.org_id);
end xtd_ap_init_context_prc;
/
