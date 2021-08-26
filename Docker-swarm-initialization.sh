#!/bin/bash
echo -e "\e[7;32m  Please Enter Docker Master Node IP:$I1 \e[0m"
read MASTER_IP
    I1=$MASTER_IP
touch token.txt && docker swarm init --advertise-addr $I1:2377 > token.txt && sed '5!d' token.txt >> remote.sh

echo "How  Many Docker Worker Nodes You Have : - )"
read END
for i in $(seq 1 $END); do
echo -e "\e[7;32m  Please Enter Docker Slave Node $i IP: \e[0m"
read SLAVE_IP
ip=$SLAVE_IP
cat  remote.sh | ssh -l root $ip
done
docker node ls
237
sudo firewall-cmd --zone=public --add-port=2377/tcp --permanent
sudo firewall-cmd --reload