# Helm Repo

```sh
helm repo add metallb https://metallb.github.io/metallb
helm repo add longhorn https://charts.longhorn.io
helm repo add jetstack https://charts.jetstack.io --force-update
helm repo add uptime-kuma https://helm.irsigler.cloud
```

### Ingress

```sh
helm repo add nginx-stable https://helm.nginx.com/stable
helm repo update
```

### Others

```sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo add traefik https://traefik.github.io/charts
helm repo add harbor https://helm.goharbor.io
helm repo add argo https://argoproj.github.io/argo-helm
```

## Usage

### Metallb

```sh
helm repo add metallb https://metallb.github.io/metallb
helm pull metallb/metallb --untar

cd metallb
kubectl create namespace metallb-system
helm install metallb -n metallb-system -f values.yaml . --debug
```

> check

```sh
kubectl -n metallb-system get all
kubectl -n metallb-system get pod -w
```
