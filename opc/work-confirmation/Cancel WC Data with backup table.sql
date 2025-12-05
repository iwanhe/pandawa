/****************************************************************************************
**                                                                                     **
**                                                                                     **
**      This Datafix script is used to cancel the work confirmation and the associated **
**      receipt data. In this script we will reduce the amount/quantity delivered      **
**      for the work confirmation in po tables and delink the receiving                **
**      and po data as if no WC has been created and set the WC status to REJECTED     **
**      status.                                                                        **
**                                                                                     **
**      Note :                                                                         **
**     1.User has to i/p the work confirmation number to cancel the WC.                **
**     2.In case if invoice is created for the WC then user has to cancel the invoice  **
**       prior to applying this script by contacting the Payables dept.                **
**                                                                                     **
**      Updated on Feb 13 2014.
****************************************************************************************/


DECLARE
l_count NUMBER:=0;
l_ship_num rcv_shipment_headers.shipment_num%type := '106073-1';
l_matching_basis po_line_locations_all.matching_basis%type;
i number:=0;

CURSOR rt IS
SELECT rsh.shipment_num,rt.*
FROM rcv_transactions rt ,
     rcv_shipment_headers rsh
WHERE Trim(rsh.shipment_num) = Trim(l_ship_num)
and rsh.receipt_source_code = 'VENDOR'
and rsh.asn_type = 'WC'
AND rsh.shipment_header_id=rt.shipment_header_id;


CURSOR rsl IS
SELECT rsh.shipment_num,rsl.*
FROM rcv_shipment_lines rsl ,
     rcv_shipment_headers rsh
WHERE Trim(rsh.shipment_num) = Trim(l_ship_num)
and rsh.receipt_source_code = 'VENDOR'
and rsh.asn_type = 'WC'
and rsl.shipment_line_status_code ='EXPECTED'
and rsl.approval_status = 'APPROVED'
and rsh.shipment_header_id=rsl.shipment_header_id
and not exists (select 1 from rcv_transactions rt
                where rt.shipment_header_id = rsh.shipment_header_id);

BEGIN
--create backup table--
dbms_output.put_line('Backup Table...');
FOR rec IN (SELECT distinct rsh.shipment_num,rt.SHIPMENT_HEADER_ID, rt.SHIPMENT_LINE_ID, PO_HEADER_ID, PO_LINE_ID, PO_LINE_LOCATION_ID, PO_DISTRIBUTION_ID 
            FROM rcv_transactions rt ,
                 rcv_shipment_headers rsh
            WHERE Trim(rsh.shipment_num) = Trim(l_ship_num)
            and rsh.receipt_source_code = 'VENDOR'
            and rsh.asn_type = 'WC'
            AND rsh.shipment_header_id=rt.shipment_header_id)
LOOP

i:=i+1;

    EXECUTE IMMEDIATE 'CREATE TABLE pda_'||i||'_02122024 AS SELECT * FROM po_distributions_all WHERE po_distribution_id='||rec.po_distribution_id||'';
      
    EXECUTE IMMEDIATE 'CREATE TABLE plla_'||i||'_02122024 AS SELECT * FROM po_line_locations_all WHERE line_location_id='||rec.po_line_location_id||'';
      
    EXECUTE IMMEDIATE 'CREATE TABLE pla_'||i||'_02122024 AS SELECT * FROM po_lines_all WHERE po_line_id  = '||rec.po_line_id||'';
    
    EXECUTE IMMEDIATE 'CREATE TABLE pha_'||i||'_02122024 AS SELECT * FROM po_headers_all WHERE po_header_id  = '||rec.po_header_id||'';
    
    EXECUTE IMMEDIATE 'CREATE TABLE rsl_'||i||'_02122024 AS SELECT * FROM rcv_shipment_lines WHERE shipment_line_id = '||rec.shipment_line_id||'';
    
    EXECUTE IMMEDIATE 'CREATE TABLE rsh_'||i||'_02122024 AS SELECT * FROM rcv_shipment_headers WHERE shipment_num = '''||rec.shipment_num||'''';
    
    EXECUTE IMMEDIATE 'CREATE TABLE rt_'||i||'_02122024 AS SELECT * FROM rcv_transactions WHERE shipment_header_id in
         (SELECT shipment_header_id
            FROM rcv_shipment_headers
           WHERE shipment_num = '''||rec.shipment_num||''')';
                
    EXECUTE IMMEDIATE 'CREATE TABLE rti_'||i||'_02122024 AS SELECT * FROM rcv_transactions_interface WHERE shipment_num = '''||rec.shipment_num||''' AND po_line_location_id = '||rec.po_line_location_id||'';
    
    EXECUTE IMMEDIATE 'CREATE TABLE rhi'||i||'_02122024 AS SELECT * FROM rcv_headers_interface rhi WHERE rhi.shipment_num = '''||rec.shipment_num||'''';
   
END LOOP;
dbms_output.put_line('All Tables already backed up...');
--End create backup table--
dbms_output.put_line('Start Datafix...');
FOR rec IN rt
LOOP
select poll.matching_basis
  into l_matching_basis
  from po_distributions_all pod,
       po_line_locations_all poll
 where pod.po_distribution_id=rec.po_distribution_id
   and poll.line_location_id=pod.line_location_id;

l_count:=l_count+1;
if(l_matching_basis='QUANTITY') then

      UPDATE po_distributions_all
      SET quantity_delivered = Decode( Sign(quantity_delivered-rec.quantity), -1, 0,quantity_delivered-rec.quantity),
          last_update_date = sysdate 
      WHERE po_distribution_id=rec.po_distribution_id
      and rec.transaction_type='DELIVER';

      UPDATE po_line_locations_all
      SET quantity_received = Decode( Sign(quantity_received-rec.quantity), -1, 0,quantity_received-rec.quantity),
          last_update_date = sysdate
      WHERE line_location_id=rec.po_line_location_id
      AND rec.transaction_type='RECEIVE'
      AND matching_basis='QUANTITY';

elsif(l_matching_basis='AMOUNT') then

      UPDATE po_distributions_all
      SET amount_delivered = Decode( Sign(amount_delivered-rec.amount), -1, 0,amount_delivered-rec.amount),
          last_update_date = sysdate 
      WHERE po_distribution_id=rec.po_distribution_id
      and rec.transaction_type='DELIVER';

      UPDATE po_line_locations_all
      SET amount_received = Decode( Sign(amount_received-rec.amount), -1, 0,amount_received-rec.amount),
          last_update_date = sysdate 
      WHERE line_location_id=rec.po_line_location_id
      AND rec.transaction_type='RECEIVE'
      AND matching_basis='AMOUNT';

end if;

IF l_matching_basis IN ('QUANTITY','AMOUNT') THEN 

UPDATE po_line_locations_all 
SET closed_code               = decode(CLOSED_CODE, 'CLOSED FOR RECEIVING', 'OPEN', 'CLOSED FOR INVOICE'),
    closed_for_receiving_date =  NULL,
    closed_reason             =  NULL,
    closed_date               =  NULL,
    closed_flag               =  NULL,
    last_update_date          =  sysdate
WHERE closed_code IN ('CLOSED','CLOSED FOR RECEIVING')
AND   line_location_id        =  rec.po_line_location_id;


UPDATE po_lines_all 
SET closed_code   = 'OPEN',    
    closed_reason =  NULL,
    closed_date   =  NULL,
    closed_flag   =  NULL,
    last_update_date = sysdate
WHERE closed_code = 'CLOSED'
AND   po_line_id  = rec.po_line_id;


UPDATE po_headers_all
SET closed_code    = 'OPEN',
    closed_date    =  NULL,
    last_update_date = sysdate
WHERE closed_code  = 'CLOSED'
AND   po_header_id = rec.po_header_id;


END IF;


END LOOP;

FOR rec IN rsl
LOOP
 select poll.matching_basis
  into l_matching_basis
  from po_line_locations_all poll
 where poll.line_location_id=rec.po_line_location_id;

l_count:=l_count+1;
if(l_matching_basis='QUANTITY') then

      UPDATE po_line_locations_all
      SET quantity_shipped = Decode( Sign(quantity_shipped - rec.quantity_shipped), -1, 0,quantity_shipped - rec.quantity_shipped),
          last_update_date = sysdate 
      WHERE line_location_id=rec.po_line_location_id;

      UPDATE rcv_shipment_lines
      SET quantity_shipped = 0,
          last_update_date = sysdate           
      WHERE shipment_line_id = rec.shipment_line_id;

      DELETE FROM rcv_transactions_interface
      WHERE TRANSACTION_TYPE IN ('SHIP', 'RECEIVE')
      AND interface_source_code = 'ISP'
      AND Trim(shipment_num) = Trim(rec.shipment_num)
      AND ( (processing_status_code = 'COMPLETED' AND transaction_status_code = 'ERROR' ) OR
            (processing_status_code = 'ERROR' AND transaction_status_code = 'PENDING')
          )
      AND quantity IS NOT NULL
      AND po_line_location_id = rec.po_line_location_id; 


elsif(l_matching_basis='AMOUNT') then

      UPDATE po_line_locations_all
      SET amount_shipped = Decode( Sign(amount_shipped - rec.amount_shipped), -1, 0,amount_shipped - rec.amount_shipped),
          last_update_date = sysdate
      WHERE line_location_id=rec.po_line_location_id;

      UPDATE rcv_shipment_lines
      SET amount_shipped = 0,
          requested_amount = 0,
          last_update_date = sysdate 
      WHERE shipment_line_id = rec.shipment_line_id;
      
      DELETE FROM rcv_transactions_interface
      WHERE TRANSACTION_TYPE IN ('SHIP', 'RECEIVE')
      AND interface_source_code = 'ISP'
      AND Trim(shipment_num) = Trim(rec.shipment_num)
      AND ( (processing_status_code = 'COMPLETED' AND transaction_status_code = 'ERROR' ) OR
            (processing_status_code = 'ERROR' AND transaction_status_code = 'PENDING')
          )
      AND amount IS NOT NULL
      AND po_line_location_id = rec.po_line_location_id; 
  

end if;

END LOOP;

if(l_count>0) then

      UPDATE rcv_transactions
      SET po_line_location_id=-1*po_line_location_id,
          po_distribution_id=-1*po_distribution_id,
          last_update_date = sysdate
      WHERE shipment_header_id in
         (SELECT shipment_header_id
            FROM rcv_shipment_headers
           WHERE Trim(shipment_num) = Trim(l_ship_num)
             AND asn_type='WC')
      AND po_line_location_id > 0;

      UPDATE rcv_shipment_lines
      SET approval_status='REJECTED',
      po_header_id = -1*po_header_id,
      po_line_id = -1*po_line_id,
      po_line_location_id=-1*po_line_location_id,
      po_distribution_id=-1*po_distribution_id,
      last_update_date = sysdate
      WHERE shipment_header_id in
         (SELECT shipment_header_id
            FROM rcv_shipment_headers
           WHERE Trim(shipment_num) = Trim(l_ship_num)
             AND asn_type='WC')
      AND po_line_location_id > 0;

      UPDATE rcv_shipment_headers
      SET shipment_num = to_char('R' || '-' ||Trim(l_ship_num)),
      approval_status='REJECTED',
      last_update_date = sysdate
      WHERE Trim(shipment_num) = Trim(l_ship_num)
      AND asn_type='WC';

      UPDATE rcv_headers_interface
      SET shipment_num=to_char('R' || '-' ||Trim(l_ship_num)),
          last_update_date = sysdate
      WHERE Trim(shipment_num) = Trim(l_ship_num)
      AND asn_type='WC';

      DELETE FROM rcv_headers_interface rhi
      WHERE Trim(rhi.shipment_num) = Trim(l_ship_num)
      AND rhi.processing_status_code = 'ERROR'
      AND rhi.asn_type = 'WC';

end if;

dbms_output.put_line('Pls. check the data again and then commit');

EXCEPTION
   when others THEN
     dbms_output.put_line('Error Occured :');
     dbms_output.put_line(' ' || SQLCODE || ' -- ' || SQLERRM);
     ROLLBACK ;
     CLOSE rt;
END;