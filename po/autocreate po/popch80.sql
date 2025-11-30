REM dbdrv: none
WHENEVER SQLERROR EXIT FAILURE ROLLBACK;
REM $Header: popch80.sql 120.4 2011/04/07 06:49:54 rakearun ship $
REM
REM             (c) Copyright Oracle Corporation 1994
REM                       All Rights Reserved
REM *********************************************************************
REM * FILENAME                                                          *
REM *    popch80.sql                                                    *
REM *                                                                   *
REM * DESCRIPTION                                                       *
REM * This file creates a database trigger on po_distributions to 	*
REM * copy the descriptive flexfield columns from the req distributions *
REM *									*
REM * You should only install this trigger if your flexfield definitions*
REM * on both the requisition distribution and the purchase order 	*
REM * distribution match.  This trigger does not validate the copied	*
REM * attribute columns							*
REM *                                                                   *
REM * USAGE                                                             *
REM *    % sqlplus <po_un>/<po_pw>                                      *
REM *                                                                   *
REM *    start popch80                                                  *
REM *                                                                   *
REM * HISTORY                                                           *
REM *    09/18/95 K Miller Created                                      *
REM *    06/17/96 T Cai    Modified for 10.7 change '--' to 'REM'       *
REM *    03/12/98 Modified for R11 inclusion as a PKMFRZ patch and      *
REM *    changed table name PO_DISTRIBUTIONS to PO_DISTRIBUTIONS_ALL    *
REM *                                                                   *
REM *********************************************************************

REM Trigger copies flexfields from a requisition-distribution to a PO
REM distribution 

CREATE OR REPLACE TRIGGER po_distributions_t1
before insert on po_distributions_all for each row

WHEN (NEW.REQ_DISTRIBUTION_ID is not null)
declare
P_ATTRIBUTE_CATEGORY  varchar2(30);
P_ATTRIBUTE1  varchar2(150);
P_ATTRIBUTE2  varchar2(150);
P_ATTRIBUTE3  varchar2(150);
P_ATTRIBUTE4  varchar2(150);
P_ATTRIBUTE5  varchar2(150);
P_ATTRIBUTE6  varchar2(150);
P_ATTRIBUTE7  varchar2(150);
P_ATTRIBUTE8  varchar2(150);
P_ATTRIBUTE9  varchar2(150);
P_ATTRIBUTE10  varchar2(150);
P_ATTRIBUTE11  varchar2(150);
P_ATTRIBUTE12  varchar2(150);
P_ATTRIBUTE13  varchar2(150);
P_ATTRIBUTE14  varchar2(150);
P_ATTRIBUTE15  varchar2(150);
BEGIN
IF (:NEW.source_distribution_id is NULL) THEN
select
         Decode(PR.ATTRIBUTE_CATEGORY,:NEW.ATTRIBUTE_CATEGORY,:NEW.ATTRIBUTE_CATEGORY,PR.ATTRIBUTE_CATEGORY),
         Decode(PR.ATTRIBUTE1 ,:NEW.ATTRIBUTE1 ,:NEW.ATTRIBUTE1,PR.ATTRIBUTE1  ),
         Decode(PR.ATTRIBUTE2 ,:NEW.ATTRIBUTE2 ,:NEW.ATTRIBUTE2,PR.ATTRIBUTE2  ),
         Decode(PR.ATTRIBUTE3 ,:NEW.ATTRIBUTE3 ,:NEW.ATTRIBUTE3,PR.ATTRIBUTE3  ),
         Decode(PR.ATTRIBUTE4 ,:NEW.ATTRIBUTE4 ,:NEW.ATTRIBUTE4,PR.ATTRIBUTE4  ),
         Decode(PR.ATTRIBUTE5 ,:NEW.ATTRIBUTE5 ,:NEW.ATTRIBUTE5,PR.ATTRIBUTE5  ),
         Decode(PR.ATTRIBUTE6 ,:NEW.ATTRIBUTE6 ,:NEW.ATTRIBUTE6,PR.ATTRIBUTE6  ),
         Decode(PR.ATTRIBUTE7 ,:NEW.ATTRIBUTE7 ,:NEW.ATTRIBUTE7,PR.ATTRIBUTE7  ),
         Decode(PR.ATTRIBUTE8 ,:NEW.ATTRIBUTE8 ,:NEW.ATTRIBUTE8,PR.ATTRIBUTE8  ),
         Decode(PR.ATTRIBUTE9 ,:NEW.ATTRIBUTE9 ,:NEW.ATTRIBUTE9,PR.ATTRIBUTE9  ),
         Decode(PR.ATTRIBUTE10,:NEW.ATTRIBUTE10,:NEW.ATTRIBUTE10,PR.ATTRIBUTE10),
         Decode(PR.ATTRIBUTE11,:NEW.ATTRIBUTE11,:NEW.ATTRIBUTE11,PR.ATTRIBUTE11),
         Decode(PR.ATTRIBUTE12,:NEW.ATTRIBUTE12,:NEW.ATTRIBUTE12,PR.ATTRIBUTE12),
         Decode(PR.ATTRIBUTE13,:NEW.ATTRIBUTE13,:NEW.ATTRIBUTE13,PR.ATTRIBUTE13),
         Decode(PR.ATTRIBUTE14,:NEW.ATTRIBUTE14,:NEW.ATTRIBUTE14,PR.ATTRIBUTE14),
         Decode(PR.ATTRIBUTE15,:NEW.ATTRIBUTE15,:NEW.ATTRIBUTE15,PR.ATTRIBUTE15)
into
         P_ATTRIBUTE_CATEGORY,
         P_ATTRIBUTE1,
         P_ATTRIBUTE2,
         P_ATTRIBUTE3,
         P_ATTRIBUTE4,
         P_ATTRIBUTE5,
         P_ATTRIBUTE6,
         P_ATTRIBUTE7,
         P_ATTRIBUTE8,
         P_ATTRIBUTE9,
         P_ATTRIBUTE10,
         P_ATTRIBUTE11,
         P_ATTRIBUTE12,
         P_ATTRIBUTE13,
         P_ATTRIBUTE14,
         P_ATTRIBUTE15
from 	po_req_distributions_all PR
where 	pr.distribution_id = :NEW.REQ_DISTRIBUTION_ID;
ELSE
 	  select
 	          Decode(PR.ATTRIBUTE_CATEGORY,:NEW.ATTRIBUTE_CATEGORY,:NEW.ATTRIBUTE_CATEGORY,PR.ATTRIBUTE_CATEGORY),
         	  Decode(PR.ATTRIBUTE1 ,:NEW.ATTRIBUTE1 ,:NEW.ATTRIBUTE1,PR.ATTRIBUTE1  ),
       		  Decode(PR.ATTRIBUTE2 ,:NEW.ATTRIBUTE2 ,:NEW.ATTRIBUTE2,PR.ATTRIBUTE2  ),
      		  Decode(PR.ATTRIBUTE3 ,:NEW.ATTRIBUTE3 ,:NEW.ATTRIBUTE3,PR.ATTRIBUTE3  ),
       		  Decode(PR.ATTRIBUTE4 ,:NEW.ATTRIBUTE4 ,:NEW.ATTRIBUTE4,PR.ATTRIBUTE4  ),
      		  Decode(PR.ATTRIBUTE5 ,:NEW.ATTRIBUTE5 ,:NEW.ATTRIBUTE5,PR.ATTRIBUTE5  ),
      		  Decode(PR.ATTRIBUTE6 ,:NEW.ATTRIBUTE6 ,:NEW.ATTRIBUTE6,PR.ATTRIBUTE6  ),
      		  Decode(PR.ATTRIBUTE7 ,:NEW.ATTRIBUTE7 ,:NEW.ATTRIBUTE7,PR.ATTRIBUTE7  ),
         	  Decode(PR.ATTRIBUTE8 ,:NEW.ATTRIBUTE8 ,:NEW.ATTRIBUTE8,PR.ATTRIBUTE8  ),
     		  Decode(PR.ATTRIBUTE9 ,:NEW.ATTRIBUTE9 ,:NEW.ATTRIBUTE9,PR.ATTRIBUTE9  ),
       		  Decode(PR.ATTRIBUTE10,:NEW.ATTRIBUTE10,:NEW.ATTRIBUTE10,PR.ATTRIBUTE10),
	          Decode(PR.ATTRIBUTE11,:NEW.ATTRIBUTE11,:NEW.ATTRIBUTE11,PR.ATTRIBUTE11),
	          Decode(PR.ATTRIBUTE12,:NEW.ATTRIBUTE12,:NEW.ATTRIBUTE12,PR.ATTRIBUTE12),
		  Decode(PR.ATTRIBUTE13,:NEW.ATTRIBUTE13,:NEW.ATTRIBUTE13,PR.ATTRIBUTE13),
	          Decode(PR.ATTRIBUTE14,:NEW.ATTRIBUTE14,:NEW.ATTRIBUTE14,PR.ATTRIBUTE14),
	          Decode(PR.ATTRIBUTE15,:NEW.ATTRIBUTE15,:NEW.ATTRIBUTE15,PR.ATTRIBUTE15)
 	   into
 	          P_ATTRIBUTE_CATEGORY,
 	          P_ATTRIBUTE1,
 	          P_ATTRIBUTE2,
 	          P_ATTRIBUTE3,
 	          P_ATTRIBUTE4,
 	          P_ATTRIBUTE5,
 	          P_ATTRIBUTE6,
 	          P_ATTRIBUTE7,
 	          P_ATTRIBUTE8,
 	          P_ATTRIBUTE9,
 	          P_ATTRIBUTE10,
 	          P_ATTRIBUTE11,
 	          P_ATTRIBUTE12,
 	          P_ATTRIBUTE13,
 	          P_ATTRIBUTE14,
 	          P_ATTRIBUTE15
 	   from  po_distributions_all PR
 	   WHERE pr.po_distribution_id = :NEW.source_distribution_id;

 	 END IF;


:NEW.ATTRIBUTE_CATEGORY :=  P_ATTRIBUTE_CATEGORY;
:NEW.ATTRIBUTE1 :=         P_ATTRIBUTE1;
:NEW.ATTRIBUTE2 :=         P_ATTRIBUTE2;
:NEW.ATTRIBUTE3 :=         P_ATTRIBUTE3;
:NEW.ATTRIBUTE4 :=         P_ATTRIBUTE4;
:NEW.ATTRIBUTE5 :=         P_ATTRIBUTE5;
:NEW.ATTRIBUTE6 :=         P_ATTRIBUTE6;
:NEW.ATTRIBUTE7 :=         P_ATTRIBUTE7;
:NEW.ATTRIBUTE8 :=         P_ATTRIBUTE8;
:NEW.ATTRIBUTE9 :=         P_ATTRIBUTE9;
:NEW.ATTRIBUTE10 :=        P_ATTRIBUTE10;
:NEW.ATTRIBUTE11 :=        P_ATTRIBUTE11;
:NEW.ATTRIBUTE12 :=        P_ATTRIBUTE12;
:NEW.ATTRIBUTE13 :=        P_ATTRIBUTE13;
:NEW.ATTRIBUTE14 :=        P_ATTRIBUTE14;
:NEW.ATTRIBUTE15 :=        P_ATTRIBUTE15;

exception
  when OTHERS then null;
end;
/

