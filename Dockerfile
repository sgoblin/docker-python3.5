# Base python 3.5 build, inspired by
# https://github.com/crosbymichael/python-docker/blob/master/Dockerfile
FROM ubuntu:xenial
MAINTAINER Ryan M. <ryanm@redcow.club>

RUN sed -i 's/archive.ubuntu.com/mirror.us.leaseweb.net/' /etc/apt/sources.list \
    && sed -i 's/deb-src/#deb-src/' /etc/apt/sources.list \
    && apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y \
    build-essential \
    ca-certificates \
    gcc \
    git \
    libpq-dev \
    make \
    pkg-config \
    python3 \
    python3-dev \
    python3-pip \
    aria2 \
    && apt-get autoremove -y \
    && apt-get clean

RUN pip3 install -U virtualenv

CMD []
ENTRYPOINT ["/bin/bash"]
