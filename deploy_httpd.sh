#!/bin/bash
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
docker login --username <login> --password <password>
cd httpd && sudo docker build -t vadimalexandrovich/httpd:latest .
sudo docker run -d -p 8080:8080  -t vadimalexandrovich/httpd:latest
docker push vadimalexandrovich/httpd:latest