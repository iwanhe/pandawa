/* Formatted on 08/09/2025 14:42:57 (QP5 v5.362) */
DECLARE
    l_request_id   NUMBER;
BEGIN
Fnd_Global.apps_initialize (1479, 50911, 140);
    l_request_id :=
        FND_REQUEST.SUBMIT_REQUEST (
            'OFA', -- Application short name for General Ledger
            'FAACCPB', -- Short name for Create Accounting program
            'Create Accounting for Assets',
            SYSDATE,
            FALSE,
            'NTI KUDUS FKL', 
            140, 
            140,  
            'Y',
            2022,
            '',
            TO_CHAR (SYSDATE, 'YYYY/MM/DD HH24:MI:SS'), 
            'Y',
            'Y',
            'F',
            'Y',
            'N',
            'D',
            'Y',
            'Y',
            'N',
            '',
            '',
            'N',
            '',
            ''
            );

    IF l_request_id = 0
    THEN
        DBMS_OUTPUT.PUT_LINE ('Error submitting Create Accounting request.');
    ELSE
        DBMS_OUTPUT.PUT_LINE (
            'Create Accounting request submitted with ID: ' || l_request_id);
    END IF;
    COMMIT;                 
EXCEPTION
    WHEN OTHERS
    THEN
        ROLLBACK;
        DBMS_OUTPUT.PUT_LINE ('An error occurred: ' || SQLERRM);
END;
/