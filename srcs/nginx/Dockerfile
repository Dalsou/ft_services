# Base OS
FROM alpine:latest

# Update & install nginx & dependencies
RUN apk update && apk add openrc --no-cache \
	&& apk add nginx openssl openssh \
	&& apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

RUN mkdir -p /run/nginx www

# Copy files to config
ADD nginx.conf				/etc/nginx/
ADD setup.sh 				/srcs/
RUN chmod +x 				/srcs/setup.sh
ADD index.html				/www/
RUN chown -R nginx:nginx	/www/
ADD telegraf.conf			/etc/telegraf/

# Config openssl
RUN openssl req -newkey rsa:2048 -nodes -days 365 -x509 \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=afoulqui/CN=localhost" \
	-keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt

# Config ssh
ADD sshd_config 		/etc/ssh/

# Expose
EXPOSE	80 443

CMD ["sh", "/srcs/setup.sh"]