with stg_orders as(
    select * from {{ source('dbt_source', 'src_orders') }}
)

select 
        order_id,
        customer_id,
        order_purchase_timestamp,
        order_status,
        payment_method,
        customer_city,
        sales_channel,
        order_total
 from stg_orders