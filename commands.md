### Create storage class from file
kubectl create -f gp2-storage-class.yaml

### Show existing storage classes
kubectl get storageclass

### Set this storage class as default
kubectl annotate storageclass gp2 storageclass.kubernetes.io/is-default-class=true

### Check is this storage class set as default
kubectl get storageclass

### INSTALL MINICUBE ON UBUNTU 22
## INSTALL KUBECTL
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
chmod +x ./kubectl
sudo mv ./kubectl /usr/local/bin/kubectl
## INSTALL DOCKER
https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-22-04
## INSTAL MINICUBE
wget https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo cp minikube-linux-amd64 /usr/local/bin/minikube
sudo chmod +x /usr/local/bin/minikube
minikube version

Prerequisites
Kubernetes 1.16+
Helm 3+

### INSTALL DOCKER AWS LINUX
https://www.cyberciti.biz/faq/how-to-install-docker-on-amazon-linux-2/
### INSTALL
helm install chart-prometheus -f values.yaml prometheus-community/kube-prometheus-stack --create-namespace --namespace monitoring


kubectl -n monitoring port-forward svc/chart-prometheus-grafana 31258:80 --address='0.0.0.0'




helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
helm install my-loki-stack grafana/loki-stack --version 2.8.8 --namespace monitoring

kubectl get secret -n monitoring chart-prometheus-grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo


### Grafana telegram alert
https://gist.github.com/ilap/cb6d512694c3e4f2427f85e4caec8ad7