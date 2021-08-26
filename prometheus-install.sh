#!bin/bash

sudo yum install -y wget
sudo wget https://github.com/prometheus/prometheus/releases/download/v2.8.1/prometheus-2.8.1.linux-amd64.tar.gz

sudo useradd --no-create-home --shell /bin/false prometheus

sudo mkdir /etc/prometheus

sudo mkdir /var/lib/prometheus

sudo chown prometheus:prometheus /etc/prometheus

sudo chown prometheus:prometheus /var/lib/prometheus

sudo tar -xvzf prometheus-2.8.1.linux-amd64.tar.gz

sudo mv prometheus-2.8.1.linux-amd64 prometheus

sudo cp prometheus/prometheus /usr/local/bin/

sudo cp prometheus/promtool /usr/local/bin/

sudo chown prometheus:prometheus /usr/local/bin/prometheus

sudo chown prometheus:prometheus /usr/local/bin/promtool

sudo cp -r prometheus/* /etc/prometheus

sudo chown -R prometheus:prometheus /etc/prometheus

sed -i '29s/localhost/'`hostname -I | awk '{print $1}'`'/g'  /etc/prometheus/prometheus.yml
sudo tee -a /etc/systemd/system/prometheus.service << EOF2
[Unit]
Description=Prometheus
Wants=network-online.target
After=network-online.target

[Service]
User=prometheus
Group=prometheus
Type=simple
ExecStart=/usr/local/bin/prometheus --config.file /etc/prometheus/prometheus.yml --storage.tsdb.path /var/lib/prometheus/ --web.console.templates=/etc/prometheus/consoles --web.console.libraries=/etc/prometheus/console_libraries

[Install]
WantedBy=multi-user.target
EOF2

sudo systemctl daemon-reload

sudo systemctl start prometheus

firewall-cmd --zone=public --add-port=9090/tcp --permanent

systemctl reload firewalld

# Use the following URL to access the Prometheus web interface.

# http://Your Server IP or Host Name:9090/