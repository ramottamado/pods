#!/bin/bash

mkdir -p /var/opt/containers/postgres

# WARN: Change password after creating container
podman container create \
    --pod postgres \
    --name postgres-server \
    --label "io.containers.autoupdate=registry" \
    --shm-size=256MB \
    -e POSTGRES_PASSWORD=pass \
    -m 1gb \
    -v /var/opt/containers/postgres:/var/lib/postgresql/data:z \
    docker.io/library/postgres:15 postgres
