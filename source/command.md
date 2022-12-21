### Tutorial
https://www.digitalocean.com/community/tutorials/how-to-configure-kubernetes-horizontal-pod-autoscaler-using-metrics-server

### create/delete cluster
eksctl create cluster -f cluster.yaml
eksctl delete cluster -f cluster.yaml

### if some problem with reconnect to eks
// Start with fresh file
rm ~/.kube/config

// Update with the context you want
aws eks update-kubeconfig --name hpa-cluster --region eu-central-1

// Use KubeCtl to delete the context
kubectl config delete-cluster arn:aws:eks:us-west-2:000000000000:cluster/my-cluster

// RE-Apply the Config
aws eks update-kubeconfig --name hpa-cluster --region eu-central-1

'NoneType' object is not iterable


### Create a Kubernetes Metrics Server
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

kubectl get pods -n kube-system -l k8s-app=metrics-server
kubectl autoscale deployment nginx --cpu-percent=10 --min=1 --max=5
kubectl get hpa

### Run load-generator container
kubectl run -i --tty load-generator --image=busybox /bin/sh
while true; do wget -q -O- http://nginx; done
kubectl get hpa -w

### Delete Resources
kubectl delete hpa,service,deployment nginx
kubectl delete pod load-generator


### Helm stack
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update

helm install chart-prometheus prometheus-community/kube-prometheus-stack --create-namespace --namespace monitoring

### Config grafana
kubectl -n monitoring edit svc chart-prometheus-grafana
- Change service type from ClusterIP to NodePort -
kubectl -n monitoring port-forward chart-prometheus-grafana-679fc6f96f-sqhdd 3000
- Expose port 32470


### HELM START

helm intall App AppNginx/
helm install App1 AppNginx/ -f another-values.yaml
helm install App3 AppNginx/ --setReplicaCount=4

### Helm Create

helm create Chart-name # in folder AppNginx