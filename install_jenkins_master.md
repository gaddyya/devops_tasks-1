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
## 1.4 Open in browser
```
http://localhost:8080
```
## 1.5 Cat pasword and fill in
```
cat /var/lib/jenkins/secrets/initialAdminPassword
```

# Configure Jenkins
## 2.1 Connect jenkins to github

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
## 2.2 Change language in UI
- Manage Jenkins > Manage Plugins 
> Install Locale Plugin
- Manage Jenkins > Configure System
> Search Locale and set Default languge "EN"


## 2.3 Configure webhooks
### 2.3.1 Configuring GitHub
> Step 1: go to your GitHub repository and click on ‘Settings’.

> Step 2: Click on Webhooks and then click on ‘Add webhook’.

> Step 3: In the ‘Payload URL’ field, paste your Jenkins environment URL. At the end of this URL add /github-webhook/. In the ‘Content type’ select: ‘application/json’ and leave the ‘Secret’ field empty.

### 2.3.2 Configuring Jenkins

> Step 1: In Jenkins, click on ‘New Item’ to create a new project

> Step 2: Give your project a name, then choose ‘Freestyle project’ and finally, click on ‘OK’.

> Step 3: Click on the ‘Source Code Management’ tab

> Step 4: Click on Git and paste your GitHub repository URL in the ‘Repository URL’ field.

> Step 5: Click on the ‘Build Triggers’ tab and then on the ‘GitHub hook trigger for GITScm polling’
