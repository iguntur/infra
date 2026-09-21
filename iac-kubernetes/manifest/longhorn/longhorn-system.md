```
kubectl patch svc -n longhorn-system longhorn-frontend --type=merge -p '{"spec": {"type": "LoadBalancer", "loadBalancerIP": "172.16.50.102"}}'
```
