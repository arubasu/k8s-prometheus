node_exporter_version='v1.1.2'
version=$(echo $node_exporter_version | tr -d v)
useradd -m -d /home/prometheus prometheus
cd /home/prometheus
wget https://github.com/prometheus/node_exporter/releases/download/${node_exporter_version}/node_exporter-${version}.linux-amd64.tar.gz
tar -zxvf node_exporter-${version}.linux-amd64.tar.gz
mv node_exporter-${version}.linux-amd64 node_exporter
chown -R prometheus:prometheus ~
cat <<EOF > /etc/systemd/system/node_exporter.service
[Unit]
Description=Node Exporter
 
[Service]
User=prometheus
ExecStart=/home/prometheus/node_exporter/node_exporter
 
[Install]
WantedBy=default.target
EOF

systemctl daemon-reload
systemctl enable --now node_exporter.service
netstat -nltp | grep 9100

