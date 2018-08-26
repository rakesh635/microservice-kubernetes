#!/bin/bash

kubectl expose deployment/apache --type="LoadBalancer" --port 80
kubectl expose deployment/catalog --type="LoadBalancer" --port 8080
kubectl expose deployment/customer --type="LoadBalancer" --port 8080
kubectl expose deployment/order --type="LoadBalancer" --port 8080
kubectl expose deployment/hystrix-dashboard --type="LoadBalancer" --port 8080