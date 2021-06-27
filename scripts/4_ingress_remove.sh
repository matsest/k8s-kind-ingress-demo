#!/bin/bash

echo "Cleaning up testapps and ingres-nginx from cluster"

kubectl delete -f testapps.yml
kubectl delete -f kind-ingress.yml
