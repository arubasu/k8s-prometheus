#!/bin/sh
kubectl delete -f prometheus-service.yml
kubectl create -f prometheus-deployment.yml
kubectl delete -f prometheus-rules-config-map.yml
kubectl delete -f prometheus-config-map.yml
kubectl delete -f alertmanager-service.yml
kubectl delete -f alertmanager-deployment.yml
kubectl delete -f alertmanager-configmap.yml
kubectl delete -f grafana-service.yml
kubectl delete -f grafana-deployment.yml
kubectl delete -f kube-state-metrics.yml
kubectl delete -f clusterRole.yml
kubectl delete -f namespaces.yml

