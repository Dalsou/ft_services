# Base OS
FROM alpine:latest

# Update & install dependencies
RUN apk update \
	&& apk add --no-cache grafana grafana-openrc vim \
	&& apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

# Copy files
ADD grafana.ini 		/usr/share/grafana/conf/custom.ini
ADD setup.sh			/srcs/setup.sh
RUN chmod +x 			/srcs/setup.sh
ADD datasources.yaml 	/usr/share/grafana/conf/provisioning/datasources/
ADD dashboards.yaml 	/usr/share/grafana/conf/provisioning/dashboards/
RUN mkdir -p 			/var/lib/grafana/dashboards
ADD dashboard.json		/var/lib/grafana/dashboards/
ADD telegraf.conf		/etc/telegraf/

# Expose
EXPOSE 3000

CMD ["sh", "/srcs/setup.sh"]