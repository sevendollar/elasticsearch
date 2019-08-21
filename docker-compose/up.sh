#!/bin/bash

# 1st step
docker-compose -f create-certs.yml run --rm create_certs && \

# 2nd step
docker-compose up -d
