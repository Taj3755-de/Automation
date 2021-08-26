#!/bin/bash

echo -e "\e[1;32m \e[0m"
echo -e "\e[1;32m \e[0m"
echo -e "\e[1;32m       ]\                           / [       \e[0m"
echo -e "\e[1;32m       ] \                         /  [  \e[0m"
echo -e "\e[1;32m       ]  \    Aigilx Health      /   [  \e[0m"
echo -e "\e[1;32m       ]   ]    Technology       [    [  \e[0m"
echo -e "\e[1;32m       ]   ]                     [    [     \e[0m"
echo -e "\e[1;32m       ]   ]___               ___[    [            ___                 _ _ _ _ _ _           \e[0m"
echo -e "\e[1;32m       ]   ]  ]\             /[  [    [           /   \         !    /                   !    !                \      / \e[0m"
echo -e "\e[1;32m       ]   ]  ] \           / [  [    [          /     \        !    |                   !    !                 \    /\e[0m"
echo -e "\e[1;32m       ]   ]  ]  ]         [  [  [    [         /       \       !    |                   !    !                  \  /  \e[0m"
echo -e "\e[1;32m       ]   ]  ]  ]__     __[  [  [    [        /         \      !    |                   !    !                   \/\e[0m"
echo -e "\e[1;32m       ]   ]  ]  ] ]\ _ /[ [  [  [    [       /_ _ _ _ _ _\     !    |       _ _ _ _     !    !                   /\ \e[0m"
echo -e "\e[1;32m       ]   ]  ]  ] ]     [ [  [  [    [      /             \    !    |         |    \    !    !                  /  \ \e[0m"
echo -e "\e[1;32m       ]   ]  ]  ]_].....[_[  [  [    [     /               \   !    |         |     |   !    !                 /    \ \e[0m"
echo -e "\e[1;32m       ]   ]  ]  ]         [  [  [    [    /                 \  !    \_  _ _ _ /     |   !    !_ _ _ _ _ _ _   /      \ \e[0m"
echo -e "\e[1;32m       ]   ]  ] /           \ [  [    [       \e[0m"
echo -e "\e[1;32m       ]   ]__]/             \[__[    [       \e[0m"
echo -e "\e[1;32m       ]   ]                   \ [    [       \e[0m"
echo -e "\e[1;32m       ]   ]                    \[    [       \e[0m"
echo -e "\e[1;32m       ]   ]                     [    [       \e[0m"
echo -e "\e[1;32m       ]  /                       \   [       \e[0m"
echo -e "\e[1;32m       ] /                         \  [       \e[0m"
echo -e "\e[1;32m       ]/                           \ [       \e[0m"

 yum install -y yum-utils device-mapper-persistent-data lvm2
 yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
  yum-config-manager --enable docker-ce
  yum install docker-ce containerd.io -y
  systemctl start docker
  touch /etc/docker/daemon.json
  chmod 757 /etc/docker/daemon.json

echo -e "\e[4;34m Please Enter docker repository1:$in1 \e[0m"
read repository1_IP
    in1=$repository1_IP
 cat >> /etc/docker/daemon.json <<EOL
{
  "insecure-registries" : ["$in1:5000"],
  "metrics-addr" : "`hostname -I | awk '{print $1}'`:9323",
  "experimental" : true,
  "log-driver": "json-file",
  "log-opts": {
  "max-size": "10m",
  "max-file": "3"
  }
}

EOL
echo -e "\e[1;33m    D O C K E R   I N S T A L L E D   S U C C E S S F U L L Y \e[0m"

 systemctl restart docker
 systemctl status docker
