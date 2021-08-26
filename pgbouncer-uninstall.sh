 #!/bin/bash
systemctl stop  pgbouncer
yum remove pgbouncer -y
rm -rf  /etc/pgbouncer
rm -rf /var/log/pgbouncer/
echo -e "\e[4;34m P G B O U N C E R    U N I N S T A L L E D    S U C C E S SF U L L Y \e[0m"