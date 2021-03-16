# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    setup.sh                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: afoulqui <afoulqui@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/25 11:38:33 by afoulqui          #+#    #+#              #
#    Updated: 2021/03/16 19:01:40 by afoulqui         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

mkdir -p /srcs/ftp/ftp_admin
echo -e "ftp_admin:password" | adduser -h /srcs/ftp/ftp_admin ftp_admin
chown ftp_admin:ftp_admin /srcs/ftp/ftp_admin
mkdir /srcs/ftp/ftp_admin/folder_txt
chown ftp_admin:ftp_admin /srcs/ftp/ftp_admin/folder_text
touch /srcs/ftp/ftp_admin/folder_txt/text.txt

/usr/sbin/vsftpd /etc/vsftpd/vsftpd.conf 

tail -f /dev/null