# kafka-kraft-docker

A docker image for [Kafka](https://kafka.apache.org) without requiring Zookeeper - this is predicated on _several_ of the images others have posted on [GitHub](https://github.com/search?q=kafka-kraft). This should only be considered a _testing_ image and not suitable for anything more than development or test purposes.

**THERE IS NO GUARANTEE THAT THESE INSTRUCTIONS OR IMAGES WORK AT ALL!!**

Freely copyable. Caveat emptor.

For more information about the Kafka running in KRaft mode check out the [introductory blog post](https://www.confluent.io/blog/kafka-without-zookeeper-a-sneak-peek).

# Build the image

There's two different means of building, depending on circumstances or need. Check version numbers before building and update accordingly.

## Multi-Stage Docker
The [multibuild](multibuild) directory builds the image using a Docker [multi-stage](https://docs.docker.com/develop/develop-images/multistage-build/) build:

```shell
docker build -t kafka-kraft:3.5.1 multibuild
```

## Shell Style
Downloads (if not present), a pretty recent version of Kafka and builds the Docker image.

```shell
cd shell-build
./build.sh
```

The downloaded Kafka binary is left on the system.

# Run

```
docker run -p 9092:9092 -d kafka-kraft:3.5.1
```

# :bangbang: Running on another host
The **[runit](runit.sh)** script allows for the server to be accessed _remotely_ (sets up the single listener varables). Note there still is **NO** persistence, backup, partitioning, etc. - it's just running and available.

:bangbang: :bomb: **STILL NOT A PRODUCTION IMAGE!!! SATISFACTION NOT GUARANTEED!!!** :boom: :sob:

Clients connecting to this server will need to use the _ip address_ of the host to connect. (Note that _mDNS_ hostnames will not resolve inside the container.)

## UI
The [redpanda.sh](redpanda.sh) runs a nifty Kafak GUI (no manager/topic editing) on port **8080** that connects to this server on the same host.
