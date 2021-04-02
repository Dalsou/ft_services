FROM alpine:latest

RUN apk update \
	&& apk add --no-cache influxdb \
	&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

ADD setup.sh		/srcs/
RUN chmod +x		/srcs/setup.sh
ADD telegraf.conf	/etc/telegraf/

EXPOSE 8086

CMD ["sh", "/srcs/setup.sh"]