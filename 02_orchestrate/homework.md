Question 1
  
![alt text](q1.png)
  
  
Question 2<br>
file: "{{inputs.taxi}}_tripdata_{{inputs.year}}-{{inputs.month}}.csv" --> green_tripdata_2020-04.csv  <br><br>
  
  
Question 3  
  
select date_trunc(tpep_pickup_datetime,year), count(*) from `de_zoomcamp_kry.yellow_tripdata`  
where date_trunc(tpep_pickup_datetime,year) = '2020-01-01'  
group by 1<br><br>

Question 4<br>  
select date_trunc(lpep_pickup_datetime,year), count(*) from `de_zoomcamp_kry.green_tripdata`  
where date_trunc(lpep_pickup_datetime,year) = '2020-01-01'  
group by 1  

Question 5<br>
select date_trunc(tpep_pickup_datetime,month), count(*) from `de_zoomcamp_kry.yellow_tripdata`<br>
where date_trunc(tpep_pickup_datetime,month) = '2021-03-01'<br>
group by 1  
  
Question 6<br>
Source: Kestra documentation for triggers plugin - https://kestra.io/plugins/core/triggers/io.kestra.plugin.core.trigger.schedule#timezone
The time zone identifier (i.e. the second column in the Wikipedia table) to use for evaluating the cron expression. Default value is the server default zone ID.