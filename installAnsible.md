## Install and Configure Ansible on Ubuntu
```
sudo apt-add-repository ppa:ansible/ansible -y && sudo apt update
```
```
sudo apt install ansible -y
```
```
sudo vim /etc/ansible/hosts
```
> And add the following
```
[servers]
server1 ansible_host=203.0.113.111
server2 ansible_host=203.0.113.112
server3 ansible_host=203.0.113.113
```

> To check the inventory
```
ansible-inventory --list -y
```

```
cd /etc/ansible
```
``` 
mkdir group_vars
```
```
echo -e "ansible_user: ubuntu\nansible_ssh_private_key_file: /home/ubuntu/.ssh/trainee8.pem" > servers
```
