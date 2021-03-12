# OS Base & Mai
FROM alpine:latest

# Update & Install tools and wordpress
RUN apk update \
	&& apk add curl \
	&& apk add php7 php7-fpm php7-opcache \
	php7-gd php7-mysqli php7-zlib php7-curl \
	php7-mbstring php7-json php7-session


# Download the last version of Wordpress & uncompress it
RUN mkdir /www \
    && curl -LO https://wordpress.org/latest.tar.gz \
	&& tar zxvf latest.tar.gz \
	&& mv wordpress /www \
	&& rm *.gz

ADD setup.sh 			/srcs/setup.sh
ADD wp-config.php		/www/wp-config.php

EXPOSE 5050

CMD ["sh", "/srcs/setup.sh"]