#!/usr/bin/env bash
set -euo pipefail

KEEP_NS="traefik-system"
KEEP_NAME="wildcard-letsencrypt-production-local-gunturpoetra-com"

kubectl get certificate -A --no-headers | while read -r NS NAME READY SECRET ISSUER STATUS AGE; do
	if [[ "$NS" != "$KEEP_NS" || "$NAME" != "$KEEP_NAME" ]]; then
		echo "🗑️  Deleting Certificate $NS/$NAME"
		kubectl delete certificate "$NAME" -n "$NS"
	fi
done
