#setup ftp
apt update && apt install vsftpd -y
service vsftpd start
apt install inetutils-ftp -y
adduser ainur melkor

#create+configure folder permission
cd ../srv/ftp
mkdir shared
chown -R ainur:ainur shared
chmod -R 700 shared

#mengubah konfigurasi vsftpd
nano /etc/vsftpd.conf
#tambahkan command berikut 
listen=YES
listen_ipv6=NO
anonymous_enable=NO
local_enable=YES
write_enable=YES
dirmessage_enable=YES
use_localtime=YES
xferlog_enable=YES
connect_from_port_20=YES
chroot_local_user=YES
pam_service_name=vsftpd
allow_writeable_chroot=YES
local_root=/srv/ftp/shared
tcp_wrappers=YES
user_config_dir=/etc/vsftpd_user.conf
userlist_enable=YES
userlist_file=/etc/vsftpd.user_list
userlist_deny=YES

echo "melkor" | tee etc/vsftpd.user_list
service vsftpd restart
