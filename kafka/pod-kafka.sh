#!/bin/bash

podman pod create \
    --ip 10.88.0.10 \
    --hostname kafka.marceline.test \
    --infra-name kafka-infra \
    --memory 4g \
    kafka
