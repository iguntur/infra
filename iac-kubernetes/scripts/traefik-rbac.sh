#!/usr/bin/env bash

# Install RBAC for Traefik
kubectl apply -f https://raw.githubusercontent.com/traefik/traefik/v3.4/docs/content/reference/dynamic-configuration/kubernetes-crd-rbac.yml
