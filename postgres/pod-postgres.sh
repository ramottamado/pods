#!/bin/bash

podman pod create \
    --ip 10.88.0.11 \
    --hostname postgres.nadzieja.test \
    --infra-name postgres-infra \
    --memory 4g \
    postgres
