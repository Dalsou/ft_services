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
	nginx openssl openrc curl \
	&& apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache


# Download the last version of Wordpress & uncompress it
RUN mkdir -p /var/www/ \
    && curl -LO https://wordpress.org/latest.tar.gz \
	&& tar zxvf latest.tar.gz \
	&& mv wordpress /var/www/ \
	&& rm *.gz

# Add files
ADD wp-config.php		/var/www/wordpress/
RUN mkdir -p 			/run/nginx 
ADD nginx.conf 			/etc/nginx/conf.d/default.conf
ADD setup.sh 			/srcs/
RUN chmod +x 			/srcs/setup.sh
ADD telegraf.conf		/etc/telegraf/

# Expose
EXPOSE 5050

# Launch 
CMD ["sh", "/srcs/setup.sh"]