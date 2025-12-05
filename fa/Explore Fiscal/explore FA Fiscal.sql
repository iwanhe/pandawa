/* Formatted on 11/05/2025 22:47:16 (QP5 v5.362) */
--By Iwan Herdian 10 May 2025
SET SERVEROUTPUT ON;

DECLARE
    l_trans_rec             FA_API_TYPES.trans_rec_type;
    l_dist_trans_rec        FA_API_TYPES.trans_rec_type;
    l_asset_hdr_rec         FA_API_TYPES.asset_hdr_rec_type;
    l_asset_desc_rec        FA_API_TYPES.asset_desc_rec_type;
    l_asset_cat_rec         FA_API_TYPES.asset_cat_rec_type;
    l_asset_type_rec        FA_API_TYPES.asset_type_rec_type;
    l_asset_hierarchy_rec   FA_API_TYPES.asset_hierarchy_rec_type;
    l_asset_fin_rec         FA_API_TYPES.asset_fin_rec_type;
    l_asset_deprn_rec       FA_API_TYPES.asset_deprn_rec_type;
    l_asset_dist_rec        FA_API_TYPES.asset_dist_rec_type;
    l_asset_dist_tbl        FA_API_TYPES.asset_dist_tbl_type;
    l_inv_rec               FA_API_TYPES.inv_rec_type;
    l_inv_tbl               FA_API_TYPES.inv_tbl_type;
    l_inv_rate_tbl          FA_API_TYPES.inv_rate_tbl_type;
    l_desc_flex_rec         FA_API_TYPES.desc_flex_rec_type;


    l_return_status         VARCHAR2 (1);
    l_mesg_count            NUMBER;
    l_mesg                  VARCHAR2 (4000);
BEGIN
    DBMS_OUTPUT.enable (10000000);

    FA_SRVR_MSG.Init_Server_Message;

    --DFF
    l_desc_flex_rec.attribute3 := 'No Mesin';        --DFF di sebelah category
    l_desc_flex_rec.attribute5 := 'Jenis Mesin';    -- DFF di sebelah category
    l_desc_flex_rec.context := 'Mesin.Primary.Gol 1';         --category asset

    --SOURCE LINE
    l_inv_rec.description := 'SOURCE LINE';                  --utk source line
    l_inv_tbl (1) := l_inv_rec; --pointer untuk masuk record pointer di API utama addition

    -- desc info
    l_asset_desc_rec.asset_number := 'F05T'; --nomor disesuaikan dengan kebutuhan
    l_asset_desc_rec.tag_number := 'TAG5';                       --disesuaikan
    l_asset_desc_rec.serial_number := 'SERIAL5';                 --disesuaikan
    l_asset_desc_rec.in_use_flag := 'YES';                           --default
    l_asset_desc_rec.new_used := 'NEW';                              --default
    l_asset_desc_rec.owned_leased := 'OWNED';                        --default
    l_asset_desc_rec.current_units := 1;                         --jumlah unit
    l_asset_desc_rec.description := 'TEST API 5';            --deskripsi asset
    l_asset_desc_rec.asset_key_ccid := 21;     --disamakan dengan yang lainnya

    -- cat info
    -- Valid Value in FA_CATEGORIES
    l_asset_cat_rec.category_id := '36'; --Mesin.Primary.Gol 1 --disamakan dengan category dari parent asset
    l_asset_cat_rec.desc_flex := l_desc_flex_rec;


    --type info
    l_asset_type_rec.asset_type := 'CAPITALIZED';        --default capitalized

    -- Asset Financial Information --
    l_asset_fin_rec.set_of_books_id := 2022;                       --ledger id
    l_asset_fin_rec.date_placed_in_service :=
        TO_DATE ('31-JAN-2025', 'DD-MON-RRRR');                         --DPIS
    l_asset_fin_rec.deprn_start_date :=
        TO_DATE ('01-JAN-2025', 'DD-MON-RRRR');                 --Prorate Date
    l_asset_fin_rec.deprn_method_code := 'DDB NTI'; --disesuaikan dengan metode depresiasi parent asset
    l_asset_fin_rec.life_in_months := 48; --disesuaikan dengan umur bulan parent asset
    l_asset_fin_rec.original_cost := 2;           --Cost nilai perolehan asset
    l_asset_fin_rec.cost := 2;                         --disamakan dengan cost
    l_asset_fin_rec.prorate_convention_code := 'NTI MONTH'; --prorate convention disesuaikan dengan parent asset
    l_asset_fin_rec.salvage_type := 'AMT';             -- PCT - for Percentage
    l_asset_fin_rec.salvage_value := 0; --diisi nol sebagai default nilai sisa
    l_asset_fin_rec.percent_salvage_value := NULL;                --diisi null
    l_asset_fin_rec.depreciate_flag := 'YES';    --jika didepresiasi, maka YES
    l_asset_fin_rec.orig_deprn_start_date :=
        TO_DATE ('01-JAN-2025', 'DD-MON-RRRR'); --start depresiasi, disamakan dengan prorate date

    -- deprn info
    l_asset_deprn_rec.set_of_books_id := 2022;                     --ledger id
    l_asset_deprn_rec.ytd_deprn := 0;                         --default awal 0
    l_asset_deprn_rec.deprn_reserve := 0;                     --default awal 0
    l_asset_deprn_rec.bonus_ytd_deprn := 0;                   --default awal 0
    l_asset_deprn_rec.bonus_deprn_reserve := 0;               --default awal 0

    -- book / trans info
    -- Valid value in FA_BOOK_CONTROLS
    l_asset_hdr_rec.book_type_code := 'NTI CORP KUDUS'; --book yang nanti perlu disesuaikan


    -- distribution info
    l_asset_dist_rec.units_assigned := 1;                    --jumlah quantity
    -- Valid Record from GL Code cominations with record type = 'E' (Expense)
    l_asset_dist_rec.expense_ccid := 799312; --dari expense account parent asset
    -- Valid Value in FA Locations
    l_asset_dist_rec.location_ccid := 97252;         --dari ccid lokasi parent
    l_asset_dist_rec.assigned_to := NULL; --jika diketahui maka perlu diisi person id, jika tidak maka diisi null
    l_asset_dist_rec.transaction_units := l_asset_dist_rec.units_assigned;
    l_asset_dist_tbl (1) := l_asset_dist_rec;

    -- call the api
    fa_addition_pub.do_addition (
        -- std parameters
        p_api_version            => 1.0,
        p_init_msg_list          => FND_API.G_FALSE,
        p_commit                 => FND_API.G_FALSE,
        p_validation_level       => FND_API.G_VALID_LEVEL_FULL,
        p_calling_fn             => NULL,
        x_return_status          => l_return_status,
        x_msg_count              => l_mesg_count,
        x_msg_data               => l_mesg,
        -- api parameters
        px_trans_rec             => l_trans_rec,
        px_dist_trans_rec        => l_dist_trans_rec,
        px_asset_hdr_rec         => l_asset_hdr_rec,
        px_asset_desc_rec        => l_asset_desc_rec,
        px_asset_type_rec        => l_asset_type_rec,
        px_asset_cat_rec         => l_asset_cat_rec,
        px_asset_hierarchy_rec   => l_asset_hierarchy_rec,
        px_asset_fin_rec         => l_asset_fin_rec,
        px_asset_deprn_rec       => l_asset_deprn_rec,
        px_asset_dist_tbl        => l_asset_dist_tbl,
        px_inv_tbl               => l_inv_tbl);

    --dump messages
    l_mesg_count := fnd_msg_pub.count_msg;

    IF l_mesg_count > 0
    THEN
        l_mesg :=
               CHR (10)
            || SUBSTR (
                   fnd_msg_pub.get (fnd_msg_pub.G_FIRST, fnd_api.G_FALSE),
                   1,
                   250);
        DBMS_OUTPUT.put_line (l_mesg);

        FOR i IN 1 .. (l_mesg_count - 1)
        LOOP
            l_mesg :=
                SUBSTR (
                    fnd_msg_pub.get (fnd_msg_pub.G_NEXT, fnd_api.G_FALSE),
                    1,
                    250);
            DBMS_OUTPUT.put_line (l_mesg);
        END LOOP;

        fnd_msg_pub.delete_msg ();
    END IF;

    IF (l_return_status <> FND_API.G_RET_STS_SUCCESS)
    THEN
        DBMS_OUTPUT.put_line ('FAILURE');
    ELSE
        DBMS_OUTPUT.put_line ('SUCCESS');
        DBMS_OUTPUT.put_line (
            'ASSET_ID :' || TO_CHAR (l_asset_hdr_rec.asset_id));
        DBMS_OUTPUT.put_line (
            'ASSET_NUMBER :' || l_asset_desc_rec.asset_number);
        COMMIT;--jika sukses perlu commit
    END IF;
END;
/