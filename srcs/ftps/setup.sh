#!/bin/sh

echo -e "password\npassword" | adduser -h /mnt/ftp user
mkdir -p /mnt/ftp/doss
echo "Hello World !" > /mnt/ftp/doss/file

vsftpd /etc/vsftpd/vsftpd.conf 

tail -f /dev/null