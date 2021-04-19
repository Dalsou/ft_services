# OS Base
FROM alpine:latest

# Update & install MySQL & Telegraf
RUN apk update \
	&& apk add --no-cache mariadb mariadb-client supervisor \
	&& apk add telegraf --repository http://dl-3.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

# Add files
RUN mkdir -p 			/run/mysqld
ADD setup.sh			/srcs/
RUN chmod +x			/srcs/setup.sh
ADD wordpress.sql		/srcs/
ADD my.cnf				/etc/my.cnf.d/mariadb-server.cnf
ADD telegraf.conf		/etc/telegraf/
ADD supervisord.conf	/etc/

# Expose port
EXPOSE 3306

# Launch script
CMD ["sh", "/srcs/setup.sh"]