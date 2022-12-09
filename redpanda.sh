#!/usr/bin/env sh
# Runs a "local" GUI on port 8080 to connect to the "local" broker running via the `runit.sh` script
TARGET=$(hostname -I | awk '{print $1}')

docker run -p 8080:8080 -e KAFKA_BROKERS=${TARGET}:9092 --name redpanda -d docker.redpanda.com/vectorized/console:latest
