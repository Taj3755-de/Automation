#!/bin/bash

# Install Oracle Java
install_java(){
#install jdk and jre

yum install java-1.8.0-openjdk  java-1.8.0-openjdk-devel -y

# set JAVA HOME AND JRE HOME
sh -c "echo export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk >> /etc/environment"
sh -c "echo export JRE_HOME=/usr/lib/jvm/java-1.8.0-openjdk/jre >> /etc/environment"
echo -e "\e[1;32m "JAVA INSTALLED SUCCESSFULLY" \e[0m"
}

if type -p java; then
    echo found java executable in PATH
    _java=java
else
    echo "Installing JAVA"
   install_java
fi

#Kafka installation 
echo "kafka installation started" 

yum install -y wget
wget https://downloads.apache.org/kafka/2.8.0/kafka_2.13-2.8.0.tgz
tar xzf kafka_2.13-2.8.0.tgz
mv kafka_2.13-2.8.0 kafka
mv kafka /opt/

cd /opt/kafka/config

sed -i '31s/#listeners/listeners/g' server.properties
sed -i '31s#//#//'`hostname -I | awk '{print $1}'`'#g' server.properties
sed -i '36s/#advertised/advertised/g' server.properties
sed -i '36s#//your.host.name#//'`hostname -I | awk '{print $1}'`'#g' server.properties
sed -i '21s/localhost/'`hostname -I | awk '{print $1}'`'/g' producer.properties

touch /etc/systemd/system/zookeeper.service
touch /etc/systemd/system/kafka.service
cat <<EOF >/etc/systemd/system/zookeeper.service
[Unit]
Description=zookeeper
After=syslog.target network.target

[Service]
Type=simple

User=root
Group=root

ExecStart=/opt/kafka/bin/zookeeper-server-start.sh /opt/kafka/config/zookeeper.properties
ExecStop=/opt/kafka/bin/zookeeper-server-stop.sh

[Install]
WantedBy=multi-user.target
EOF
cat <<EOF >/etc/systemd/system/kafka.service

[Unit]
Description=Apache Kafka
Requires=zookeeper.service
After=zookeeper.service

[Service]
Type=simple

User=root
Group=root

ExecStart=/opt/kafka/bin/kafka-server-start.sh /opt/kafka/config/server.properties
ExecStop=/opt/kafka/bin/kafka-server-stop.sh

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl start zookeeper
systemctl start kafka







