#!/bin/bash

#adding node_exporter user
sudo useradd --no-create-home --shell /bin/false node_exporter

#Downloading Node Exporter
wget https://github.com/prometheus/node_exporter/releases/download/v1.2.2/node_exporter-1.2.2.linux-amd64.tar.gz

#Extracting the downloaded file
tar xvf node_exporter-1.2.2.linux-amd64.tar.gz

#moving it to the usr bin dir
sudo cp node_exporter-1.2.2.linux-amd64/node_exporter /usr/local/bin

#Permissions and ownership
sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter

#Creating a systemd service file
echo '[Unit]
Description=Node Exporter
Wants=network-online.target
After=network-online.target

[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter

[Install]
WantedBy=multi-user.target' | sudo tee /etc/systemd/system/node_exporter.service

#Reload systemd
sudo systemctl daemon-reload

#Enable and start Node Exporter service
sudo systemctl enable node_exporter
sudo systemctl start node_exporter

#Allow port 9100 through the firewall
sudo ufw allow 9100/tcp

#Restart the firewall to apply changes
sudo systemctl restart ufw

#Checking the status to be sure it does not fail
sudo systemctl status node_exporter --no-pager