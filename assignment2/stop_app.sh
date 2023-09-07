#!/bin/sh

kubectl delete deployment joomla
kubectl delete service joomla

kubectl delete deployment mysql
kubectl delete service mysql
