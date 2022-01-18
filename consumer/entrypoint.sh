#!/bin/sh
set -e

while ! nc -z influxdb 8086; do
    echo "waiting for influxdb ..."
    sleep 0.5
done

echo "InfluxDB Ready!"

