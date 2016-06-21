FROM ubuntu:trusty

## Common
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
    apt-get install -y wget && \
    echo "deb [arch=amd64] http://apt.tcpcloud.eu/nightly trusty main security tcp" > /etc/apt/sources.list && \
    wget -O - http://apt.tcpcloud.eu/public.gpg | apt-key add -

RUN apt-get update && apt-get install -y python-flask-hello

ENTRYPOINT ["/usr/bin/hello.py"]
EXPOSE 5000

# Cleanup
RUN apt-get autoremove --purge -y
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* /var/cache/salt/*
