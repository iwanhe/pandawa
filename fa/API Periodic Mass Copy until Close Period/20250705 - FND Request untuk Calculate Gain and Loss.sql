DECLARE 
   lv_book_type_code   VARCHAR2 (15) := 'NTI KUDUS FKL';   
   ln_request_id       NUMBER;
BEGIN
   fnd_global.apps_initialize (user_id           => 1479, -- User ID nya NTI
                               resp_id           => 50911, --Responsibility FA Superuser
                               resp_appl_id      => 140 -- Application ID Fixed Asset
                              );
   ln_request_id :=
          fnd_request.submit_request ('OFA',
                                      'FARET',
                                       null,
                                       null,
                                       false,
                                       lv_book_type_code
                                      );
   COMMIT;
   DBMS_OUTPUT.PUT_LINE (ln_request_id);
End;