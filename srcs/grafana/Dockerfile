# Base OS
FROM alpine:latest

# Update & install dependencies
RUN apk update && apk add openrc

# Install Grafana
RUN wget https://dl.grafana.com/oss/release/grafana-7.1.5.linux-amd64.tar.gz \
	&& tar -zxf grafana-7.1.5.linux-amd64.tar.gz \
	&& mv grafana-7.1.5 grafana \
	&& rm -r *.gz

# Required by grafana-server dependency to run grafana binary
RUN mkdir /lib64 && ln -s /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2

# Copy files
ADD setup.sh			/srcs/setup.sh
ADD datasources.yaml 	grafana/conf/provisioning/datasources/
ADD dashboards.yaml 	grafana/conf/provisioning/dashboards/

EXPOSE 3000

CMD ["sh", "/srcs/setup.sh"]