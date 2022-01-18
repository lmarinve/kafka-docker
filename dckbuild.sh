#!/bin/sh

docker build -f Dockerfile -t os_image .
docker build -f kafka/Dockerfile -t kafka_image .
docker build -f consumer/Dockerfile -t consumer_image .

