SET SERVEROUTPUT ON
SET VERIFY OFF

DECLARE

   l_org_id                     NUMBER;
   l_user_id                    NUMBER;
   l_resp_id                    NUMBER;
   l_check_id                   NUMBER := &check_id;
   l_period_name                VARCHAR2(100);
   l_num_cancelled              NUMBER;
   l_num_not_cancelled          NUMBER;
   l_clear_count                NUMBER;
   l_unclear_count              NUMBER;
   l_mat_count                  NUMBER;
   l_mat_rev_count              NUMBER;
   l_return_status              VARCHAR2(1000);
   l_msg_count                  NUMBER;
   l_msg_data                   VARCHAR2(4000);
   l_debug_info                 VARCHAR2(4000);
   l_netting_type               VARCHAR2 (25);

BEGIN

    l_debug_info := 'fetching the org_id';
    SELECT org_id
    INTO l_org_id
    FROM ap_checks_all
    WHERE check_id = l_check_id;

    l_debug_info := 'fetching the period name';
    SELECT DISTINCT glps.period_name
    INTO l_period_name
    FROM gl_period_statuses glps,
       ap_system_parameters_all asp,
       ap_checks_all ac
    WHERE glps.application_id = 200
    AND nvl(glps.adjustment_period_flag, 'N') = 'N'
    AND trunc(sysdate) BETWEEN glps.start_date AND glps.end_date
    AND glps.set_of_books_id = asp.set_of_books_id
    AND asp.org_id = ac.org_id
    AND ac.check_id = l_check_id
    AND rownum < 2;

    l_debug_info := 'Getting the user_id';
    SELECT user_id
    INTO l_user_id
    FROM fnd_user
    WHERE user_name = '&user_name'
    AND rownum < 2;

    l_debug_info := 'Getting the responsibility_id';
    SELECT responsibility_id
    INTO l_resp_id
    FROM fnd_responsibility_tl
    WHERE application_id = 200
    AND responsibility_name = '&responsibility_name'
    AND language = userenv('LANG')
    AND rownum < 2;

    l_debug_info := 'before calling the fnd global';
    FND_GLOBAL.APPS_INITIALIZE(l_user_id, l_resp_id, 200);

    l_debug_info := 'Setting the org context';
    MO_GLOBAL.set_policy_context('S', l_org_id);

    l_debug_info := 'Getting the counts of the transaction types';
    SELECT nvl(SUM(decode(transaction_type,'PAYMENT CLEARING',1,0)), 0),
       nvl(SUM(decode(transaction_type,'PAYMENT UNCLEARING',1,0)), 0),
       nvl(SUM(decode(transaction_type,'PAYMENT MATURITY',1,0)), 0),
       nvl(SUM(decode(transaction_type,'PAYMENT MATURITY REVERSED',1,0)), 0)
    INTO l_clear_count,
       l_unclear_count,
       l_mat_count,
       l_mat_rev_count
    FROM ap_payment_history_all
    WHERE check_id = l_check_id;
	
	SELECT  payment_type_flag
    INTO    l_netting_type
    FROM    ap_checks_all
    WHERE   check_id = l_check_id;
	
	
    l_debug_info := 'Evaluating the counts before calling reverse check / calling reverse check directly if it is netting payment';
    IF (l_clear_count <= l_unclear_count or l_netting_type = 'N') THEN

      l_debug_info := 'calling the reverse check';
      AP_VOID_PKG.Ap_Reverse_Check(
          P_Check_Id                    =>  l_check_id,                                 --IN         NUMBER,
          P_Replace_Flag                =>  'N',                                        --IN         VARCHAR2,
          P_Reversal_Date               =>  trunc(sysdate),                             --IN         DATE,
          P_Reversal_Period_Name        =>  l_period_name,                              --IN         VARCHAR2,
          P_Checkrun_Name               =>  NULL,                                       --IN         VARCHAR2,
          P_Invoice_Action              =>  NULL,                                       --IN         VARCHAR2,
          P_Hold_Code                   =>  NULL,                                       --IN         VARCHAR2,
          P_Hold_Reason                 =>  NULL,                                       --IN         VARCHAR2,
          P_Sys_Auto_Calc_Int_Flag      =>  NULL,                                       --IN         VARCHAR2,
          P_Vendor_Auto_Calc_Int_Flag   =>  NULL,                                       --IN         VARCHAR2,
          P_Last_Updated_By             =>  -8647964,                                   --IN         NUMBER,
          P_Last_Update_Login           =>  -8647964,                                   --IN         NUMBER,
          P_Num_Cancelled               =>  l_num_cancelled,                            --OUT NOCOPY NUMBER,
          P_Num_Not_Cancelled           =>  l_num_not_cancelled,                        --OUT NOCOPY NUMBER,
          P_Calling_Module              =>  'backend cancel script',                    --IN         VARCHAR2 Default 'SQLAP',
          P_Calling_Sequence            =>  'backend cancel script',                    --IN         VARCHAR2,
          X_return_status               =>  l_return_status,                            --OUT NOCOPY VARCHAR2,
          X_msg_count                   =>  l_msg_count,                                --OUT NOCOPY NUMBER,
          X_msg_data                    =>  l_msg_data);                                --OUT NOCOPY VARCHAR2)

    ELSE

      DBMS_OUTPUT.put_line('Unclear the check and then run the void_check script again');

    END IF;
	
	l_debug_info := 'Before setting the status';
  
  If (nvl(l_return_status,'N') = 'S') Then
    UPDATE ap_checks_all
    SET status_lookup_code = 'VOIDED',
        void_date = trunc(sysdate)       
    WHERE check_id = l_check_id
     and   status_lookup_code <> 'VOIDED';
	 
	 l_debug_info := 'The check has been voided successfully';
  Else
      DBMS_OUTPUT.put_line('call to AP_VOID_PKG.Ap_Reverse_Check API was not succeeded');
   end if;  

    l_debug_info := 'before the commit';
    COMMIT;

EXCEPTION
  WHEN OTHERS THEN
    DBMS_OUTPUT.PUT_LINE('Encountered an Exception '||SQLERRM||' while performing '||l_debug_info);

END;

