batch no =24231857

select *
from gme_batch_history
where 1=1
and batch_id='985341'

select *
from gme_batch_steps
where 1=1
--and batchstep_id='567302'
and batch_id='985341'

select *
from gme_batch_step_resources
where 1=1
--and resources like '%TO%'
and batch_id='985341'
--and organization_id=337

select *
from hr_all_organization_units

select *
from gme_batch_header
where 1=1
and batch_no=24231858

select *
from gme_batch_step_resources
where organization_id=337

select *
from GME_RESOURCE_TXNS_INTERFACE

select *
from gmd_recipes
where 1=1
and recipe_no='DM.DMY.000001'

select v.recipe_validity_rule_id, v.recipe_id, r.recipe_no, r.recipe_version, v.*
--            into v_recipe_rule, v_recipe_id, v_recipe_no, v_recipe_version
        from  gmd_recipes r,gmd_recipe_validity_rules v
        where 1=1
        and r.recipe_id=v.recipe_id
--        and r.recipe_version='25'
        and r.recipe_no = 'DM.DMY.000001'--'DM.DUMY.00000000' -- harcode 
        and v.organization_id = 337--i.io_id
        and rownum = 1;
        


----------------

select null, '010/24-241106'
            ,transaction_date
            ,line_no
            ,line_type
            ,item_id
            ,1
            ,2
            ,1
            ,uom
            ,lot_number||'A'
            ,io_id
            ,subinventory_code
            ,upload_flag
            ,null
            ,null
            ,null
            ,null
            ,'IWANHE'
from xodi_inv_glt_int
where 1=1
and instruction_list='009/24-240911'
--and instruction_list='005/24-240910-01'
order by transaction_id desc

select rowid,x.*
from xodi_inv_glt_int x
where created_by ='IWANHE'

delete xodi_inv_glt_int x
where created_by ='IWANHE'

and lot_number like '%2303700073601%'
order by transaction_date desc

insert into xodi_inv_glt_int (transaction_id
            ,instruction_list
            ,transaction_date
            ,line_no
            ,line_type
            ,item_id
            ,netto
            ,bruto
            ,tara
            ,uom
            ,lot_number
            ,io_id
            ,IO_CODE
            ,subinventory_code
            ,upload_flag
            ,created_by)
(select null
            ,'012/24-241106'
            ,transaction_date
            ,line_no
            ,line_type
            ,item_id
            ,1
            ,2
            ,1
            ,uom
            ,lot_number||'C'
            ,io_id
            ,IO_CODE
            ,subinventory_code
            ,null
--            ,null upload_message
--            ,null action_description
--            ,null description
--            ,null creation_date
            ,'IWANHE'
from xodi_inv_glt_int
where 1=1
and instruction_list='009/24-240911'
--and line_type='-1'
--and instruction_list='005/24-240910-01'
--order by transaction_id desc
)