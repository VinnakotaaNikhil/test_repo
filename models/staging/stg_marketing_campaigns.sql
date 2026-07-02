with stg_marketing_campaigns as(
    select * from {{ source('dbt_source', 'src_marketing_campaigns') }}
)

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
        attributed_revenue  
 from stg_marketing_campaigns