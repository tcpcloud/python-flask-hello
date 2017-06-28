FROM ubuntu:trusty

## Common
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y wget && \
    echo "deb [arch=amd64] http://apt-mk.mirantis.com/trusty/ nightly extra" >> /etc/apt/sources.list.d/mirantis.list && \
    wget -O - http://apt-mk.mirantis.com/public.gpg | apt-key add -

RUN apt-get update && apt-get install -y python-flask-hello

ENTRYPOINT ["/usr/bin/hello.py"]
EXPOSE 5000

# Cleanup
RUN apt-get autoremove --purge -y
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/salt/*
