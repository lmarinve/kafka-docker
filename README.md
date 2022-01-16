# Kafka Docker

Install Docker and Docker Compose

Clone Kafka git project 

$ git clone https://github.com/atlanticwave-sdx/kafka-docker

$ cd kafka-docker


// Update KAFKA_ADVERTISED_HOST_NAME inside 'docker-compose.yml',

// For example, set it to 172.17.0.1

// Optional - Scale the cluster by adding more brokers

$ docker-compose scale kafka=3

//Check the proceses running:

$ docker-compose ps

// Destroy the cluster when you are done with it

$ docker-compose stop

# Kafka Shell

//Start Kafka shell

$ ./start-kafka-shell.sh <DOCKER_HOST_IP/KAFKA_ADVERTISED_HOST_NAME>

# In my case:

$ ./start-kafka-shell.sh 172.17.0.1

# Create a Topic

> $KAFKA_HOME/bin/kafka-topics.sh --create --topic test \
--partitions 4 --replication-factor 2 \
--bootstrap-server `broker-list.sh`

> $KAFKA_HOME/bin/kafka-topics.sh --describe --topic test \
--bootstrap-server `broker-list.sh`

# Producer

// Initialize the producer and write messages to Kafka’s brokers.

> $KAFKA_HOME/bin/kafka-console-producer.sh --topic=test \
--broker-list=`broker-list.sh`

>> Hello World!

>> I'm a Producer writing to 'hello-topic'

# Consumer

// Initialize the consumer from another Kafka terminal and it will start reading the messages sent by the producer.


> $KAFKA_HOME/bin/kafka-console-consumer.sh --topic=test \
--from-beginning --bootstrap-server `broker-list.sh`
