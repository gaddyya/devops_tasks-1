# 1. Install Jenkins Master Server on Ubuntu 22.04

### 1.1 Connect to ec2 instance
```
ssh ubuntu@54.93.34.94
```
### 1.2 Install java
```
sudo apt update && sudo apt install openjdk-11-jre -y
```
### 1.3 Intall Jenkins
```
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee \
/usr/share/keyrings/jenkins-keyring.asc > /dev/null
```
```
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
https://pkg.jenkins.io/debian binary/ | sudo tee \
/etc/apt/sources.list.d/jenkins.list > /dev/null
```
```
sudo apt-get update && sudo apt-get install jenkins -y
```
### 1.4 Open in browser
```
http://localhost:8080
```
### 1.5 Cat pasword and fill in
```
cat /var/lib/jenkins/secrets/initialAdminPassword
```

# Configure Jenkins
### 2.1 Connect jenkins to github

```
sudo su -s /bin/bash jenkins
```
```
eval "$(ssh-agent -s)"
```
```
pwd
```
```
ssh-keygen -t rsa
```
```
ssh-add <private-key>
```
### 2.2 Change language in UI
- Manage Jenkins > Manage Plugins 
> Install Locale Plugin
- Manage Jenkins > Configure System
> Search Locale and set Default languge "EN"


### 2.3 Configure webhooks
