{{ config (schema = 'dbt_intermediate' )}}

with int_product_pricing as (

select  
        p.product_id,
        p.product_category_name,
        p.product_name_length,
        p.product_description_length,	
        p.product_photos_quality,	
        p.product_weight_grams,	
        p.product_score,
        p.is_active,
        r.month_year,
        r.quantity,
        r.total_price,
        r.freight_price,
        r.unit_price,
        r.customers,
        r.week_day,
        r.weekend,
        r.holiday,
        r.month,
        r.year,
        r.sale,
        r.volume,
        r.competitor_1,
        r.ps1,
        r.fp1,
        r.competitor_2,
        r.ps2,
        r.fp2,
        r.competitor_3,
        r.ps3,
        r.fp3,
        r.lag_price

from {{ ref('stg_retail_price') }} r
join {{ ref('stg_products') }} p
    on r.product_id = p.product_id
)

select * from int_product_pricing