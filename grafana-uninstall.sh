#!/bin/bash


systemctl stop grafana-server
sudo yum remove -y grafana
rm -rf /usr/lib/systemd/system/grafana-server.service