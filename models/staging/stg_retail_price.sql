with stg_retail_price as(
    select * from {{ source('dbt_source', 'src_retail_price') }}
)


select 
    product_id,
    product_category_name as product_category,
    month_year,
    qty as quantity,
    total_price,
    freight_price,
    unit_price,
    product_name_lenght as product_name_length,
    product_description_lenght as product_description_length,
    product_photos_qty as product_photos_quantity,
    product_weight_g as product_weight_grams,
    product_score,
    customers,
    weekday as week_day,
    weekend,
    holiday,
    month,
    year,
    s as sale,
    volume,
    comp_1 as competitor_1,
    ps1,
    fp1,
    comp_2 as competitor_2,
    ps2,
    fp2,
    comp_3 as competitor_3,
    ps3,
    fp3,
    lag_price
from stg_retail_price
    