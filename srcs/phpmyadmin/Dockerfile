# OS Base
FROM alpine:latest

# Update & install vsftpd
RUN apk update && apk add openrc \
	&& apk add curl \
	&& apk add php7 php7-fpm \
	php7-opcache php7-gd php7-mysqli \
	php7-zlib php7-curl php7-mbstring \
	php7-json php7-session

# Get files
RUN mkdir /www \
    && curl -LO http://files.directadmin.com/services/all/phpMyAdmin/phpMyAdmin-5.0.2-all-languages.tar.gz \
	&& tar zxvf phpMyAdmin-5.0.2-all-languages.tar.gz \
	&& mv phpMyAdmin-5.0.2-all-languages /www/phpmyadmin \
	&& rm *.gz

# Copy files
ADD setup.sh 			/srcs/
RUN chmod +x 			/srcs/setup.sh
ADD config.inc.php		/www/

# Expose port
EXPOSE 5000

# Launch script
CMD ["sh", "/srcs/setup.sh"]