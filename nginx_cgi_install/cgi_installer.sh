#!/bin/bash
apt-get update && apt get install nginx fxgiwrap build-essential -y
mkdir /usr/lib/cgi-bin -p
cp cpu.cgi /usr/lib/cgi-bin/cpu.cgi
cp fcgiwrap.conf /etc/nginx/fcgiwrap.conf
cp example_server /etc/nginx/sites-available/example_server