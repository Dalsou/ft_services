# Base OS
FROM alpine:latest

# Update & install nginx
RUN apk update \
	&& apk add nginx

# (à supprimer à la fin)
RUN apk add vim

# Copy files to configurate
COPY ./nginx.conf /etc/nginx
COPY ./index.html /var/www/localhost

# Expose
EXPOSE 80