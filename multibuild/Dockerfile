FROM eclipse-temurin:17-jre AS builder
ENV KAFKA_VERSION=3.5.1
ENV SCALA_VERSION=2.13
COPY install_kafka.sh /
RUN /install_kafka.sh

FROM eclipse-temurin:17-jre
COPY --from=builder /opt/kafka /opt/kafka
COPY start_kafka.sh /bin/
CMD [ "/bin/start_kafka.sh" ]
