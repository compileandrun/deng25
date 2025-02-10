--Creating the External table--
CREATE EXTERNAL TABLE stellar-day-445214-e5.hw3.yellow_taxi_ext
OPTIONS (
  format='parquet',
  uris=['gs://dataeng_hw3/yellow_tripdata_2024*']
);

--Q1-- check the number of rows in the table
SELECT 
  count(*) 
FROM `stellar-day-445214-e5.hw3.yellow_taxi_ext`

--Creating regular table--
CREATE OR REPLACE TABLE stellar-day-445214-e5.hw3.yellow_taxi
AS SELECT * FROM stellar-day-445214-e5.hw3.yellow_taxi_ext;

--Q2--
--it is always 0 from external table because it cannot be read from GCS.
SELECT 
  count(distinct PULocationID) 
FROM `stellar-day-445214-e5.hw3.yellow_taxi_ext`

SELECT 
  count(distinct PULocationID) 
FROM `stellar-day-445214-e5.hw3.yellow_taxi`

--Q4--
SELECT 
  count(*) 
FROM `stellar-day-445214-e5.hw3.yellow_taxi`
where fare_amount = 0

--Q6-- Creating the partitioned and clustered table
CREATE OR REPLACE TABLE stellar-day-445214-e5.hw3.yellow_taxi_p
partition by date(tpep_dropoff_datetime)
  cluster by VendorID
AS SELECT * FROM stellar-day-445214-e5.hw3.yellow_taxi_ext

select count(distinct VendorID) from `hw3.yellow_taxi`
where tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15' --310mb

select count(distinct VendorID) from `hw3.yellow_taxi_p`
where tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15' --26.84mb