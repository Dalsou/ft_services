# OS Base
FROM alpine

# Update
RUN apk update

# Install tool to download 
RUN apk add wget

# Install Wordpress
RUN apk add php7 php7-fpm php7-opcache \
php7-gd php7-mysqli php7-zlib php7-curl \
php7-mbstring php7-json php7-session

EXPOSE 5050