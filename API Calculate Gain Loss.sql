/* Formatted on 01/09/2025 13:16:51 (QP5 v5.362) */
DECLARE
    lv_book_type_code   VARCHAR2 (15) := 'NTI CORP KUDUS';
    ln_request_id       NUMBER;
BEGIN
    fnd_global.apps_initialize (user_id        => 1479,
                                resp_id        => 50911,
                                resp_appl_id   => 140);
    ln_request_id :=
        fnd_request.submit_request ('OFA',
                                    'FARET',
                                    NULL,
                                    NULL,
                                    FALSE,
                                    lv_book_type_code);
    COMMIT;
    DBMS_OUTPUT.PUT_LINE (ln_request_id);
END;