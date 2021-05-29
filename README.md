# Prometheus setup:
------------------------------------------------------------------------

## Prerequisites:
----------------------------------------
A working Kubernetes cluster.
<br />
<br />

## Steps to follow for Installation:
----------------------------------------
#### 1. Install the Node exporter in all the VMs which are in your Kubernetes Cluster i.e. kubernetes master and worker nodes.
  Follow the instructions on **'Setting Up Node exporters helper'**
  Or, execute `install_node_exporter.sh` in each node 

#### 2. Update the slack_receiver section inside `alertmanager-configmap.yml`
```
	receivers:
	- name: slack_receiver
	  slack_configs:
	  - send_resolved: true
		username: 'arunava.basu'
		api_url: 'https://hooks.slack.com/services/TJYPFGQUW/B010QEWQ1FW/XXXXXXXXXXXXXXXXXXXXXXXXXX'
		channel: '#alerts'
```

#### 3. Update the Grafana UI admin **PASSWORD** in `grafana-deployment.yml`
```
        - name: GF_SECURITY_ADMIN_PASSWORD
          value: PASSWORD
```

#### 4. Update VM IPs inside `prometheus-config-map.yml`. 
   This should include all the VMs which are in your Kubernetes Cluster i.e. Master and Worker nodes.
```
        static_configs:
        - targets: ['172.31.21.212:9100', '172.31.25.138:9100', '172.31.21.174:9100']
```

#### 5. Execute `bootstrap.sh`
<br />
<br />

## Steps to remove prometheus setup:
----------------------------------------
#### 1. Execute `remove_prometheus.sh`
<br />
<br />

