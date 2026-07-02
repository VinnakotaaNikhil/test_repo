{{ config(schema='dbt_intermediate') }}

with int_inventory_status as (
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
        unit_cost,

        case 
            when stock_on_hand < reorder_point then 'Reorder Needed'
            when stockout_flag = 1 then 'Stockout'
            else 'Sufficient Stock'
        end as inventory_status

from {{ ref('stg_inventory') }}
)

select * from int_inventory_status