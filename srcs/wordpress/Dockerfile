# OS Base
FROM alpine:latest

# Update & Install tools and wordpress
RUN apk update \
	&& apk add --no-cache php7 php7-fpm \
	php7-opcache php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring \
	php7-json php7-session php7-iconv php7-xml \
	nginx openssl openrc curl supervisor \
	&& apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

# Download the last version of Wordpress & uncompress it
RUN mkdir -p /var/www/ \
    && curl -LO https://wordpress.org/latest.tar.gz \
	&& tar -xvf latest.tar.gz \
	&& mv wordpress /var/www/ \
	&& rm *.gz

# Add files
ADD wp-config.php		/var/www/wordpress/
RUN	chmod 744 			/var/www/wordpress/wp-config.php
RUN mkdir -p 			/run/nginx 
ADD nginx.conf 			/etc/nginx/conf.d/default.conf
ADD setup.sh 			/srcs/
RUN chmod +x 			/srcs/setup.sh
ADD telegraf.conf		/etc/telegraf/
ADD supervisord.conf	/etc/

# Expose
EXPOSE 5050

# Launch 
CMD ["sh", "/srcs/setup.sh"]