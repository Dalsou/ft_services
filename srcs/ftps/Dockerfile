# OS Base
FROM alpine:latest

# Update & install vsftpd
RUN apk update && apk add vim && apk add bash && apk add vsftpd

# Copy files
COPY ./vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY ./init_ftp.sh	/utils/init_ftp.sh

# Launch script
RUN chmod +x /utils/init_ftp.sh
CMD /utils/init_ftp.sh
