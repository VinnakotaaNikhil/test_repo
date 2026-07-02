{% snapshot snap_product_price %}
{{
    config(
        target_database='internship-project-484400',
        target_schema='dbt_snapshots',
        unique_key='product_id',
        strategy='check',
        check_cols=['unit_price']
    )
}}

select * from {{ ref('stg_retail_price') }}
{% endsnapshot %}