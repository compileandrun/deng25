{{
    config(
        materialized='table' ,
        schema=resolve_schema_for('core')
    )
}}

with fact_trips as (
    select *
    from {{ ref('fact_trips') }}
)
select
   date_trunc(pickup_datetime,quarter) as year_quarter,
    sum(total_amount) as total_amount
from fact_trips
group by 1