#!/bin/bash
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
docker login --username <login> --password <password>
cd httpd && sudo docker build -t vadimalexandrovich/nginx:latest .
sudo docker run -d -p 8080:8080  -t vadimalexandrovich/nginx:latest
docker push vadimalexandrovich/nginx:latest