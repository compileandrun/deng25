select date_trunc('month',lpep_pickup_datetime) as month, count(*) as count
from green_tripdata
group by 1
order by 1 DESC;
###