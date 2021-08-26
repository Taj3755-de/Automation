#!/bin/bash

sudo yum remove -y nginx
sudo rm -rf /etc/nginx
sudo rm -rf /var/log/nginx

sudo echo -e "\e[1;32m " N G I N X    U N I N S T A L L E D    S U C C E S S F U L L Y " \e[0m"
