# kafka-kraft-docker

A docker image for [Kafka](https://kafka.apache.org) without requiring Zookeeper - this is predicated on _several_ of the images others have posted on [GitHub](https://github.com/search?q=kafka-kraft). This should only be considered a _testing_ image and not suitable for anything more than development or test purposes.

:bangbang: :bomb: **NOT A PRODUCTION IMAGE!!! SATISFACTION NOT GUARANTEED!!!** :boom: :sob:

Freely copyable. Caveat emptor.

For more information about the Kafka running in KRaft mode check out the [introductory blog post](https://www.confluent.io/blog/kafka-without-zookeeper-a-sneak-peek).

## Build the image

There's two different means of building, depending on circumstances or need. Check version numbers before building and update accordingly.

**`KAFKA_VERSION=3.6.0`**

### Multi-Stage Docker
The [multibuild](multibuild) directory builds the image using a Docker [multi-stage](https://docs.docker.com/develop/develop-images/multistage-build/) build:

```shell
docker build -t kafka-kraft:${KAFKA_VERSION} multibuild
```

### Shell Style
Downloads (if not present), a pretty recent version of Kafka and builds the Docker image.

```shell
cd shell-build
./build.sh
```

The downloaded Kafka binary is left on the system.

## Run

```
docker run -p 9092:9092 -d kafka-kraft:${KAFKA_VERSION}
```

## :bangbang: Running on another host
The **[runit](runit.sh)** script executes the [docker-compose](docker-compose.yaml) file, which allows the server to be accessed _remotely_.

Note that this uses the default server configuration (auto-create topics, etc.). If you wish to actually _store_ the data, un-comment the appropriate line in the [docker-compose](docker-compose.yaml) file and set the desired directory. **NOTE** the data directory must/will have permissions as defined by the `docker` runtime environment.

Clients connecting to this server will need to use the _ip address_ of the host to connect. (Note that _mDNS_ hostnames will not resolve inside the container.)

### UI
A [web-based admin-type console](https://github.com/redpanda-data/console) is also run in the [docker-compose](docker-compose.yaml) file and is exposed on port `8080`.
