#!/bin/bash
systemctl stop postgresql-12
yum remove -y postgresql12-server postgresql12.x86_64 postgresql12-libs.x86_64 postgresql12-server.x86_64
rm -rf /var/lib/pgsql/12/
echo -e "\e[1;33m                    P O S T G R E S    U N I N S T A L E D   S U C C E S S F U L L Y \e[0m"