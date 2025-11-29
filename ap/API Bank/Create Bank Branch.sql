/* Formatted on 2023/11/01 09:30 (Formatter Plus v4.8.8) */
SET serveroutput on;

DECLARE
   l_api_version        NUMBER          := 1;
   l_init_msg_list      VARCHAR2 (30)   DEFAULT fnd_api.g_false;
   l_validation_level   NUMBER          DEFAULT fnd_api.g_valid_level_full;
   l_msg_data           VARCHAR2 (1000);
   l_msg_count          NUMBER;
   l_return_status      VARCHAR2 (100);
   l_branch_id          NUMBER;
   l_party_id           NUMBER;
   l_bank_id            NUMBER;
BEGIN
   --Intializing the Message Pub API.
   fnd_msg_pub.initialize;

   SELECT bank_party_id
     INTO l_bank_id
     FROM ce_banks_v
    WHERE UPPER (bank_name) = UPPER ('BNI');

   ce_bank_pub.create_bank_branch (p_init_msg_list              => l_init_msg_list,
                                   p_bank_id                    => l_bank_id,
                                   p_branch_name                => 'SUPPLIER',
                                   p_branch_number              => NULL,
                                   p_branch_type                => NULL,
                                   p_alternate_branch_name      => NULL,
                                   p_description                => 'H2H_API',
                                   p_bic                        => NULL,
                                   p_eft_number                 => NULL,
                                   p_rfc_identifier             => NULL,
                                   p_attribute_category         => NULL,
                                   p_attribute1                 => NULL,
                                   p_attribute2                 => NULL,
                                   p_attribute3                 => NULL,
                                   p_attribute4                 => NULL,
                                   p_attribute5                 => NULL,
                                   p_attribute6                 => NULL,
                                   p_attribute7                 => NULL,
                                   p_attribute8                 => NULL,
                                   p_attribute9                 => NULL,
                                   p_attribute10                => NULL,
                                   p_attribute11                => NULL,
                                   p_attribute12                => NULL,
                                   p_attribute13                => NULL,
                                   p_attribute14                => NULL,
                                   p_attribute15                => NULL,
                                   p_attribute16                => NULL,
                                   p_attribute17                => NULL,
                                   p_attribute18                => NULL,
                                   p_attribute19                => NULL,
                                   p_attribute20                => NULL,
                                   p_attribute21                => NULL,
                                   p_attribute22                => NULL,
                                   p_attribute23                => NULL,
                                   p_attribute24                => NULL,
                                   x_branch_id                  => l_branch_id,
                                   x_return_status              => l_return_status,
                                   x_msg_count                  => l_msg_count,
                                   x_msg_data                   => l_msg_data
                                  );
   DBMS_OUTPUT.put_line (l_branch_id);
   DBMS_OUTPUT.put_line (l_return_status);
   DBMS_OUTPUT.put_line (l_msg_data);

   IF l_msg_count > 1
   THEN
      FOR i IN 1 .. l_msg_count
      LOOP
         DBMS_OUTPUT.put_line (i || '. ' || SUBSTR (fnd_msg_pub.get (p_encoded      => fnd_api.g_false), 1, 255));
      END LOOP;
   END IF;

   IF (l_return_status = 'S')
   THEN
      COMMIT;
   END IF;
END;