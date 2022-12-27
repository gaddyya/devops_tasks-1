# Install Jenkins Master Server on Ubuntu 22.04

### Connect to ec2 instance
> ssh ubuntu@54.93.34.94

### Install java
> sudo apt update && sudo apt install openjdk-11-jre -y

### Intall Jenkins
> 
curl -fsSL https://pkg.jenkins.io/debian/jenkins.io.key | sudo tee \
/usr/share/keyrings/jenkins-keyring.asc > /dev/null

> echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] /n\
  https://pkg.jenkins.io/debian binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null

> sudo apt-get update && sudo apt-get install jenkins -y

### Open in browser
http://54.93.34.94:8080

### Cat pasword and fill in
> cat /var/lib/jenkins/secrets/initialAdminPassword
