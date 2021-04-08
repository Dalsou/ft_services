#!/bin/sh

# Config openssl
openssl req -newkey rsa:2048 -nodes -days 365 -x509 \
-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=afoulqui/CN=localhost" \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt

# Start Telegraf
telegraf & 

# Nginx starting
openrc
touch /run/openrc/softlevel
service nginx start

# SSH starting
adduser -D user
echo -e "user:password" | chpasswd
rc-update add sshd
ssh-keygen -A

# Keep container running
tail -f /dev/null 