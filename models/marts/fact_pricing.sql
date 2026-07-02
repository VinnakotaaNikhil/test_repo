{{config (schema = 'dbt_marts' )}}

with fact_pricing as (

            select
                product_id,
                total_price,
                freight_price,
                unit_price,
                competitor_1,
                ps1,
                fp1,
                competitor_2,
                ps2,
                fp2,
                competitor_3,
                ps3,
                fp3,
                lag_price

            from {{ref ('int_product_pricing')}}
)

select * from fact_pricing