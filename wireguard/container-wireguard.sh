#!/bin/bash

podman container create \
    --pod wireguard \
    --name warp-server \
    --label "io.containers.autoupdate=registry" \
    -v /var/opt/containers/wireproxy:/etc/wireproxy:z \
    ghcr.io/pufferffish/wireproxy:latest
