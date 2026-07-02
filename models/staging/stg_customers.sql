with stg_customer as(
    select * from {{ source('dbt_source', 'src_customers') }}
)

select 
        customer_id,
        customer_city,
        customer_segment,
        acquisition_channel,
        signup_date
 from stg_customer