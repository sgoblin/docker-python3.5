# Base python 3.5 build, inspired by
# https://github.com/crosbymichael/python-docker/blob/master/Dockerfile
FROM ubuntu:wily
MAINTAINER Ryan M. <ryanm@redcow.club>

RUN sed -i 's/archive.ubuntu.com/ubuntu.cs.utah.edu/' /etc/apt/sources.list \
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
    python3.5 \
    python3.5-dev \
    && apt-get autoremove -y \
    && apt-get clean
    
ADD https://bootstrap.pypa.io/get-pip.py /tmp/
RUN ln -s /usr/bin/python3.5 /usr/bin/python3 && python3 /tmp/get-pip.py && rm /tmp/get-pip.py

RUN pip3 install -U virtualenv

CMD []
ENTRYPOINT ["/bin/bash"]
