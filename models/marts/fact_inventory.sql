{{ config(schema='dbt_marts') }}

with fact_inventory as(

    select 
        product_id,
        inventory_id,
        warehouse_id,
        stock_on_hand,
        reorder_point,
        units_sold,
        stockout_flag,
        supplier_lead_time_days,
        unit_cost,
        inventory_status

    from {{ ref('int_inventory_status') }}  

    
)

select * from fact_inventory