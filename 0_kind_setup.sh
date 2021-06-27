#!/bin/bash

echo "Setting up ingress-ready kind cluster with ports 1080->80 and 1443->443"

kind create cluster --config="cluster-config.yml"