#!/bin/bash

echo "Running curl against k8s ingress controller"

echo "curl localhost:1080/foo:"
curl localhost:1080/foo

echo "curl localhost:1080/bar:"
curl localhost:1080/bar