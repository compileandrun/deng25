#docker/dockerfile:1 #eventually not used
FROM python:3.9.1

RUN apt-get install wget
#RUN pip install dlt
#RUN pip install "dlt[duckdb]"
WORKDIR /dlt
COPY . .
RUN pip install --requirement requirements.txt


ENTRYPOINT ["python","binance_flow.py"]