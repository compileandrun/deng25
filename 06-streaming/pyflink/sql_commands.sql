select count(*) from processed_events

CREATE TABLE processed_events (
            lpep_pickup_datetime   VARCHAR,
            lpep_dropoff_datetime  VARCHAR,
            PULocationID           INTEGER,
            DOLocationID           INTEGER,
            passenger_count        FLOAT,
            trip_distance          FLOAT,
            tip_amount             FLOAT
        )
		
DROP TABLE processed_events