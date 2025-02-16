#Q1
!dlt --version
#Answer: dlt 1.6.1

#Q2 - 2 versions
#v1
con.sql('select * from duckdb_tables()').fetchdf()

#v2
con.sql(f"SET search_path = '{pipeline.dataset_name}'")
con.sql("DESCRIBE").df() 
#Answer 4 tables

#Q3 - 2 versions
#v1
con.sql('select * from ny_taxi_data.sample_taxi_rides').fetchdf()

#v2
pipeline.dataset(dataset_type="default").sample_taxi_rides.df()
#Answer 10000 rows

#Q4
with pipeline.sql_client() as client:
    res = client.execute_sql(
            """
            SELECT
            AVG(date_diff('minute', trip_pickup_date_time, trip_dropoff_date_time))
            FROM sample_taxi_rides;
            """
        )
    # Prints column values of the first row
    print(res)
#Answer 12.3049