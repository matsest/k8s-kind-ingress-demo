# k8s-kind-ingress-demo

Setting up an [ingress controller on a kind k8s cluster](https://kind.sigs.k8s.io/docs/user/ingress/)

## Prerequisites

- [kind](https://kind.sigs.k8s.io/docs/user/quick-start/#installation)
- [Docker](https://www.docker.com/) or [Podman](https://podman.io/)
  - If you're running Podman, please see [this](https://kind.sigs.k8s.io/docs/user/rootless/).

## Cluster setup

- Prepare kind cluster with nodeports

```bash
./0_kind_setup.sh
```

## Usage

1. Deploy ingress controller to cluster

```bash
./1_ingress_setup.sh
```

2. Deploy [test application](testapps.yml) (pods, services and ingress)

```bash
./2_deploy_apps.sh
```

3. Run curl against the ingress controller on the specified ports/paths

```bash
./3_test_apps.sh
```

## Clean up

- Run `4_ingress_remove.sh` to remove the test apps and ingress-controller from your cluster
- Run `kind delete cluster` to remove the cluster
