#!/usr/bin/env bash

KAFKA_VERSION="3.6.0"
SCALA_VERSION="2.13"

DL_PATH="/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz"
URL="https://downloads.apache.org${DL_PATH}"

# do not download if it already exists
if [[ ! -d kafka ]] ; then
  # determine if curl is available
  which curl > /dev/null 2>&1
  if [[ $? -eq 0 ]]; then
    curl -L -o kafka.tgz ${URL}
  else
    wget -O kafka.tgz ${URL}
  fi

  tar -xvzf kafka.tgz
  rm -rf kafka.tgz
  mv "kafka_${SCALA_VERSION}-${KAFKA_VERSION}" kafka
fi

docker build -t kafka-kraft:${KAFKA_VERSION} .
