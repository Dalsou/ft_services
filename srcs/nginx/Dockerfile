# Base OS
FROM alpine

# Update
RUN apk update

# Install tool to download 
RUN apk add wget

# Install NGINX & MYSQL & PHP
RUN apk add nginx

RUN apk add vim

COPY ./nginx.conf /etc/nginx
COPY ./index.html /var/www/localhost


EXPOSE 80