/* Formatted on 07/11/2024 00:08:59 (QP5 v5.362) */
DECLARE
    l_api_version          NUMBER := 2.0;
    l_validation_level     NUMBER DEFAULT GME_COMMON_PVT.G_MAX_ERRORS;
    p_init_msg_list        BOOLEAN DEFAULT FALSE;
    l_batchstep_resource   GME_BATCH_STEP_RESOURCES%ROWTYPE;
    x_batchstep_resource   GME_BATCH_STEP_RESOURCES%ROWTYPE;
    --    l_batch_no                  VARCHAR2(10) := '24231860';
    --    l_batchstep_no              VARCHAR2(50) := '10';
    l_message_count        NUMBER;
    l_message_list         VARCHAR2 (500);
    l_return_status        VARCHAR2 (1);
--    l_msg_index_out             NUMBER;

BEGIN
    l_batchstep_resource.batchstep_resource_id := 572904;
    l_batchstep_resource.batch_id := 985342;
    l_batchstep_resource.actual_rsrc_qty := 1; --dari neto
    gme_api_pub.update_batchstep_resource (
        p_api_version              => l_api_version,
        p_validation_level         => l_validation_level,
        p_init_msg_list            => FND_API.G_TRUE,
        p_commit                   => FND_API.G_TRUE,
        p_batchstep_resource_rec   => l_batchstep_resource,
        p_org_code                  => NULL,
        p_batch_no                 => '24231861',                --l_batch_no,
        p_batchstep_no             => 10,                    --l_batchstep_no,
        p_activity                 => 'TOLL-OUT',
        p_ignore_qty_below_cap     => FND_API.G_TRUE,
        p_validate_flexfields      => FND_API.G_TRUE,
        x_batchstep_resource_rec   => x_batchstep_resource,
        x_message_count            => l_message_count,
        x_message_list             => l_message_list,
        x_return_status            => l_return_status);
    
    gme_debug.display_messages (l_message_count);
    DBMS_OUTPUT.put_line ('x_message_count =' || TO_CHAR (l_message_count));
    DBMS_OUTPUT.put_line (
           'x_message_list ='
        || LENGTH (l_message_list)
        || SUBSTR (l_message_list, LENGTH (l_message_list) - 20, 20));
    DBMS_OUTPUT.put_line ('x_message_list =' || l_message_list);
    DBMS_OUTPUT.put_line ('x_return_status =' || l_return_status);

commit;

END;