#!/bin/sh

# Config SSL
openssl req -newkey rsa:2048 -nodes -days 365 -x509 \
-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=afoulqui/CN=localhost" \
-keyout /etc/ssl/private/vsftpd-selfsigned.key \
-out /etc/ssl/certs/vsftpd-selfsigned.crt

# Create directory
mkdir -p /var/ftps

# Create user
adduser -D -h /var/ftps user
echo "user:password" | chpasswd

# Create test file
echo "Hello World !" > /var/ftps/hello.txt

# Start services
supervisord