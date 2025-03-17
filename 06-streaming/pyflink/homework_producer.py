#Hello, included the command line commands for the first 2 questions and the code for the 4th question.
#Q1
#docker exec -it redpanda-1 sh -c "rpk --version"

#Q2
#docker exec -it redpanda-1 sh -c "rpk topic create green_trips"

#Code for Question 4
import sys
from time import time
import pandas as pd

#sys.prefix
#pip install kafka-python

import json
from kafka import KafkaProducer

def json_serializer(data):
    return json.dumps(data).encode('utf-8')

server = 'localhost:9092'

producer = KafkaProducer(
    bootstrap_servers=[server],
    value_serializer=json_serializer
)

producer.bootstrap_connected()

df = pd.read_csv('green_tripdata_2019-10.csv.gz',compression='gzip')

df.info()

column_list = ['lpep_pickup_datetime',
'lpep_dropoff_datetime',
'PULocationID',
'DOLocationID',
'passenger_count',
'trip_distance',
'tip_amount']
df = df[column_list]
df.info()
df.head()

my_dict = df.to_dict(orient='records')

t0 = time()
for message in my_dict:
    topic_name = 'green_trips'
    producer.send(topic_name, value=message)
t1 = time()
took = t1 - t0
print(took)

producer.flush()




