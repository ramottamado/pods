#!/bin/bash

podman pod create \
    --ip 10.88.0.12 \
    --infra-name wireguard-infra \
    wireguard
