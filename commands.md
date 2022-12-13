# Remote access to nginx-service which running in minicube on ec2 <ip-addr:31200>
kubectl port-forward svc/nginx-service 31200:80 --address='0.0.0.0'