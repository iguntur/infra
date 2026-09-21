#!/usr/bin/env bash

kubectl create secret docker-registry harbor-secret \
	--docker-server=harbor.example.com \
	--docker-username='robot$k8s-puller' \
	--docker-password='random-password' \
	--docker-email='robot@example.com' \
	--namespace default
