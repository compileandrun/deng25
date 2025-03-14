#Q1
os.chdir('/Users/koray/Documents/GitHub/deng25/05_spark')
os.getcwd()

# Create SparkSession
#local master - this master method is for cardinating clusters
#number of clusters to be used
spark = SparkSession.builder.master("local[3]") \
                    .appName('test-spark') \
                    .getOrCreate()

print(f'The PySpark {spark.version} version is running...')

#Q2
output_path = 'data/'
df = df.repartition(4)
df.write.parquet('output')

#Q3
df.registerTempTable('df_data')
spark.sql("""
SELECT count(*) FROM df_data where date(tpep_pickup_datetime) = '2024-10-15' 
""").show()

#Q4
spark.sql("""
SELECT max(timestampdiff(hour,tpep_pickup_datetime,tpep_dropoff_datetime)) FROM df_data
""").show()

#Q6
!wget https://d37ci6vzurychx.cloudfront.net/misc/taxi_zone_lookup.csv
df_zones = spark.read \
    .option("header", "true") \
    .csv('taxi_zone_lookup.csv')

df_zones.show()

df_zones.registerTempTable('zones')

spark.sql("""
SELECT z.zone,count(*) FROM df_data d
left join zones z
on d.PULocationID = z.LocationID
group by 1
order by 2 ASC
""").show(truncate=False)