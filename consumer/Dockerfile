#from Debian base image
FROM os_base

WORKDIR /usr/src/app

RUN apt install gcc musl-dev linux-headers librdkafka-dev build-essential \
zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libsqlite3-dev \
libreadline-dev libffi-dev curl libbz2-dev

wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz

COPY /consumer/. /usr/src/app/*

#run entrypoint
RUN chmod 775 /usr/src/app/entrypoint.sh
ENTRYPOINT ["sh","entrypoint.sh"]
