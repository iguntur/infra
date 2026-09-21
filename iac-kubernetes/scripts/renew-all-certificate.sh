#!/usr/bin/env bash
set -euo pipefail

NOW="$(date -u +'%Y-%m-%dT%H:%M:%SZ')"

echo "🔄 Forcing renewal for all cert-manager Certificates"
echo "🕒 Timestamp: $NOW"
echo

kubectl get certificate -A --no-headers | while read -r NS NAME READY SECRET ISSUER STATUS AGE; do
	echo "➡️  Processing Certificate:"
	echo "   Namespace : $NS"
	echo "   Name      : $NAME"
	echo "   Status    : $STATUS"

	# Force renewal via annotation
	kubectl annotate certificate "$NAME" \
		--namespace "$NS" \
		cert-manager.io/renew-attempt-time="$NOW" \
		--overwrite >/dev/null

	echo "   ✅ Renewal annotation applied"

	# Optional: cleanup stuck CertificateRequests
	CRS=$(kubectl get certificaterequest -n "$NS" \
		--field-selector spec.certificateRef.name="$NAME" \
		-o name 2>/dev/null || true)

	if [[ -n "$CRS" ]]; then
		echo "   🧹 Deleting old CertificateRequests"
		kubectl delete "$CRS" -n "$NS" --ignore-not-found >/dev/null
	fi

	echo
done

echo "🎉 All certificates have been queued for renewal"
echo "📌 Monitor progress with:"
echo "   kubectl get certificate -A"
echo "   kubectl logs -n cert-manager deploy/cert-manager -f"
