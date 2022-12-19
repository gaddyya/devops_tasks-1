
### if some problem with reconnect to eks
// Start with fresh file
rm ~/.kube/config

// Update with the context you want
aws eks update-kubeconfig --name my-cluster --region eu-central-1

// Use KubeCtl to delete the context
kubectl config delete-cluster arn:aws:eks:us-west-2:000000000000:cluster/my-cluster

// RE-Apply the Config
aws eks update-kubeconfig --name my-cluster --region us-west-2

'NoneType' object is not iterable

### create/delete cluster
eksctl create cluster -f cluster.yaml — create cluster
eksctl delete cluster -f cluster.yaml — delete cluster