kubectl create namespace argocd

kubectl apply -n argocd -f https://raw.githubusercontent.com/codefresh-contrib/gitops-certification-examples/main/argocd-noauth/install.yaml

kubectl get pods -n argocd

kubectl apply -f service.yaml # in folder "installArgoCd"