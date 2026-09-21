#!/usr/bin/env bash

timestamp="$(date -u +'%Y-%m-%dT%H:%M:%SZ')"
namespaces=(
	"argocd"
	"default"
	"harbor-system"
	"longhorn-system"
	"traefik-system"
	"codesativa-erp-production"
	"codesativa-erp-staging"
)

for ns in "${namespaces[@]}"; do
	kubectl annotate certificate \
		--namespace "$ns" \
		letsencrypt-production-local-gunturpoetra-com \
		cert-manager.io/renew-attempt-time="$timestamp" \
		--overwrite
done
