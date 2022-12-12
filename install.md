# Set Hostnames
hostnamectl set-hostname k8smaster (On Master)
hostnamectl set-hostname k8sworker1(On Node1)



# Edit /etc/hosts file
Run the below commands on the machines. Change the IP address and host name as per your machine settings.

cat << EOF >> /etc/hosts

192.168.0.xxx k8smaster
192.168.0.xxx k8sworker1

EOF

# Setup Kubernetes Repo

cat << EOF > /etc/yum.repos.d/kubernetes.repo
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
EOF

# Installing Kubeadm and Docker, Enable and start the services

yum install kubeadm docker -y
systemctl enable kubelet
systemctl start kubelet
systemctl enable docker
systemctl start docker


# Disable Swap

swapoff -a
vi /etc/fstab and Comment the line with Swap Keyword

# Initialize Kubernetes Cluster

kubeadm init
mkdir -p $HOME/.kube
cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
chown (id -u):(id -g) $HOME/.kube/config

# Installing Pod Network using Calico network

curl https://docs.projectcalico.org/manifests/calico.yaml -O
kubectl apply -f calico.yaml
kubectl get pods -n kube-system

# Join Worker Nodes 

Use the token from Kubeadmin init screen. Below is a sample how it looks like.

kubeadm join 192.168.0.xxx:6443 --token XXX
--discovery-token-ca-cert-hash sha256:XX