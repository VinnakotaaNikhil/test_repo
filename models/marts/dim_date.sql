{{ config (schema = 'dbt_marts') }}


with date_spine as (
    select date_value
    from unnest(generate_date_array('2017-01-01', '2018-12-31')) as date_value  
),

date_att as (
    select
        date(date_value) as date,
        extract(year from date_value) as year,
        extract(month from date_value) as month,
        extract(quarter from date_value) as quarter,

        case 

        when format_date('%A', date_value) = 'Monday' then 1
        when format_date('%A', date_value) = 'Tuesday' then 2
        when format_date('%A', date_value) = 'Wednesday' then 3
        when format_date('%A', date_value) = 'Thursday' then 4
        when format_date('%A', date_value) = 'Friday' then 5
        when format_date('%A', date_value) = 'Saturday' then 6
        when format_date('%A', date_value) = 'Sunday' then 7
        end as day_of_week

    from date_spine
),



dim_date as (
            select
                date,
                month,
                year,
                quarter,
                day_of_week,

                case
                    when day_of_week in (6,7) then 'Weekend'
                    else 'Weekday'
                    end as is_weekend

        from date_att
)

select * from dim_date