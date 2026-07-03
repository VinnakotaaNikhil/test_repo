{{ config(schema='dbt_marts' }}

with fact_sales as(

    select 
        customer_id,
        product_id,
        quantity,
        item_total,
        order_id,
        order_purchase_timestamp

    from {{ ref('int_sales_enriched') }}  

)

select * from fact_sales

