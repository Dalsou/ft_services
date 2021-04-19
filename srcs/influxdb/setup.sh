#!/bin/sh

# Initialize database
influx -execute "CREATE DATABASE telegraf"
influx -execute "CREATE USER user WITH PASSWORD 'password' WITH ALL PRIVILEGES"

# Start services
supervisord