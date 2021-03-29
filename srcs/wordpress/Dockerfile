# OS Base
FROM alpine:latest

# Update & Install tools and wordpress
RUN apk update \
	&& apk add --no-cache php7 php7-fpm php7-opcache \
	php7-gd php7-mysqli php7-zlib php7-curl \
	php7-mcrypt php7-soap php7-openssl \
	php7-gmp php7-pdo_odbc php7-json php7-dom \
	php7-pdo php7-zip php7-sqlite3 php7-apcu \
	php7-pdo_pgsql php7-bcmath php7-odbc \
	php7-pdo_mysql php7-pdo_sqlite php7-gettext \
	php7-xmlreader php7-xmlrpc php7-bz2 \
	php7-iconv php7-pdo_dblib php7-ctype \
	nginx openssl openrc curl

# Download the last version of Wordpress & uncompress it
RUN mkdir -p /var/www/ \
    && curl -LO https://wordpress.org/latest.tar.gz \
	&& tar zxvf latest.tar.gz \
	&& mv wordpress /var/www/ \
	&& rm *.gz

# Config SSL
RUN openssl req -newkey rsa:2048 -nodes -days 365 -x509 \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/CN=afoulqui" \
	-addext "subjectAltName=DNS:localhost" \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt

# Add files
ADD wp-config.php			/var/www/wordpress/
RUN mkdir -p 				/run/nginx 
ADD nginx.conf 				/etc/nginx/conf.d/default.conf
ADD setup.sh 				/srcs/
RUN chmod +x 				/srcs/setup.sh

RUN	sed -i 's/nobody/root/g' /etc/php7/php-fpm.d/www.conf
RUN	echo "clear_env = no" >> /etc/php7/php-fpm.d/www.conf 

EXPOSE 5050

CMD ["sh", "/srcs/setup.sh"]