#!/bin/bash
 systemctl stop docker
 echo -e "\e[1;33m Docker service stoped successfully \e[0m"
 yum remove docker-ce docker-ce-cli containerd.io -y
 yum remove docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
 rm -rf /var/lib/docker
 rm -rf /etc/docker
echo -e "\e[1;33m                     D O C K E R   U N I N S T A L E D   S U C C E S S F U L L Y \e[0m"