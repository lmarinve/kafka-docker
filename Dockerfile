FROM debian:buster as jdk_full

ENV DEBIAN_FRONTEND=noninteractive
ENV KAFKA_VERSION=3.0.0
ENV SCALA_VERSION=2.13
ENV KRAFT_CONTAINER_HOST_NAME=kafka
ENV KRAFT_CREATE_TOPICS=topic-a,topic-b,topic-c
ENV KRAFT_PARTITIONS_PER_TOPIC=3

WORKDIR /opt

RUN apt-get update \
    && apt-get install -y --no-install-recommends wget \
        ca-certificates \
        curl \
    && curl \
        -L \
        -o openjdk.tar.gz \
        https://download.java.net/java/GA/jdk11/13/GPL/openjdk-11.0.1_linux-x64_bin.tar.gz \
    && mkdir jdk \
    && tar zxf openjdk.tar.gz -C jdk --strip-components=1 \
    && rm -rf openjdk.tar.gz \
    && apt-get -y --purge autoremove curl \
    && ln -sf /opt/jdk/bin/* /usr/local/bin/ \
    && rm -rf /var/lib/apt/lists/* \
    && java  --version \
    && javac --version \
    && jlink --version 
    
RUN wget https://mirrors.ocf.berkeley.edu/apache/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -O kafka.tgz \
    && tar xvzf kafka.tgz \
    && mv kafka_${SCALA_VERSION}-${KAFKA_VERSION} kafka

WORKDIR /opt/kafka

COPY ./configs/server.properties ./config/kraft
COPY ./*.sh .

EXPOSE 9092 9093

ENTRYPOINT ["./docker-entrypoint.sh"]
