#!/bin/sh

kubectl apply -f mysql-deployment.yaml
kubectl apply -f mysql-service.yaml

kubectl apply -f joomla-deployment.yaml
kubectl apply -f joomla-service.yaml
