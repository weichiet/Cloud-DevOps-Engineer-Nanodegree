#!/usr/bin/env bash

eksctl create cluster -n devops-capstone -r us-west-2  -t t2.small
kubectl apply -f deployment.yml
kubectl apply -f services.yml
