with stg_order_items as(
    select * from {{ source('dbt_source', 'src_order_items') }}
)


select 
        order_id,
        product_id,
        product_category_name,
        quantity,
        unit_price,
        freight_price,
        discount_pct as discount_percentage,
        item_total,
        month,
        year   

    from stg_order_items