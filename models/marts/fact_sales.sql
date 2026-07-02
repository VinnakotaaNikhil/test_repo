{{ config(schema='dbt_marts',
            materialized = 'incremental',
                unique_key = 'order_id') }}

with fact_sales as(

    select 
        customer_id,
        product_id,
        quantity,
        item_total,
        order_id,
        order_purchase_timestamp

    from {{ ref('int_sales_enriched') }}  

    
{% if is_incremental() %}
    where order_purchase_timestamp > (select max(order_purchase_timestamp) from {{ this }})
{% endif %}
)

select * from fact_sales

