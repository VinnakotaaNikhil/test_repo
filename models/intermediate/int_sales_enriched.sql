{{config(schema = 'dbt_intermediate' )}}


with int_sales_enriched as (


    select 
            c.customer_id,
            c.customer_city,
            c.customer_segment,
            c.acquisition_channel,
            c.signup_date,
            i.product_id,
            i.product_category_name,
            i.quantity,
            i.unit_price,
            i.freight_price,
            i.discount_percentage,
            i.item_total,
            i.month,
            i.year,
            o.order_id,
            o.order_purchase_timestamp,
            o.order_status,
            o.payment_method,
            o.sales_channel,
            o.order_total

    from {{ ref('stg_customers') }} c

    join {{ref('stg_orders')}} o
            on c.customer_id = o.customer_id
    join {{ref ('stg_order_items')}} i
            on o.order_id = i.order_id
               
)



select * from int_sales_enriched