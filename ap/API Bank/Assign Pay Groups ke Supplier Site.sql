/* Formatted on 2023/11/01 19:27 (Formatter Plus v4.8.8) */
DECLARE
   l_msg_data                VARCHAR2 (20000);
   l_return_status           VARCHAR2 (100);
   l_msg_count               NUMBER;
   l_vendor_site_rec         apps.ap_vendor_pub_pkg.r_vendor_site_rec_type;
   l_location_id             NUMBER;
   l_object_version_number   NUMBER;
   l_message_int             NUMBER;
   l_vendor_site_id          NUMBER;
   p_api_version             NUMBER;
   p_init_msg_list           VARCHAR2 (200);
   p_commit                  VARCHAR2 (200);
   p_validation_level        NUMBER;
   x_return_status           VARCHAR2 (200);
   x_msg_count               NUMBER;
   x_msg_data                VARCHAR2 (200);
   lr_vendor_rec             apps.ap_vendor_pub_pkg.r_vendor_rec_type;
   lr_existing_vendor_rec    ap_suppliers%ROWTYPE;
   l_msg                     VARCHAR2 (200);
   p_vendor_id               NUMBER;
BEGIN
   fnd_global.apps_initialize (1479, 20707, 201); -- user_id, resp_id, resp_appl_id
   
/*
select *
from fnd_user
where user_name ='NTI' --1479

select *
from fnd_responsibility
where responsibility_key like 'PURCHASING%' --20707
*/

   FOR j IN (SELECT vendor_id,
                    vendor_site_id,
                    org_id
               FROM ap_supplier_sites_all
              WHERE 1 = 1
                AND org_id = 81
                AND vendor_site_id = 226)
                
                --SPIRAX SARCO INDONESIA, PT
   LOOP
      mo_global.set_policy_context ('S', 81); --Org_ID
      mo_global.init ('SQLAP');
      fnd_client_info.set_org_context (81); --Org_ID
      l_return_status := NULL;
      l_msg_count := NULL;
      l_msg_data := NULL;
      l_vendor_site_rec := NULL;
      l_vendor_site_id := j.vendor_site_id;
      l_vendor_site_rec.vendor_site_id := l_vendor_site_id;
      l_vendor_site_rec.pay_group_lookup_code := 'MDR_H2H';

      --     l_vendor_site_rec.address_line1  := 'Dummy Address';
      ap_vendor_pub_pkg.update_vendor_site_public (p_api_version        => 1
                                                 , x_return_status      => l_return_status
                                                 , x_msg_count          => l_msg_count
                                                 , x_msg_data           => l_msg_data
                                                 , p_vendor_site_rec    => l_vendor_site_rec
                                                 , p_vendor_site_id     => l_vendor_site_id);
      DBMS_OUTPUT.put_line ('hasil.vendor_site_id' || l_vendor_site_id);
      DBMS_OUTPUT.put_line ('hasil.status' || l_return_status);

      IF (l_return_status <> 'S')
      THEN
         IF l_msg_count >= 1
         THEN
            FOR v_index IN 1 .. l_msg_count
            LOOP
               fnd_msg_pub.get (p_msg_index          => v_index
                              , p_encoded => 'F'
                              , p_data => l_msg_data
                              , p_msg_index_out => l_message_int);
               l_msg_data := 'UPDATE_VENDOR_SITE ' || SUBSTR (l_msg_data, 1, 3900);
               DBMS_OUTPUT.put_line ('l_msg_data - ' || l_msg_data);
            END LOOP;
         END IF;
      ELSE
         DBMS_OUTPUT.put_line ('The API call ended with SUCCESS status');
         COMMIT;
      END IF;

      COMMIT;
   END LOOP;
END;