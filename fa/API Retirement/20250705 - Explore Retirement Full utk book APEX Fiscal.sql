SET SERVEROUTPUT ON;
  DECLARE
    le_api_error        EXCEPTION;
    
    -- Asset to be retired
    lv_asset_number     VARCHAR2(100) DEFAULT 'F68';--user NTI
    lv_book_type_code   VARCHAR2(15)  DEFAULT 'NTI KUDUS FKL';--book yang mirroring dari APEX fiscal
    
    ln_asset_id         NUMBER;    
    ln_user_id          NUMBER := 1479;--user id NTI
    ln_cost_retired     NUMBER ;--:=1000000;
    ln_proceeds_of_sale NUMBER := 0;
    ln_cost_of_removal  NUMBER := 0;
    ln_request_id       NUMBER;
    lr_trans_rec        fa_api_types.trans_rec_type;
    lr_dist_trans_rec   fa_api_types.trans_rec_type;
    lr_asset_hdr_rec    fa_api_types.asset_hdr_rec_type;
    lr_asset_retire_rec fa_api_types.asset_retire_rec_type;
    lt_asset_dist_tbl   fa_api_types.asset_dist_tbl_type;
    lt_subcomp_tbl      fa_api_types.subcomp_tbl_type;
    lt_inv_tbl          fa_api_types.inv_tbl_type;
    ln_api_version      NUMBER := 1;
    lv_init_msg_list    VARCHAR2(1) := fnd_api.g_false;
    lv_commit           VARCHAR2(1) := fnd_api.g_true;
    lv_validation_level NUMBER := fnd_api.g_valid_level_full;
    lv_calling_func     VARCHAR2(80) := 'APEX_FISCAL';
    lv_return_sts       VARCHAR2(1) := fnd_api.g_false;
    ln_msg_cnt          NUMBER := 0;
    lv_message          VARCHAR2(512);
    ln_count            NUMBER;
    i                   NUMBER := 0;
    lv_dummy            VARCHAR2(512);
    ln_message_count    NUMBER;
    
    CURSOR cur_fa_addition IS
    SELECT
        a.asset_number,
        a.asset_id,
        b.cost
    FROM
        fa_additions_b a,
        fa_books_v     b
    WHERE a.asset_id = b.asset_id
--      and b.asset_id = 610
      and a.asset_number = 'F68'--lv_asset_number
--      AND a.creation_date > sysdate - 300
      AND b.book_type_code = 'NTI KUDUS FKL'--lv_book_type_code
      AND ROWNUM < 5
      AND NOT EXISTS ( SELECT 1
                         FROM fa_retirements fr
                        WHERE fr.asset_id = a.asset_id
                      );

  BEGIN
    fnd_global.apps_initialize(user_id => 1479, 
                               resp_id => 50911, 
                               resp_appl_id => 140
                               );

    FOR i IN cur_fa_addition 
    LOOP
      BEGIN         
        fa_srvr_msg.init_server_message;
        fa_debug_pkg.set_debug_flag(debug_flag => 'YES');
        dbms_output.put_line('Asset_id :' || i.asset_id);
            
        ln_asset_id     := i.asset_id;
        ln_cost_retired := i.cost;
            
        -- Get Standard Who Info
        ln_request_id := fnd_global.conc_request_id;
        fnd_profile.get('LOGIN_ID', lr_trans_rec.who_info.last_update_login);
        fnd_profile.get('USER_ID', lr_trans_rec.who_info.last_updated_by);
        IF ( lr_trans_rec.who_info.last_updated_by IS NULL ) 
        THEN
          lr_trans_rec.who_info.last_updated_by := -1;
        END IF;

        IF ( lr_trans_rec.who_info.last_update_login IS NULL ) 
        THEN
          lr_trans_rec.who_info.last_update_login := -1;
        END IF;

        lr_trans_rec.who_info.last_update_date := SYSDATE;
        lr_trans_rec.who_info.creation_date    := SYSDATE;
        lr_trans_rec.who_info.created_by       := lr_trans_rec.who_info.last_updated_by;
        lr_asset_hdr_rec.asset_id              := ln_asset_id;
        lr_asset_hdr_rec.book_type_code        := lv_book_type_code;
        lr_trans_rec.transaction_type_code     := NULL;
        
        -- This Will Be Determined Inside Api
        lr_trans_rec.transaction_date_entered := NULL;
        lr_asset_hdr_rec.period_of_addition   := NULL;
        lr_asset_retire_rec.retirement_prorate_convention := NULL;
        lr_asset_retire_rec.date_retired      := NULL;
        -- Will Be Current Period By Default
        lr_asset_retire_rec.units_retired     := NULL;
        lr_asset_retire_rec.cost_retired      := ln_cost_retired;
        lr_asset_retire_rec.proceeds_of_sale  := ln_proceeds_of_sale;
        lr_asset_retire_rec.cost_of_removal   := ln_cost_of_removal;
        lr_asset_retire_rec.retirement_type_code := 'RUSAK';--PENJUALAN, COP, HIBAH, HILANG, PEMUTIHAN, 
        lr_asset_retire_rec.trade_in_asset_id := NULL;
        lr_asset_retire_rec.calculate_gain_loss := fnd_api.g_false;
        fnd_profile.put('USER_ID', ln_user_id);
        
        lt_asset_dist_tbl.DELETE;
        dbms_output.put_line('Call API');
        fa_retirement_pub.do_retirement
                         (
                          p_api_version       => ln_api_version, 
                          p_init_msg_list     => lv_init_msg_list, 
                          p_commit            => lv_commit,
                          p_validation_level  => lv_validation_level, 
                          p_calling_fn        => lv_calling_func,
                          x_return_status     => lv_return_sts, 
                          x_msg_count         => ln_msg_cnt, 
                          x_msg_data          => lv_message, 
                          px_trans_rec        => lr_trans_rec, 
                          px_dist_trans_rec   => lr_dist_trans_rec,
                          px_asset_hdr_rec    => lr_asset_hdr_rec,
                          px_asset_retire_rec => lr_asset_retire_rec, 
                          p_asset_dist_tbl    => lt_asset_dist_tbl, 
                          p_subcomp_tbl       => lt_subcomp_tbl, 
                          p_inv_tbl           => lt_inv_tbl
                         );

        IF lv_return_sts = fnd_api.g_false 
        THEN
          RAISE le_api_error;
        ELSE
          dbms_output.put_line('lv_return_sts :' || lv_return_sts);
        END IF;

        dbms_output.put_line('Asset Retirement Done: id: '
                            || lr_asset_retire_rec.retirement_id
                            );

 
        IF ( fa_debug_pkg.print_debug ) 
        THEN
          fa_debug_pkg.write_debug_log;
        END IF;
        fa_srvr_msg.add_message(calling_fn => lv_calling_func, 
                                name       => 'FA_SHARED_END_SUCCESS', 
                                token1     => 'PROGRAM', 
                                value1 => 'RETIREMENT_API'
                               );

        ln_message_count := fnd_msg_pub.count_msg;
        IF ( ln_message_count > 0 ) 
        THEN
          lv_dummy := fnd_msg_pub.get(fnd_msg_pub.g_first, fnd_api.g_false);
          dbms_output.put_line('dump: ' || lv_dummy);
          FOR i IN 1..( ln_message_count - 1 ) 
          LOOP
            lv_dummy := fnd_msg_pub.get(fnd_msg_pub.g_next, fnd_api.g_false);
            dbms_output.put_line('dump: ' || lv_dummy);
          END LOOP;

        ELSE
          dbms_output.put_line('dump: NO MESSAGE !');
        END IF;
      EXCEPTION
        WHEN OTHERS THEN
           dbms_output.put_line('Error :' || sqlerrm);
        END;
    END LOOP;

  EXCEPTION
    WHEN le_api_error THEN
      ROLLBACK WORK;
      fa_srvr_msg.add_message(calling_fn => lv_calling_func, 
                      name       => 'FA_SHARED_PROGRAM_FAILED', 
                  token1     => 'PROGRAM', 
                  value1     => lv_calling_func);

      ln_message_count := fnd_msg_pub.count_msg;
      IF ( ln_message_count > 0 )
      THEN
          lv_dummy := fnd_msg_pub.get(fnd_msg_pub.g_first, fnd_api.g_false);
        dbms_output.put_line('dump: ' || lv_dummy);
        FOR i IN 1..( ln_message_count - 1 ) 
        LOOP
          lv_dummy := fnd_msg_pub.get(fnd_msg_pub.g_next, fnd_api.g_false);
          dbms_output.put_line('dump: ' || lv_dummy);
        END LOOP;

      ELSE
        dbms_output.put_line('dump: NO MESSAGE !');
      END IF;

      COMMIT;
END;
/