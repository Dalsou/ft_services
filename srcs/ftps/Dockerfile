# OS Base
FROM alpine:latest

# Update & install vsftpd & Telegraf
RUN apk update  \
	&& apk add --no-cache vsftpd openssl supervisor \
	&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

# Copy files
ADD vsftpd.conf			/etc/vsftpd/ 
ADD setup.sh			/srcs/
RUN chmod +x			/srcs/setup.sh
ADD telegraf.conf		/etc/telegraf/
ADD supervisord.conf	/etc/

# Expose port
EXPOSE 21 30000

# Launch script
CMD ["sh", "/srcs/setup.sh"]	
