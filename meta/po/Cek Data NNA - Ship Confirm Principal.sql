select   --distinct   
--            rsh.attribute1
--			,rsh.attribute2
--			,rsh.comments
--			,rsl.line_num
--			,rsl.quantity_received
--			,rsl.unit_of_measure
--			,rsl.item_description
--			,
			xopds.no_do delivery_number_di_staging_yg_dikirim_NTI
--			,rsh.PACKING_SLIp NO_DO_NNA_YG_DIINPUT
--			,rsh.SHIPMENT_NUM NO_DI_KOLOM_SHIPMENT_NNA	
			, xopds.delivery_id
			, xopds.organization_code do_organization_code
			, rt.transaction_date dist_receipt_date
			, rsh.receipt_num dist_no_receipt
			, (select segment1 from po_headers_all where po_header_id = rt.po_header_id) dist_po_number
			, rt.po_header_id dist_po_header_id
			, rt.transaction_id dist_rcv_transaction_id
--			, rsh.shipment_header_id dist_rcv_transaction_id
			, xopds.no_so sales_order_number
			, xopds.order_header_id
			, null status
			, null creation_date
			, null last_update_date
			, asp.vendor_name
			,rt.ORGANIZATION_ID	
--				, xdsp.*
		from rcv_shipment_headers rsh, rcv_shipment_lines rsl
			, rcv_transactions rt
			, (select asp.vendor_id
						, asp.vendor_name
					from ap_suppliers asp
					where 1=1
						and asp.attribute6 like 'PRINC%'
						and asp.attribute15 is not null) asp
			, (select distinct company_code, no_do,delivery_id,organization_code,delivery_date,no_surat_jalan,po_number,po_header_id,no_so,order_header_id from XTD_OM_PRINCIPAL_DO_STG) xopds
--            , XTD_OM_PRINCIPAL_DO_STG xopds
		where 1=1
--			and rt.vendor_id = p_vendor_id
			and rsh.shipment_header_id = rt.shipment_header_id
			and rsh.shipment_header_id=rsl.shipment_header_id
			and rt.shipment_line_id=rsl.shipment_line_id
			and rt.transaction_type = 'DELIVER'
			and rt.vendor_id = asp.vendor_id
			and rt.po_header_id = xopds.po_header_id
			and (xopds.NO_SURAT_JALAN=rsh.packing_slip or xopds.NO_SURAT_JALAN=rsh.shipment_num)
			and rt.transaction_date between sysdate-2 and sysdate --add by iwanhe
--			and not exists (select '1' from XTD_RCV_PRINCIPAL_TXTFILE_STG where dist_rcv_transaction_id = rt.transaction_id)
--			and xopds.no_do between 227235 and 227235
--            and
--            and asp.vendor_name like 'NOJORONO TOBACCO INTERNATIONAL, PT'
--            and rt.po_header_id='1970003'
--            and asp.vendor_name like 'AROMA%'
--            and xopds.no_do in ('2521100005','2521100006','2521100007')
            and xopds.no_do in (select no_do from xtd_om_principal_do_stg_v)
--            and asp.vendor_name like 'NIKO%'
order by 4 asc
           
select *
from hr_all_organization_units
where 1=1
and organization_id='271'

select *
from po_headers_all
where segment1=24210102537

select *--no_do,x.*--count(1)
from XTD_OM_PRINCIPAL_DO_STG x
where 1=1
and company_code='NTI'
--and delivery_number like '2521110000%'
--and no_surat_jalan='227241'
and po_number='25210100025'

--mencari nomor surat jalan yang belum direceipt di NNA

/* Formatted on 08/01/2025 21:05:56 (QP5 v5.362) */

create or replace view xtd_om_principal_do_stg_v as
SELECT no_do                                                  --count(1)
  FROM XTD_OM_PRINCIPAL_DO_STG x
 WHERE     1 = 1
       --and company_code='NSTI'
       --and delivery_number='227239'
       --and no_surat_jalan='227241'
       AND po_number = '24210102535'
       --and no_do=1
       --order by 1 desc
       AND no_do IN
               (SELECT no_surat_jalan
                  FROM (SELECT shipment_num     no_surat_jalan
                          FROM rcv_shipment_headers
                         WHERE     1 = 1
                               --and receipt_num='251230100005'
                               AND shipment_num IN
                                       (SELECT no_do
                                          FROM XTD_OM_PRINCIPAL_DO_STG
                                         WHERE     1 = 1
                                               --and company_code='NSTI'
                                               --and delivery_number='227239'
                                               --and no_surat_jalan='227241'
                                               AND po_number = '24210102535'--and no_do=1
                                                                            --order by 1 desc
                                                                            )
                        UNION
                        SELECT packing_slip     no_surat_jalan
                          FROM rcv_shipment_headers
                         WHERE     1 = 1
                               --and receipt_num='251230100005'
                               AND packing_slip IN
                                       (SELECT no_do
                                          FROM XTD_OM_PRINCIPAL_DO_STG
                                         WHERE     1 = 1
                                               --and company_code='NSTI'
                                               --and delivery_number='227239'
                                               --and no_surat_jalan='227241'
                                               AND po_number = '24210102535'--and no_do=1
                                                                            --order by 1 desc
                                                                            )
                        ORDER BY 1 ASC))

select *
from rcv_shipment_lines
where 1=1
and shipment_header_id='2428007'

select *
from rcv_transactions
where 1=1
and shipment_header_id='2428007'
and transaction_type='DELIVER'

Penyebab issue double, ada di level rcv_trx dimana trx_id berdasarkan kode item dan per shipment line, seharusnya ambil dari headers aja

select po_header_id, x.*
from RCV_VRC_TXS_V x
where 1=1
--and shipment_header_id='2428007'
and po_header_id='1943006'

select receipt_num,packing_slip nomor_do,attribute1,attribute2,x.*
from rcv_shipment_headers x
where 1=1
and packing_slip='227244'
--and shipment_num ='227243'

where 1=1
and po_number='25210100025'
--and no_do='2521100007'
--where 1=1
--and no_so='2511100013'
order by 10 asc, 7 asc

select *
from XTD_OM_PRINCIPAL_DO_STG
where 1=1
and

select *
from XTD_RCV_PRINCIPAL_TXTFILE_STG
where 1=1
--and dist_po_number='24210102537'
and dist_no_receipt='251230100004'

			order by delivery_id desc
			
			select *
			from rcv_shipment_headers
			where 1=1
			and 1=1
			and receipt_num='251010400001'
			order by creation_date desc
			
			select *
			from XTD_OM_PRINCIPAL_DO_STG
			where po_number='25210100002'
			
			select *
			from XTD_OM_PRINCIPAL_DO_ERROR_STG