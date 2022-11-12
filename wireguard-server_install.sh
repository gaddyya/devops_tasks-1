#!/bin/bash
sudo apt-get update && sudo apt-get upgrade -y
sudo apt-get install -y wireguard
wg genkey | tee /etc/wireguard/privatekey | wg pubkey | tee /etc/wireguard/publickey


echo -e "[Interface] \n
PrivateKey = `cat /etc/wireguard/privatekey` \n
Address = 10.10.10.5/24 \n
ListenPort = 51820 \n
PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE \n
PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE " > /etc/wireguard/wg0.conf

chmod 600 /etc/wireguard/privatekey

echo "net.ipv4.ip_forward=1" >> /etc/sysctl.conf
sysctl -p


systemctl enable wg-quick@wg0.service
systemctl start wg-quick@wg0.service
systemctl status wg-quick@wg0.service


wg genkey | tee /etc/wireguard/vadim_privatekey | wg pubkey | tee /etc/wireguard/vadim_publickey

echo -e "
[Interface] \n
PrivateKey = `cat /etc/wireguard/vadim_privatekey` \n
Address = 10.0.0.2/32 \n
DNS = 8.8.8.8 \n

[Peer] \n
PublicKey = `cat /etc/wireguard/publickey` \n
Endpoint = `curl http://169.254.169.254/latest/meta-data/public-ipv4`:51820 \n
AllowedIPs = 0.0.0.0/0 \n
PersistentKeepalive = 20 " > host_setting.conf
