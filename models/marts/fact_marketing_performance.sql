{{config (schema = 'dbt_marts')}}

with fact_marketing_performance as(

    select 
            
        campaign_id,
        campaign_month,
        product_id,
        product_category_name,
        channel,
        impressions,
        clicks,
        spend,
        click_through_rate,
        conversion_rate,
        cost_per_acquisition,
        return_on_ad_spend

    from {{ref('int_marketing_performance')}}
    
)

select * from fact_marketing_performance