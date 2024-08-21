# Kubernetes Dashboard

## Install Dashboard and Sample User

```
helm repo add kubernetes-dashboard https://kubernetes.github.io/dashboard/
helm upgrade --install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard --create-namespace --namespace kubernetes-dashboard
kubectl apply -f .\dashboard-serviceaccount.yml
kubectl apply -f .\dashboard-clusterrolebinding.yml
kubectl -n kubernetes-dashboard create token admin-user
```
Anmelden am Dashboard mit dem Bearer Token
Dashboard starten

```
kubectl -n kubernetes-dashboard port-forward svc/kubernetes-dashboard-kong-proxy 8443:443
```

https://kubernetes.io/docs/tasks/access-application-cluster/web-ui-dashboard/