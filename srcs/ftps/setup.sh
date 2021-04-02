#!/bin/sh

# Start Telegraf
telegraf & 

# Start vsFTPd
vsftpd /etc/vsftpd/vsftpd.conf 

# Keep container running
tail -f /dev/null 