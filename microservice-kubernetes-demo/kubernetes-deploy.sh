#!/bin/sh

kubectl run apache --image=thegaijin/demo-apache --port=80
kubectl expose deployment/apache --type="LoadBalancer" --port 80
kubectl run catalog --image=thegaijin/catalog --port=8080
kubectl expose deployment/catalog --type="LoadBalancer" --port 8080
kubectl run customer --image=thegaijin/customer --port=8080
kubectl expose deployment/customer --type="LoadBalancer" --port 8080
kubectl run order --image=thegaijin/order --port=8080
kubectl expose deployment/order --type="LoadBalancer" --port 8080
kubectl run hystrix-dashboard --image=thegaijin/hystrix-dashboard --port=8080
kubectl expose deployment/hystrix-dashboard --type="LoadBalancer" --port 8080
