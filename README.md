## Dockerized CAPI Unit Test Environemnt

#### Requirements
* Docker
* Docker Compose

#### Getting Started
* `git submodule update --init`
* `docker build . -t local/capitest2.7`
* `docker-compose up`

#### Connect to container
* `docker exec -it capi27 /bin/bash`
* `chruby 2.7.8`
