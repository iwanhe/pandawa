create table XTD_FA_RETIREMENT_TEMP_STG as
select   book_type_code book
        ,asset_id
        ,date_retired
        ,retirement_type_code
        ,cost_retired
        ,units
        ,cost_of_removal
        ,proceeds_of_sale
        ,sold_to  
        ,creation_date
        ,created_by
        ,status
        ,attribute1 message
--        ,fr.*

CREATE TABLE APPS.XTD_FA_RETIREMENT_TEMP_STG
(
  BOOK                  VARCHAR2(15 BYTE)       NOT NULL,
  ASSET_ID              NUMBER(15)              NOT NULL,
  DATE_RETIRED          DATE                    NOT NULL,
  RETIREMENT_TYPE_CODE  VARCHAR2(15 BYTE),
  COST_RETIRED          NUMBER                  NOT NULL,
  UNITS                 NUMBER,
  COST_OF_REMOVAL       NUMBER,
  PROCEEDS_OF_SALE      NUMBER,
  SOLD_TO               VARCHAR2(30 BYTE),
  CREATION_DATE         DATE,
  CREATED_BY            NUMBER(15),
  STATUS                VARCHAR2(15 BYTE)       NOT NULL,
  MESSAGE               VARCHAR2(150 BYTE)
)
TABLESPACE APPS_TS_TX_DATA
PCTUSED    0
PCTFREE    10
INITRANS   1
MAXTRANS   255
STORAGE    (
            INITIAL          128K
            NEXT             128K
            MINEXTENTS       1
            MAXEXTENTS       UNLIMITED
            PCTINCREASE      0
            BUFFER_POOL      DEFAULT
           )
LOGGING 
NOCOMPRESS 
NOCACHE;

select *
from XTD_FA_RETIREMENT_TEMP_STG

insert into XTD_FA_RETIREMENT_TEMP_STG
SELECT  b.book_type_code
       ,a.asset_id
       ,trunc(sysdate)-1 date_retired
       ,'PENJUALAN' RETIREMENT_TYPE_CODE
       ,b.cost COST_RETIRED
       ,'' UNITS
       ,'' COST_OF_REMOVAL
       ,1000000 PROCEEDS_OF_SALE
       ,'VENDOR SOLD TO' SOLD_TO
       ,SYSDATE CREATED_DATE
       ,to_number('1479') CREATED_BY
       ,'N' STATUS
       ,'' MESSAGE    
      FROM fa_additions_b a, fa_books_v b
         WHERE     a.asset_id = b.asset_id
               --      and b.asset_id = 610
               --      and a.asset_number = 'F68'--lv_asset_number
               --      AND a.creation_date > sysdate - 300
               AND b.book_type_code = 'NTI CORP KUDUS'     --lv_book_type_code
               AND ROWNUM < 3
               AND NOT EXISTS
                       (SELECT 1
                          FROM fa_retirements fr
                         WHERE fr.asset_id = a.asset_id);

begin
XTD_FA_RETIREMENT_TEMP_PRC;
end;