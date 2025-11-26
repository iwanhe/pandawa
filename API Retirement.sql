/* Formatted on 01/09/2025 12:22:13 (QP5 v5.362) */
SET SERVEROUTPUT ON;

DECLARE
    le_api_error          EXCEPTION;

    lv_book_type_code     VARCHAR2 (15) DEFAULT 'NTI CORP KUDUS';
    ln_asset_id           NUMBER;
    ln_user_id            NUMBER := 1479; --user id NTI, bisa disesuaikan
    ln_cost_retired       NUMBER;                                 
    ln_proceeds_of_sale   NUMBER;                                     
    ln_cost_of_removal    NUMBER := 0;
    ln_request_id         NUMBER;
    ln_sold_to            VARCHAR2 (32);
    ln_retirement_type_code   VARCHAR2 (32);
    lr_trans_rec          fa_api_types.trans_rec_type;
    lr_dist_trans_rec     fa_api_types.trans_rec_type;
    lr_asset_hdr_rec      fa_api_types.asset_hdr_rec_type;
    lr_asset_retire_rec   fa_api_types.asset_retire_rec_type;
    lt_asset_dist_tbl     fa_api_types.asset_dist_tbl_type;
    lt_subcomp_tbl        fa_api_types.subcomp_tbl_type;
    lt_inv_tbl            fa_api_types.inv_tbl_type;
    ln_api_version        NUMBER := 1;
    lv_init_msg_list      VARCHAR2 (1) := fnd_api.g_false;
    lv_commit             VARCHAR2 (1) := fnd_api.g_true;
    lv_validation_level   NUMBER := fnd_api.g_valid_level_full;
    lv_calling_func       VARCHAR2 (80) := 'FARET';
    lv_return_sts         VARCHAR2 (1) := fnd_api.g_false;
    ln_msg_cnt            NUMBER := 0;
    lv_message            VARCHAR2 (512);
    ln_count              NUMBER;
    i                     NUMBER := 0;
    lv_dummy              VARCHAR2 (512);
    ln_message_count      NUMBER;

    CURSOR cur_fa_retirement IS
        select * from XTD_FA_RETIREMENT_TEMP_STG --Status harus diisi N waktu diinput pertama kali
        where 1=1
        and status='N';
BEGIN
    fnd_global.apps_initialize (user_id        => 1479,
                                resp_id        => 50911,
                                resp_appl_id   => 140);

    FOR i IN cur_fa_retirement
    LOOP
        BEGIN
            fa_srvr_msg.init_server_message;
            fa_debug_pkg.set_debug_flag (debug_flag => 'YES');
            DBMS_OUTPUT.put_line ('Asset_id :' || i.asset_id);

            ln_asset_id := i.asset_id;
            ln_cost_retired := i.cost_retired;
            ln_proceeds_of_sale := i.proceeds_of_sale;
            ln_sold_to := i.sold_to;
            ln_retirement_type_code :=i.retirement_type_code;
            

            -- Ambil Standard Info Who
            ln_request_id := fnd_global.conc_request_id;
            fnd_profile.get ('LOGIN_ID',
                             lr_trans_rec.who_info.last_update_login);
            fnd_profile.get ('USER_ID',
                             lr_trans_rec.who_info.last_updated_by);

            IF (lr_trans_rec.who_info.last_updated_by IS NULL)
            THEN
                lr_trans_rec.who_info.last_updated_by := -1;
            END IF;

            IF (lr_trans_rec.who_info.last_update_login IS NULL)
            THEN
                lr_trans_rec.who_info.last_update_login := -1;
            END IF;

            lr_trans_rec.who_info.last_update_date := SYSDATE;
            lr_trans_rec.who_info.creation_date := SYSDATE;
            lr_trans_rec.who_info.created_by :=
                lr_trans_rec.who_info.last_updated_by;
            
            lr_asset_hdr_rec.asset_id := ln_asset_id;
            lr_asset_hdr_rec.book_type_code := lv_book_type_code;
            lr_trans_rec.transaction_type_code := NULL;

            -- Bagian ini akan ditentukan dalam API
            lr_trans_rec.transaction_date_entered := NULL; --AUTO
            lr_asset_hdr_rec.period_of_addition := NULL; --AUTO
            lr_asset_retire_rec.retirement_prorate_convention := NULL; --AUTO
            lr_asset_retire_rec.date_retired := NULL; --AUTO
            
            -- Bagian ini ditentukan secara Default
            lr_asset_retire_rec.units_retired := NULL; --TIDAK PERLU KALAU FULL
            lr_asset_retire_rec.cost_retired := ln_cost_retired;
            lr_asset_retire_rec.proceeds_of_sale := ln_proceeds_of_sale;
            lr_asset_retire_rec.cost_of_removal := ln_cost_of_removal;-- didefine null di inisialisasi parameter
            lr_asset_retire_rec.retirement_type_code := ln_retirement_type_code; --PENJUALAN, COP, HIBAH, HILANG, PEMUTIHAN,
            lr_asset_retire_rec.trade_in_asset_id := NULL;
            lr_asset_retire_rec.sold_to := ln_sold_to;
            lr_asset_retire_rec.calculate_gain_loss := fnd_api.g_false;
            fnd_profile.put ('USER_ID', ln_user_id);

            lt_asset_dist_tbl.DELETE;
            
            DBMS_OUTPUT.put_line ('Call API');
            fa_retirement_pub.do_retirement (
                p_api_version         => ln_api_version,
                p_init_msg_list       => lv_init_msg_list,
                p_commit              => lv_commit,
                p_validation_level    => lv_validation_level,
                p_calling_fn          => lv_calling_func,
                x_return_status       => lv_return_sts,
                x_msg_count           => ln_msg_cnt,
                x_msg_data            => lv_message,
                px_trans_rec          => lr_trans_rec,
                px_dist_trans_rec     => lr_dist_trans_rec,
                px_asset_hdr_rec      => lr_asset_hdr_rec,
                px_asset_retire_rec   => lr_asset_retire_rec,
                p_asset_dist_tbl      => lt_asset_dist_tbl,
                p_subcomp_tbl         => lt_subcomp_tbl,
                p_inv_tbl             => lt_inv_tbl);

            IF lv_return_sts = fnd_api.g_false
            THEN
                RAISE le_api_error;
            ELSE
                DBMS_OUTPUT.put_line ('lv_return_sts :' || lv_return_sts);
            END IF;
            
            DBMS_OUTPUT.put_line (
                   'Asset Retirement Done: id: '
                || lr_asset_retire_rec.retirement_id);
            
            update XTD_FA_RETIREMENT_TEMP_STG
            set status = lv_return_sts, message=lr_asset_retire_rec.retirement_id
            where asset_id=i.asset_id;
            --kalau sukses, Status jadi S, Message berisi Retirement ID
            
            commit;

            IF (fa_debug_pkg.print_debug)
            THEN
                fa_debug_pkg.write_debug_log;
            END IF;

            fa_srvr_msg.add_message (calling_fn   => lv_calling_func,
                                     name         => 'FA_SHARED_END_SUCCESS',
                                     token1       => 'PROGRAM',
                                     value1       => 'RETIREMENT_API');

            ln_message_count := fnd_msg_pub.count_msg;

            IF (ln_message_count > 0)
            THEN
                lv_dummy :=
                    fnd_msg_pub.get (fnd_msg_pub.g_first, fnd_api.g_false);
                DBMS_OUTPUT.put_line ('dump: ' || lv_dummy);

                FOR i IN 1 .. (ln_message_count - 1)
                LOOP
                    lv_dummy :=
                        fnd_msg_pub.get (fnd_msg_pub.g_next, fnd_api.g_false);
                    DBMS_OUTPUT.put_line ('dump: ' || lv_dummy);
                END LOOP;
            ELSE
                DBMS_OUTPUT.put_line ('dump: NO MESSAGE !');
            END IF;
        EXCEPTION
            WHEN OTHERS
            THEN
                DBMS_OUTPUT.put_line ('Error :' || SQLERRM);
        END;
    END LOOP;
EXCEPTION
    WHEN le_api_error
    THEN
        ROLLBACK WORK;
        fa_srvr_msg.add_message (calling_fn   => lv_calling_func,
                                 name         => 'FA_SHARED_PROGRAM_FAILED',
                                 token1       => 'PROGRAM',
                                 value1       => lv_calling_func);

        ln_message_count := fnd_msg_pub.count_msg;

        IF (ln_message_count > 0)
        THEN
            lv_dummy :=
                fnd_msg_pub.get (fnd_msg_pub.g_first, fnd_api.g_false);
            DBMS_OUTPUT.put_line ('dump: ' || lv_dummy);

            FOR i IN 1 .. (ln_message_count - 1)
            LOOP
                lv_dummy :=
                    fnd_msg_pub.get (fnd_msg_pub.g_next, fnd_api.g_false);
                DBMS_OUTPUT.put_line ('dump: ' || lv_dummy);
            END LOOP;
        ELSE
            DBMS_OUTPUT.put_line ('dump: NO MESSAGE !');
        END IF;

        COMMIT;
END;
/