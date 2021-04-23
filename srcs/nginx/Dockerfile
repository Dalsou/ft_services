# Base OS
FROM alpine:3.13

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
ADD sshd_config 			/etc/ssh/

# Expose
EXPOSE	80 443

CMD ["sh", "/srcs/setup.sh"]