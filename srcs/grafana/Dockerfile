# Base OS
FROM alpine:latest

# Update & install dependencies
RUN apk update \
	&& apk add grafana grafana-openrc

# Copy files
ADD grafana.ini 		/usr/share/grafana/conf/custom.ini
ADD setup.sh			/srcs/setup.sh
RUN chmod +x 			/srcs/setup.sh
ADD datasources.yaml 	grafana/conf/provisioning/datasources/
ADD dashboards.yaml 	grafana/conf/provisioning/dashboards/

# Expose
EXPOSE 3000

CMD ["sh", "/srcs/setup.sh"]