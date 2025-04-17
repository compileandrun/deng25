
{{ config(materialized='table') }}


select
*
from {{source('elegant','binance_data')}}

/*
    Uncomment the line below to remove records with null `id` values
*/

-- where id is not null
