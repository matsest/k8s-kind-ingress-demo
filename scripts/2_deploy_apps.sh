#!/bin/bash

echo "Deploying k8s resources"

kubectl apply -f workloads.yml

kubectl wait \
  --for=condition=ready pod \
  --selector=workload=ingress-demo \
  --timeout=90s