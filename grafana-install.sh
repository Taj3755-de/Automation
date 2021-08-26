#!/bin/bash

# su - root
# wget -O - https://dl.grafana.com/oss/release/grafana-7.1.4-1.x86_64.rpm
# # sudo yum install -y grafana-7.1.4-1.x86_64.rpm
sudo tee -a /etc/yum.repos.d/grafana.repo << EOF
[grafana]
name=grafana
baseurl=https://packages.grafana.com/oss/rpm
repo_gpgcheck=1
enabled=1
gpgcheck=1
gpgkey=https://packages.grafana.com/gpg.key
sslverify=1
sslcacert=/etc/pki/tls/certs/ca-bundle.crt
EOF

sudo yum install -y grafana
sudo systemctl daemon-reload
sudo systemctl start grafana-server
sudo systemctl status grafana-server
sudo systemctl enable grafana-server.service
sudo firewall-cmd --zone=public --add-port=3000/tcp --permanent
sudo firewall-cmd --reload

# Use the following URL to access the Grafana web interface.

# http://Your Server IP or Host Name:3000/