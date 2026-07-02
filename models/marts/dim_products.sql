{{ config (schema = 'dbt_marts') }}

with dim_products as (
    select 
        product_id,
        product_category_name,
        product_name_length,
        product_description_length,
        product_photos_quality,
        product_weight_grams,
        product_score,
        is_active
    from {{ ref('stg_products') }}
)

select * from dim_products