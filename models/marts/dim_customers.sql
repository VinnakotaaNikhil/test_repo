{{ config (schema = 'dbt_marts') }}

with dim_customers as (

    select
        customer_id,
        customer_city,
        customer_segment,
        acquisition_channel,
        signup_date
    from {{ ref('stg_customers') }}

)

select * from dim_customers