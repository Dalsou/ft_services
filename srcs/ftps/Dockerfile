# OS Base
FROM alpine:latest

# Update & install vsftpd
RUN apk update && apk add vsftpd openssl

# Copy files
ADD vsftpd.conf /etc/vsftpd/
ADD setup.sh	/srcs/
RUN chmod +x	/srcs/setup.sh

# Config openssl
RUN openssl req -x509 -nodes -subj '/C=FR/ST=IDF/L=PARIS/O=afoulqui/CN=localhost' \
	-days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd-selfsigned.key \
	-out /etc/ssl/certs/vsftpd-selfsigned.crt

# Expose port
EXPOSE 20 21 21009-21011

# Launch script
CMD ["sh", "/srcs/setup.sh"]	
