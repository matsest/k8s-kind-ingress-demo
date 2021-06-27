#!/bin/bash

echo "Cleaning up testapps and ingres-nginx from cluster"

kubectl delete -f workloads.yml
kubectl delete -f kind-nginx-ingress.yml
