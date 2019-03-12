#!/bin/bash

docker-compose up -d

echo "Waiting for database servers setup..."
sleep 30

./server/provision.sh node1
./server/provision.sh node2
./server/provision.sh node3
