# Varnish

Docker image for Varnish using Ubuntu Trusty. 

# Usage

Run parameter includes link with app container, assume "app" as the name of the app container and "backend" as alias. Do not change "backend" without changing [scripts/varnishd-foreground] (https://github.com/hhcordero/docker-varnish/blob/master/scripts/varnishd-foreground). Bind varnish to port 80, assume "app" is listening to port 8080. 

    docker run \
                --name docker_varnish \
                --link app:backend \
                --publish 80:80 \
                --detach \
                hhcordero/docker-varnish
