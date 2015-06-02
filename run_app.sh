#!/bin/bash
docker run \
            --name docker_varnish \
            --link app:backend \
            --publish 80:80 \
            --detach \
            hhcordero/docker-varnish
