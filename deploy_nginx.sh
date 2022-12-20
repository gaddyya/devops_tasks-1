#!/bin/bash
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
docker login --username vadimalexandrovich --password nifdaX-syrdak-6cuzhy
cd nginx && sudo docker build -t vadimalexandrovich/nginx:latest .
sudo docker run -d -p 80:80  -t vadimalexandrovich/nginx:latest
docker push vadimalexandrovich/nginx:latest