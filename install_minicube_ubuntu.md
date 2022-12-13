
### ------------------ INSTALL Kubectl ------------------

# Download the latest release with the command:
curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl

# Make the kubectl binary executable.
chmod +x ./kubectl


# Move the binary in to your PATH.
mv ./kubectl /usr/local/bin/kubectl

### ------------------ INSTALL Docker ------------------

apt-get update -y &&  sudo apt-get install -y docker.io

docker version

### ------------------ INSTALL minikube ------------------
curl -Lo minikube https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64 \
&& chmod +x minikube \
&& sudo mv minikube /usr/local/bin/

minikube version

### ------------------ START minikube ------------------
minikube start --driver=none


# INSTALL Conntrack
apt install conntrack

kubectl get pods

# RUN APP

kubectl expose deployment hello-node --type=NodePort --port=8080