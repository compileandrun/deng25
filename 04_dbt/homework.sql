--Q1
/*
sources:
  - name: raw_nyc_tripdata
    database: "{{ env_var('DBT_BIGQUERY_PROJECT', 'dtc_zoomcamp_2025') }}"
    schema:   "{{ env_var('DBT_BIGQUERY_SOURCE_DATASET', 'raw_nyc_tripdata') }}"

export DBT_BIGQUERY_PROJECT=myproject
export DBT_BIGQUERY_DATASET=my_nyc_tripdata
*/
--


--Q2
--This is how I used the filter with a var and env_var. 
{% if var (days_limit,default = 30)%} --#this 30 is just placeholder.

and cast(tpep_pickup_datetime as timestamp) >= CURRENT_TIMESTAMP - INTERVAL '{{ var("days_back", env_var("DBT_DAYS_BACK", "30")) }}' DAY
--I had to change the env_name because it had to start with DBT_
{% endif %}