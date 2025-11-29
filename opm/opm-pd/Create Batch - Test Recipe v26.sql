/* Formatted on 06/11/2024 20:19:40 (QP5 v5.362) */
DECLARE
    v_return_status    VARCHAR2 (20);
    v_return_message   VARCHAR2 (2000);
    v_user_id          NUMBER;
    v_resp_id          NUMBER;
    v_resp_appl_id     NUMBER;
    v_batch_id         NUMBER;
    v_inv_periods      VARCHAR2 (10);

    CURSOR c1 IS
          SELECT DISTINCT instruction_list,
                          TRUNC (transaction_date)     transaction_date,
                          io_id,
                          io_code
            FROM xodi_inv_glt_int
           WHERE 1 = 1 AND upload_flag IS NULL AND created_by = 'IWANHE'
        ORDER BY instruction_list;
        
BEGIN
    fnd_file.put_line (fnd_file.output,
                       'BEGIN process Synchronize data inventory EDP !!');

    -- get security context
    BEGIN
        SELECT responsibility_id, application_id
          INTO v_resp_id, v_resp_appl_id
          FROM fnd_responsibility_vl
         WHERE 1 = 1 AND responsibility_name = 'Production Supervisor';
    EXCEPTION
        WHEN OTHERS
        THEN
            v_resp_id := 0;
            v_resp_appl_id := 0;
    END;

    BEGIN
        SELECT user_id
          INTO v_user_id
          FROM fnd_user
         WHERE 1 = 1 AND user_name = 'ODI';
    EXCEPTION
        WHEN OTHERS
        THEN
            v_user_id := 0;
    END;


    FOR i IN c1
    LOOP
        fnd_file.put_line (
            fnd_file.output,
            '================================================================================================================');
        fnd_file.put_line (
            fnd_file.output,
            'Start process instruction_list : ' || i.instruction_list);

        --CEK INVENTORY ACCOUNTING PERIODS TO
        BEGIN
            SELECT 'Y'
              INTO v_inv_periods
              FROM org_acct_periods_v
             WHERE     1 = 1
                   --and trunc(sysdate) between start_date and end_date
                   AND i.transaction_date BETWEEN start_date AND end_date
                   AND organization_id = i.io_id
                   AND status = 'Open';
        EXCEPTION
            WHEN OTHERS
            THEN
                v_inv_periods := 'N';
        END;

        IF v_inv_periods = 'Y'
        THEN
            --step1 create batch
            xodi_inv_transact_int_pkg.create_batch_glt (i.instruction_list,
                                                        i.transaction_date,
                                                        v_user_id,
                                                        v_resp_id,
                                                        v_resp_appl_id,
                                                        v_return_message,
                                                        v_return_message,
                                                        v_batch_id);

            IF v_batch_id IS NOT NULL
            THEN
                xodi_inv_transact_int_pkg.insert_material_line_glt (
                    i.instruction_list,
                    i.transaction_date,
                    v_batch_id,
                    v_user_id,
                    v_resp_id,
                    v_resp_appl_id,
                    v_return_status,
                    v_return_message);    -- step2 insert ingridient & product
                xodi_inv_transact_int_pkg.release_batch_glt (
                    i.instruction_list,
                    i.transaction_date,
                    v_batch_id,
                    v_user_id,
                    v_resp_id,
                    v_resp_appl_id,
                    v_return_status,
                    v_return_message);                 -- step 3 release batch
                xodi_inv_transact_int_pkg.transact_material_glt (
                    i.instruction_list,
                    i.transaction_date,
                    v_batch_id,
                    v_user_id,
                    v_resp_id,
                    v_resp_appl_id,
                    v_return_status,
                    v_return_message);                     -- step 4 WIP issue
                xodi_inv_transact_int_pkg.complete_batch_glt (
                    i.instruction_list,
                    i.transaction_date,
                    v_batch_id,
                    v_user_id,
                    v_resp_id,
                    v_resp_appl_id,
                    v_return_status,
                    v_return_message);                -- step 5 Complete batch
               xodi_inv_transact_int_pkg.close_batch_glt (
                    i.instruction_list,
                    i.transaction_date,
                    v_batch_id,
                    v_user_id,
                    v_resp_id,
                    v_resp_appl_id,
                    v_return_status,
                    v_return_message);                   -- step 6 close batch 
            ELSE
                DBMS_OUTPUT.put_line ('Failed Batch Creation !!');
            END IF;
        ELSE                                               -- no open perioode
            DBMS_OUTPUT.put_line ('Inventory acct period not opened !!');
            fnd_file.put_line (
                fnd_file.output,
                   'Inventory acct period : '
                || i.io_code
                || ' harus dalam status Open !!');
        END IF;

        fnd_file.put_line (
            fnd_file.output,
            '================================================================================================================');
        fnd_file.put_line (
            fnd_file.output,
            'End process instruction_list : ' || i.instruction_list);
    END LOOP;

    DBMS_OUTPUT.put_line ('END process Synchronize data inventory GLT !!');
    fnd_file.put_line (fnd_file.output,
                       'END process Synchronize data inventory GLT !!');
END;