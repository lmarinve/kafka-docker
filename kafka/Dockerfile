FROM os_image

ENV DEBIAN_FRONTEND=noninteractive
ENV KAFKA_VERSION=3.0.0
ENV SCALA_VERSION=2.13
ENV KRAFT_CONTAINER_HOST_NAME=kafka
ENV KRAFT_CREATE_TOPICS=topic-a,topic-b,topic-c
ENV KRAFT_PARTITIONS_PER_TOPIC=3

WORKDIR /opt

RUN java --version \
    && javac --version \
    && jlink --version 
    
RUN wget https://mirrors.ocf.berkeley.edu/apache/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz -O kafka.tgz \
    && tar xvzf kafka.tgz \
    && mv kafka_${SCALA_VERSION}-${KAFKA_VERSION} kafka

WORKDIR /opt/kafka

COPY /kafka/configs/server.properties ./config/kraft
COPY /kafka/*.sh .

EXPOSE 9092 9093

ENTRYPOINT ["./entrypoint.sh"]
