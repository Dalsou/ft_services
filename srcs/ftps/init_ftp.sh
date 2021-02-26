# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init_ftp.sh                                        :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: afoulqui <afoulqui@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/25 11:38:33 by afoulqui          #+#    #+#              #
#    Updated: 2021/02/26 13:50:43 by afoulqui         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

mkdir -p /src/ftp/afoulqui
echo -e "test2018\ntest2018" | adduser -h /src/ftp/afoulqui afoulqui
chown afoulqui /src/ftp/afoulqui
mkdir /src/ftp/afoulqui/folder_txt
touch /src/ftp/afoulqui/folder_txt/text.txt

exec /usr/sbin/vsftpd -opasv_min_port=21000 -opasv_max_port=21010 -opasv_address=127.0.0.1 /etc/vsftpd/vsftpd.conf & tail -f /dev/null


