{{ config(schema='dbt_intermediate') }}

with int_marketing_performance as (

    select
        campaign_id,
        campaign_month,
        product_id,
        product_category_name,
        channel,
        impressions,
        clicks,
        spend,
        conversions,
        attributed_revenue,
        SAFE_DIVIDE(clicks, impressions) as click_through_rate,
        SAFE_DIVIDE(conversions, clicks) as conversion_rate,
        SAFE_DIVIDE(spend, conversions) as cost_per_acquisition,
        SAFE_DIVIDE((attributed_revenue - spend), spend ) as return_on_ad_spend


    from {{ ref('stg_marketing_campaigns') }}
)

select * from int_marketing_performance