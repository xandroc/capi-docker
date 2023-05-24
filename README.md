## Dockerized CAPI Unit Test Environemnt

#### Requirements
* Docker
* Docker Compose

#### Getting Started
* `git submodule update --init`
* `docker build . -t local/capitest2.7`
* `docker-compose up`

or

* `./run-docker`

#### Connect to container
* `docker exec -it capi27 /bin/bash`
* `/run-tests`



