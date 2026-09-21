#!/usr/bin/env bash

# kubectl create namespace cert-manager

helm install cert-manager jetstack/cert-manager \
	--namespace cert-manager \
	--version v1.18.0 \
	--set crds.enabled=true
