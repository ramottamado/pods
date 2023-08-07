#!/bin/bash

mkdir -p /var/opt/containers/kafka
chown -R 1001:1001 /var/opt/containers/kafka

podman container create \
    --pod kafka \
    --name kafka-0 \
    --label "io.containers.autoupdate=registry" \
    -e ALLOW_PLAINTEXT_LISTENER=yes \
    -e KAFKA_ENABLE_KRAFT=yes \
    -e KAFKA_KRAFT_CLUSTER_ID=ZjU4YzZhNGI1MjM5NDI0OT \
    -e KAFKA_BROKER_ID=0 \
    -e KAFKA_CFG_PROCESS_ROLES=broker,controller \
    -e KAFKA_CFG_INTER_BROKER_LISTENER_NAME=PLAINTEXT \
    -e KAFKA_CFG_CONTROLLER_LISTENER_NAMES=CONTROLLER \
    -e KAFKA_CFG_LISTENERS=PLAINTEXT://:9092,CONTROLLER://:9093 \
    -e KAFKA_CFG_LISTENER_SECURITY_PROTOCOL_MAP=CONTROLLER:PLAINTEXT,PLAINTEXT:PLAINTEXT \
    -e KAFKA_CFG_ADVERTISED_LISTENERS=PLAINTEXT://kafka.nadzieja.test:9092 \
    -e KAFKA_CFG_NODE_ID=0 \
    -e KAFKA_CFG_CONTROLLER_QUORUM_VOTERS=0@kafka.nadzieja.test:9093 \
    -e BITNAMI_DEBUG=yes \
    -v /var/opt/containers/kafka:/bitnami/kafka:z \
    docker.io/bitnami/kafka:3.4
