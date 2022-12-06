#!/usr/bin/env sh

path=/kafka/${KAFKA_VERSION}/kafka_${SCALA_VERSION}-${KAFKA_VERSION}.tgz

downloadUrl="https://downloads.apache.org${path}"

echo "Downloading from ${downloadUrl}"
curl -L "${downloadUrl}" --output "/tmp/kafka.tgz"
tar xfz /tmp/kafka.tgz -C /opt
rm /tmp/kafka.tgz
ln -s /opt/kafka_${SCALA_VERSION}-${KAFKA_VERSION} /opt/kafka
