Question 1  
docker run -it --entrypoint /bin/bash python:3.12.8
pip --version <br><br>

Question 2  
We type localhost:5433 to connect to the WEB UI of pgadmin.<br>
Then, when we connect to the database, we use the service name **db** and port (first port number in the docker-compose.yml) **5433**. <br><br>

Question 3<br>
select  
	case  
		when trip_distance <= 1 THEN '1.<=1'  
		when trip_distance BETWEEN 1 AND 3 THEN '2.1-3'  
		when trip_distance BETWEEN 3 AND 7 THEN '3.3-7'  
		when trip_distance BETWEEN 7 AND 10 THEN '4.7-10'  
		when trip_distance > 10 THEN '5.>10'  
	ELSE 'unknown' END as distance_groups,  
	count(*) from green_taxi_trips  
where date_trunc('month',lpep_pickup_datetime) = '2019-10-01'  
group by 1  
order by 1 ASC<br><br>

Question 4<br>
select lpep_pickup_datetime,trip_distance from green_taxi_trips  
where trip_distance = (select max(trip_distance) from green_taxi_trips)<br><br>

Question 5 <br>