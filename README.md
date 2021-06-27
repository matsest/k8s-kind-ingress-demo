# k8s-kind-ingress-demo

Setting up an [ingress controller on a kind k8s cluster](https://kind.sigs.k8s.io/docs/user/ingress/)

## Prerequisites

- [kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)
- [Docker](https://www.docker.com/) or [Podman](https://podman.io/)
  - If you're running Podman, please see [this](https://kind.sigs.k8s.io/docs/user/rootless/).

## Cluster setup

- Prepare kind cluster with ports 1080->80 and 1443->443

```bash
kind create cluster --config="cluster-config.yml"
```

## Usage

1. Deploy [nginx ingress controller](kind-ignress.yml) to cluster

```bash
kubectl apply -f kind-ingress.yml

kubectl wait --namespace ingress-nginx \
  --for=condition=ready pod \
  --selector=app.kubernetes.io/component=controller \
  --timeout=90s
```

2. Deploy [test application](testapps.yml) (pods, services and ingress)

```bash
kubectl apply -f testapps.yml
```

3. Run curl against the ingress controller on the specified ports/paths

```bash
curl localhost:1080/foo

curl localhost:1080/bar
```

Output:

```bash
'hello world! this is foo'
'hello world! this is bar'
```

## Clean up

- Run `4_ingress_remove.sh` to remove the test apps and ingress-controller from your cluster
- Run `kind delete cluster` to remove the cluster
