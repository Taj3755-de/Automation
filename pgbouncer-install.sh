 #!/bin/bash
rpm -Uvh https://download.postgresql.org/pub/repos/yum/reporpms/EL-7-x86_64/pgdg-redhat-repo-latest.noarch.rpm
yum install pgbouncer -y
cd /etc/pgbouncer
sed -i '53s#127.0.0.1#'`hostname -I | awk '{print $1}'`'#g' pgbouncer.ini
sed -i '54s/6432/6543/g'  pgbouncer.ini
echo -e "\e[4;34m P G B O U N C E R    I N S T A L L E D    S U C C E S SF U L L Y \e[0m"

sudo firewall-cmd --zone=public --add-port=6543/tcp --permanent
sudo firewall-cmd --reload

systemctl start pgbouncer
systemctl status  pgbouncer