#!/bin/bash

docker network create xlayer-network --subnet 192.168.213.0/24
docker run --name xlayer-container -d --network xlayer-network --ip 192.168.213.10 --privileged -p 80:80 -p 443:443 -p 6443:6443 xlayer-docker:20251113
