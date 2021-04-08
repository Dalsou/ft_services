#!/bin/sh

# Config SSL
openssl req -newkey rsa:2048 -nodes -days 365 -x509 \
-subj "/C=FR/ST=IDF/L=Paris/O=42/CN=afoulqui" \
-keyout /etc/ssl/private/nginx-selfsigned.key \
-out /etc/ssl/certs/nginx-selfsigned.crt

# Config Wordpress
sed -i 's/nobody/root/g' /etc/php7/php-fpm.d/www.conf
echo "clear_env = no" >> /etc/php7/php-fpm.d/www.conf 

# Start Telegraf
telegraf & 

# Start
php-fpm7 -R && nginx -g 'daemon off;'

# Keep container running
tail -f /dev/null 