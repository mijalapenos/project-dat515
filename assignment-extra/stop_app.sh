#!/bin/sh

kubectl delete service joomla
kubectl delete deployment joomla

kubectl delete service mysql
kubectl delete deployment mysql
