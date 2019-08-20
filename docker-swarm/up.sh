#!/bin/bash

# 1st step
./create-certs.sh && \

# 2nd step 
sudo docker stack deploy -c docker-compose-swarm.yml elasticsearch
