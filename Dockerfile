FROM ubuntu:trusty

ARG apt_repository="deb [arch=amd64] http://apt-mk.mirantis.com/trusty/ nightly extra"
ARG apt_key_url="http://apt-mk.mirantis.com/public.gpg"

## Common
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y wget && \
    echo "$apt_repository" >> /etc/apt/sources.list.d/mirantis.list && \
    wget -O - $apt_key_url | apt-key add -

RUN apt-get update && apt-get install -y python-flask-hello

ENTRYPOINT ["/usr/bin/hello.py"]
EXPOSE 5000

# Cleanup
RUN apt-get autoremove --purge -y
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/salt/*
