with stg_inventory as(
    select * from {{ source('dbt_source', 'src_inventory') }}
)

select 
        inventory_id,
        product_id,
        warehouse_id,
        month,
        year,
        stock_on_hand,
        reorder_point,
        units_sold,
        stockout_flag,
        supplier_lead_time_days,
        unit_cost
 from stg_inventory

