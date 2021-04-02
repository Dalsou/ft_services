# OS Base
FROM alpine:latest

# Update & install vsftpd
RUN apk update  \
	&& apk add --no-cache vsftpd openssl \
	&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

# Copy files
ADD vsftpd.conf 		/etc/vsftpd/
ADD setup.sh			/srcs/
RUN chmod +x			/srcs/setup.sh
ADD telegraf.conf		/etc/telegraf/

# Config SSL
RUN openssl req -newkey rsa:2048 -nodes -days 365 -x509 \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=afoulqui/CN=localhost" \
	-keyout /etc/ssl/private/vsftpd-selfsigned.key \
	-out /etc/ssl/certs/vsftpd-selfsigned.crt

# Expose port
EXPOSE 20 21 30021

# Launch script
CMD ["sh", "/srcs/setup.sh"]	
