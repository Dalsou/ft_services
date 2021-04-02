#!/bin/sh

# Start Telegraf
telegraf & 

# Nginx starting
openrc
touch /run/openrc/softlevel
service nginx start

# SSH starting
adduser -D user
echo -e "user:password" | chpasswd
rc-update add sshd
ssh-keygen -A

# Keep container running
tail -f /dev/null 