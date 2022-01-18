FROM debian:buster

# LABEL about the custom image
LABEL maintainer="lmarinve@fiu.edu"
LABEL version="0.1"
LABEL description="Base Image"

#Disable Prompt during package installation
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /opt

# Update Debian
RUN apt-get update && apt-get -y upgrade

RUN apt-get install gcc musl-dev linux-headers librdkafka-dev build-essential \
zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev \
libreadline-dev libffi-dev curl libbz2-dev wget ca-certificates

RUN curl -L -o openjdk.tar.gz \
        https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz \
    && mkdir jdk \
    && tar zxf openjdk.tar.gz -C jdk --strip-components=1 \
    && rm -rf openjdk.tar.gz \
    && ln -sf /opt/jdk/bin/* /usr/local/bin/ \

RUN wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz \
    && tar -xf Python-3.9.1.tgz \
    && cd Python-3.9.1 \
    && ./configure --enable-optimizations \
    && make -j 2 \
    && make altinstall \
    && rm -rf /var/lib/apt/lists/*
