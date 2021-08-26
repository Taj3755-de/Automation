#!/bin/bash
 echo "How  Many Docker Worker Nodes You  Want to remove : - )"
read END
docker node ls 
for i in $(seq 1 $END); do
echo -e "\e[7;32m  Please Enter Docker Slave Node $i IP and ID: \e[0m"
read SLAVE_IP
read SLAVE_ID
ip=$SLAVE_IP
host=$SLAVE_ID

 ssh -l root $ip 'docker swarm leave --force'
 echo -e "\e[7;32m  Please wait for 5sec...\e[0m"
 sleep 5 
 docker node ls
 docker node rm --force  $host
done 
echo -e "\e[7;32m  Please wait for 5sec...\e[0m"
 sleep 5 
 docker node ls 
echo -e "\e[1;33m N O D E   H A S   B E E N   L  E F T   F R O M   S W A R M  M O D E  \e[0m"