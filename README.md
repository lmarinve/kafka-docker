# Kafka Docker

# Install Docker and Docker Compose

https://docs.docker.com/compose/install/

// Clone Kafka git project 

git clone https://github.com/atlanticwave-sdx/kafka-docker

cd kafka-docker

## Environment Variables

| Name                       | Type     | Description                                                    | Example                 |
| -------------------------- | -------- | -------------------------------------------------------------- | ----------------------- |
| KRAFT_CONTAINER_HOST_NAME  | string   | Hostname for the running container as the Kafka listener       | kafka                   |
| KRAFT_CREATE_TOPICS        | []string | Comma separated list of topics to be created post server setup | topic-a,topic-b,topic-c |
| KRAFT_PARTITIONS_PER_TOPIC | int      | Number of partitions per topic                                 | 3                       |

# Create docker image

./dckbuild.sh

vim docker-compose.yml 

// Optional - Scale the cluster by adding more brokers

docker-compose scale kafka=3

# Start Docker compose

docker-compose up -d

//Check the proceses running:

docker-compose ps

// Destroy the cluster when you are done with it

docker-compose stop

![Infraestructure](https://github.com/lmarinve/kafka-docker/blob/master/kafka-kraft.jpeg)
