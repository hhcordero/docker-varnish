FROM ubuntu:trusty

MAINTAINER Hector Cordero <hhcordero@gmail.com>

# Update repository, install application then clean-up after
RUN set -x \
    && apt-get update \
    && DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install varnish \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Set environment variables
ENV VARNISHD_CONFIG /etc/varnish/default.vcl
ENV VARNISHD_USER varnish
ENV VARNISHD_PORT 80
ENV VARNISHD_ADMIN_PORT 6082
ENV VARNISHD_CACHE_SIZE 256M
ENV VARNISHD_PARAMS -p default_ttl=3600 -p default_grace=3600

# Copy varnish config and script to container
COPY /conf/varnish-3.x.vcl $VARNISHD_CONFIG
COPY /scripts/varnishd-foreground /usr/local/bin/

RUN chmod +x /usr/local/bin/varnishd-foreground

EXPOSE $VARNISHD_PORT

CMD ["varnishd-foreground"]
