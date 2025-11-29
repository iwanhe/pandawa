alter session set nls_language=american;
set serveroutput on size 1000000;

DECLARE
p_api_version NUMBER DEFAULT gme_api_pub.api_version;
   p_validation_level NUMBER DEFAULT gme_api_pub.max_errors;
   p_init_msg_list BOOLEAN DEFAULT FALSE;
   P_batch_type NUMBER DEFAULT 0;
   p_orgn_code VARCHAR2(4) DEFAULT 'PR1';
   x_batch_header gme_batch_header%ROWTYPE;
   x_unallocated_material gme_api_pub.unallocated_materials_tab;
   x_message_count NUMBER;
   x_message_list VARCHAR2(100);
   x_return_status VARCHAR2(1);

   l_batch_header GME_BATCH_HEADER%ROWTYPE;
   l_msg_index_out NUMBER;
BEGIN
l_batch_header.plant_code :='PR1';
l_batch_header.batch_type :=p_batch_type;
l_batch_header.batch_no:= '';
l_batch_header.plan_start_date := '';
l_batch_header.plan_cmplt_date := '';
l_batch_header.due_date :=TO_DATE('10-AUG-2006 12:00:00','DD-MON-YYYY HH24:MI:SS');
l_batch_header.update_inventory_ind :='Y';
l_batch_header.recipe_validity_rule_id :=1239;
l_batch_header.wip_whse_code:='PR1';
fnd_global.apps_initialize(user_id =>1003637,
   resp_id => null,
   resp_appl_id => null);
gme_api_pub.create_batch(
p_api_version => p_api_version
,p_validation_level => p_validation_level
,p_init_msg_list => p_init_msg_list
,p_commit => true
,x_message_count => x_message_count
,x_message_list => x_message_list
,x_return_status => x_return_status
,p_batch_header => l_batch_header
,x_batch_header => x_batch_header
,p_batch_size => 10
,p_batch_size_uom => 'KG'
,p_creation_mode => 'RECIPE'
,p_recipe_id => null
,p_recipe_no => 'JGC_1'
,p_recipe_version => '301'
,p_product_no => null
,p_product_id => null
,p_ignore_qty_below_cap => true
,p_ignore_shortages => true
,x_unallocated_material =>x_unallocated_material );

gme_debug.display_messages(x_message_count);
dbms_output.put_line('x_message_count ='||TO_CHAR(x_message_count));
   dbms_output.put_line('x_message_list =
'||length(x_message_list)||SubStr(x_message_list,length(x_message_list)-20,20));
dbms_output.put_line('x_message_list ='||x_message_list);
   dbms_output.put_line('x_return_status ='||x_return_status);
   dbms_output.put_line('x_batch_header.batch_id= '||TO_CHAR(x_batch_header.batch_id));
   dbms_output.put_line(SubStr('x_batch_header.plant_code ='||x_batch_header.plant_code,1,255));
   dbms_output.put_line(SubStr('x_batch_header.batch_no ='||x_batch_header.batch_no,1,255));

END;
/


--To find the Validity Rule Id, run this script
select r.recipe_no
,r.recipe_version
,r.recipe_id
,v.RECIPE_VALIDITY_RULE_ID
,v.orgn_code
,RECIPE_USE
,PREFERENCe
,START_DATe
,END_DATE
,MIN_QTY
,MAX_QTY
,STD_QTY
,ITEM_UM
from gmd_recipes r
,gmd_recipe_validity_rules v
where r.recipe_no='&recipe_no'
and r.recipe_version='&version'
and r.recipe_id=v.recipe_id
order by
v.preference

/*Remarks on Example 1
Notice the ‘alter session set nls_language=american;’ command. This command is used to ensure that the language in the current SQL*Plus session matches one of the installed languages within the Application. It is always safe to set this to ‘american’.
The ‘set serveroutput on size 1000000’ command is there to ensure that the 'dbms_out.put_line' messages can be seen on the screen. In real life examples, the user will probably use the 'utl_file.put_line' command in order to write these messages to a text log file.
Note the combination of the Recipe Number and Version and the Validity Rule Id. The Validity Rule Id must be attached to the relevant Recipe, and both must be ‘Approved for General Use’. The Validity Rule must be effective on the relevant batch dates (in this case, the batch due date). To find the appropriate value of Validity Rule Id, run the script shown above.
Note the Batch Size and UOM. These must be valid within the limits set by the Validity Rule being used.
The ‘fnd_global.apps_initialize’ is used to set the application context. In the above example, the context is set according to the applications user whose id is 1003637. The relevant id can found for the required user by using this command: ‘select user_id from fnd_user where user_name='&user_name'; and entering the required username. The user selected should have a responsibility attached which allows creation of batches via the application.
A full description of the Create Batch API and its parameters can be found in the User Guide pages 4-16 to 4-19.

Example 2: Creation of batch by Product*/

set serveroutput on size 1000000
alter session set nls_language=american;

DECLARE
x_message_count NUMBER;
x_message_list VARCHAR2(2000);
x_return_status VARCHAR2(1);
p_batch_header GME_BATCH_HEADER%rowtype;
x_batch_header GME_BATCH_HEADER%rowtype;
x_unallocated_material GME_API_PUB.UNALLOCATED_MATERIALS_TAB;
BEGIN
dbms_output.enable(100000);

fnd_global.apps_initialize( USER_ID =>1007882,
                      resp_id =>NULL,
                      resp_appl_id =>NULL);

p_batch_header.plant_code := 'PR1';
p_batch_header.batch_no := '';
p_batch_header.batch_type := 0;
p_batch_header.plan_start_date := TO_DATE('16-JULY-2006 12:00:00','DD-MON-YYYY HH24:MI:SS');
p_batch_header.wip_whse_code := '';

gme_api_pub.create_batch(
   p_api_version
   ,p_validation_level     =>  100
   ,p_init_msg_list        => TRUE
   ,p_commit               => FALSE
   ,x_message_count        => x_message_count
   ,x_message_list         => x_message_list
   ,x_return_status        => x_return_status
   ,p_batch_header         => p_batch_header
   ,x_batch_header         => x_batch_header
   ,p_batch_size           => 100
   ,p_batch_size_uom       => 'KG'
   ,p_creation_mode        => 'PRODUCT'
   ,p_recipe_id            => null
   ,p_recipe_no            => null
   ,p_recipe_version       => null
   ,p_product_no           => 'JGC_1'
   ,p_product_id           => NULL
   ,p_ignore_qty_below_cap => TRUE
   ,p_ignore_shortages     => TRUE
   ,x_unallocated_material => x_unallocated_material
   );

gme_debug.display_messages(x_message_count);
dbms_output.put_line('x_message_count = '||TO_CHAR(x_message_count));
dbms_output.put_line('x_message_list = '||x_message_list);
dbms_output.put_line('x_return_status = '||x_return_status);
dbms_output.put_line('x_batch_header.batch_id = '||TO_CHAR(x_batch_header.batch_id));
dbms_output.put_line(SubStr('x_batch_header.plant_code = '||x_batch_header.plant_code,1,255));
dbms_output.put_line(SubStr('x_batch_header.batch_no = '||x_batch_header.batch_no,1,255));
dbms_output.put_line('x_batch_header.batch_type = '||TO_CHAR(x_batch_header.batch_type));
dbms_output.put_line('x_batch_header.recipe_validity_rule_id ='||TO_CHAR(x_batch_header.recipe_validity_rule_id));
dbms_output.put_line('x_batch_header.formula_id = '||TO_CHAR(x_batch_header.formula_id));
dbms_output.put_line('x_batch_header.routing_id = '||TO_CHAR(x_batch_header.routing_id));
dbms_output.put_line('x_batch_header.plan_start_date = '||TO_CHAR(x_batch_header.plan_start_date, 'DD-MON-YYYY HH24:MI:SS'));
dbms_output.put_line('x_batch_header.due_date = '||TO_CHAR(x_batch_header.due_date, 'DD-MON-YYYY HH24:MI:SS'));
dbms_output.put_line('x_batch_header.plan_cmplt_date = '||TO_CHAR(x_batch_header.plan_cmplt_date, 'DD-MON-YYYY HH24:MI:SS'));
dbms_output.put_line('x_batch_header.batch_status = '||TO_CHAR(x_batch_header.batch_status));
dbms_output.put_line(SubStr('x_batch_header.wip_whse_code ='||x_batch_header.wip_whse_code,1,255));
dbms_output.put_line(SubStr('x_batch_header.poc_ind = '||x_batch_header.poc_ind,1,255));
dbms_output.put_line(SubStr('x_batch_header.update_inventory_ind = '||x_batch_header.update_inventory_ind,1,255));
dbms_output.put_line('x_batch_header.last_update_date='||TO_CHAR(x_batch_header.last_update_date, 'DD-MON-YYYY HH24:MI:SS'));
dbms_output.put_line('x_batch_header.last_updated_by = '||TO_CHAR(x_batch_header.last_updated_by));
dbms_output.put_line('x_batch_header.creation_date = '||TO_CHAR(x_batch_header.creation_date, 'DD-MON-YYYY HH24:MI:SS'));
dbms_output.put_line('x_batch_header.created_by = '||TO_CHAR(x_batch_header.created_by));
dbms_output.put_line('x_batch_header.last_update_login ='||TO_CHAR(x_batch_header.last_update_login));
dbms_output.put_line('x_batch_header.delete_mark = '||TO_CHAR(x_batch_header.delete_mark));
dbms_output.put_line('x_batch_header.text_code = '||TO_CHAR(x_batch_header.text_code));
dbms_output.put_line('x_batch_header.automatic_step_calculation ='||TO_CHAR(x_batch_header.automatic_step_calculation));IF x_unallocated_material.count > 0 THEN
   FOR i IN x_unallocated_material.first..x_unallocated_material.last LOOP
      IF x_unallocated_material.exists(i) THEN         dbms_output.put_line('x_unallocated_material('||to_char(i)||').batch_id ='||TO_CHAR(x_unallocated_material(i).batch_id));
         dbms_output.put_line(SubStr('x_unallocated_material('||to_char(i)||').batch_no ='||x_unallocated_material(i).batch_no,1,255));
         dbms_output.put_line('x_unallocated_material('||to_char(i)||').material_detail_id='||TO_CHAR(x_unallocated_material(i).material_detail_id));
         dbms_output.put_line('x_unallocated_material('||to_char(i)||').line_type='||TO_CHAR(x_unallocated_material(i).line_type));
         dbms_output.put_line('x_unallocated_material('||to_char(i)||').line_no='||TO_CHAR(x_unallocated_material(i).line_no));
         dbms_output.put_line('x_unallocated_material('||to_char(i)||').item_id='||TO_CHAR(x_unallocated_material(i).item_id));
         dbms_output.put_line(SubStr('x_unallocated_material('||to_char(i)||').item_no ='||x_unallocated_material(i).item_no,1,255));
         dbms_output.put_line('x_unallocated_material('||to_char(i)||').alloc_qty='||TO_CHAR(x_unallocated_material(i).alloc_qty));
         dbms_output.put_line('x_unallocated_material('||to_char(i)||').unalloc_qty ='||TO_CHAR(x_unallocated_material(i).unalloc_qty));
         dbms_output.put_line(SubStr('x_unallocated_material('||to_char(i)||').alloc_uom='||x_unallocated_material(i).alloc_uom,1,255));
      END IF;
   END LOOP;
END IF;

gme_api_pub.save_batch(
   p_batch_header         => p_batch_header,
   X_return_status        => x_return_status,
   p_commit               =>TRUE);

EXCEPTION
   WHEN OTHERS THEN   dbms_output.put_line('Error '||TO_CHAR(SQLCODE)||': '||SQLERRM);
RAISE;
   END;
/

/*Remarks on Example 2
The remarks made against Example 1 remain valid for Example 2. In addition please note the following.
In this example, the product to be output is specified and the quantity to be output is likewise specified. Once again, however, there must be a valid Recipe Validity Rule that can used to create the batch. See remark 3 on example 1 for more details.
Notice that when the API creating the batch  (gme_api_pub.create_batch) is run, the transaction is not committed. Instead this is done at a later stage using the 'gme_api_pub.save_batch' API.  The user may care to use this technique when, for example, creating and releasing a batch in a single transaction.
*/

--Example 3: Creation using Output Quantity

set serveroutput on
alter session set nls_language=american;
DECLARE
x_message_count NUMBER;
x_message_list VARCHAR2(2000);
x_return_status VARCHAR2(1);
p_batch_header GME_BATCH_HEADER%rowtype;
x_batch_header GME_BATCH_HEADER%rowtype;
x_unallocated_material GME_API_PUB.UNALLOCATED_MATERIALS_TAB;
l_msg_index_out NUMBER;
BEGIN
-- Following line is set the output buffer
   dbms_output.enable(100000); /**************************************************************************************
* Enter your user id below
* NOTE: To retrieve user_id Log on to the application.
* Select to Production Supervisor responsibility
* Navigate Others->Session parameters
* You will see your USER ID and Username on the screen.
* fnd_profile.initialize(user_id);
**************************************************************************************/
-- set the applications context
   fnd_global.apps_initialize( USER_ID =>1007882,
      resp_id =>NULL,
      resp_appl_id =>NULL
   );

/**************************************************************************************
* (R) = Required, (O) = Optional
* enter your own plant_code (R), recipe_validity_Rule_Id(O), batch_type (R)
* specify batch_no (R if testing manual doc ordering)
* dates are optional;format of the dates is
* TO_DATE('10-OCT-2001 12:00:00','DD-MON-YYYY HH24:MI:SS');
* In esence you supply the date and appropriate format.
* wip_whse_code is optional.
* update_inventory_ind is optional and should only be used if the plant is a Lab.
* 'Y'=Transactions to be created, 'N'=transactions should not be created.
**************************************************************************************/

p_batch_header.plant_code := 'PR1'; p_batch_header.batch_no := '';
-- batch_type .. 10=fpo, 0=batch
p_batch_header.batch_type := 0;
p_batch_header.recipe_validity_rule_id := null;
p_batch_header.plan_start_date := ''; --TO_DATE('30-JUL-2006 12:00:00','DD-MON-YYYY HH24:MI:SS');
p_batch_header.due_date := ''; ---TO_DATE('');
p_batch_header.plan_cmplt_date := ''; --TO_DATE('');
p_batch_header.wip_whse_code := '';
-- -- you have the option to set the below param to N when testing Lab batch creation
p_batch_header.update_inventory_ind := 'Y';

/**************************************************************************************
* Now call the stored program
* Leave first 4 parameters as they are
* enter p_batch_size and p_batch_size_uom are required
* if p_creation_mode is 'PRODUCT', 'OUTPUT', 'INPUT')
* enter p_creation_mode = RECIPE, PRODUCT,OUTPUT,INPUT
* p_batch_header_validity_rule_id OR p_recipe_id OR (p_recipe_no and p_recipe_version)
* are required if p_creation_mode = 'RECIPE','INPUT','OUTPUT'
* p_batch_header_validity_rule_id OR p_product_id OR p_product_no
* are required if p_creation_mode = 'PRODUCT'
* If p_ignore_shortages id passed as FALSE then in case of shortages
* and profile option GMI:Allow negative inventory is set to Warning or Error
* Batch will not be created and the x_unallocated procedure will be populated
* with the material lines causing shortages.
* p_ignore_qty_below_cap: If set to FALSE, then if the process quantity of any of
* the resources in the batch is less than the minimum capacity for that resource
* batch will not be created.
**************************************************************************************/

gme_api_pub.create_batch(
   ,p_api_version => 1
   ,p_validation_level => 100
   ,p_init_msg_list => TRUE
   ,p_commit => TRUE
   ,x_message_count => x_message_count
   ,x_message_list => x_message_list
   ,x_return_status => x_return_status
   ,p_batch_header => p_batch_header
   ,x_batch_header => x_batch_header
   ,p_batch_size => 1000
   ,p_batch_size_uom => 'KG'
   ,p_creation_mode => 'OUTPUT'
   ,p_recipe_id => NULL
   ,p_recipe_no => 'JGC_1'
   ,p_recipe_version => '301'
   ,p_product_no => 'JGC_1'
   ,p_product_id => NULL
   ,p_ignore_qty_below_cap => TRUE
   ,p_ignore_shortages => TRUE
   ,x_unallocated_material => x_unallocated_material
);

/***************************************************************************************
* Following line can be uncommented, if there are multiple messages return by the
* API, and you want to see all those messages. These will be written to the Log file
* If generated by the API.
***************************************************************************************/
-- gme_debug.display_messages(x_message_count);

/***************************************************************************************
* Output the results
* One of the following will be the outcome of the API call( x_return_status)
* S - Success
* E - Error
* U - Unexpected Error
* N - Items failed auto allocation
* V - Inventory shortage exists
***************************************************************************************/
IF x_return_status <> FND_API.g_ret_sts_success THEN
   IF X_message_count = 1 THEN
   DBMS_OUTPUT.PUT_LINE('Error:'||X_message_list);
   ELSE
   FOR i IN 1..x_message_count LOOP
      FND_MSG_PUB.get (p_msg_index => i
      ,p_data => X_message_list
      ,p_msg_index_out => l_msg_index_out);
      DBMS_OUTPUT.PUT_LINE('Error: '||X_message_list);
   END LOOP;
END IF;

ELSE

dbms_output.put_line('x_message_count = '||TO_CHAR(x_message_count));
dbms_output.put_line('x_message_list = '||length(x_message_list)||SubStr(x_message_list,length(x_message_list)-20,20));
dbms_output.put_line('x_return_status = '||x_return_status);
dbms_output.put_line('x_batch_header.batch_id = '||TO_CHAR(x_batch_header.batch_id));
dbms_output.put_line(SubStr('x_batch_header.plant_code = '||x_batch_header.plant_code,1,255));
dbms_output.put_line(SubStr('x_batch_header.batch_no = '||x_batch_header.batch_no,1,255));
dbms_output.put_line('x_batch_header.batch_type = '||TO_CHAR(x_batch_header.batch_type));
dbms_output.put_line('x_batch_header.recipe_validity_rule_id = '||TO_CHAR(x_batch_header.recipe_validity_rule_id));
dbms_output.put_line('x_batch_header.formula_id = '||TO_CHAR(x_batch_header.formula_id));
dbms_output.put_line('x_batch_header.routing_id = '||TO_CHAR(x_batch_header.routing_id));
dbms_output.put_line('x_batch_header.plan_start_date = '||TO_CHAR(x_batch_header.plan_start_date, 'DD-MON-YYYY HH24:MI:SS'));
dbms_output.put_line('x_batch_header.due_date = '||TO_CHAR(x_batch_header.due_date, 'DD-MON-YYYY HH24:MI:SS'));
dbms_output.put_line('x_batch_header.plan_cmplt_date = '||TO_CHAR(x_batch_header.plan_cmplt_date, 'DD-MON-YYYY HH24:MI:SS'));
dbms_output.put_line('x_batch_header.batch_status = '||TO_CHAR(x_batch_header.batch_status));
dbms_output.put_line(SubStr('x_batch_header.wip_whse_code = '||x_batch_header.wip_whse_code,1,255));
dbms_output.put_line(SubStr('x_batch_header.poc_ind = '||x_batch_header.poc_ind,1,255));
dbms_output.put_line(SubStr('x_batch_header.update_inventory_ind = '||x_batch_header.update_inventory_ind,1,255));
dbms_output.put_line('x_batch_header.last_update_date = '||TO_CHAR(x_batch_header.last_update_date, 'DD-MON-YYYY HH24:MI:SS'));
dbms_output.put_line('x_batch_header.last_updated_by = '||TO_CHAR(x_batch_header.last_updated_by));
dbms_output.put_line('x_batch_header.creation_date = '||TO_CHAR(x_batch_header.creation_date, 'DD-MON-YYYY HH24:MI:SS'));
dbms_output.put_line('x_batch_header.created_by = '||TO_CHAR(x_batch_header.created_by));
dbms_output.put_line('x_batch_header.last_update_login = '||TO_CHAR(x_batch_header.last_update_login));
dbms_output.put_line('x_batch_header.delete_mark = '||TO_CHAR(x_batch_header.delete_mark));
dbms_output.put_line('x_batch_header.text_code = '||TO_CHAR(x_batch_header.text_code));
dbms_output.put_line('x_batch_header.automatic_step_calculation = '||TO_CHAR(x_batch_header.automatic_step_calculation));
IF x_unallocated_material.count > 0 THEN
   FOR i IN x_unallocated_material.first..x_unallocated_material.last LOOP
      IF x_unallocated_material.exists(i) THEN
         dbms_output.put_line('x_unallocated_material('||to_char(i)||').batch_id = '||TO_CHAR(x_unallocated_material(i).batch_id));
         dbms_output.put_line(SubStr('x_unallocated_material('||to_char(i)||').batch_no = '||x_unallocated_material(i).batch_no,1,255));
         dbms_output.put_line('x_unallocated_material('||to_char(i)||').material_detail_id = '||TO_CHAR(x_unallocated_material(i).material_detail_id));
         dbms_output.put_line('x_unallocated_material('||to_char(i)||').line_type = '||TO_CHAR(x_unallocated_material(i).line_type));
         dbms_output.put_line('x_unallocated_material('||to_char(i)||').line_no = '||TO_CHAR(x_unallocated_material(i).line_no));
         dbms_output.put_line('x_unallocated_material('||to_char(i)||').item_id = '||TO_CHAR(x_unallocated_material(i).item_id));
         dbms_output.put_line(SubStr('x_unallocated_material('||to_char(i)||').item_no = '||x_unallocated_material(i).item_no,1,255));
         dbms_output.put_line('x_unallocated_material('||to_char(i)||').alloc_qty = '||TO_CHAR(x_unallocated_material(i).alloc_qty));
         dbms_output.put_line('x_unallocated_material('||to_char(i)||').unalloc_qty = '||TO_CHAR(x_unallocated_material(i).unalloc_qty));
         dbms_output.put_line(SubStr('x_unallocated_material('||to_char(i)||').alloc_uom = '||x_unallocated_material(i).alloc_uom,1,255));
      END IF;
   END LOOP;
END IF;
END IF;

EXCEPTION
WHEN OTHERS THEN
dbms_output.put_line('Error '||TO_CHAR(SQLCODE)||': '||SQLERRM);
RAISE;
END;
/

--Remarks on example 3
--See Remarks for both Example 1 and Example 2.  As in Example 1, the Recipe and Version numbers are specified and like Example 2, the Product is specified. This example differs from the others in that it allows the user to control both the recipe used and the output quantity. It basically provides the same functionality as using the ‘Total Output’ tab when creating a batch in the application.

--Example 4:  Create, Release and Save Batch

alter session set nls_language=american;
set serveroutput on size 100000;

DECLARE
l_batch_header            gme_batch_header%ROWTYPE;
x_batch_header            gme_batch_header%ROWTYPE;
p_batch_header            gme_batch_header%ROWTYPE;
x_message_count            NUMBER;
x_message_list            VARCHAR2(2000);
x_unallocated_material    gme_api_pub.unallocated_materials_tab;
x_return_status            VARCHAR2(1);
l_material_detail        gme_material_details%ROWTYPE;
x_material_detail        gme_material_details%ROWTYPE;
p_values_tab            gme_api_pub.field_values_tab;
l_field                     gme_api_pub.p_field;
l_unallocated_material    gme_api_pub.unallocated_materials_tab;
l_msg_index_out NUMBER;
BEGIN
-- Set the applications context
fnd_global.apps_initialize( USER_ID =>1007882,
                               resp_id =>NULL,                               resp_appl_id =>NULL);
l_batch_header.plant_code            :='PR1';
l_batch_header.batch_type             := 0;
l_batch_header.plan_start_date             := SYSDATE;
l_batch_header.plan_cmplt_date             := SYSDATE;
l_batch_header.due_date             := SYSDATE;
l_batch_header.update_inventory_ind         := 'Y';
l_batch_header.wip_whse_code             := 'PR1';
l_batch_header.recipe_validity_rule_id := 1239;

--
-- CREATE THE BATCH
--
gme_api_pub.create_batch  (p_api_version         => 1
            ,p_validation_level         => 1000
            ,p_init_msg_list         => TRUE
            ,p_commit             => FALSE
            ,x_message_count         => x_message_count
            ,x_message_list         => x_message_list
            ,x_return_status         => x_return_status
            ,p_batch_header         => l_batch_header
            ,x_batch_header         => x_batch_header
            ,p_batch_size         => 10
            ,p_batch_size_uom         => 'KG'               
            ,p_creation_mode         => 'RECIPE'
            ,p_recipe_id             => NULL                                     
            ,p_recipe_no             => 'JGC_1'
            ,p_recipe_version         => '301'    
            ,p_product_no         => NULL     
            ,p_product_id         => NULL       
            ,p_ignore_qty_below_cap     => TRUE
            ,p_ignore_shortages         => TRUE
            ,x_unallocated_material     => x_unallocated_material);

IF x_return_status <> FND_API.g_ret_sts_success THEN
      IF X_message_count = 1 THEN
            DBMS_OUTPUT.PUT_LINE('Error:'||X_message_list);
            ELSE
            FOR i IN 1..x_message_count LOOP
                        FND_MSG_PUB.get (p_msg_index => i
                        ,p_data => X_message_list
                        ,p_msg_index_out => l_msg_index_out);
                        DBMS_OUTPUT.PUT_LINE('Error: '||X_message_list);
            END LOOP;
      END IF;
ELSE

      dbms_output.put_line('x_message_count = '||TO_CHAR(x_message_count));
      dbms_output.put_line('x_message_list = length'||length(x_message_list)||' Contents ' ||substr(x_message_list,1,200));
      dbms_output.put_line('x_return_status = '||x_return_status);
      dbms_output.put_line('x_batch_header.batch_id = '||TO_CHAR(x_batch_header.batch_id));
      dbms_output.put_line(SubStr('x_batch_header.plant_code = '||x_batch_header.plant_code,1,255));
      dbms_output.put_line(SubStr('x_batch_header.batch_no = '||x_batch_header.batch_no,1,255));
      dbms_output.put_line('x_batch_header.batch_type = '||TO_CHAR(x_batch_header.batch_type));
      dbms_output.put_line('x_batch_header.recipe_validity_rule_id = '||TO_CHAR(x_batch_header.recipe_validity_rule_id));
      dbms_output.put_line('x_batch_header.formula_id = '||TO_CHAR(x_batch_header.formula_id));
      dbms_output.put_line('x_batch_header.routing_id = '||TO_CHAR(x_batch_header.routing_id));
      dbms_output.put_line('x_batch_header.plan_start_date = '||TO_CHAR(x_batch_header.plan_start_date, 'DD-MON-YYYY HH24:MI:SS'));
      dbms_output.put_line('x_batch_header.due_date = '||TO_CHAR(x_batch_header.due_date, 'DD-MON-YYYY HH24:MI:SS'));
      dbms_output.put_line('x_batch_header.plan_cmplt_date = '||TO_CHAR(x_batch_header.plan_cmplt_date, 'DD-MON-YYYY HH24:MI:SS');
      dbms_output.put_line('x_batch_header.batch_status = '||TO_CHAR(x_batch_header.batch_status));

      l_batch_header.batch_type               := 0;
      l_batch_header.batch_id                 := x_batch_header.batch_id;
      l_batch_header.plan_start_date          := SYSDATE;
      l_batch_header.plan_cmplt_date          := SYSDATE;
      l_batch_header.due_date                 := SYSDATE;
      l_batch_header.update_inventory_ind     := 'Y';
      l_batch_header.actual_start_date        := SYSDATE;

      ---
      --- RELEASE IT
      ---
       gme_api_pub.release_batch  (p_api_version        => 1
            ,p_validation_level        => 1000
            ,p_init_msg_list        => TRUE
            ,p_commit            => FALSE
            ,x_message_count        => x_message_count
            ,x_message_list        => x_message_list
            ,x_return_status        => x_return_status
            ,p_batch_header        => l_batch_header
            ,x_batch_header        => x_batch_header
            ,p_ignore_shortages        => TRUE
            ,x_unallocated_material     => l_unallocated_material
            ,p_ignore_unalloc         => TRUE);

      IF x_return_status = FND_API.g_ret_sts_success THEN
            dbms_output.put_line('Batch Released');
            p_batch_header.batch_id                 := x_batch_header.batch_id;
      --
      -- SAVE THE CHANGES
      --
            gme_api_pub.save_batch(
            p_batch_header         => p_batch_header,
            X_return_status        => x_return_status,
            p_commit               =>TRUE);
      else 
            dbms_output.put_line('Batch Release failed');
            IF X_message_count = 1 THEN
               DBMS_OUTPUT.PUT_LINE('Error:'||X_message_list);
            ELSE
               FOR i IN 1..x_message_count LOOP                   FND_MSG_PUB.get (p_msg_index => i
                   ,p_data => X_message_list
                   ,p_msg_index_out => l_msg_index_out);
                   DBMS_OUTPUT.PUT_LINE('Error: '||X_message_list);
               END LOOP;
            end if;      end if;
end if;

EXCEPTION
      WHEN OTHERS THEN
         dbms_output.put_line('Error '||TO_CHAR(SQLCODE)||': '||SQLERRM);
RAISE;

END;
/

--Remarks on example 4
--This script creates, releases and saves a batch. Note that when the batch is created and released, these changes are not committed (that is to say, 'p_commit' is set to False). This enables the user to treat both batch creation and release as part of the same transaction and commit the changes if both operations succeed.

/*Example 5: Create a batch and insert an additional material line*/

alter session set nls_language=american;
set serveroutput on size 100000
DECLARE
l_batch_header gme_batch_header%ROWTYPE;
x_batch_header gme_batch_header%ROWTYPE;
p_batch_header gme_batch_header%ROWTYPE;
x_message_count NUMBER;
x_message_list VARCHAR2(2000);
x_unallocated_material gme_api_pub.unallocated_materials_tab;
x_return_status VARCHAR2(1);
l_material_detail gme_material_details%ROWTYPE;
x_material_detail gme_material_details%ROWTYPE;
p_values_tab gme_api_pub.field_values_tab;
l_field gme_api_pub.p_field;
l_unallocated_material gme_api_pub.unallocated_materials_tab;
l_msg_index_out NUMBER;
BEGIN
-- Set the applications context
fnd_global.apps_initialize( USER_ID =>1007882,
                               resp_id =>NULL,
                               resp_appl_id =>NULL);

l_batch_header.plant_code :='PR1';
l_batch_header.batch_type := 0;
l_batch_header.plan_start_date := SYSDATE;
l_batch_header.plan_cmplt_date := SYSDATE;
l_batch_header.due_date := SYSDATE;
l_batch_header.update_inventory_ind := 'Y';
l_batch_header.wip_whse_code := 'PR1';
l_batch_header.recipe_validity_rule_id := 1239;

--
-- CREATE THE BATCH
--
gme_api_pub.create_batch (p_api_version => 1
     ,p_validation_level => 1000
     ,p_init_msg_list => TRUE
     ,p_commit => FALSE
     ,x_message_count => x_message_count
     ,x_message_list => x_message_list
     ,x_return_status => x_return_status
     ,p_batch_header => l_batch_header
     ,x_batch_header => x_batch_header
     ,p_batch_size => 10
     ,p_batch_size_uom => 'KG'
     ,p_creation_mode => 'RECIPE'
     ,p_recipe_id => NULL
     ,p_recipe_no => 'JGC_1'
     ,p_recipe_version => '301'
     ,p_product_no => NULL
     ,p_product_id => NULL
     ,p_ignore_qty_below_cap => TRUE
     ,p_ignore_shortages => TRUE
     ,x_unallocated_material => x_unallocated_material);

IF x_return_status <> FND_API.g_ret_sts_success THEN
     DBMS_OUTPUT.PUT_LINE('Error:'||X_message_list);
ELSE
     dbms_output.put_line('x_message_count = '||TO_CHAR(x_message_count));
     dbms_output.put_line('x_message_list = lenght '||length(x_message_list)||' Contents ' ||substr(x_message_list,1,200));
     dbms_output.put_line('x_return_status = '||x_return_status);
     dbms_output.put_line('x_batch_header.batch_id = '||TO_CHAR(x_batch_header.batch_id));
     dbms_output.put_line(SubStr('x_batch_header.plant_code = '||x_batch_header.plant_code,1,255));
     dbms_output.put_line(SubStr('x_batch_header.batch_no = '||x_batch_header.batch_no,1,255));
     dbms_output.put_line('x_batch_header.batch_type = '||TO_CHAR(x_batch_header.batch_type));
     dbms_output.put_line('x_batch_header.recipe_validity_rule_id = '||TO_CHAR(x_batch_header.recipe_validity_rule_id));
     dbms_output.put_line('x_batch_header.formula_id = '||TO_CHAR(x_batch_header.formula_id));
     dbms_output.put_line('x_batch_header.routing_id = '||TO_CHAR(x_batch_header.routing_id));
     dbms_output.put_line('x_batch_header.plan_start_date = '||TO_CHAR(x_batch_header.plan_start_date, 'DD-MON-YYYY HH24:MI:SS'));
     dbms_output.put_line('x_batch_header.due_date = '||TO_CHAR(x_batch_header.due_date, 'DD-MON-YYYY HH24:MI:SS'));
     dbms_output.put_line('x_batch_header.plan_cmplt_date = '||TO_CHAR(x_batch_header.plan_cmplt_date, 'DD-MON-YYYY HH24:MI:SS');
     dbms_output.put_line('x_batch_header.batch_status = '||TO_CHAR(x_batch_header.batch_status));

     l_material_detail.batch_id :=x_batch_header.batch_id;
     l_material_detail.line_no :=2;
     l_material_detail.item_id :=712;
     l_material_detail.plan_qty :=100;
     l_material_detail.scale_type :=1;
     l_material_detail.alloc_ind :=0;
     l_material_detail.item_um :='LB';
     l_material_detail.line_type :=-1;
     l_material_detail.cost_alloc :=0;
     l_material_detail.contribute_yield_ind :='Y';
     l_material_detail.scrap_factor :=0;
     l_material_detail.phantom_type :=0;
     p_batch_header := x_batch_header;

--
-- INSERT INGREDIENT LINE
--
gme_api_pub.insert_material_line (p_api_version =>1
     ,p_validation_level =>100
     ,p_init_msg_list =>FALSE
     ,p_commit =>FALSE
     ,x_message_count =>x_message_count
     ,x_message_list =>x_message_list
     ,x_return_status =>x_return_status
     ,p_material_detail =>l_material_detail
     ,p_batchstep_no =>NULL
     ,x_material_detail =>x_material_detail);
     IF x_return_status = FND_API.g_ret_sts_success THEN 
          dbms_output.put_line('Material line inserted for item id '||x_material_detail.item_id);

         --
         -- SAVE THE CHANGES
         --
         gme_api_pub.save_batch(
              p_batch_header => p_batch_header,
              X_return_status => x_return_status,
             p_commit =>TRUE);

     else
              dbms_output.put_line('Material line insertion failed');
              DBMS_OUTPUT.PUT_LINE('Error:'||X_message_list);
     end if;
end if;

EXCEPTION
     WHEN OTHERS THEN
          dbms_output.put_line('Error '||TO_CHAR(SQLCODE)||': '||SQLERRM);
RAISE;

END;
/

--Remarks on Example 5
--This is similar to Example 4 except that this time, once the batch is created, a new ingredient line is added. The changes are then saved via the save batch API.

--Example 6: Insert_line_allocation API
set serverout on size 100000
alter session set nls_language=american;

DECLARE
--
x_message_count NUMBER;
x_message_list VARCHAR2(2000);
x_return_status VARCHAR2(2000);
p_material_details gme_material_details%ROWTYPE;
x_material_details gme_material_details%ROWTYPE;
p_batch_header gme_batch_header%ROWTYPE;
x_def_tran_row gme_inventory_txns_gtmp%ROWTYPE;
x_tran_row gme_inventory_txns_gtmp%ROWTYPE;
x_unallocated_materials gme_api_pub.unallocated_materials_tab;
x_unallocated_items gme_unallocated_items_gtmp%rowtype;
p_tran_row gme_inventory_txns_gtmp%ROWTYPE;
--
x_msg_index number;
x_msg_data varchar2(200);
l_message_count NUMBER;
l_message_list VARCHAR2(200);

BEGIN
-- Following line is set the output buffer
DBMS_OUTPUT.enable(20000);

-- Line below required if formula security is used. It sets the security context.
fnd_global.apps_initialize( USER_ID =>1007882,
                               resp_id =>NULL,
                               resp_appl_id =>NULL
                               );
--
p_material_details.material_detail_id := 22188;
p_batch_header.batch_id := 4354;
--
/**/
p_tran_row.doc_id := 4354;
p_tran_row.material_detail_id := 22188;
p_tran_row.whse_code := 'PR1';
p_tran_row.location := '1';
p_tran_row.lot_id := 7571;
p_tran_row.alloc_qty := 100;
p_tran_row.trans_qty := 100;
p_tran_row.completed_ind := 0;
p_tran_row.trans_date := sysdate;
p_tran_row.reason_code := null;

/**************************************************************************************
* Now call the stored program *
* Leave first 4 parameters as they are *
**************************************************************************************/
gme_api_pub.insert_line_allocation(p_api_version => 1
     p_validation_level => 1000
     ,p_init_msg_list => TRUE
     ,p_commit => TRUE
     ,p_tran_row => p_tran_row
     ,p_lot_no => null
     ,p_sublot_no => null
     ,p_create_lot => TRUE
     ,p_ignore_shortage => FALSE
     ,p_scale_phantom => FALSE
     ,x_material_detail => p_material_details
     ,x_tran_row => x_tran_row
     ,x_def_tran_row => x_def_tran_row
     ,x_message_count => l_message_count
     ,x_message_list => l_message_list
     ,x_return_status => x_return_status);
IF x_return_status = FND_API.g_ret_sts_success THEN
     DBMS_OUTPUT.put_line('doc_id = '||x_tran_row.doc_id);
     DBMS_OUTPUT.put_line('material_detail_id = '||x_tran_row.material_detail_id);
     DBMS_OUTPUT.put_line('trans_id = '||x_tran_row.trans_id);
     DBMS_OUTPUT.put_line('line_type = '||x_tran_row.line_type);
     DBMS_OUTPUT.put_line('whse_code = '||x_tran_row.whse_code);
     DBMS_OUTPUT.put_line('location = '||x_tran_row.location); 
     DBMS_OUTPUT.put_line('alloc_qty = '||x_tran_row.alloc_qty);
     DBMS_OUTPUT.put_line('trans_qty = '||x_tran_row.trans_qty); 
     DBMS_OUTPUT.put_line('trans_qty2 = '||x_tran_row.trans_qty2);
     DBMS_OUTPUT.put_line('completed_ind = '||x_tran_row.completed_ind);
     DBMS_OUTPUT.put_line('trans_date = '||x_tran_row.trans_date);

else
     DBMS_OUTPUT.put_line('x_message_count = '||TO_CHAR(L_message_count));
     DBMS_OUTPUT.put_line(SubStr('x_message_list = '||l_message_list,1,255));
     DBMS_OUTPUT.put_line(SubStr('x_return_status = '||x_return_status,1,255));

end if;

EXCEPTION
     WHEN OTHERS THEN
          DBMS_OUTPUT.put_line('Error '||TO_CHAR(SQLCODE)||': '||SQLERRM);
RAISE;
END;
/

--Remarks on Example 6
--This will create a line allocation for either an ingredient or product line. Note this API can be used in conjunction with the gme_api_pub.insert_material_line API to both add and allocate a new material line. Once again the gme_api_pub.save_batch procedure can be used to save both transactions once the user is sure there are no errors.

--Example 7: Close (Complete) Batch
alter session set nls_language=american;
set serveroutput on size 1000000
DECLARE
v_batch_header apps.gme_batch_header%ROWTYPE;
x_batch_header apps.gme_batch_header%ROWTYPE;
v_message_count number;
v_message_list VARCHAR2(1024);
v_unallocated_material apps.gme_api_pub.unallocated_materials_tab;
v_return_status VARCHAR2(1);
BEGIN
fnd_global.apps_initialize( USER_ID =>1007882,
                               resp_id =>NULL,
                               resp_appl_id =>NULL);

v_batch_header.batch_id := 4355; 
v_batch_header.ACTUAL_CMPLT_DATE := sysdate;

gme_api_pub.certify_batch (
     p_init_msg_list => TRUE
     ,p_commit => false
     ,x_message_count => v_message_count
     ,x_message_list => v_message_list
     ,x_return_status => v_return_status
     ,p_del_incomplete_manual => TRUE
     ,p_ignore_shortages => TRUE
     ,p_batch_header => v_batch_header
     ,x_batch_header => x_batch_header
     ,x_unallocated_material => v_unallocated_material);

IF v_return_status = 'S' THEN
     dbms_output.put_line( 'Certify succeeded');
     gme_api_pub.save_batch(x_batch_header, v_return_status); 
     dbms_output.put_line( 'save_batch: status='|| v_return_status); 
     commit;
else
     dbms_output.put_line( 'Certify failed status= '|| v_return_status);
     DBMS_OUTPUT.PUT_LINE('Error: '||v_message_list); 
     rollback; 
end if; 

EXCEPTION
    WHEN OTHERS THEN
         dbms_output.put_line('Error '||TO_CHAR(SQLCODE)||': '||SQLERRM);
RAISE;

END;
/

--Remarks on example 7
--Bear in mind the state the batch must be in before it can completed - that is, the quantity of the output product should have been recorded and the ingredients allocated. If the user has any doubts about this, it is suggested that they create, release, allocate and attempt to complete a batch in the Application. If this can be done in the application then a batch in the same state should be able to be completed using the API. Notice also in this example the commit is done at the end of the script i.e. after the save batch.

--Example 8: Release, Record Usage and Complete step
alter session set nls_language=american;
set serveroutput on size 1000000

DECLARE
v_message_count number;
v_message_list VARCHAR2(1024);
v_return_status VARCHAR2(1);
v_batch_header gme_batch_header%ROWTYPE;
x_batch_header gme_batch_header%ROWTYPE;
v_batch_step gme_batch_steps%ROWTYPE;
x_batch_step gme_batch_steps%ROWTYPE;
l_release boolean :=false;
l_usage boolean :=false;
l_certify boolean :=false;
v_unallocated_material gme_api_pub.unallocated_materials_tab;
l_batchstep_id number;
l_batch_id number;
x_poc_trans_id number;
BEGIN
fnd_global.apps_initialize( USER_ID =>1007882,
                               resp_id =>NULL,
                               resp_appl_id =>NULL);
---
--- Get batch details
----
    select * into v_batch_header 
    from gme_batch_header
    where batch_id=4362;
---
--- release step 10
---
    v_batch_step.batchstep_no := 10; 
    v_batch_step.batch_id := v_batch_header.batch_id;
    v_batch_step.actual_start_date := v_batch_header.actual_start_date;

    gme_api_pub.release_step (
        p_init_msg_list => TRUE
        ,p_commit => FALSE
        ,p_batch_step => v_batch_step
        ,x_message_count => v_message_count
        ,x_message_list => v_message_list
        ,x_return_status => v_return_status
        ,x_batch_step => x_batch_step
        ,x_unallocated_material => v_unallocated_material
        ,p_ignore_shortages => TRUE
        ,p_ignore_unalloc => TRUE);

    if v_return_status = 'S' then 
        l_release := true;
        l_batch_id :=x_batch_step.batch_id;
        l_batchstep_id := x_batch_step.batchstep_id;
        dbms_output.put_line( 'Release step succeeded');
    else
        dbms_output.put_line( 'release_step: status='|| v_return_status||', message='||v_message_list);
        rollback;
    end if;
---
--- Record resource usage
---
    if l_release = true then
        for c1 in (select batchstep_resource_id
            , resources
            ,activity 
            from
            gme_batch_step_resources r
            ,gme_batch_step_activities a
            where 
            r.batchstep_id=x_batch_step.batchstep_id 
            and a.batchstep_id=r.batchstep_id
            and a.batch_id=x_batch_step.batch_id
            and r.batchstep_activity_id=a.batchstep_activity_id)
        loop
        gme_api_pub.update_actual_rsrc_usage(
            p_init_msg_list => TRUE
            ,p_commit => FALSE
            ,p_batchstep_rsrc_id => c1.batchstep_resource_id
            ,p_plant_code => v_batch_header.plant_code
            ,p_batch_no => v_batch_header.batch_no
            ,p_batchstep_no => x_batch_step.batchstep_no
            ,p_activity => c1.activity
            ,p_resource => c1.resources
            ,p_trans_date => v_batch_header.actual_start_date 
            ,p_start_date => v_batch_header.actual_start_date 
            ,p_end_date => sysdate
            ,p_usage => 1.0
            ,p_reason_code => ''
            ,x_message_count => v_message_count
            ,x_message_list => v_message_list
            ,x_return_status => v_return_status
            ,x_poc_trans_id => x_poc_trans_id);
            dbms_output.put_line( 'update_actual_rsrc_usage: status='|| v_return_status||', 
            message='||v_message_list);
        end loop; 
    end if;
    if v_return_status = 'S' then 
        l_usage := true;
    else
        rollback;
    end if;
---
--- Complete step
---
    IF l_usage = true then
        gme_api_pub.certify_step(
            p_init_msg_list => TRUE
            ,p_commit => FALSE
            ,x_message_count => v_message_count
            ,x_message_list => v_message_list
            ,x_return_status => v_return_status
            ,p_batch_step => v_batch_step
            ,x_batch_step => x_batch_step
            ,x_unallocated_material => v_unallocated_material
            ,p_del_incomplete_manual => FALSE
            ,p_ignore_shortages => TRUE);

        if v_return_status = 'S' then 
                l_certify := true; 
             --- 
             --- Save the changes
             --- 
            gme_api_pub.save_batch(x_batch_header, v_return_status); 
            dbms_output.put_line( 'save_batch: status='|| v_return_status); 
            if v_return_status = 'S' then 
                commit;
            else 
                rollback;
            end if; 
        else
            dbms_output.put_line( 'Certify step: status='|| v_return_status||', message='||v_message_list); 
            rollback; 
        end if; 
    end if;

EXCEPTION
    WHEN OTHERS THEN
    dbms_output.put_line('Error '||TO_CHAR(SQLCODE)||': '||SQLERRM);
RAISE;

END;
/

--Remarks on Example 8
--This example releases a batch step, records actual resource usage and then completes the step. Assuming all operations are successful, the changes are then saved using the save batch API and the changes are committed.