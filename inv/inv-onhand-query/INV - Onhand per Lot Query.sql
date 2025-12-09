/* Formatted on 08/12/2025 23:01:12 (QP5 v5.362) */
--explore
SELECT *
  FROM (  SELECT DISTINCT
                 mp.organization_code,
                 msi.secondary_inventory_name
                     subinventory,
                 xxen_util.meaning (NVL (msi.subinventory_type, 1),
                                    'MTL_SUB_TYPES',
                                    700)
                     subinventory_type,
                 inv_project.get_locator (moqd.locator_id,
                                          moqd.organization_id)
                     locator,
--                 xxen_util.meaning (mil.inventory_location_type,
--                                    'MTL_LOCATOR_TYPES',
--                                    700)
--                     locator_type,
--                 mmsv.status_code
--                     status,
                 msiv.concatenated_segments
                     item,
                 msiv.description
                     item_description,
                 moqd.revision,
                 muot.unit_of_measure_tl
                     unit_of_measure,
                 SUM (moqd.primary_transaction_quantity)
                     OVER (PARTITION BY moqd.organization_id,
                                        moqd.inventory_item_id,
                                        moqd.revision,
                                        moqd.lot_number,
                                        moqd.cost_group_id,
                                        moqd.subinventory_code,
                                        moqd.locator_id,
                                        moqd.lpn_id,
                                        moqd.project_id,
                                        moqd.task_id,
                                        moqd.owning_tp_type,
                                        moqd.owning_organization_id,
                                        moqd.planning_tp_type,
                                        moqd.planning_organization_id)
                     on_hand,
                 mr.reserved,
                 SUM (
                     DECODE (moqd.containerized_flag,
                             1, 0,
                             moqd.primary_transaction_quantity))
                     OVER (PARTITION BY moqd.organization_id,
                                        moqd.inventory_item_id,
                                        moqd.revision,
                                        moqd.lot_number,
                                        moqd.cost_group_id,
                                        moqd.subinventory_code,
                                        moqd.locator_id,
                                        moqd.lpn_id,
                                        moqd.project_id,
                                        moqd.task_id,
                                        moqd.owning_tp_type,
                                        moqd.owning_organization_id,
                                        moqd.planning_tp_type,
                                        moqd.planning_organization_id)
                     unpacked,
                 SUM (
                     DECODE (moqd.containerized_flag,
                             1, moqd.primary_transaction_quantity,
                             0))
                     OVER (PARTITION BY moqd.organization_id,
                                        moqd.inventory_item_id,
                                        moqd.revision,
                                        moqd.lot_number,
                                        moqd.cost_group_id,
                                        moqd.subinventory_code,
                                        moqd.locator_id,
                                        moqd.lpn_id,
                                        moqd.project_id,
                                        moqd.task_id,
                                        moqd.owning_tp_type,
                                        moqd.owning_organization_id,
                                        moqd.planning_tp_type,
                                        moqd.planning_organization_id)
                     packed,
--                 wlpn.license_plate_number,
                 moqd.lot_number,
                 mln.expiration_date
                     lot_expiration_date,
                 ccg.cost_group,
--                 ppa.project_number
--                     project,
--                 pt.task_number
--                     task,
                 xxen_util.meaning (moqd.owning_tp_type, 'MTL_TP_TYPES', 3)
                     owning_tp_type,
                    asu.vendor_name
                 || NVL2 (assa.vendor_site_code, '-', NULL)
                 || assa.vendor_site_code
                     owning_party,
                 xxen_util.meaning (moqd.planning_tp_type, 'MTL_TP_TYPES', 3)
                     planning_tp_type,
                 DECODE (moqd.planning_tp_type,
                         2, mp2.organization_code,
                         1, assa2.vendor_site_code,
                         moqd.planning_organization_id)
                     planning_org,
                 NVL (
                     xxen_util.meaning (msiv.serial_number_control_code,
                                        'CSP_INV_ITEM_SERIAL_CONTROL',
                                        0),
                     xxen_util.meaning (msiv.serial_number_control_code,
                                        'MTL_SERIAL_NUMBER',
                                        700))
                     serial_control,
                 xxen_util.meaning (msiv.lot_control_code,
                                    'MTL_LOT_CONTROL',
                                    700)
                     lot_control,
                 xxen_util.meaning (msi.availability_type,
                                    'MTL_AVAILABILITY',
                                    700)
                     availability_type,
                 MAX (moqd.date_received)
                     OVER (PARTITION BY moqd.organization_id,
                                        moqd.inventory_item_id,
                                        moqd.revision,
                                        moqd.lot_number,
                                        moqd.cost_group_id,
                                        moqd.subinventory_code,
                                        moqd.locator_id,
                                        moqd.lpn_id,
                                        moqd.project_id,
                                        moqd.task_id,
                                        moqd.owning_tp_type,
                                        moqd.owning_organization_id,
                                        moqd.planning_tp_type,
                                        moqd.planning_organization_id)
                     date_received,
--                 msiv.list_price_per_unit,
--                 msiv.min_minmax_quantity,
--                 msiv.max_minmax_quantity,
                 (SELECT DISTINCT
                         MAX (mss.safety_stock_quantity)
                         KEEP (DENSE_RANK LAST ORDER BY mss.effectivity_date)
                         OVER (
                             PARTITION BY mss.organization_id,
                                          mss.inventory_item_id)    safety_stock
                    FROM mtl_safety_stocks mss
                   WHERE     moqd.organization_id = mss.organization_id
                         AND moqd.inventory_item_id = mss.inventory_item_id
                         AND mss.effectivity_date <= SYSDATE)
                     safety_stock,
                 moqd.inventory_item_id,
                 moqd.organization_id,
                 moqd.subinventory_code
--                 ,
--                 SUM (moqd.primary_transaction_quantity)
--                     OVER (PARTITION BY moqd.inventory_item_id)
--                     on_hand_sum
            FROM mtl_onhand_quantities_detail moqd,
                 mtl_parameters              mp,
                 mtl_secondary_inventories   msi,
                 mtl_item_locations          mil,
                 mtl_material_statuses_vl    mmsv,
                 wms_license_plate_numbers   wlpn,
                 mtl_system_items_vl         msiv,
                 mtl_units_of_measure_tl     muot,
                 ap_supplier_sites_all       assa,
                 ap_suppliers                asu,
                 mtl_parameters              mp2,
                 ap_supplier_sites_all       assa2,
                 mtl_lot_numbers             mln,
                 cst_cost_groups             ccg,
                 (SELECT ppa.project_id, ppa.segment1 project_number
                    FROM pa_projects_all ppa
                  UNION
                  SELECT psm.project_id, psm.project_number
                    FROM pjm_seiban_numbers psm) ppa,
                 pa_tasks                    pt,
                 (SELECT DISTINCT
                         SUM (mr.primary_reservation_quantity)
                             OVER (
                                 PARTITION BY mr.inventory_item_id,
                                              mr.organization_id,
                                              mr.subinventory_code)
                             reserved,
                         mr.inventory_item_id,
                         mr.organization_id,
                         mr.subinventory_code
                    FROM mtl_reservations mr) mr
           WHERE     1 = 1
                 AND moqd.organization_id = mp.organization_id
                 AND moqd.organization_id = msi.organization_id(+)
                 AND moqd.subinventory_code = msi.secondary_inventory_name(+)
                 AND moqd.organization_id = mil.organization_id(+)
                 AND moqd.locator_id = mil.inventory_location_id(+)
                 AND mil.status_id = mmsv.status_id(+)
                 AND moqd.lpn_id = wlpn.lpn_id(+)
                 AND moqd.organization_id = msiv.organization_id
                 AND moqd.inventory_item_id = msiv.inventory_item_id
                 AND msiv.primary_uom_code = muot.uom_code(+)
                 AND muot.language(+) = USERENV ('lang')
                 AND DECODE (moqd.owning_tp_type,
                             1, moqd.owning_organization_id) =
                     assa.vendor_site_id(+)
                 AND assa.vendor_id = asu.vendor_id(+)
                 AND DECODE (moqd.planning_tp_type,
                             2, moqd.planning_organization_id) =
                     mp2.organization_id(+)
                 AND DECODE (moqd.planning_tp_type,
                             1, moqd.planning_organization_id) =
                     assa2.vendor_site_id(+)
                 AND moqd.inventory_item_id = mln.inventory_item_id(+)
                 AND moqd.organization_id = mln.organization_id(+)
                 AND moqd.lot_number = mln.lot_number(+)
                 AND moqd.cost_group_id = ccg.cost_group_id(+)
                 AND moqd.project_id = ppa.project_id(+)
                 AND moqd.task_id = pt.task_id(+)
                 AND moqd.inventory_item_id = mr.inventory_item_id(+)
                 AND moqd.organization_id = mr.organization_id(+)
                 AND moqd.subinventory_code = mr.subinventory_code(+)
        ORDER BY --on_hand_sum DESC,
                 item,
                 on_hand DESC
                 )
 WHERE 1 = 1 AND organization_id = 94 --PMP
 
 
--Query simple dan summary untuk per IO per Lot Number
SELECT
    ood.organization_id,
    ood.organization_code,
    msib.inventory_item_id,
    msib.segment1||'.'||msib.segment2||'.'||msib.segment3            AS item_number,
    moqd.lot_number,
    msib.primary_uom_code,
    SUM(moqd.primary_transaction_quantity) AS onhand_qty
FROM
    mtl_onhand_quantities_detail moqd,
    mtl_system_items_b           msib,
    org_organization_definitions ood
WHERE
    moqd.inventory_item_id = msib.inventory_item_id
AND moqd.organization_id  = msib.organization_id
AND ood.organization_id   = moqd.organization_id
and ood.organization_code='PMP'
-- Optional filter:
-- AND ood.organization_code = :p_org_code
-- AND msib.segment1         = :p_item_number
-- AND moqd.lot_number       = :p_lot_number
GROUP BY
    ood.organization_id,
    ood.organization_code,
    msib.inventory_item_id,
    msib.segment1||'.'||msib.segment2||'.'||msib.segment3,
    moqd.lot_number,
    msib.primary_uom_code
HAVING
    SUM(moqd.primary_transaction_quantity) <> 0;
    
-- Query lebih lengkap infonya, detailnya belum dipivot

/* ============================================================================
   Query: Inventory On-Hand Quantities Report
   Purpose: Display on-hand inventory with detailed breakdowns
   Optimized: December 2025
   ============================================================================ */

/* Formatted on 09/12/2025 07:40:32 (QP5 v5.362) */
SELECT *
  FROM (  SELECT DISTINCT
                 -- Organization & Subinventory
                 mp.organization_code,
                 msi.secondary_inventory_name
                     AS subinventory,
                 xxen_util.meaning (NVL (msi.subinventory_type, 1),
                                    'MTL_SUB_TYPES',
                                    700)
                     AS subinventory_type,
                 -- Location
                 inv_project.get_locator (moqd.locator_id,
                                          moqd.organization_id)
                     AS locator,
                 -- Item Information
                 msiv.concatenated_segments
                     AS item,
                 msiv.description
                     AS item_description,
                 moqd.revision,
                 muot.unit_of_measure_tl
                     AS unit_of_measure,
                 -- Quantity Calculations
                 SUM (moqd.primary_transaction_quantity)
                     OVER (PARTITION BY moqd.organization_id,
                                        moqd.inventory_item_id,
                                        moqd.revision,
                                        moqd.lot_number,
                                        moqd.cost_group_id,
                                        moqd.subinventory_code,
                                        moqd.locator_id,
                                        moqd.lpn_id,
                                        moqd.project_id,
                                        moqd.task_id,
                                        moqd.owning_tp_type,
                                        moqd.owning_organization_id,
                                        moqd.planning_tp_type,
                                        moqd.planning_organization_id)
                     AS on_hand,
                 mr.reserved,
                 -- Unpacked Quantity
                 SUM (
                     DECODE (moqd.containerized_flag,
                             1, 0,
                             moqd.primary_transaction_quantity))
                     OVER (PARTITION BY moqd.organization_id,
                                        moqd.inventory_item_id,
                                        moqd.revision,
                                        moqd.lot_number,
                                        moqd.cost_group_id,
                                        moqd.subinventory_code,
                                        moqd.locator_id,
                                        moqd.lpn_id,
                                        moqd.project_id,
                                        moqd.task_id,
                                        moqd.owning_tp_type,
                                        moqd.owning_organization_id,
                                        moqd.planning_tp_type,
                                        moqd.planning_organization_id)
                     AS unpacked,
                 -- Packed Quantity
                 SUM (
                     DECODE (moqd.containerized_flag,
                             1, moqd.primary_transaction_quantity,
                             0))
                     OVER (PARTITION BY moqd.organization_id,
                                        moqd.inventory_item_id,
                                        moqd.revision,
                                        moqd.lot_number,
                                        moqd.cost_group_id,
                                        moqd.subinventory_code,
                                        moqd.locator_id,
                                        moqd.lpn_id,
                                        moqd.project_id,
                                        moqd.task_id,
                                        moqd.owning_tp_type,
                                        moqd.owning_organization_id,
                                        moqd.planning_tp_type,
                                        moqd.planning_organization_id)
                     AS packed,
                 -- Lot Information
                 moqd.lot_number,
                 mln.expiration_date
                     AS lot_expiration_date,
                 -- Cost Group
                 ccg.cost_group,
                 -- Trading Partner Information
                 xxen_util.meaning (moqd.owning_tp_type, 'MTL_TP_TYPES', 3)
                     AS owning_tp_type,
                    asu.vendor_name
                 || NVL2 (assa.vendor_site_code, '-', NULL)
                 || assa.vendor_site_code
                     AS owning_party,
                 xxen_util.meaning (moqd.planning_tp_type, 'MTL_TP_TYPES', 3)
                     AS planning_tp_type,
                 DECODE (moqd.planning_tp_type,
                         2, mp2.organization_code,
                         1, assa2.vendor_site_code,
                         moqd.planning_organization_id)
                     AS planning_org,
                 -- Item Control Attributes
                 NVL (
                     xxen_util.meaning (msiv.serial_number_control_code,
                                        'CSP_INV_ITEM_SERIAL_CONTROL',
                                        0),
                     xxen_util.meaning (msiv.serial_number_control_code,
                                        'MTL_SERIAL_NUMBER',
                                        700))
                     AS serial_control,
                 xxen_util.meaning (msiv.lot_control_code,
                                    'MTL_LOT_CONTROL',
                                    700)
                     AS lot_control,
                 xxen_util.meaning (msi.availability_type,
                                    'MTL_AVAILABILITY',
                                    700)
                     AS availability_type,
                 -- Date Received
                 MAX (moqd.date_received)
                     OVER (PARTITION BY moqd.organization_id,
                                        moqd.inventory_item_id,
                                        moqd.revision,
                                        moqd.lot_number,
                                        moqd.cost_group_id,
                                        moqd.subinventory_code,
                                        moqd.locator_id,
                                        moqd.lpn_id,
                                        moqd.project_id,
                                        moqd.task_id,
                                        moqd.owning_tp_type,
                                        moqd.owning_organization_id,
                                        moqd.planning_tp_type,
                                        moqd.planning_organization_id)
                     AS date_received,
                 -- Safety Stock (Subquery)
                 (SELECT DISTINCT
                         MAX (mss.safety_stock_quantity)
                         KEEP (DENSE_RANK LAST ORDER BY mss.effectivity_date)
                         OVER (
                             PARTITION BY mss.organization_id,
                                          mss.inventory_item_id)    AS safety_stock
                    FROM mtl_safety_stocks mss
                   WHERE     moqd.organization_id = mss.organization_id
                         AND moqd.inventory_item_id = mss.inventory_item_id
                         AND mss.effectivity_date <= SYSDATE)
                     AS safety_stock,
                 -- IDs for filtering
                 moqd.inventory_item_id,
                 moqd.organization_id,
                 moqd.subinventory_code
            FROM mtl_onhand_quantities_detail moqd
                 -- Core Tables
                 INNER JOIN mtl_parameters mp
                     ON moqd.organization_id = mp.organization_id
                 INNER JOIN mtl_system_items_vl msiv
                     ON     moqd.organization_id = msiv.organization_id
                        AND moqd.inventory_item_id = msiv.inventory_item_id
                 -- Optional Tables (Outer Joins)
                 LEFT OUTER JOIN mtl_secondary_inventories msi
                     ON     moqd.organization_id = msi.organization_id
                        AND moqd.subinventory_code =
                            msi.secondary_inventory_name
                 LEFT OUTER JOIN mtl_item_locations mil
                     ON     moqd.organization_id = mil.organization_id
                        AND moqd.locator_id = mil.inventory_location_id
                 LEFT OUTER JOIN mtl_material_statuses_vl mmsv
                     ON mil.status_id = mmsv.status_id
                 LEFT OUTER JOIN wms_license_plate_numbers wlpn
                     ON moqd.lpn_id = wlpn.lpn_id
                 LEFT OUTER JOIN mtl_units_of_measure_tl muot
                     ON     msiv.primary_uom_code = muot.uom_code
                        AND muot.language = USERENV ('lang')
                 -- Supplier Information
                 LEFT OUTER JOIN ap_supplier_sites_all assa
                     ON DECODE (moqd.owning_tp_type,
                                1, moqd.owning_organization_id) =
                        assa.vendor_site_id
                 LEFT OUTER JOIN ap_suppliers asu
                     ON assa.vendor_id = asu.vendor_id
                 -- Planning Organization
                 LEFT OUTER JOIN mtl_parameters mp2
                     ON DECODE (moqd.planning_tp_type,
                                2, moqd.planning_organization_id) =
                        mp2.organization_id
                 LEFT OUTER JOIN ap_supplier_sites_all assa2
                     ON DECODE (moqd.planning_tp_type,
                                1, moqd.planning_organization_id) =
                        assa2.vendor_site_id
                 -- Lot Numbers
                 LEFT OUTER JOIN mtl_lot_numbers mln
                     ON     moqd.inventory_item_id = mln.inventory_item_id
                        AND moqd.organization_id = mln.organization_id
                        AND moqd.lot_number = mln.lot_number
                 -- Cost Group
                 LEFT OUTER JOIN cst_cost_groups ccg
                     ON moqd.cost_group_id = ccg.cost_group_id
                 -- Project Information
                 LEFT OUTER JOIN
                 (SELECT ppa.project_id, ppa.segment1 AS project_number
                    FROM pa_projects_all ppa
                  UNION
                  SELECT psm.project_id, psm.project_number
                    FROM pjm_seiban_numbers psm) ppa
                     ON moqd.project_id = ppa.project_id
                 LEFT OUTER JOIN pa_tasks pt ON moqd.task_id = pt.task_id
                 -- Reservations
                 LEFT OUTER JOIN
                 (SELECT DISTINCT
                         SUM (mr.primary_reservation_quantity)
                             OVER (
                                 PARTITION BY mr.inventory_item_id,
                                              mr.organization_id,
                                              mr.subinventory_code)
                             AS reserved,
                         mr.inventory_item_id,
                         mr.organization_id,
                         mr.subinventory_code
                    FROM mtl_reservations mr) mr
                     ON     moqd.inventory_item_id = mr.inventory_item_id
                        AND moqd.organization_id = mr.organization_id
                        AND moqd.subinventory_code = mr.subinventory_code
        ORDER BY item, on_hand DESC)
 WHERE organization_id = 94                                -- PMP Organization
 ;