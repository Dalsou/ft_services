#!/bin/sh

# Start Telegraf
telegraf & 

# Start grafana
grafana-server --homepath=/usr/share/grafana 

# Keep container running
sleep infinite