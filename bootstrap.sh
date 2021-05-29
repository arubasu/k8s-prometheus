#!/bin/sh
kubectl create -f namespaces.yml
kubectl create -f clusterRole.yml
kubectl create -f kube-state-metrics.yml
kubectl create -f grafana-deployment.yml
kubectl create -f grafana-service.yml
kubectl create -f alertmanager-configmap.yml
kubectl create -f alertmanager-deployment.yml
kubectl create -f alertmanager-service.yml
kubectl create -f prometheus-config-map.yml
kubectl create -f prometheus-rules-config-map.yml
kubectl create -f prometheus-deployment.yml
kubectl create -f prometheus-service.yml

