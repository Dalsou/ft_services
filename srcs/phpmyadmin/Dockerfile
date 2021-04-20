# OS Base
FROM alpine:3.13

# Update & install phpmyadmin
RUN apk update \
	&& apk add --no-cache php7 php7-fpm \
	php7-opcache php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring \
	php7-json php7-session php7-iconv php7-xml \
	nginx openssl openrc curl supervisor \
	&& apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

# Get files
RUN mkdir -p /var/www/ \
	&& curl -LO http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.1.0-all-languages.tar.gz \
	&& tar -xvf phpMyAdmin-5.1.0-all-languages.tar.gz \
	&& mv phpMyAdmin-5.1.0-all-languages /var/www/phpmyadmin \
	&& rm *.gz

# Copy files
ADD config.inc.php		/var/www/phpmyadmin/
RUN	chmod 744 			/var/www/phpmyadmin/config.inc.php
RUN mkdir -p 			/run/nginx 
ADD nginx.conf 			/etc/nginx/conf.d/default.conf
ADD setup.sh 			/srcs/
RUN chmod +x 			/srcs/setup.sh
ADD telegraf.conf		/etc/telegraf/
ADD supervisord.conf	/etc/

# Expose port
EXPOSE 5000

# Launch script
CMD ["sh", "/srcs/setup.sh"]