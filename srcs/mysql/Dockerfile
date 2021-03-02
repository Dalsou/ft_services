# OS Base
FROM alpine:latest

# Update & install vsftpd
RUN apk update \
	&& apk add mariadb mariadb-client openrc

# Copy files
ADD setup.sh 		/srcs/setup.sh
ADD create_database /srcs/create_database

# Expose port
EXPOSE 3306

# Launch script
CMD ["sh", "/srcs/setup.sh"]