# Base OS
FROM alpine:latest

# Update & install nginx & dependencies
RUN apk update && apk add openrc \
	&& apk add nginx openssl openssh

# Create files
RUN mkdir www /run/nginx \
	&& echo "root:root" | chpasswd

# Copy files to config
ADD nginx.conf		/etc/nginx/
ADD setup.sh 		/srcs/
ADD index.html		/www/
ADD sshd_config 	/etc/ssh/
ADD ssl_params.conf /etc/nginx

# Config openssl
RUN openssl req -x509 -nodes -subj '/C=FR/ST=IDF/L=PARIS/O=afoulqui/CN=localhost' \
	-days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key \
	-out /etc/ssl/certs/nginx-selfsigned.crt \
	&& openssl dhparam -dsaparam -out /etc/ssl/certs/dhparam.pem 2048

# Config ssh
RUN	ssh-keygen -A


# Expose
EXPOSE	22 80 443

CMD ["sh", "/srcs/setup.sh"]