with stg_products as(
    select * from {{ source('dbt_source', 'src_products') }}
)

select 
        product_id,
        product_category_name,
        product_name_length,
        product_description_length,
        product_photos_qty as product_photos_quality,
        product_weight_g as product_weight_grams,
        product_score,
        is_active
 from stg_products