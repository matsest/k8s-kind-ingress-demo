#!/bin/bash

echo "Deploying k8s resources"

kubectl apply -f workloads.yml
