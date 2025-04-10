#docker/dockerfile:1
#FROM ubuntu:22.04
FROM python:3.9.1

#RUN apt-get update && apt-get install -y python3 python3-pip
RUN apt-get install wget
RUN pip install pandas

WORKDIR /

COPY test.py test.py

#these entry points point to the executable and the file
ENTRYPOINT [ "python","test.py" ] 

#the CMD points to the arguments (that I use in the python file)
CMD ["Berlin"]