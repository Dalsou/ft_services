#!/bin/sh

# Config SSL
openssl req -newkey rsa:2048 -nodes -days 365 -x509 \
-subj "/C=FR/ST=IDF/L=Paris/O=42/CN=afoulqui" \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt

# Start Services
supervisord