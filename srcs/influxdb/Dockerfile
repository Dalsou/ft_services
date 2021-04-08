# OS Base
FROM alpine:latest

# Update & install InfluxDB & Telegraf
RUN apk update \
	&& apk add --no-cache influxdb \
	&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

# Copy files
ADD setup.sh		/srcs/
RUN chmod +x		/srcs/setup.sh
ADD telegraf.conf	/etc/telegraf/

# Expose
EXPOSE 8086

# Launch script
CMD ["sh", "/srcs/setup.sh"]