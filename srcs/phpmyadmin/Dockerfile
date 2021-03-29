# OS Base
FROM alpine:latest

# Update & install phpmyadmin
RUN apk update \
	&& apk add --no-cache php7 php7-fpm \
	php7-opcache php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring \
	php7-json php7-session php7-iconv php7-xml \
	nginx openssl openrc curl

# Get files
RUN mkdir -p /var/www/ \
	&& curl -LO http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.1.0-all-languages.tar.gz \
	&& tar -xvf phpMyAdmin-5.1.0-all-languages.tar.gz \
	&& mv phpMyAdmin-5.1.0-all-languages /var/www/phpmyadmin \
	&& rm *.gz

# Config SSL
RUN openssl req -newkey rsa:2048 -nodes -days 365 -x509 \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/CN=afoulqui" \
	-addext "subjectAltName=DNS:localhost" \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt

# Copy files
ADD config.inc.php		/var/www/phpmyadmin/
RUN	chmod 744 			/var/www/phpmyadmin/config.inc.php
RUN mkdir -p 			/run/nginx 
ADD nginx.conf 			/etc/nginx/conf.d/default.conf
ADD setup.sh 			/srcs/
RUN chmod +x 			/srcs/setup.sh


# Expose port
EXPOSE 5000

# Launch script
CMD ["sh", "/srcs/setup.sh"]