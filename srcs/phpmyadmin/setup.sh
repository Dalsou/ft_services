#!/bin/sh

# Start Telegraf
telegraf & 

# Start
php-fpm7 -R && nginx -g 'daemon off;'

# Keep container running
tail -f /dev/null 