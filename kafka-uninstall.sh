#!/bin/bash

sudo systemctl stop zookeeper
sudo systemctl stop kafka
sudo rm -rf /opt/kafka
sudo rm -rf /etc/systemd/system/zookeeper.service
sudo rm -rf /etc/systemd/system/kafka.service
sudo rm -rf /opt/kafka
sudo echo -e "\e[1;32m "UNINSTALLED KAFKA SUCCESSFULLY" \e[0m"
