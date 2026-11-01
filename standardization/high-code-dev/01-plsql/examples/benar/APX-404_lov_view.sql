-- APX-404: LOV di Shared Components dengan view pendukung berakhiran _LOV_V.
create or replace force view apx_prism_status_lov_v
as
select sts.display_value as d
      ,sts.return_value  as r
  from apx_prism_status_ref sts
 where sts.is_active = 'Y'
 order by sts.sort_order;
