#!bin/bash
systemctl stop prometheus
rm -rf prometheus-2.8.1.linux-amd64.tar.gz
rm -rf /usr/local/bin/prometheus
rm -rf /etc/prometheus
rm -rf /etc/systemd/system/prometheus.service
rm -rf /var/lib/prometheus

# sudo yum remove -y prometheus
# sudo yum autoremove -y prometheus

echo -e "\e[1;32m "UNINSTALLED PROMETHEUS SUCCESSFULLY" \e[0m"
