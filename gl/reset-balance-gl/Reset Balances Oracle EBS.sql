select *
from gl_balances
where 1=1
and period_name not in ('ADJ-AUD-23','DEC-23')

select decode(gjb.STATUS,'P','POSTED','OTHER') BATCH_STATUS
       ,gjb.NAME BATCH_NAME
       ,gjh.NAME JOURNAL_NAME
       ,gjh.period_name PERIOD
       ,gjh.running_total_dr JOURNAL_DEBIT
       ,gjh.running_total_cr  JOURNAL_CREDIT
from gl_je_headers gjh
     ,gl_je_batches gjb
where 
      gjh.JE_BATCH_ID = gjb.JE_BATCH_ID
      and gjh.period_name in ('Jan-23','Feb-23','Mar-23','Apr-23','May-23','Jun-23','Jul-23','Aug-23','Sep-23','Oct-23','Nov-23','Dec-23','Jan-23')
      and gjh.status='P'
      and gjb.STATUS='P'
      and gjh.ledger_id=2084
ORDER BY  GJB.NAME

Ga perlu dibersihin:
NCT, ATI, NSTI, DNN, VC

Perlu dibersihin:
NTI, NNA, KDK, GLT, MNM

select ledger_id,name,short_name,chart_of_accounts_id
from gl_ledgers
order by 1 asc

2021	VC_LEDGER	00000	50388 --no
2023	MNM_LEDGER	12200	50391 -- cek
2024	NTI_LEDGER	21000	50389 --cek
2027	ATI_LEDGER	22101	50390 -- no
2029	NCT_LEDGER	23101	50393 --no
2031	NSTI_LEDGER	24101	50395 --no
2033	GLT_LEDGER	12101	50392 --cek, close
2035	KDK_LEDGER	12100	50394 --cek, close
2037	NNA_LEDGER	11101	50396 --cek
2041	DNN_LEDGER	11000	50408 --no

Eksperimen KDK
close period saja 


2023	MNM_LEDGER	12200	50391 -- cek
2024	NTI_LEDGER	21000	50389 --cek
2037	NNA_LEDGER	11101	50396 --cek---DONE


-----------------------NNA_LEDGER

 SELECT * FROM GL_BALANCES --66433 record
 where 1=1
 and period_name in (
                                 'JAN-24'
                                ,'FEB-24'
                                ,'MAR-24'
                                ,'APR-24'
                                ,'MAY-24'
                                ,'JUN-24'
                                ,'JUL-24'
                                ,'AUG-24'
                                ,'SEP-24'
                                ,'OCT-24'
                                ,'NOV-24'
                                ,'DEC-24'
                                )
 and ledger_id=2037
 
 create table gl_balances_2037_bkp as
 SELECT * FROM GL_BALANCES
 where 1=1
-- and period_name='Dec-23'
 and ledger_id=2037
 
 select count (*)
 from gl_balances_2037_bkp
 
 DELETE FROM GL_BALANCES
 WHERE period_name IN ( 'JAN-24'
                                ,'FEB-24'
                                ,'MAR-24'
                                ,'APR-24'
                                ,'MAY-24'
                                ,'JUN-24'
                                ,'JUL-24'
                                ,'AUG-24'
                                ,'SEP-24'
                                ,'OCT-24'
                                ,'NOV-24'
                                ,'DEC-24')
 AND ledger_id = 2037
 AND actual_flag = 'A'
 
 SELECT * FROM GL_PERIOD_STATUSES
 where set_of_books_id=2037
 and closing_status ='O'--<>'N' 
 
 update gl_period_statuses
set closing_status='F'
where set_of_books_id=2037
and application_id=101
and period_name in (             'JAN-24'
                                ,'FEB-24'
                                ,'MAR-24'
                                ,'APR-24'
                                ,'MAY-24'
                                ,'JUN-24'
                                ,'JUL-24'
                                ,'AUG-24'
                                ,'SEP-24'
                                ,'OCT-24'
                                ,'NOV-24'
                                ,'DEC-24')


update gl_je_batches
set status ='U'
, status_verified='N'
,posted_date=null
,posting_run_id=null
,request_id=null
,budgetary_control_status='N'
,posted_by=null
where default_period_name in ('JAN-24'
                                ,'FEB-24'
                                ,'MAR-24'
                                ,'APR-24'
                                ,'MAY-24'
                                ,'JUN-24'
                                ,'JUL-24'
                                ,'AUG-24'
                                ,'SEP-24'
                                ,'OCT-24'
                                ,'NOV-24'
                                ,'DEC-24')
     and actual_flag='A'
--     and set_of_books_id='2061'
     and chart_of_accounts_id='50396'
     and status ='P'
     
select *--distinct chart_of_accounts_id
 from gl_je_batches
 where 1=1
 and status ='U'
 and chart_of_accounts_id='50396'
 
 SELECT default_period_name,status,status_verified,count(*) FROM GL_JE_BATCHES
WHERE default_period_name in ('JAN-24'
                                ,'FEB-24'
                                ,'MAR-24'
                                ,'APR-24'
                                ,'MAY-24'
                                ,'JUN-24'
                                ,'JUL-24'
                                ,'AUG-24'
                                ,'SEP-24'
                                ,'OCT-24'
                                ,'NOV-24'
                                ,'DEC-24')
   AND actual_flag = 'A'
   and chart_of_accounts_id='50396'
--   AND ledger_id = '2061'
group by    
   default_period_name,status,status_verified
   
SELECT distinct period_name,status,ledger_id,count(*) FROM GL_JE_HEADERS 
where period_name in ('JAN-24'
                                ,'FEB-24'
                                ,'MAR-24'
                                ,'APR-24'
                                ,'MAY-24'
                                ,'JUN-24'
                                ,'JUL-24'
                                ,'AUG-24'
                                ,'SEP-24'
                                ,'OCT-24'
                                ,'NOV-24'
                                ,'DEC-24')
   AND actual_flag = 'A'
   AND ledger_id = 2037
group by
  period_name,status,ledger_id
  
update gl_je_headers
set status ='U',posted_date=null
where period_name in ('JAN-24'
                                ,'FEB-24'
                                ,'MAR-24'
                                ,'APR-24'
                                ,'MAY-24'
                                ,'JUN-24'
                                ,'JUL-24'
                                ,'AUG-24'
                                ,'SEP-24'
                                ,'OCT-24'
                                ,'NOV-24'
                                ,'DEC-24')
     and actual_flag='A'
     and ledger_id='2037'
     and status ='P'  
     
SELECT distinct period_name,status,count(*) FROM GL_JE_LINES 
 WHERE period_name IN ('JAN-24'
                                ,'FEB-24'
                                ,'MAR-24'
                                ,'APR-24'
                                ,'MAY-24'
                                ,'JUN-24'
                                ,'JUL-24'
                                ,'AUG-24'
                                ,'SEP-24'
                                ,'OCT-24'
                                ,'NOV-24'
                                ,'DEC-24')
   AND ledger_id = 2037
   AND je_header_id IN (SELECT je_header_id FROM gl_je_headers
             where period_name in ('JAN-24'
                                ,'FEB-24'
                                ,'MAR-24'
                                ,'APR-24'
                                ,'MAY-24'
                                ,'JUN-24'
                                ,'JUL-24'
                                ,'AUG-24'
                                ,'SEP-24'
                                ,'OCT-24'
                                ,'NOV-24'
                                ,'DEC-24')
                           AND actual_flag = 'A')
GROUP BY period_name,status

select *
from gl_je_lines
where 1=1
and ledger_id=2037
and period_name in ('JAN-24'
                                ,'FEB-24'
                                ,'MAR-24'
                                ,'APR-24'
                                ,'MAY-24'
                                ,'JUN-24'
                                ,'JUL-24'
                                ,'AUG-24'
                                ,'SEP-24'
                                ,'OCT-24'
                                ,'NOV-24'
                                ,'DEC-24')
and status ='P'

update gl_je_lines
set status ='U'
where period_name in ('JAN-24'
                                ,'FEB-24'
                                ,'MAR-24'
                                ,'APR-24'
                                ,'MAY-24'
                                ,'JUN-24'
                                ,'JUL-24'
                                ,'AUG-24'
                                ,'SEP-24'
                                ,'OCT-24'
                                ,'NOV-24'
                                ,'DEC-24')
     --and actual_flag='A'
     and ledger_id='2037'
     and status ='P'
     and je_header_id in
     (
       select je_header_id
       from gl_je_headers
             where period_name in ('JAN-24'
                                ,'FEB-24'
                                ,'MAR-24'
                                ,'APR-24'
                                ,'MAY-24'
                                ,'JUN-24'
                                ,'JUL-24'
                                ,'AUG-24'
                                ,'SEP-24'
                                ,'OCT-24'
                                ,'NOV-24'
                                ,'DEC-24')
             and actual_flag='A'
             and ledger_id='2037'
 --    and status !='U'
     )
     
SELECT latest_opened_period_name FROM GL_SETS_OF_BOOKS
 WHERE set_of_books_id = 2037
 
 update GL_SETS_OF_BOOKS set latest_opened_period_name = 'ADJ-AUD-23' WHERE set_of_books_id = 2037
 
 select *
 from gl_period_statuses
     







