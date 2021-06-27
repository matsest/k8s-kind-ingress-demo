#!/bin/bash

echo "Setting up ingress-nginx"

kubectl apply -f kind-ingress.yml

kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s
