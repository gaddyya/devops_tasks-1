# Register GitLab Runner with Docker executor and configure docker service
> Install Docker on the ec2 where will be configured runner
> Export env variables

```
export GITLAB_URL=""
```
```
export GITLAB_TAG=""
```
```
export GITLAB_PROJECT_REGISTRATION_TOKEN=""
```
> Registration of runner 
```
sudo gitlab-runner register \
  --non-interactive \
  --url $GITLAB_URL \
  --registration-token "$GITLAB_PROJECT_REGISTRATION_TOKEN" \
  --executor "docker" \
  --docker-image alpine:latest \
  --description "docker-runner" \
  --maintenance-note "Gitlab runner with docker executor" \
  --tag-list "$GITLAB_TAG" \
  --run-untagged="true" \
  --locked="false" \
  --docker-privileged \
```

> CI/CD pipeline
```
variables:
  DOCKER_HOST: tcp://docker:2375/
  DOCKER_TLS_CERTDIR: ""

deploy:
  stage: build
  image: docker:18.09
  services:
    - docker:18.09-dind

  script:
    - docker ps
  tags:
    -  docker-runner
```

> Depends on the docker-dind service version, DOCKER_HOST port may be different. 
> Check it out with this pipeline:

```
find-docker-port:
  image: alpine
  services:
    - docker:18.09-dind
  script:
    - apk add nmap
    - nmap -sT -p- docker
type=rpm-md
```
