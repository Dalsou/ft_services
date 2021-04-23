#!/bin/sh

# Start Telegraf
telegraf & 

# Start InfluxDB
influxd -config /etc/influxdb.conf

# Initialize database
influx -execute "CREATE DATABASE telegraf"
influx -execute "CREATE USER user WITH PASSWORD 'password' WITH ALL PRIVILEGES"

# Keep container running
sleep infinite