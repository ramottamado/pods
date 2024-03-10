#!/bin/bash

mkdir -p /var/opt/containers/kafka-ui
touch /var/opt/containers/kafka-ui/config.yml
chown -R 100:101 /var/opt/containers/kafka-ui

# CAP_NET_BIND_SERVICE needed for port 80
podman container create \
    --pod kafka \
    --name kafka-ui \
    --label "io.containers.autoupdate=registry" \
    --cap-add=CAP_NET_BIND_SERVICE \
    -e SERVER_PORT=80 \
    -e DYNAMIC_CONFIG_ENABLED=true \
    -m 256mb \
    -v /var/opt/containers/kafka-ui/config.yml:/etc/kafkaui/dynamic_config.yaml:z \
    docker.io/provectuslabs/kafka-ui:latest
