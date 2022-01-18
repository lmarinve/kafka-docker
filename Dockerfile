FROM debian:bullseye

# LABEL about the custom image
LABEL maintainer="lmarinve@fiu.edu"
LABEL version="0.1"
LABEL description="Base Image"

#Disable Prompt during package installation
ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /opt

# Update Debian
RUN apt-get update && apt-get -y upgrade

RUN apt-get install -y gcc musl-dev librdkafka-dev build-essential zlib1g-dev \
libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev libreadline-dev \
libffi-dev curl libbz2-dev wget ca-certificates netcat tar python3 python3-pip

RUN curl -L -o openjdk.tar.gz \
https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz
RUN mkdir jdk
RUN tar zxf openjdk.tar.gz -C jdk --strip-components=1
RUN rm -rf openjdk.tar.gz
RUN ln -sf /opt/jdk/bin/* /usr/local/bin/
RUN rm -rf /var/lib/apt/lists/*
