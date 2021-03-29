# OS Base
FROM alpine:latest

# Update & install MySQL
RUN apk update \
	&& apk add --no-cache mariadb mariadb-client

# Setup MySQL
RUN mkdir -p 	/run/mysqld

ADD setup.sh		/srcs/
RUN chmod +x		/srcs/setup.sh
ADD wordpress.sql	/srcs/
ADD my.cnf			/etc/my.cnf.d/mariadb-server.cnf

# Expose port
EXPOSE 3306

# Launch script
CMD ["sh", "/srcs/setup.sh"]