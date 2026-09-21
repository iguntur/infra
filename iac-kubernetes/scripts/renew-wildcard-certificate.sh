#!/usr/bin/env bash

timestamp="$(date -u +'%Y-%m-%dT%H:%M:%SZ')"

kubectl annotate certificate wildcard-letsencrypt-production-local-gunturpoetra-com \
	--namespace traefik-system \
	cert-manager.io/renew-attempt-time="$timestamp" \
	--overwrite
