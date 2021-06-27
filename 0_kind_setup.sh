#!/bin/bash

echo "Setting up ingress-ready kind cluster with ports 1080->80 and 1443->443"

kind create cluster --config="cluster-config.yml"
#cat <<EOF | kind create cluster --config=-
#kind: Cluster
#apiVersion: kind.x-k8s.io/v1alpha4
#nodes:
#- role: control-plane
#  kubeadmConfigPatches:
#  - |
#    kind: InitConfiguration
#    nodeRegistration:
#      kubeletExtraArgs:
#        node-labels: "ingress-ready=true"
#  extraPortMappings:
#  - containerPort: 80
#    hostPort: 1080
#    protocol: TCP
#  - containerPort: 443
#    hostPort: 1443
#    protocol: TCP
#EOF

#! Note: Choose 1080 and 1443 due to
# Command Output: Error: rootlessport cannot expose privileged port 80, you can add 'net.ipv4.ip_unprivileged_port_start=80' to /etc/sysctl.conf (currently 1024), or choose a larger port number (>= 1024): listen tcp 0.0.0.0:80: bind: permission denied

